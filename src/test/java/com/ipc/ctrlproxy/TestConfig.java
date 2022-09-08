package com.ipc.ctrlproxy;

import okhttp3.mockwebserver.MockWebServer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TestConfig
{


    @Bean
    public MockWebServer getMockCTRLWebServer() {
        return MockWebServerInitializer.get();
    }
}
