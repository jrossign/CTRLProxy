package com.ipc.ctrlproxy.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.ctrl.production.Production;
import com.ipc.ctrlproxy.model.status.MessageItem;
import com.ipc.ctrlproxy.model.status.Status;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class CTRLReceiveServices implements CTRLServices {

    @Autowired
    private CTRLWebServices webServices;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private StatusHelper statusHelper;

    public Status receive(final String document, Production pRequest, final List<Details> details) throws IOException {

        List<MessageItem> responses = new ArrayList<>();
        boolean success = true;

        try {
            log.warn(mapper.writeValueAsString(pRequest));
            log.warn(mapper.writeValueAsString(details));
        }
        catch (Exception e) {}


        // Get our header from CTRL
        Map<String, Header> allHeaders = webServices.getAllCTRLOrderHeaders();
        Header header = allHeaders.get(document);

        // Get CTRL details for this order mapped by line description
        Map<String, List<Details>> ctrlOrdersByLineDesc = webServices.getAllCTRLOrders(header.getDocument());
        log.info("ctrlOrdersByLineDesc : {}", ctrlOrdersByLineDesc.size());
        Map<String, List<Details>> ctrlReceiptByLineDesc = webServices.getAllCTRLReceipt(header.getDocument());
        log.info("ctrlReceiptByLineDesc : {}", ctrlReceiptByLineDesc.size());

        // Map Steel details by line description
        Map<String, List<Details>> steelByLineDesc = groupByDescription(details);

        // Update CTRL header if not already in ACT state
        if ( !"ACT".equals(header.getStatut())) {
            Header update = Header.builder()
                    .type(header.getType())
                    .document(header.getDocument())
                    .projet(header.getProjet())
                    .statut("ACT")
                    .build();
            log.info(mapper.writeValueAsString(update));
            CTRLResponse resp = webServices.put("DocumentEntete/" + header.getIdentifiantUnique() + "//?Company=001", update);
            success = success && statusHelper.buildMessageItems("Update en ACT d'un header", resp.code, resp.body, responses);
        }
        else {
            success = success && statusHelper.buildMessageItems("Header déjà en ACT", 200, header.getDocument(), responses);
        }

        // update CTRL details' Transaction2Quantite
        for (String key : steelByLineDesc.keySet()) {
            if (ctrlOrdersByLineDesc.containsKey(key)) {
                List<Details> steelDetails = steelByLineDesc.get(key);
                List<Details> ctrlDetails = ctrlOrdersByLineDesc.get(key);
                List<Details> ctrlReceipts = ctrlReceiptByLineDesc.get(key);

                for (Details steelDetail : steelDetails) {
                    if ("N".equalsIgnoreCase(steelDetail.getActionType())) {
                        if (!ctrlDetails.isEmpty()) {
                            Details ctrlBest = removeBestOrder(ctrlDetails, steelDetail);
                            resetForReceive(steelDetail, ctrlBest);
                            log.info("Sending RECEIVE: {}", mapper.writeValueAsString(steelDetail));
                            CTRLResponse resp = webServices.put("DocumentDetail/" + ctrlBest.getIdentifiantUnique() + "//?Company=001", steelDetail);
                            log.info(mapper.writeValueAsString(resp));
                            success = success && statusHelper.buildMessageItems("Réception d'un détail", resp.code, resp.body, responses);
                        }
                        else {
                            success = false && statusHelper.buildMessageItems("Réception d'un détail manquant", 404, steelDetail.getDescriptionLigne(), responses);
                        }
                    }
                    else if ("D".equalsIgnoreCase(steelDetail.getActionType())) {
                        Details ctrlBest = removeBestReceip(ctrlReceipts, steelDetail);
                        CTRLResponse resp = webServices.delete("DocumentDetail/" + ctrlBest.getIdentifiantUnique() + "//?Company=001");
                        success = success && statusHelper.buildMessageItems("Renversement d'une réception d'un détail", resp.code, resp.body, responses);
                    }
                    else {
                        success = false && statusHelper.buildMessageItems("Réception d'une réception avec action inconnue: " + steelDetail.getActionType(), 404, steelDetail.getDescriptionLigne(), responses);
                    }
                }
            }
            else {
                success = false && statusHelper.buildMessageItems("Réception d'un détail manquant", 404, key, responses);
            }
        }


        // Send Production request
        if (success) {
            log.info("Production : {}", mapper.writeValueAsString(pRequest));
            CTRLResponse resp = webServices.put("DocumentEntete/" + header.getIdentifiantUnique() + "/Production?Company=001", pRequest);
            success = success && statusHelper.buildMessageItems("Production", resp.code, resp.body, responses);
        }

        return statusHelper.buildStatus(success, success?"Success":"Problème à la réception de détails", responses);
    }
}
