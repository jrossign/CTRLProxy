package com.ipc.ctrlproxy.model.robotsoudeur;

import com.ipc.ctrlproxy.model.robotsoudeur.Piece;

import java.util.TreeMap;

public class Assemblage {

    private String marque;
    private Piece master;
    private TreeMap<String, Piece> pieces = new TreeMap<>();

    public Assemblage(String marque) {
        this.marque = marque;
    }
    public void setMaster(Piece p) {
        this.master = p;
    }
    public Piece getMaster() {
        return this.master;
    }
    public void addPiece(Piece p) {
        pieces.put(p.getPiece(), p);
    }
    public TreeMap<String, Piece> getPieces() {
        return this.pieces;
    }
}
