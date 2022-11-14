package com.ipc.ctrlproxy.translator;

import java.text.SimpleDateFormat;

public interface Translator {
    SimpleDateFormat STEEL_DATE_FORMAT = new SimpleDateFormat("yyyyMMdd");
    SimpleDateFormat CTRL_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat CTRL_DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
}
