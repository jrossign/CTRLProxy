package com.ipc.ctrlproxy.translator;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import com.ipc.ctrlproxy.model.ctrl.production.Production;
import com.ipc.ctrlproxy.model.steel_del.Item;
import com.ipc.ctrlproxy.model.steel_del.SPDelivery;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class SteelDeliveryToCTRLTranslator implements Translator
{

    private static final Map<String, String> UNITS = Map.of(

            "lb", "PND",
            "u", "UNI",
            "mm", "MM",
            "pi", "FT"
    );


    public Production getCTRLProductionRequest(SPDelivery order) throws ParseException {
        return Production.builder()
                .dateDocumentGenere(CTRL_DATE_FORMAT.format(STEEL_DATE_FORMAT.parse(order.getDeliveryDate())))
                .reference2(order.getDeliveryNumber())
                .build();
    }
    public List<Details> getCTRLDetails(SPDelivery order, String  action) {
        List<Details> list = new ArrayList<>();
        for (Item item : order.getItems()) {

            list.add(Details.builder()
                    .type("BSP")
                    .document(order.getOrderNumber())
                    .projet(StringUtils.leftPad(order.getProject(), 4, '0'))
                    .transaction2Quantite(String.valueOf(item.getOrderQuantity()))
                    .descriptionLigne(getDescriptionLigne(item))
                    .compagnie("001")
                    .activite("10010")
                    .statut("ACT")
                    .build());
        }
        return list;
    }

    private String getDescriptionLigne(Item item) {
        String ligne = item.getInputItem().getProductItem().getName();
        if (item.getInputItem().getProductItem().getLength().getValue() > 0) {
            ligne = ligne + " X" + item.getInputItem().getProductItem().getLength().getValue() + " " + item.getInputItem().getProductItem().getLength().getUom();
        }
        if (item.getInputItem().getProductItem().getWidth().getValue() > 0) {
            ligne = ligne + " X" + item.getInputItem().getProductItem().getWidth().getValue() + " " + item.getInputItem().getProductItem().getWidth().getUom();
        }
        return ligne;
    }
}
