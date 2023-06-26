package com.ipc.ctrlproxy;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.model.steel_po.SPOrder;
import com.ipc.ctrlproxy.services.CTRLWebServices;
import okhttp3.mockwebserver.Dispatcher;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.reactive.server.EntityExchangeResult;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.util.ResourceUtils;
import reactor.core.publisher.Mono;

import java.io.File;
import java.nio.file.Files;
import java.time.Duration;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.http.HttpHeaders.ACCEPT;
import static org.springframework.http.HttpHeaders.CONTENT_TYPE;
import static org.springframework.http.HttpStatus.*;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ContextConfiguration(initializers = MockWebServerInitializer.class)
@ActiveProfiles("test")
@Sql({"/h2.sql", "/achat_commande.sql", "/general_departement.sql", "/general_departement_tache.sql", "/general_fonction.sql", "/general_punch.sql", "/general_employe.sql", "/mysql_functions.sql"})
class CtrlProxyApplicationTests
{
    @Autowired
    private WebTestClient webTestClient;

    @Autowired
    private MockWebServer ctrlWebServer;

    private boolean fail = false;

    @BeforeEach
    public void init()
    {
        webTestClient = webTestClient.mutate()
                .responseTimeout(Duration.ofSeconds(5))
                .build();

        fail = false;
        final Dispatcher dispatcher = new Dispatcher() {

            @Override
            public MockResponse dispatch (RecordedRequest request) throws InterruptedException {

                if (fail) {
                    return new MockResponse().setResponseCode(500).setBody("{\\\"status\\\":\\\"CRTL Error message\\\"}");
                }
                switch (request.getPath()) {
                    case "/header": {
                        System.err.println("CTRL received request : " + request.getBody().readUtf8());
                        return new MockResponse().setResponseCode(200).setBody("{\\\"status\\\":\\\"HEADER SUCCESS\\\"}");
                    }
                    case "/details": {
                        System.err.println("CTRL received request : " + request.getBody().readUtf8());
                        return new MockResponse().setResponseCode(200).setBody("{\\\"status\\\":\\\"DETAILS SUCCESS\\\"}");
                    }
                }
                return new MockResponse().setResponseCode(404);
            }
        };
        ctrlWebServer.setDispatcher(dispatcher);
    }


