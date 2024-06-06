package com.ipc.ctrlproxy.config;

import lombok.Data;

@Data
public class QueryDefinition {
    private String connection;
    private String sql;
}
