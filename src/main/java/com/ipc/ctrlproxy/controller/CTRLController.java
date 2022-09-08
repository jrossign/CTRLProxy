package com.ipc.ctrlproxy.controller;

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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class CTRLController
{
    @Autowired
    private LaincoIntranetDAO dao;

    @Autowired
    private SteelToCTRLTranslator translator;

    @Autowired
    @Qualifier("CRTLWebClient")
    private WebClient webClient;

    @PostMapping(value = "/ctrlproxy", params = "action=SP_ORDERS", consumes = "application/json", produces = "application/json")
    public Status approvisionnement(@RequestBody List<SPOrder> orders, @RequestParam(name = "module") String module, @RequestParam(name="action") String action) throws ParseException
    {
        List<EmpStats> list = dao.getX();

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



    private Status proxyRequest(Header header, List<Details> details) {
        List<MessageItem> responses = new ArrayList<>();
        boolean success = true;

        String crtlResponse = webClient.post()
                .uri("/header")
                .bodyValue(header)
                .retrieve()
                .onStatus(HttpStatus::isError,
                        response ->
                        {
                            logTraceResponse(response);
                            return response.bodyToMono(String.class) // error body as String or other class
                                    .flatMap(error -> Mono.error(buildErrorStatus(error, response.statusCode().value()))); // throw a functional exception
                        })
                .bodyToMono(String.class).block();
        success = success && buildMessageItems(crtlResponse, responses);

        for (Details detail : details) {
            crtlResponse = webClient.post()
                    .uri("/details")
                    .bodyValue(detail)
                    .retrieve()
                    .onStatus(HttpStatus::isError,
                            response ->
                            {
                                logTraceResponse(response);
                                return response.bodyToMono(String.class) // error body as String or other class
                                        .flatMap(error -> Mono.error(buildErrorStatus(error, response.statusCode().value()))); // throw a functional exception
                            })
                    .bodyToMono(String.class).block();
            success = success && buildMessageItems(crtlResponse, responses);
        }


       return Status.builder()
               .status(success?"1":"2")
               .messageItem(responses)
               .build();
    }

    public boolean buildMessageItems(final String body, final List<MessageItem> responses) {
        boolean isSuccess = !body.contains("ERROR"); // TODO
        String type = isSuccess?"S":"E";
        MessageItem item = MessageItem.builder()
                .messages(Arrays.asList(
                        Message.builder().type(type).message("StatusCode : " + HttpStatus.OK.value()).build(),
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
        if (log.isTraceEnabled()) {
            log.trace("Response status: {}", response.statusCode());
            log.trace("Response headers: {}", response.headers().asHttpHeaders());
            response.bodyToMono(String.class)
                    .publishOn(Schedulers.boundedElastic())
                    .subscribe(body -> log.trace("Response body: {}", body));
        }
    }

}
