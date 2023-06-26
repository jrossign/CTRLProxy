package com.ipc.ctrlproxy.model.robotsoudeur;

import lombok.Builder;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Builder
@Getter
public class PoutrePeriGousset {
    private Assemblage assemblage;
    private Piece maitre;
    private List<Piece> perimetres;

    private List<Piece> goussets;

    public boolean equals(PoutrePeriGousset ppg) {
        return assemblage.getMaster().getProjet().equals(ppg.getMaitre().getProjet()) &&
                assemblage.getMaster().getId().equals(ppg.assemblage.getMaster().getId());
    }

}
