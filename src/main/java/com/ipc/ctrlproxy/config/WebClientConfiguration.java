package com.ipc.ctrlproxy.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.ipc.ctrlproxy.exception.CRTLException;
import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.Status;
import io.netty.channel.ChannelOption;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.timeout.ReadTimeoutHandler;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.reactive.function.client.ClientRequest;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import reactor.core.publisher.Mono;
import reactor.netty.http.client.HttpClient;
import reactor.netty.transport.logging.AdvancedByteBufFormat;

import java.net.URI;
import java.time.Duration;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@Configuration
@Slf4j
public class WebClientConfiguration
{
    @Autowired
    private CTRLConfig config;


    @Bean(name = "CRTLWebClient")
    public WebClient getCRTLWebClient()
    {
        String BASE_URL = "http://" + config.getHostname() + ":" + config.getPort();
        DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
        factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.NONE);
        factory.setParsePath(false);

        HttpClient httpClient = HttpClient.create()
                .option(ChannelOption.CONNECT_TIMEOUT_MILLIS, 30000)
                .responseTimeout(Duration.ofSeconds(30))
                .doOnRequest((req, conn) -> {
                    log.info("Sending request to " + BASE_URL);
                })
                .doOnConnect(req -> {
                    log.info("Connecting to " + BASE_URL);
                })
                .doOnConnected(req -> {
                    log.info("Connected to " + BASE_URL);
                })
                .doOnResponse((resp, conn) -> {
                    log.info("Received response from " + BASE_URL);
                })
                .wiretap("reactor.netty.http.client.HttpClient",
                        LogLevel.INFO, AdvancedByteBufFormat.TEXTUAL)
                .doOnConnected(conn ->
                        conn.addHandlerLast(new ReadTimeoutHandler(30, TimeUnit.SECONDS)));



        return WebClient
                .builder()
                .baseUrl(BASE_URL)
                .uriBuilderFactory(factory)
                .clientConnector(new ReactorClientHttpConnector(httpClient))
                .filter((request, next) ->
                        Mono.deferContextual(ctx -> {
                            ClientRequest cr = ClientRequest.from(request)
                                    .url(URI.create(request.url().toString().replace("/?", "//?")))
                                    .build();
                            return next.exchange(cr);
                        }))
                .filters(exchangeFilterFunctions -> {
                    exchangeFilterFunctions.add(logRequest());
                    exchangeFilterFunctions.add(logResponse());
                    //exchangeFilterFunctions.add(renderApiErrorResponse());
                })
                .build();


    }

    private static ExchangeFilterFunction logRequest() {
        return ExchangeFilterFunction.ofRequestProcessor(clientRequest -> {
            log.info("Request: {} {}", clientRequest.method(), clientRequest.url());
            clientRequest.headers().forEach((name, values) -> values.forEach(value -> log.info("{}={}", name, value)));
            return Mono.just(clientRequest);
        });
    }

    private static ExchangeFilterFunction logResponse() {
    return ExchangeFilterFunction.ofResponseProcessor(clientResponse -> {
        log.info("Response status: {}", clientResponse.statusCode());
        clientResponse.headers().asHttpHeaders().forEach((name, values) -> values.forEach(value -> log.info("{}={}", name, value)));
        return Mono.just(clientResponse);
    });
}


    private ExchangeFilterFunction renderApiErrorResponse() {

        return ExchangeFilterFunction.ofResponseProcessor(clientResponse -> {
            if (clientResponse.statusCode().isError()) {
                return clientResponse.bodyToMono(String.class)
                    .flatMap(errorBody -> Mono.error(new CRTLException( Status.builder()
                            .status("2")
                            .messageHeader(Arrays.asList(
                                    Message.builder().type("E").message("StatusCode : " + clientResponse.statusCode().value()).build(),
                                    Message.builder().type("E").message("Body : " + errorBody).build()))
                            .build())));
            }
            else {
                return clientResponse.bodyToMono(String.class)
                        .flatMap(responseBody -> Mono.just(clientResponse.mutate().body(getStatus(clientResponse.statusCode().value(), responseBody)).build()));
            }
        });

    }

    @SneakyThrows
    private String getStatus(int statusCode, String body) {
        return customJson().writeValueAsString(Status.builder()
                .status("1")
                .messageHeader(Arrays.asList(
                        Message.builder().type("T").message("StatusCode : " + statusCode).build(),
                        Message.builder().type("T").message("Body : " + body).build()))
                .build());
    }

    @Bean
    public ObjectMapper customJson() {

        return new Jackson2ObjectMapperBuilder()
                .indentOutput(true)
                .propertyNamingStrategy(PropertyNamingStrategy.UPPER_CAMEL_CASE)
                .build();
    }

}
