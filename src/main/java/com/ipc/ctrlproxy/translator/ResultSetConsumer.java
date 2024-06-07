package com.ipc.ctrlproxy.translator;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetConsumer
{
    String consume(ResultSet rSet) throws SQLException;
}
