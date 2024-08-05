package com.ipc.ctrlproxy.translator;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.header.Header;
import com.ipc.ctrlproxy.model.steel_po.Item;
import com.ipc.ctrlproxy.model.steel_po.SPOrder;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Component
public class SteelPOToCTRLTranslator implements Translator
{

    private static final Map<String, String> UNITS = Map.of(

            "lb", "PND",
            "u", "UNI",
            "mm", "MM",
            "pi", "FT"
    );


    public Header getCTRLHeader(SPOrder order, String  action) throws ParseException
    {
        //String supplierPrefix = order.getSupplier().substring(0, order.getSupplier().indexOf("-"));
        //String supplierSuffix = order.getSupplier().substring(order.getSupplier().indexOf("-")+1);
        String crtlDate = CTRL_DATE_FORMAT.format(STEEL_DATE_FORMAT.parse(order.getOrderDate()));

        return Header.builder()
                .type("BSP")
                .document(order.getNumber())
                .intervenant(order.getSupplier())
                //.description(supplierSuffix)
                //.intervenant(supplierPrefix)
                //.nomIntervenant(supplierSuffix)
                .statut("SUS")
                .dateDocument(crtlDate)
                //.dateCreation(crtlDate) ne peut être modifié
                // .usagerResponsable(order.getEmployee()) Responsable MATPER : La fiche Responsable MATPER est inexistante dans Ressource
                .usagerInscripteur("WEBSTP")
                //.dateModification(crtlDate) ne peut être modifié
                //.usagerModificateur(order.getEmployee()) ne peut être modifié
                .reference1(order.getNumber())
                .reference2(order.getNumber())
                .territoire("CA-QC")
                .commentaireGeneral(Strings.isBlank(order.getComment())?null:order.getComment())
                //.compagnieSource("001")
                //.compagnieDestination("001")
                //.compagnieLiee("001")
                .devise(order.getCurrency())
                // .prefixe("BSP") ne peut être modifié
                .dossierFacturation("F00166")
                .typeDocumentEngagement("BSP")
                .documentEngagement("BSP"+StringUtils.leftPad(order.getNumber(), 7, '0'))
                //.timestampDerniereSauvegarde(CTRL_DATE_TIME_FORMAT.format(new Date()))
                .projet(StringUtils.leftPad(order.getProject(), 4, '0'))

                .build();

    }

    public List<Details> getCTRLDetails(SPOrder order, String  action) {
        List<Details> list = new ArrayList<>();
        DecimalFormat df = new DecimalFormat("#0.0000", new DecimalFormatSymbols(Locale.ENGLISH));
        for (Item item : order.getItems()) {


            list.add(Details.builder()
                    .type("BSP")
                    .document(order.getNumber())
                    //.ligne(String.valueOf(item.getOrderLine()))
                    .projet(StringUtils.leftPad(order.getProject(), 4, '0'))
                    .transaction1Quantite(String.valueOf(item.getProductItem().getQuantity()))
                    //.quantiteSuspend(String.valueOf(item.getProductItem().getQuantity()))
                    //.transaction1Unite(UNITS.get(item.getValuationUnit()))
                    .prixUnitaireTransaction1(item.getUnitaryPrice())
                    //.grandTotalTransaction1(item.getTotalPrice())
                    //.quantiteSuspend("DONT KNOW HOW")
                    .descriptionLigne(getDescriptionLigne(item))
                    //.compagnie("001")
                    .division(StringUtils.leftPad(order.getPurchasingOrganization(), 3, '0'))
                    .activite(item.getSectionName())
                    .statut("SUS")
                    .ordre(item.getOrderLine())
                    .quantiteAnnulee(item.getProductItem().getCancelledQuantity())
                    //.timestampDerniereSauvegarde(CTRL_DATE_TIME_FORMAT.format(new Date()))
                    .build());
        }
        return list;
    }

    private String getDescriptionLigne(Item item) {
        String ligne = item.getProductItem().getName();
        if (StringUtils.isNotBlank(item.getProductItem().getLength().getValue()) && !item.getProductItem().getLength().getValue().trim().equals("0")) {
            ligne = ligne + " X" + item.getProductItem().getLength().getValue() + " " + item.getProductItem().getLength().getUom();
        }
        if (StringUtils.isNotBlank(item.getProductItem().getWidth().getValue()) && !item.getProductItem().getWidth().getValue().trim().equals("0")) {
            ligne = ligne + " X" + item.getProductItem().getWidth().getValue() + " " + item.getProductItem().getWidth().getUom();
        }
        return ligne;
    }
}
