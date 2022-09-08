package com.ipc.ctrlproxy.config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "ctrl")
@Data
public class CTRLConfig
{
    private String hostname;
    private int port;
}
