package com.ipc.ctrlproxy.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.config.DataSourceConfig;
import com.ipc.ctrlproxy.model.status.Status;
import com.ipc.ctrlproxy.model.steel_del.SPDelivery;
import com.ipc.ctrlproxy.model.steel_po.SPOrder;
import com.ipc.ctrlproxy.services.CTRLOrderServices;
import com.ipc.ctrlproxy.services.CTRLReceiveServices;
import com.ipc.ctrlproxy.services.ReportServices;
import com.ipc.ctrlproxy.translator.SteelDeliveryToCTRLTranslator;
import com.ipc.ctrlproxy.translator.SteelPOToCTRLTranslator;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.ServiceUnavailableException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController
{
    @Autowired
    private ReportServices services;

    @GetMapping(value = "/rapport1", produces = MediaType.TEXT_PLAIN_VALUE)
    public String approvisionnement(@RequestParam(name = "param1", required = true) String param) {
        return services.report1(param);
    }

}
