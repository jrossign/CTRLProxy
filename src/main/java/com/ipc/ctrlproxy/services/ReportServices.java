package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.config.DataSourceConfig;
import com.ipc.ctrlproxy.config.QueryConfig;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.*;
import java.util.Arrays;

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

    public String generateCSVReport(String query, String[] params) {
        try {
            String connName = qConfig.getQueries().get(query).getConnection();
            Connection conn = dbConfig.getConnection(connName);
            String sql = qConfig.getQueries().get(query).getSql();
            log.info("Running {} with params {} on DB {}\n{}", query, Arrays.asList(params).toString(), connName, sql);

            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
                for (int i=0; i<params.length; i++) {
                    pstmt.setString(i+1, params[i]);
                }
                return SCVUtils.getCSV(pstmt.executeQuery()) ;
            }

        } catch (Exception e) {
            log.error("ERROR", e);
            e.printStackTrace();
            return "ERROR: " + e.toString();
        }
    }
    public String generateJSONReport(String query, String[] params) {
        try {
            String connName = qConfig.getQueries().get(query).getConnection();
            Connection conn = dbConfig.getConnection(connName);
            String sql = qConfig.getQueries().get(query).getSql();
            log.info("Running {} with params {} on DB {}\n{}", query, Arrays.asList(params).toString(), connName, sql);

            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
                for (int i=0; i<params.length; i++) {
                    pstmt.setString(i+1, params[i]);
                }
                return JSonUtils.getJson(pstmt.executeQuery()) ;
            }

        } catch (Exception e) {
            log.error("ERROR", e);
            e.printStackTrace();
            return "ERROR: " + e.toString();
        }
    }

}
