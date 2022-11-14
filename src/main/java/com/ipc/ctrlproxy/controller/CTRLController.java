package com.ipc.ctrlproxy.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.dao.LaincoIntranetDAO;
import com.ipc.ctrlproxy.model.status.Status;
import com.ipc.ctrlproxy.model.steel_po.SPOrder;
import com.ipc.ctrlproxy.model.steel_del.SPDelivery;
import com.ipc.ctrlproxy.services.CTRLOrderServices;
import com.ipc.ctrlproxy.services.CTRLReceiveServices;
import com.ipc.ctrlproxy.translator.SteelDeliveryToCTRLTranslator;
import com.ipc.ctrlproxy.translator.SteelPOToCTRLTranslator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.ServiceUnavailableException;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class CTRLController
{
    @Autowired
    private LaincoIntranetDAO dao;

    @Autowired
    private SteelPOToCTRLTranslator poTranslator;

    @Autowired
    private SteelDeliveryToCTRLTranslator deliveryTranslator;

    @Autowired
    @Qualifier("CRTLWebClient")
    private WebClient webClient;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CTRLOrderServices orderServices;

    @Autowired
    private CTRLReceiveServices receiveServices;

    @PostMapping(value = "/ctrlproxy", params = "action=SP_ORDERS", consumes = "application/json", produces = "application/json")
    public Status approvisionnement(@RequestBody List<SPOrder> orders, @RequestParam(name = "module", required = false) String module, @RequestParam(name="action") String action) throws ParseException, IOException {

        Status last = null;
        for (SPOrder order : orders) {

            try {
                log.warn(mapper.writeValueAsString(order));
            }
            catch (Exception e) {}

            last = orderServices.syncHeaderAndDetails(
                    order.getActionType(),
                    poTranslator.getCTRLHeader(order, action),
                    poTranslator.getCTRLDetails(order, action));
        }
        return last;
    }

    @PostMapping(value = "/ctrlproxy", params = "action=SP_RECEIVING", consumes = "application/json", produces = "application/json")
    public Status receive(@RequestBody List<SPDelivery> deliveries, HttpServletRequest req, @RequestParam(name="action") String action) throws IOException, ParseException {

        Status last = null;
        for (SPDelivery delivery : deliveries) {
            last = receiveServices.receive(
                    delivery.getOrderNumber(),
                    deliveryTranslator.getCTRLProductionRequest(delivery),
                    deliveryTranslator.getCTRLDetails(delivery, action));
        }
        return last;
    }

    @PostMapping(value = "/ctrlproxy", consumes = "application/json", produces = "application/json")
    public Mono<Status> commande(@RequestBody String body, HttpServletRequest req)
    {
        log.warn("Unserviced URI / body type / params");
        log.warn(req.getRequestURI());
        log.warn(req.getQueryString());
        log.warn(System.lineSeparator()+body);
        return Mono.error(new ServiceUnavailableException("Method not allowed. Please check the URL and body."));
    }

}
