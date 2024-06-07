package com.ipc.ctrlproxy.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Map;

@Data
@ConfigurationProperties
public class QueryConfig {
    private Map<String, QueryDefinition> queries;
    public QueryDefinition get(String queryName) {return queries.get(queryName);}
}