    @Test
    void testCommandes() throws Exception
    {

        List<SPOrder> pos = loadPurchaseOrderList("classpath:messages/steel/sp_order_1.json");

        EntityExchangeResult<String> result = webTestClient.post()
                .uri(uriBuilder -> uriBuilder
                    .path("/api/ctrlproxy")
                    .queryParam("module", "M")
                    .queryParam("action", "SP_ORDERS")
                    .build())
                .body(Mono.just(load("classpath:messages/steel/sp_order_1.json")), String.class)
                .header(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                .header(ACCEPT, APPLICATION_JSON_VALUE)
                .exchange()
                .expectStatus()
                .isEqualTo(OK)
                .expectBody(String.class)
                .returnResult();

        System.err.println("Received: " + result.getResponseBody());
        assertEquals("{\n" +
                "  \"status\" : \"1\",\n" +
                "  \"messageItem\" : [ {\n" +
                "    \"messages\" : [ {\n" +
                "      \"type\" : \"S\",\n" +
                "      \"message\" : \"StatusCode : 200\"\n" +
                "    }, {\n" +
                "      \"type\" : \"S\",\n" +
                "      \"message\" : \"Body : {\\\\\\\"status\\\\\\\":\\\\\\\"HEADER SUCCESS\\\\\\\"}\"\n" +
                "    } ]\n" +
                "  }, {\n" +
                "    \"messages\" : [ {\n" +
                "      \"type\" : \"S\",\n" +
                "      \"message\" : \"StatusCode : 200\"\n" +
                "    }, {\n" +
                "      \"type\" : \"S\",\n" +
                "      \"message\" : \"Body : {\\\\\\\"status\\\\\\\":\\\\\\\"DETAILS SUCCESS\\\\\\\"}\"\n" +
                "    } ]\n" +
                "  } ]\n" +
                "}", result.getResponseBody());


    }

    @Test
    void testReception() throws Exception
    {
        EntityExchangeResult<String> result = webTestClient.post()
                .uri(uriBuilder -> uriBuilder
                        .path("/api/ctrlproxy")
                        .queryParam("module", "M")
                        .queryParam("action", "SP_RECEIVING")
                        .build())
                .body(Mono.just(load("classpath:messages/po2.json")), String.class)
                .header(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                .header(ACCEPT, APPLICATION_JSON_VALUE)
                .exchange()
                .expectStatus()
                .isEqualTo(OK)
                .expectBody(String.class)
                .returnResult();

        System.err.println("Received: " + result.getResponseBody());
        assertEquals("{\n" +
                "  \"status\" : \"1\",\n" +
                "  \"messageHeader\" : [ {\n" +
                "    \"type\" : \"S\",\n" +
                "    \"message\" : \"StatusCode : 200\"\n" +
                "  }, {\n" +
                "    \"type\" : \"S\",\n" +
                "    \"message\" : \"Body : {\\\\\\\"info\\\\\\\":{\\\\\\\"name\\\":\\\"Lucas Albuquerque\\\",\\\"age\\\":\\\"21\\\",\\\"gender\\\":\\\"male\\\"}}\"\n" +
                "  } ]\n" +
                "}", result.getResponseBody());
        
    }

    @Test
    void testError1() throws Exception
    {
        webTestClient.post()
                .uri(uriBuilder -> uriBuilder
                        .path("/api/ctrlproxy")
                        .queryParam("module", "M")
                        .queryParam("action", "DOES_NOT_EXIST")
                        .build())
                .body(Mono.just(load("classpath:messages/po2.json")), String.class)
                .header(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                .header(ACCEPT, APPLICATION_JSON_VALUE)
                .exchange()
                .expectStatus()
                .isEqualTo(INTERNAL_SERVER_ERROR);
    }

    @Test
    void testError2() throws Exception
    {
        webTestClient.post()
                .uri(uriBuilder -> uriBuilder
                        .path("/api/ctrlproxy")
                        .queryParam("module", "M")
                        .queryParam("action", "SP_RECEIVING")
                        .build())
                .body(Mono.just("{ \"foo\" : \"bar\"}"), String.class)
                .header(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                .header(ACCEPT, APPLICATION_JSON_VALUE)
                .exchange()
                .expectStatus()
                .isEqualTo(BAD_REQUEST);
    }

    @Test
    void testReceptionFailure() throws Exception
    {
        fail = true;
        EntityExchangeResult<String> result = webTestClient.post()
                .uri(uriBuilder -> uriBuilder
                        .path("/api/ctrlproxy")
                        .queryParam("module", "M2")
                        .queryParam("action", "SP_RECEIVING")
                        .build())
                .body(Mono.just(load("classpath:messages/po2.json")), String.class)
                .header(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                .header(ACCEPT, APPLICATION_JSON_VALUE)
                .exchange()
                .expectStatus()
                .isEqualTo(OK)
                .expectBody(String.class)
                .returnResult();

        System.err.println("Received: " + result.getResponseBody());
        assertEquals("{\n" +
                "  \"status\" : \"2\",\n" +
                "  \"messageHeader\" : [ {\n" +
                "    \"type\" : \"E\",\n" +
                "    \"message\" : \"StatusCode : 500\"\n" +
                "  }, {\n" +
                "    \"type\" : \"E\",\n" +
                "    \"message\" : \"Body : {\\\\\\\"status\\\\\\\":\\\\\\\"CRTL Error message\\\\\\\"}\"\n" +
                "  } ]\n" +
                "}", result.getResponseBody());

    }

    public List<SPOrder> loadPurchaseOrderList(String path) throws Exception
    {
        String content = load(path);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(content, new TypeReference<List<SPOrder>>(){});
    }

    public String load(String path) throws Exception
    {
        File file = ResourceUtils.getFile(path);
        return new String(Files.readAllBytes(file.toPath()));
    }

}
