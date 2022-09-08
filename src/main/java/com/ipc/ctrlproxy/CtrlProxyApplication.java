package com.ipc.ctrlproxy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan("com.ipc.ctrlproxy.config")
public class CtrlProxyApplication
{

    public static void main(String[] args)
    {
        SpringApplication.run(CtrlProxyApplication.class, args);
    }

}
