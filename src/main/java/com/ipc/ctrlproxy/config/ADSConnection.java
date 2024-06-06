package com.ipc.ctrlproxy.config;

import lombok.Data;

import java.sql.Connection;

@Data
public class ADSConnection {

    private String uri;
    private String validation;
    private Connection connection;
}
