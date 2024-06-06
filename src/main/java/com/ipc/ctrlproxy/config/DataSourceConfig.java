package com.ipc.ctrlproxy.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.*;

@Slf4j
@Component
public class DataSourceConfig
{
    private static final String VALIDATION_QUERY = "select count(1) from \"ls01pwem\"";

    @Autowired
    private ADSConfig adsConfig;

    public Connection getConnection(String name) throws ClassNotFoundException, SQLException {
        ADSConnection conn = adsConfig.getAds().get(name);
        if (conn.getConnection() != null) {
            if (!validateConnection(conn.getConnection())) {
                conn.setConnection(null);
            }
        }
        if (conn.getConnection() == null) {
            Class.forName("com.sap.jdbc.advantage.ADSDriver");
            conn.setConnection(DriverManager.getConnection(conn.getUri()));
        }

        return conn.getConnection();
    }

    private boolean validateConnection(Connection conn) {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(VALIDATION_QUERY);
            rs.next();
            rs.getInt(1);
            return true;
        }
        catch (Throwable t) {
            log.info("Connection not valid anymore");
            return false;
        }
    }
}
