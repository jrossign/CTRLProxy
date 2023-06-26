package com.ipc.ctrlproxy.model.robotsoudeur;

import lombok.Builder;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Builder
@Getter
public class PoutrePerimetre {

    private Assemblage assemblage;
    private Piece maitre;
    private List<Piece> perimetres;

    public List<Piece> getPerimetres() {
        if (this.perimetres==null) {
            this.perimetres = new ArrayList<>();
        }
        return this.perimetres;
    }
    public boolean equals(PoutrePerimetre pp) {
        return assemblage.getMaster().getProjet().equals(pp.getMaitre().getProjet()) &&
                assemblage.getMaster().getId().equals(pp.assemblage.getMaster().getId());
    }
}
