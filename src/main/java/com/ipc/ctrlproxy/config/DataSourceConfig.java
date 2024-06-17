package com.ipc.ctrlproxy.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.*;

@Slf4j
@Component
public class DataSourceConfig
{
    private final ADSConfig adsConfig;

    public DataSourceConfig(@Autowired ADSConfig adsConfig) {
        this.adsConfig = adsConfig;
    }

    public Connection getConnection(String name) throws ClassNotFoundException, SQLException {
        ADSConnection conn = adsConfig.getAds().get(name);
        if (conn.getConnection() != null) {
            if (!validateConnection(conn)) {
                conn.setConnection(null);
            }
        }
        if (conn.getConnection() == null) {
            Class.forName("com.sap.jdbc.advantage.ADSDriver");
            conn.setConnection(DriverManager.getConnection(conn.getUri()));
        }

        return conn.getConnection();
    }

    private boolean validateConnection(ADSConnection adsConnection) {
        try {
            Connection conn = adsConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(adsConnection.getValidation());
            rs.next();
            rs.getInt(1);
            return true;
        }
        catch (Throwable t) {
            log.error("{} connection not valid anymore", adsConnection.getUri(), t);
            return false;
        }
    }
}
