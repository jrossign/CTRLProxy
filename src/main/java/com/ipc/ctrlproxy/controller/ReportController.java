package com.ipc.ctrlproxy.controller;

import com.ipc.ctrlproxy.services.ReportServices;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController
{
    @Autowired
    private ReportServices services;

    /**
     * Generic calls
     * @param query
     * @param params
     * @return
     */
    @GetMapping(value = "/api/{query}/{params}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String api(@PathVariable String query, @PathVariable String[] params) {
        return services.generateReport(query, params);
    }

    /**
     * Generic calls, no parameters
     * @param query
     * @return
     */
    @GetMapping(value = "/api/{query}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String apiNoParams(@PathVariable String query) {
        return services.generateReport(query, new String[0]);
    }

    /**
     * Non generic call
     * @param query
     * @param params
     * @return
     */
    @GetMapping(value = "/api/specific/{query}/[{params}]", produces = MediaType.TEXT_PLAIN_VALUE)
    public String reportNeedingProcessing(@PathVariable String query, @PathVariable String[] params) {
        return "TODO";
    }

}
