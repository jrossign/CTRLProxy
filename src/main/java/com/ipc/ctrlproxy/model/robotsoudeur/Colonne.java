package com.ipc.ctrlproxy.model.robotsoudeur;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class Colonne {
    private Assemblage assemblage;
    private Piece maitre;
}
