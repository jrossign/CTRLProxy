package com.ipc.ctrlproxy.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ipc.ctrlproxy.CTRLServices;
import com.ipc.ctrlproxy.dao.EmpStats;
import com.ipc.ctrlproxy.dao.LaincoIntranetDAO;
import com.ipc.ctrlproxy.exception.CRTLException;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.po.PurchaseOrder;
import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.MessageItem;
import com.ipc.ctrlproxy.model.status.Status;
import com.ipc.ctrlproxy.model.steel.SPOrder;
import com.ipc.ctrlproxy.translator.SteelToCTRLTranslator;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.ClientResponse;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.ServiceUnavailableException;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class CTRLController implements InitializingBean
{
    @Autowired
    private LaincoIntranetDAO dao;

    @Autowired
    private SteelToCTRLTranslator translator;

    @Autowired
    @Qualifier("CRTLWebClient")
    private WebClient webClient;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CTRLServices ctrlServices;

    @PostMapping(value = "/ctrlproxy", params = "action=SP_ORDERS", consumes = "application/json", produces = "application/json")
    public Status approvisionnement(@RequestBody List<SPOrder> orders, @RequestParam(name = "module", required = false) String module, @RequestParam(name="action") String action) throws ParseException, IOException {
        //List<EmpStats> list = dao.getX();

        Status last = null;
        for (SPOrder order : orders) {
            last = proxyRequest(translator.getCTRLHeader(order, action), translator.getCTRLDetails(order, action));
        }
        return last;
    }

    @PostMapping(value = "/ctrlproxy", params = "action=SP_RECEIVING", consumes = "application/json", produces = "application/json")
    public Mono<Status> commande(@RequestBody List<PurchaseOrder> preq, @RequestParam(name = "module") String module, @RequestParam(name="action") String action)
    {
        List<EmpStats> list = dao.getX();

        return null;//proxyRequest(translate(preq, action));
    }

    @PostMapping(value = "/ctrlproxy", consumes = "application/json", produces = "application/json")
    public Mono<Status> commande(@RequestBody String body, HttpServletRequest req)
    {
        log.warn("Unserviced URI / body type / params");
        log.warn(req.getRequestURI());
        log.warn(req.getQueryString());
        log.warn(System.lineSeparator()+body);
        return Mono.error(new ServiceUnavailableException("Method not allowed. Please check the URL and body."));
    }



    private Status proxyRequest(final Header header, final List<Details> details) throws IOException {
        List<MessageItem> responses = new ArrayList<>();
        boolean success = true;

        try {
            log.warn(mapper.writeValueAsString(header));
            log.warn(mapper.writeValueAsString(details));
        }
        catch (Exception e) {}

        OkHttpClient client = new OkHttpClient().newBuilder().build();

        MediaType mediaType = MediaType.parse("application/json");
        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, mapper.writeValueAsString(header));
        Request request = new Request.Builder()
                .url("http://192.168.1.157:8002/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/DocumentEntete//?Company=001")
                .method("POST", body)
                .addHeader("CTRL-Token", "{3F2DB33F-902E-45BC-98C3-C5F18F7019AE}")
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Basic V0VCU1RQOlN0ZWVsMjAyMiE=")
                .build();
        Response response = client.newCall(request).execute();
        String respBody = unescape(response.body().string());
        logJson(respBody);
        success = success && buildMessageItems("Création de l'entête", response.code(), respBody, responses);

        if (success) {
            for (Details detail : details) {
                body = okhttp3.RequestBody.create(mediaType, mapper.writeValueAsString(detail));
                request = new Request.Builder()
                        .url("http://192.168.1.157:8002/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/DocumentDetail//?Company=001")
                        .method("POST", body)
                        .addHeader("CTRL-Token", "{3F2DB33F-902E-45BC-98C3-C5F18F7019AE}")
                        .addHeader("Content-Type", "application/json")
                        .addHeader("Authorization", "Basic V0VCU1RQOlN0ZWVsMjAyMiE=")
                        .build();
                response = client.newCall(request).execute();
                respBody = unescape(response.body().string());
                logJson(respBody);
                success = success && buildMessageItems("Création d'un détail", response.code(), respBody, responses);
            }
        }
        else {

            return Status.builder()
                    .webservice("0")
                    .status("2")
                    .messageHeader(buildStatusHeader(success, "Problème à la création de l'entête"))
                    .messageItem(responses)
                    .build();
        }


        return Status.builder()
                .webservice("0")
                .status(success?"1":"2")
                .messageHeader(buildStatusHeader(success, success?"Success":"Problème à la création de détails"))
                .messageItem(responses)
                .build();
        /*

        String crtlResponse = webClient.post()

                .uri("/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/DocumentEntete//?Company=001")
                .header("CTRL-Token", "{3F2DB33F-902E-45BC-98C3-C5F18F7019AE}")
                .header("Authorization", "Basic V0VCU1RQOlN0ZWVsMjAyMiE=")
                .header("Content-Type", "application/json")
//                .bodyValue(header)
                .retrieve()
                .onStatus(HttpStatus::isError,
                        response ->
                        {
                            //logTraceResponse(response);
                            return response.bodyToMono(String.class) // error body as String or other class
                                    .flatMap(error -> Mono.error(buildErrorStatus(error, response.statusCode().value()))); // throw a functional exception
                        })
                .bodyToMono(String.class).block();
        success = success && buildMessageItems(crtlResponse, responses);

        for (Details detail : details) {
            crtlResponse = webClient.post()
                    .uri(uriBuilder -> uriBuilder
                            .path("/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/DocumentDetail//")
                            .queryParam("Company", "001")
                            .build())
                    .header("CTRL-Token", "{3F2DB33F-902E-45BC-98C3-C5F18F7019AE}")
                    .header("Authorization", "Basic V0VCU1RQOlN0ZWVsMjAyMiE=")
                    .header("Content-Type", "application/json")
                    .bodyValue(detail)
                    .retrieve()
                    .onStatus(HttpStatus::isError,
                            response ->
                            {
                                return response.bodyToMono(String.class) // error body as String or other class
                                        .flatMap(error -> Mono.error(buildErrorStatus(error, response.statusCode().value()))); // throw a functional exception
                            })
                    .bodyToMono(String.class).block();
            success = success && buildMessageItems(crtlResponse, responses);
        }
*/

    }

    private String unescape(String str) {
        if (str.contains("\\u")) {
            return StringEscapeUtils.unescapeJava(str);
        }
        return str;
    }

    public List<Message> buildStatusHeader(boolean isSuccess, String msg) {
        List<Message> messages = new ArrayList<>();
        messages.add(Message.builder()
                .type(isSuccess?"S":"E")
                .message(msg)
                .build());
        return messages;
    }
    public boolean buildMessageItems(final String msg, final int status, final String body, final List<MessageItem> responses) {
        boolean isSuccess = !body.toUpperCase().contains("ERROR"); // TODO
        String type = isSuccess?"S":"E";
        MessageItem item = MessageItem.builder()
                .status(isSuccess?"1":"2")
                .messages(Arrays.asList(
                        Message.builder().type(type).message(msg).build(),
                        Message.builder().type(type).message("StatusCode : " + status).build(),
                        Message.builder().type(type).message("Body : " + body).build()))
                .build();
        responses.add(item);
        return isSuccess;
    }

    public CRTLException buildErrorStatus(final String body, int statusCode) {
        return new CRTLException(Status.builder()
                                .status("2")
                                .messageHeader(Arrays.asList(
                                        Message.builder().type("E").message("StatusCode : " + statusCode).build(),
                                        Message.builder().type("E").message("Body : " + body).build()))
                                .build());
    }

    public static void logTraceResponse(ClientResponse response) {
        //if (log.isTraceEnabled()) {
            log.trace("Response status: {}", response.statusCode());
            log.trace("Response headers: {}", response.headers().asHttpHeaders());
            response.bodyToMono(String.class)
                    .publishOn(Schedulers.boundedElastic())
                    .subscribe(body -> log.trace("Response body: {}", body));
       // }
    }

    private void logJson(String json) {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        JsonParser jp = new JsonParser();
        JsonElement je = jp.parse(json);
        log.info(gson.toJson(je));
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        log.info(ctrlServices.getAllHeaders().toString());
        log.info(ctrlServices.getAllDetails("BSP0000006").toString());
    }
}
