package com.ipc.ctrlproxy.model.robotsoudeur;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Builder
@Getter
@ToString
public class Piece {
    private String id;
    private String projet;
    private boolean metric;
    private String titreProjet;
    private String assemblage;
    private String piece;
    private int quantite;
    private Date creation;
    private String dessin;
    private double poids;
    @Setter
    private double poidsAssemblage;
    private String type;
    private double longueur;
    private String description;
    private String url;
}
