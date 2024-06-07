package com.ipc.ctrlproxy.controller;

import com.ipc.ctrlproxy.services.ReportServices;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
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
     * @return PainText
     */
    @GetMapping(value = "/api/{query}/{params}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String apiText(@PathVariable String query, @PathVariable String[] params) {
        return services.generateCSVReport(query, params);
    }

    /**
     * Generic calls
     * @param query
     * @param params
     * @return JSON
     */
    @GetMapping(value = "/api/{query}/{params}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String apiJson(@PathVariable String query, @PathVariable String[] params) {
        return services.generateJSONReport(query, params);
    }

    /**
     * Generic calls, no parameters
     * @param query
     * @return PlainText
     */
    @GetMapping(value = "/api/{query}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String apiTextNoParams(@PathVariable String query) {
        return services.generateCSVReport(query, new String[0]);
    }

    /**
     * Generic calls, no parameters
     * @param query
     * @return JSON
     */
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
    @GetMapping(value = "/api/specific/{query}/{params}", produces = MediaType.TEXT_PLAIN_VALUE)
    public String reportNeedingProcessing(@PathVariable String query, @PathVariable String[] params) {
        return "TODO";
    }

}
