package com.ipc.ctrlproxy.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipc.ctrlproxy.model.CTRLResponse;
import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.status.MessageItem;
import com.ipc.ctrlproxy.model.status.Status;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class CTRLOrderServices implements CTRLServices {


    @Autowired
    private CTRLWebServices webServices;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private StatusHelper statusHelper;

    public Status syncHeaderAndDetails(final String actionType, final Header header, final List<Details> details) throws IOException {
        List<MessageItem> responses = new ArrayList<>();
        boolean success = true;

        try {
            log.warn(mapper.writeValueAsString(header));
            log.warn(mapper.writeValueAsString(details));
        }
        catch (Exception e) {}


        Map<String, Header> allHeaders = webServices.getAllCTRLOrderHeaders();
        if (allHeaders.containsKey(header.getDocument())) {
            log.info("Entête déjà créée, creation des détails...");
        }
        else {
            CTRLResponse resp = webServices.post("DocumentEntete//?Company=001", header);
            success = success && statusHelper.buildMessageItems("Création de l'entête", resp.code, resp.body, responses);
            allHeaders = webServices.getAllCTRLOrderHeaders();
        }

        if (success) {


            // Get CTRL details for this order mapped by line description
            Map<String, List<Details>> ctrlByLineDesc = webServices.getAllCTRLOrders(header.getDocument());

            // Map Steel details by line description
            Map<String, List<Details>> steelByLineDesc = groupByDescription(details);

            // First delete all entries not in Steel anymore
            for (String key : ctrlByLineDesc.keySet()) {
                if (!steelByLineDesc.containsKey(key)) {
                    for (Details detail : ctrlByLineDesc.get(key)) {
                        CTRLResponse resp = webServices.delete("DocumentDetail/" + detail.getIdentifiantUnique() + "//?Company=001");
                        success = success && statusHelper.buildMessageItems("Delete d'un détail", resp.code, resp.body, responses);
                    }
                }
            }

            // Then add all entries not already in CTRL
            for (String key : steelByLineDesc.keySet()) {
                if (!ctrlByLineDesc.containsKey(key)) {
                    for (Details detail : steelByLineDesc.get(key)) {
                        CTRLResponse resp = webServices.post( "DocumentDetail//?Company=001", detail);
                        success = success && statusHelper.buildMessageItems("Création d'un détail", resp.code, resp.body, responses);
                    }
                }
            }

            // Then do the updates for the line quantities with matching line descriptions in both Steel & CTRL
            for (String key : steelByLineDesc.keySet()) {
                if (ctrlByLineDesc.containsKey(key)) {
                    List<Details> steelDetails = steelByLineDesc.get(key);
                    List<Details> ctrlDetails = ctrlByLineDesc.get(key);

                    for (Details steelDetail : steelDetails) {
                        if (!ctrlDetails.isEmpty()) {
                            Details ctrlBest = removeBestOrder(ctrlDetails, steelDetail);
                            // do not update identical details
                            boolean identical = isIdentical(steelDetail, ctrlBest);
                            if (!identical) {
                                resetForUpdate(steelDetail, ctrlBest);
                                log.info(mapper.writeValueAsString(steelDetail));
                                CTRLResponse resp = webServices.put("DocumentDetail/" + ctrlBest.getIdentifiantUnique() + "//?Company=001", steelDetail);
                                success = success && statusHelper.buildMessageItems("Update d'un détail", resp.code, resp.body, responses);
                            } else {
                                String msg = "Ligne " + ctrlBest.getLigne() + " déjà à jour pour le document " + header.getDocument();
                                log.info(msg);
                                statusHelper.buildMessageItems("Création d'un détail", HttpStatus.ALREADY_REPORTED.value(), msg, responses);
                            }
                        } else {
                            // add to CTRL
                            CTRLResponse resp = webServices.post("DocumentDetail//?Company=001", steelDetail);
                            success = success && statusHelper.buildMessageItems("Création d'un détail", resp.code, resp.body, responses);
                        }
                    }


                    // If anything left in CTRL, delete it
                    if (!ctrlDetails.isEmpty()) {
                        for (Details ctrlDetail : ctrlDetails) {
                            CTRLResponse resp = webServices.delete("DocumentDetail/" + ctrlDetail.getIdentifiantUnique() + "//?Company=001");
                            success = success && statusHelper.buildMessageItems("Delete d'un détail", resp.code, resp.body, responses);
                        }
                    }
                }
            }
            if ("D".equalsIgnoreCase(actionType)) {
                Header ctrlHeader = allHeaders.get(header.getDocument());
                CTRLResponse resp = webServices.delete("DocumentEntete/" + ctrlHeader.getIdentifiantUnique() + "//?Company=001");
                success = success && statusHelper.buildMessageItems("Delete de l'entête", resp.code, resp.body, responses);
            }
        }
        else {
            return statusHelper.buildStatus(success, "Problème à la création de l'entête", responses);
        }

        return statusHelper.buildStatus(success, success?"Success":"Problème à la création de détails", responses);
    }



}
