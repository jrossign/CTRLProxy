package com.ipc.ctrlproxy.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Map;

@Data
@ConfigurationProperties
public class ADSConfig {

    private Map<String, ADSConnection> ads;
    public ADSConnection get(String name) {
        return ads.get(name);
    }
}
