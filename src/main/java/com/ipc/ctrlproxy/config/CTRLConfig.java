package com.ipc.ctrlproxy.config;


import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "ctrl")
@Data
@Slf4j
public class CTRLConfig implements InitializingBean
{

    private static final String URL_PREFIX = "/service/sgiweb.dll/Datasnap/Rest/TProductMethods/Request/";

    private String hostname;
    private int port;

    public String getUrlPrefix() {
        return "http://" + hostname + ":" + port + URL_PREFIX;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        log.info("Connecting to CTRL on {}:{}", hostname, port);
    }
}
