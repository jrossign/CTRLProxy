package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.config.DataSourceConfig;
import com.ipc.ctrlproxy.config.QueryConfig;
import com.ipc.ctrlproxy.translator.JSonUtils;
import com.ipc.ctrlproxy.translator.CSVUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.function.Function;

@Slf4j
@Component
public class ReportServices {

    private final DataSourceConfig dbConfig;
    private final QueryConfig qConfig;

    public ReportServices(@Autowired DataSourceConfig dbConfig, @Autowired QueryConfig qConfig)
    {
        this.dbConfig = dbConfig;
        this.qConfig = qConfig;
    }

    public String generateJSONReport(String query, String[] params) {
        return generateReport(query, params, JSonUtils::marshall);
    }

    public String generateCSVReport(String query, String[] params) {
        return generateReport(query, params, CSVUtils::marshall);
    }

    private String generateReport(String query, String[] params, Function<ResultSet, String> marshaller)
    {
        try {
            String connName = qConfig.get(query).getConnection();
            Connection conn = dbConfig.getConnection(connName);
            String sql = qConfig.get(query).getSql();
            log.info("Running {} with params {} on DB {}\n{}", query, Arrays.asList(params).toString(), connName, sql);

            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
                for (int i=0; i<params.length; i++) {
                    pstmt.setString(i+1, params[i]);
                }
                return marshaller.apply(pstmt.executeQuery()) ;
            }

        } catch (Exception e) {
            log.error("ERROR", e);
            return "ERROR: " + e.toString();
        }
    }

}
