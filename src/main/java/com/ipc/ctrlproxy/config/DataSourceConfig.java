package com.ipc.ctrlproxy.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.*;

@Slf4j
@Component
public class DataSourceConfig
{
    String VALIDATION_QUERY = "select count(1) from \"ls01pwem\"";

    private Connection dossierConnection;
    private Connection projetConnection;

    public Connection getDossierConnection() throws ClassNotFoundException, SQLException {
        if (dossierConnection != null) {
            if (!validateConnection(dossierConnection)) {
                dossierConnection = null;
            }
        }
        if (dossierConnection == null) {
            Class.forName("com.sap.jdbc.advantage.ADSDriver");
            dossierConnection = DriverManager.getConnection("jdbc:sap:advantage://192.168.3.4:6262/ctrl/dossier/data/smigg.add;user=AdsExt;password=LectureSeulement");
        }

        return dossierConnection;
    }
    public Connection getProjetConnection() throws ClassNotFoundException, SQLException {
        if (projetConnection != null) {
            if (!validateConnection(projetConnection)) {
                projetConnection = null;
            }
        }
        if (projetConnection == null) {
            Class.forName("com.sap.jdbc.advantage.ADSDriver");
            projetConnection = DriverManager.getConnection("jdbc:sap:advantage://192.168.3.4:6262/ctrl/projet/data/smigg.add;user=AdsExt;password=LectureSeulement");
        }

        return projetConnection;
    }
    public Connection getProduitConnection() throws ClassNotFoundException, SQLException {
        if (projetConnection != null) {
            if (!validateConnection(projetConnection)) {
                projetConnection = null;
            }
        }
        if (projetConnection == null) {
            Class.forName("com.sap.jdbc.advantage.ADSDriver");
            projetConnection = DriverManager.getConnection("jdbc:sap:advantage://192.168.3.4:6262/ctrl/produit/data/smigg.add;user=AdsExt;password=LectureSeulement");
        }

        return projetConnection;
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
