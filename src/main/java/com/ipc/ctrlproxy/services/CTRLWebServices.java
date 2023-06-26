package com.ipc.ctrlproxy.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ipc.ctrlproxy.config.CTRLConfig;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.text.translate.AggregateTranslator;
import org.apache.commons.lang3.text.translate.CharSequenceTranslator;
import org.apache.commons.lang3.text.translate.OctalUnescaper;
import org.apache.commons.lang3.text.translate.UnicodeUnescaper;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Component
public class CTRLWebServices implements InitializingBean  {


    @Autowired
    private CTRLConfig config;

    @Autowired
    private ObjectMapper mapper;

    private FilterProvider filters;

    public Map<String, Header> getAllCTRLOrderHeaders() throws IOException {
        log.info("getAllCTRLOrderHeaders()");
        return getAllCTRLHeaders("BSP", null);
    }
    public Map<String, Header> getAllCTRLReceiptHeaders(String document) throws IOException {
        log.info("getAllCTRLReceiptHeaders({})", document);
        return getAllCTRLHeaders("RSP", document);
    }
    private Map<String, Header> getAllCTRLHeaders(String type, String document) throws IOException {
        String docuParam = document!=null?",\"DocumentMaitre\":\""+document+"\"":"";
        String fieldsParam = "&Field=Document,Intervenant,NomIntervenant,Description,Statut,DateDocument,SousTotal,MontantSuspens,IdentifiantUnique,DocumentMaitre,Type,CommentaireGeneral";
        String url = config.getUrlPrefix() + "DocumentEntete?Company=001&Filter={\"Type\":\""+type+"\""+docuParam+"}"+fieldsParam;
        log.info("getAllCTRLHeaders({}, {}) using url : {}", type, document, url);
        Request request = addAuthHeaders(new Request.Builder()
                .url(url)
                .get());
        Response response = buildClient().newCall(request).execute();
        String respBody = unescape(response.body().string());
        return Stream.of(mapper.readValue(respBody, Header[].class))
                .collect(Collectors.toMap(Header::getDocument, data -> data));
    }

    public Map<String, List<Details>> getAllCTRLReceipt(String document) throws IOException {
        log.info("getAllCTRLReceipt({})", document);
        return getAllCTRLDetails(document, "RSP");
    }
    public Map<String, List<Details>> getAllCTRLOrders(String document) throws IOException {
        log.info("getAllCTRLOrders({})", document);
        return getAllCTRLDetails(document, "BSP");
    }
    private Map<String, List<Details>> getAllCTRLDetails(String document, String type) throws IOException {
        String docuParam = "\""+("BSP".equals(type)?"Document":"DocumentMaitre")+"\":\""+document+"\"";
        String fieldsParam = "&Field=Type,Document,DocumentMaitre,Ligne,Projet,Transaction1Quantite,Transaction2Quantite,Statut,QuantiteSuspend,DescriptionLigne,Transaction1QuantiteMaitre,QuantiteDejaTraiteeMaitre,Ordre,LigneDocumentMaitre,IdentifiantUnique";
        Request request = addAuthHeaders(new Request.Builder()
                .url(config.getUrlPrefix() + "DocumentDetail//?Company=001&Filter={\"Type\":\""+type+"\","+docuParam+"}"+fieldsParam)
                .get());
        Response response = buildClient().newCall(request).execute();
        String respBody = unescape(response.body().string());
        return Stream.of(mapper.readValue(respBody, Details[].class))
                .collect(Collectors.groupingBy(Details::getDescriptionLigne));
    }
    private Request addAuthHeaders(Request.Builder builder) {
        builder.addHeader("CTRL-Token", config.getToken())
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", config.getAuth());
        return builder.build();
    }

    public CTRLResponse delete(String uri) throws IOException {
        return send(new Request.Builder()
                .url(config.getUrlPrefix() + uri)
                .delete());
    }

    public CTRLResponse post(String uri, Object payload) throws IOException {

        MediaType mediaType = MediaType.parse("application/json");
        String json = mapper.writer(filters).writeValueAsString(payload);

        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, json);

        return send(new Request.Builder()
                .url(config.getUrlPrefix() + uri)
                .post(body));
    }
    public CTRLResponse put(String uri, Object payload) throws IOException {

        MediaType mediaType = MediaType.parse("application/json");
        String json = mapper.writer(filters).writeValueAsString(payload);
        okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, json);

        return send(new Request.Builder()
                .url(config.getUrlPrefix() + uri)
                .put(body));
    }

    private CTRLResponse send(Request.Builder request) throws IOException {
        Response response = buildClient().newCall(addAuthHeaders(request)).execute();
        String respBody = unescape(response.body().string());
        logJson(respBody);

        return CTRLResponse.builder().code(response.code()).body(respBody).build();
    }

    private OkHttpClient buildClient() {
        OkHttpClient client = new OkHttpClient()
                .newBuilder()
                .callTimeout(Duration.ofSeconds(20))
                .readTimeout(Duration.ofSeconds(20))
                .retryOnConnectionFailure(true)
                //.addNetworkInterceptor(new RetryAndFollowUpInterceptor())
                .build();
        //client.networkInterceptors().add(new RetryAndFollowUpInterceptor(client));

        return client;
    }


    public static String unescape(String str) {
        if (str.contains("\\u")) {
            return new AggregateTranslator(new UnicodeUnescaper()).translate(str);
            //return StringEscapeUtils.unescapeJava(str);
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
        SimpleBeanPropertyFilter actionTypeFilter = SimpleBeanPropertyFilter.serializeAllExcept("actionType");
        filters = new SimpleFilterProvider().addFilter("actionTypeFilter", actionTypeFilter);

        //logJson(mapper.writeValueAsString(getAllCTRLOrderHeaders()));
        logJson(mapper.writeValueAsString(getAllCTRLReceiptHeaders("BSP00281")));
        logJson(mapper.writeValueAsString(getAllCTRLOrders("BSP00281")));
        logJson(mapper.writeValueAsString(getAllCTRLReceipt("BSP00281")));
    }

}
