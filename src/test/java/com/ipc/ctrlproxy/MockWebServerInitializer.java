package com.ipc.ctrlproxy;

import okhttp3.mockwebserver.MockWebServer;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

import java.util.Map;


public class MockWebServerInitializer implements ApplicationContextInitializer<ConfigurableApplicationContext>
{

    private static final MockWebServer mockCTRLWebServer = new MockWebServer();
    private static boolean started = false;

    @Override
    public void initialize(ConfigurableApplicationContext applicationContext) {

        try {
            if (!started) {
                started = true;
                mockCTRLWebServer.start();
                System.out.println("Setting up MockWebServer on " + mockCTRLWebServer.getPort());
                TestPropertyValues
                        .of(Map.of("ctrl.port", String.valueOf(mockCTRLWebServer.getPort())))
                        .applyTo(applicationContext);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static MockWebServer get() {
        return mockCTRLWebServer;
    }


}