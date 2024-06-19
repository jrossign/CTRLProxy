package com.ipc.ctrlproxy.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.model.status.Message;
import com.ipc.ctrlproxy.model.status.Status;
import com.ipc.ctrlproxy.model.steel_del.SPDelivery;
import com.ipc.ctrlproxy.model.steel_po.SPOrder;
import com.ipc.ctrlproxy.services.CTRLOrderServices;
import com.ipc.ctrlproxy.services.CTRLReceiveServices;
import com.ipc.ctrlproxy.translator.SteelDeliveryToCTRLTranslator;
import com.ipc.ctrlproxy.translator.SteelPOToCTRLTranslator;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.ServiceUnavailableException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api")
public class CTRLController
{
    @Autowired
    private SteelPOToCTRLTranslator poTranslator;

    @Autowired
    private SteelDeliveryToCTRLTranslator deliveryTranslator;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CTRLOrderServices orderServices;

    @Autowired
    private CTRLReceiveServices receiveServices;

    @PostMapping(value = "/ctrlproxy", params = "action=SP_ORDERS", consumes = "application/json", produces = "application/json")
    public Status approvisionnement(@RequestBody List<SPOrder> orders, @RequestParam(name = "module", required = false) String module, @RequestParam(name="action") String action) throws ParseException, IOException {
        long start = System.currentTimeMillis();
        log("SP_ORDERS received", orders);

        Status last = null;
        for (SPOrder order : orders) {
            last = orderServices.syncHeaderAndDetails(
                    order.getActionType(),
                    poTranslator.getCTRLHeader(order, action),
                    poTranslator.getCTRLDetails(order, action),
                    StringUtils.leftPad(order.getPurchasingOrganization(), 3, '0'));
        }

        log("SP_ORDERS response (" + (System.currentTimeMillis()-start) + " millis)", last);

        return last;
    }

    @PostMapping(value = "/ctrlproxy", params = "action=SP_RECEIVING", consumes = "application/json", produces = "application/json")
    public Status receive(@RequestBody List<SPDelivery> deliveries, @RequestParam(name="action") String action) throws IOException, ParseException {
        long start = System.currentTimeMillis();
        log("SP_RECEIVING received", deliveries);

        Status last = null;
        for (SPDelivery delivery : deliveries) {
            last = receiveServices.receive(
                    delivery.getOrderNumber(),
                    deliveryTranslator.getCTRLProductionRequest(delivery),
                    deliveryTranslator.getCTRLDetails(delivery, action),
                    StringUtils.leftPad(delivery.getPurchasingOrganization(), 3, '0'));
        }

        log("SP_RECEIVING response (" + (System.currentTimeMillis()-start) + " millis)", last);

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

    private void log(String msg, Object obj) {

        try {
            log.info(msg + System.lineSeparator() + mapper.writeValueAsString(obj));
        }
        catch (Exception e) {}
    }


    @ExceptionHandler(Exception.class)
    protected ResponseEntity<Status> handleException(Exception e) {
        return new ResponseEntity<>(Status.builder()
                .status("2")
                .messageHeader(Arrays.asList(
                        Message.builder().type("E").message("StatusCode : " + HttpStatus.INTERNAL_SERVER_ERROR).build(),
                        Message.builder().type("E").message("Body : " + e.getMessage()).build()))
                .build(), HttpStatus.OK);
    }

}
