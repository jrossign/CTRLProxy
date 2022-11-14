package com.ipc.ctrlproxy.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Component
public class CTRLWebServices implements InitializingBean  {


    private static final String URL_PREFIX = "http://192.168.1.157:8002/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/";

    @Autowired
    private ObjectMapper mapper;

    public Map<String, Header> getAllCTRLHeaders() throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder().build();

        Request request = addAuthHeaders(new Request.Builder()
                .url(URL_PREFIX + "DocumentEntete?Company=001&Filter={\"Type\":\"BSP\"}&Field=Document,Intervenant,NomIntervenant,Description,Statut,DateDocument,SousTotal,MontantSuspens,IdentifiantUnique,DocumentMaitre,Type,CommentaireGeneral")
                .get());
        Response response = client.newCall(request).execute();
        String respBody = unescape(response.body().string());
        return Stream.of(mapper.readValue(respBody, Header[].class))
                .collect(Collectors.toMap(Header::getDocument, data -> data));
    }
    public Map<String, Details> getAllCTRLDetails(String document) throws IOException {
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

    public CTRLResponse delete(String uri) throws IOException {
        return send(new Request.Builder()
                .url(URL_PREFIX + uri)
                .delete());
    }

    public CTRLResponse post(String uri, Object payload) throws IOException {

        MediaType mediaType = MediaType.parse("application/json");
        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, mapper.writeValueAsString(payload));

        return send(new Request.Builder()
                .url(URL_PREFIX + uri)
                .post(body));
    }
    public CTRLResponse put(String uri, Object payload) throws IOException {

        MediaType mediaType = MediaType.parse("application/json");
        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, mapper.writeValueAsString(payload));

        return send(new Request.Builder()
                .url(URL_PREFIX + uri)
                .put(body));
    }

    private CTRLResponse send(Request.Builder request) throws IOException {

        OkHttpClient client = new OkHttpClient().newBuilder().build();
        Response response = client.newCall(addAuthHeaders(request)).execute();
        String respBody = unescape(response.body().string());
        logJson(respBody);

        return CTRLResponse.builder().code(response.code()).body(respBody).build();
    }


    private String unescape(String str) {
        if (str.contains("\\u")) {
            return StringEscapeUtils.unescapeJava(str);
        }
        return str;
    }

    private void logJson(String json) {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        JsonParser jp = new JsonParser();
        JsonElement je = jp.parse(json);
        log.info(gson.toJson(je));
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        logJson(mapper.writeValueAsString(getAllCTRLHeaders()));
        logJson(mapper.writeValueAsString(getAllCTRLDetails("BSP00BSP27")));
    }

}
