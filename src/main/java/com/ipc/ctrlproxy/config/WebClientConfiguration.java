package com.ipc.ctrlproxy.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.Status;
import io.netty.channel.ChannelOption;
import io.netty.handler.timeout.ReadTimeoutHandler;
import io.netty.handler.timeout.WriteTimeoutHandler;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.reactive.function.client.ClientResponse;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import reactor.netty.http.client.HttpClient;

import java.time.Duration;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@Configuration
public class WebClientConfiguration implements InitializingBean
{
    @Autowired
    private CTRLConfig config;

    @Bean(name = "CRTLWebClient")
    public WebClient getCRTLWebClient()
    {

        HttpClient httpClient = HttpClient.create()
                .option(ChannelOption.CONNECT_TIMEOUT_MILLIS, 30000)
                .responseTimeout(Duration.ofSeconds(30))
                .doOnConnected(conn ->
                        conn.addHandlerLast(new ReadTimeoutHandler(30, TimeUnit.SECONDS))
                                .addHandlerLast(new WriteTimeoutHandler(30, TimeUnit.SECONDS)));

        WebClient client = WebClient
                .builder()
                .baseUrl("http://" + config.getHostname() + ":" + config.getPort())
                .clientConnector(new ReactorClientHttpConnector(httpClient))
                //.filter(ExchangeFilterFunction.ofResponseProcessor(this::renderApiErrorResponse))
                .build();

        return client;
    }

    private Mono<Status> renderApiErrorResponse(ClientResponse clientResponse) {
        if(clientResponse.statusCode().isError()){
            return clientResponse.bodyToMono(String.class)
                    .flatMap(body -> Mono.just(
                            Status.builder()
                                    .status("2")
                                    .messageHeader(Arrays.asList(
                                                    Message.builder().type("E").message("StatusCode : " + clientResponse.statusCode().value()).build(),
                                                    Message.builder().type("E").message("Body : " + body).build()))
                                    .build()));
        }
        return clientResponse.bodyToMono(String.class)
                .flatMap(body -> Mono.just(
                        Status.builder()
                                .status("1")
                                .messageHeader(Arrays.asList(
                                        Message.builder().type("T").message("StatusCode : " + clientResponse.statusCode().value()).build(),
                                        Message.builder().type("T").message("Body : " + body).build()))
                                .build()));
    }

    @Bean
    public ObjectMapper customJson() {

        return new Jackson2ObjectMapperBuilder()
                .indentOutput(true)
                .propertyNamingStrategy(PropertyNamingStrategy.UPPER_CAMEL_CASE)
                .build();
    }


    @Override
    public void afterPropertiesSet() throws Exception
    {

    }
}
