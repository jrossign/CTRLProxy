package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.config.DataSourceConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.*;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;

@Slf4j
@Component
public class ReportServices {

    @Autowired
    private DataSourceConfig dbConfig;

    public String report1(String param1) {
        try {
            Connection conn = dbConfig.getProduitConnection();

            String sql = "SELECT IS17DODE.FI16DOCCOD, IS16DOEN.FI16DOCSTA," +
                    "IS17DODE.FI17DOCLIG, IS17DODE.FI17DOCORD," +
                    "IS16DOEN.FI16DATINS, IS17DODE.FI16TYPCOD," +
                    "IS17DODE.FI17DOCMAI, IS17DODE.FI17LIGMAI," +
                    "IS16DOEN.FI16FACCOD, IS17DODE.FI17PRJCOD," +
                    "IS17DODE.FI17ACTCOD, ES02ACTI.FE02ACTDES," +
                    "IS17DODE.FI17DESLIG, IS17DODE.FI17QTESUS," +
                    "IS17DODE.FI17QTETRT, IS17DODE.FI17PRX001," +
                    "IS17DODE.FI17QTEANN, IS17DODE.FI17TOT001 FROM  \"ci001-is17dode\"  IS17DODE " +
                    "LEFT OUTER JOIN  \"ci001-is16doen\"  IS16DOEN ON " +
                    "(IS16DOEN.FI16TYPCOD = IS17DODE.FI16TYPCOD) " +
                    "AND (IS16DOEN.FI16DOCCOD = IS17DODE.FI16DOCCOD) " +
                    "LEFT OUTER JOIN  \"//ctrl-lainco-0/ctrl/projet/data/smigg.add\".\"ci001-es02acti\"  ES02ACTI ON " +
                    "(ES02ACTI.FE02ACTCOD = IS17DODE.FI17ACTCOD) " +
                    "WHERE " +
                    "IS17DODE.FI16TYPCOD IN ('BSP','RSP','FSP','BCS','BCF','RCF','FFF','BSP','RSP','FSP','BCS','BCF','RCF','FFF') " +
                    "AND IS17DODE.FI17PRJCOD = ? ;";
            log.info("Running \n{}", sql);

            try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
                pstmt.setString(1, param1);
                return SCVUtils.getCSV(pstmt.executeQuery()) ;
            }

        } catch (Exception e) {
            log.error("ERROR", e);
            e.printStackTrace();
            return "ERROR: " + e.toString();
        }
    }

}
