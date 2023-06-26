package com.ipc.ctrlproxy.model.robotsoudeur;

import lombok.Builder;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Builder
@Getter
public class PoutreGousset {

    private Assemblage assemblage;
    private Piece maitre;
    private List<Piece> goussets;

    public List<Piece> getGoussets() {
        if (this.goussets==null) {
            this.goussets = new ArrayList<>();
        }
        return this.goussets;
    }

    public boolean equals(PoutreGousset pg) {
        return assemblage.getMaster().getProjet().equals(pg.getMaitre().getProjet()) &&
                assemblage.getMaster().getId().equals(pg.assemblage.getMaster().getId());
    }
}
