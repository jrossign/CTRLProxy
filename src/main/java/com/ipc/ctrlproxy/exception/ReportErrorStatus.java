package com.ipc.ctrlproxy.exception;

import lombok.Builder;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

@Builder
@Data
public class ReportErrorStatus {
    @Builder.Default
    private String timestamp = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").format(new Date());
    private int status;
    private String error;
    private String message;
    private String path;
}
