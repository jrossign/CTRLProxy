package com.ipc.ctrlproxy.translator;

import lombok.SneakyThrows;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CSVUtils
{

    @SneakyThrows
    public static String marshall(PreparedStatement preparedStatement)
    {
        ResultSet rSet = preparedStatement.executeQuery();
        StringWriter sw = new StringWriter();
        BufferedWriter bw = new BufferedWriter(sw, 32768);
        CSVFormat format = CSVFormat.DEFAULT.builder().setDelimiter('|').build().withHeader(rSet);
        CSVPrinter csvPrinter = new CSVPrinter(bw, format);
        csvPrinter.printRecords(rSet);
        csvPrinter.flush();
        bw.flush();
        csvPrinter.close();

        return sw.toString();
    }

}
