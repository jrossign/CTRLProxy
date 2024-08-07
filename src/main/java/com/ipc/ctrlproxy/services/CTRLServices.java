package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public interface CTRLServices {

    default Details removeBestOrder(List<Details> details, Details detail) {
        FirstOrderMatchPredicate fm = FirstOrderMatchPredicate.builder().toMatch(detail).build();
        boolean matched = details.removeIf(fm);
        if (matched) {
            return fm.getMatched();
        }
        return details.remove(0);
    }

    default Details removeBestReceip(List<Details> details, Details detail) {
        FirstReceipMatchPredicate fm = FirstReceipMatchPredicate.builder().toMatch(detail).build();
        boolean matched = details.removeIf(fm);
        if (matched) {
            return fm.getMatched();
        }
        return details.remove(0);
    }

    default boolean isIdentical(Details steelDetail, Details ctrlDetail) {
        return steelDetail.getTransaction1Quantite().equals(ctrlDetail.getTransaction1Quantite()) &&
               steelDetail.getPrixUnitaireTransaction1().equals(ctrlDetail.getPrixUnitaireTransaction1());
    }

    default void resetForUpdate(Details steelDetail, Details ctrlDetail) {
        steelDetail.setActivite(null);
        steelDetail.setDescriptionLigne(null);
        steelDetail.setProjet(null);
        steelDetail.setCompagnie(null);
        steelDetail.setLigne(ctrlDetail.getLigne());
        steelDetail.setOrdre(ctrlDetail.getOrdre());
    }

    default void resetForReceive(Details steelDetail, Details ctrlDetail) {
        steelDetail.setActivite(null);
        steelDetail.setDescriptionLigne(null);
        steelDetail.setProjet(null);
        steelDetail.setCompagnie(null);
        steelDetail.setActionType(null);
        steelDetail.setLigne(ctrlDetail.getLigne());
        steelDetail.setOrdre(ctrlDetail.getOrdre());
    }

    default Map<String, List<Details>> groupByDescription(List<Details> details)
    {
        return details
                .stream()
                .collect(Collectors.groupingBy(Details::getDescriptionLigne));
    }

    default Map<String, List<Details>> groupByDescription(Map<String, Details> details)
    {
        return details.values()
                .stream()
                .collect(Collectors.groupingBy(Details::getDescriptionLigne));
    }


}
