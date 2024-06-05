package com.ipc.ctrlproxy.services;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SCVUtils {

    public static String getCSV(ResultSet rSet) throws SQLException, IOException {
        StringWriter sw = new StringWriter();
        BufferedWriter bw = new BufferedWriter(sw);
        CSVFormat format = CSVFormat.DEFAULT.builder().setDelimiter('|').build().withHeader(rSet);
        CSVPrinter csvPrinter = new CSVPrinter(bw, format);
        csvPrinter.printRecords(rSet);
        csvPrinter.flush();
        bw.flush();
        csvPrinter.close();

        return sw.toString();
    }

}
