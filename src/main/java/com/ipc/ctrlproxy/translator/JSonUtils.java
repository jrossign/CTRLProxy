package com.ipc.ctrlproxy.translator;


import com.ipc.ctrlproxy.config.ADSConfig;
import lombok.extern.slf4j.Slf4j;
import org.jooq.impl.DSL;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Slf4j
@Component
public class JSonUtils
{

    @Autowired
    private static ADSConfig config;


    public static String marshall(ResultSet resultSet) {
        try {
            List<String> colNames = getCollumnNames(resultSet);

            JSONArray result = new JSONArray();
            while (resultSet.next()) {
                JSONObject row = new JSONObject();
                colNames.forEach(cn -> {
                    try {
                        row.put(cn, resultSet.getString(cn));
                    } catch (JSONException | SQLException e) {
                        log.error("Unable to extract column value", e);
                    }
                });
                result.put(row);
            }
            return result.toString();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static List<String> getCollumnNames(ResultSet resultSet) throws SQLException
    {
        ResultSetMetaData md = resultSet.getMetaData();
        int numCols = md.getColumnCount();
        return IntStream.range(0, numCols)
                .mapToObj(i -> {
                    try {
                        return md.getColumnName(i + 1);
                    } catch (SQLException e) {
                        log.error("Unable to extract column name {}", (i+1), e);
                        return "?";
                    }
                })
                .collect(Collectors.toList());

    }

    public static String marshallSlim(ResultSet resultSet) {
       return DSL.using(config.get("produit").getConnection()).fetch(resultSet).formatJSON();
    }


}
