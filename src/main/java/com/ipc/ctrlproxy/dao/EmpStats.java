package com.ipc.ctrlproxy.dao;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EmpStats
{
    private String no_employe;
    private String prenom;
    private String nom;
    private String projet;
    private String sous_projet;
    private String function;
    private String dept;
    private String tache;
    private double[] hours;
}
