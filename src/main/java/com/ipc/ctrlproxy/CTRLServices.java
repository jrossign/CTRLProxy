package com.ipc.ctrlproxy;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ipc.ctrlproxy.exception.CRTLException;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.MessageItem;
import com.ipc.ctrlproxy.model.status.Status;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.ClientResponse;
import reactor.core.scheduler.Schedulers;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Component
public class CTRLServices {


    private static final String URL_PREFIX = "http://192.168.1.157:8002/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/";

    @Autowired
    private ObjectMapper mapper;

    private Status createHeaderAndDetails(final Header header, final List<Details> details) throws IOException {
        List<MessageItem> responses = new ArrayList<>();
        boolean success = true;

        try {
            log.warn(mapper.writeValueAsString(header));
            log.warn(mapper.writeValueAsString(details));
        }
        catch (Exception e) {}

        Resp resp = post(URL_PREFIX + "DocumentEntete//?Company=001", header);
        success = success && buildMessageItems("Création de l'entête", resp.code, resp.body, responses);
        if (!success) {
            Map<String, Header> allHeaders = getAllHeaders();
            if (allHeaders.containsKey(header.getDocument())) {
                log.info("Entête déjà créée, creation des détails...");
                success = true;
            }
        }

        if (success) {

            Map<String, Details> existingDetails = getAllDetails(header.getDocument());

            for (Details detail : details) {
                if (!existingDetails.containsKey(detail.getLigne())) {
                    resp = post(URL_PREFIX + "DocumentDetail//?Company=001", detail);
                    success = success && buildMessageItems("Création d'un détail", resp.code, resp.body, responses);
                }
                else {
                    String msg = "Ligne " + detail.getLigne() + " déjà créée pour le document " + header.getDocument();
                    log.info(msg);
                    buildMessageItems("Création d'un détail", HttpStatus.ALREADY_REPORTED.value(), msg, responses);
                }
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
    private void logJson(String json) {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        JsonParser jp = new JsonParser();
        JsonElement je = jp.parse(json);
        log.info(gson.toJson(je));
    }

    public Map<String, Header> getAllHeaders() throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder().build();

        Request request = addAuthHeaders(new Request.Builder()
                .url(URL_PREFIX + "DocumentEntete?Company=001&Filter={\"Type\":\"BSP\"}&Field=Document,Intervenant,NomIntervenant,Description,Statut,DateDocument,SousTotal,MontantSuspens")
                .get());
        Response response = client.newCall(request).execute();
        String respBody = unescape(response.body().string());
        return Stream.of(mapper.readValue(respBody, Header[].class))
                .collect(Collectors.toMap(Header::getDocument, data -> data));
    }
    public Map<String, Details> getAllDetails(String document) throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder().build();

        Request request = addAuthHeaders(new Request.Builder()
                .url(URL_PREFIX + "DocumentDetail//?Company=001&Filter={\"Type\":\"BSP\",\"Document\":\""+document+"\"}")
                .get());
        Response response = client.newCall(request).execute();
        String respBody = unescape(response.body().string());
        return Stream.of(mapper.readValue(respBody, Details[].class))
                .collect(Collectors.toMap(Details::getLigne, data -> data));
    }

    private Request addAuthHeaders(Request.Builder builder) {
        builder.addHeader("CTRL-Token", "{3F2DB33F-902E-45BC-98C3-C5F18F7019AE}")
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Basic V0VCU1RQOlN0ZWVsMjAyMiE=");
        return builder.build();
    }

    private Resp post(String uri, Object payload) throws IOException {

        OkHttpClient client = new OkHttpClient().newBuilder().build();

        MediaType mediaType = MediaType.parse("application/json");
        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, mapper.writeValueAsString(payload));
        Request request = addAuthHeaders(new Request.Builder()
                .url(uri)
                .method("POST", body));
        Response response = client.newCall(request).execute();
        String respBody = unescape(response.body().string());
        logJson(respBody);

        return Resp.builder().code(response.code()).body(respBody).build();
    }

    @Builder
    private class Resp {
        public int code;
        public String body;
    }
}
