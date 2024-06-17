package com.ipc.ctrlproxy.controller;

import com.ipc.ctrlproxy.config.Measured;
import com.ipc.ctrlproxy.exception.ReportErrorStatus;
import com.ipc.ctrlproxy.services.ReportServices;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController
{
    @Autowired
    private ReportServices services;

    /**
     * Generic calls CSV returns
     * @param query
     * @param params
     * @return PainText
     */
    @Measured
    @GetMapping(value = "/api/{query}/{params}", produces = { MediaType.TEXT_PLAIN_VALUE, "text/csv" })
    public String apiText(@PathVariable String query, @PathVariable String[] params) {
        return services.generateCSVReport(query, params);
    }

    /**
     * Generic calls JSON return
     * @param query
     * @param params
     * @return JSON
     */
    @Measured
    @GetMapping(value = "/api/{query}/{params}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String apiJson(@PathVariable String query, @PathVariable String[] params) {
        return services.generateJSONReport(query, params);
    }

    /**
     * Generic calls, no parameters, CSV returns
     * @param query
     * @return PlainText
     */
    @Measured
    @GetMapping(value = "/api/{query}", produces = { MediaType.TEXT_PLAIN_VALUE, "text/csv" })
    public String apiTextNoParams(@PathVariable String query) {
        return services.generateCSVReport(query, new String[0]);
    }

    /**
     * Generic calls, no parameters, JSON return
     * @param query
     * @return JSON
     */
    @Measured
    @GetMapping(value = "/api/{query}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String apiJsonNoParams(@PathVariable String query) {
        return services.generateJSONReport(query, new String[0]);
    }


    /**
     * Non generic call
     * @param query
     * @param params
     * @return
     */
    @Measured
    @GetMapping(value = "/api/specific/{query}/{params}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String reportNeedingProcessing(@PathVariable String query, @PathVariable String[] params) {
        return "TODO";
    }

    @ExceptionHandler({Exception.class})
    protected ResponseEntity<ReportErrorStatus> handleReportException(Exception e, WebRequest req) {
        return new ResponseEntity<>(ReportErrorStatus.builder()
                .status(HttpStatus.INTERNAL_SERVER_ERROR.value())
                .path(((ServletWebRequest)req).getRequest().getRequestURI().toString())
                .error("Internal server error")
                .message(e.getMessage())
                .build(),
                HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
