package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;

import java.text.SimpleDateFormat;
import java.util.List;

public interface CTRLServices {

    default Details removeBestMatch(List<Details> details, Details detail) {
        FirstMatchPredicate fm = FirstMatchPredicate.builder().toMatch(detail).build();
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
        //steelDetail.setDocument(null);
        //steelDetail.setType(null);
        steelDetail.setActivite(null);
        steelDetail.setDescriptionLigne(null);
        steelDetail.setProjet(null);
        steelDetail.setCompagnie(null);
        steelDetail.setLigne(ctrlDetail.getLigne());
        steelDetail.setStatut("ACT");
    }


}
