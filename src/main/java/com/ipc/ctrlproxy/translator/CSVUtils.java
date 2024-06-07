package com.ipc.ctrlproxy.translator;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CSVUtils
{

    public static String marshall(ResultSet rSet) {
        try {
            StringWriter sw = new StringWriter();
            BufferedWriter bw = new BufferedWriter(sw, 32768);
            CSVFormat format = CSVFormat.DEFAULT.builder().setDelimiter('|').build().withHeader(rSet);
            CSVPrinter csvPrinter = new CSVPrinter(bw, format);
            csvPrinter.printRecords(rSet);
            csvPrinter.flush();
            bw.flush();
            csvPrinter.close();

            return sw.toString();
        }catch (IOException | RuntimeException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
