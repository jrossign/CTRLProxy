package com.ipc.ctrlproxy.dao;

import com.ipc.ctrlproxy.model.robotsoudeur.Piece;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

@Slf4j
//@Component
public class LaincoIntranetDAO
{

    String sql =
            "SELECT ia.no_employe, ia.prenom, ia.nom, ia.code_projet, ia.sous_projet, ia.FonctionBaseEmpl, ia.DeptDansPunch, ia.TacheDansPunch,\n" +
                    " sum(ia.HoursDim), sum(ia.HoursLun), sum(ia.HoursMar), sum(ia.HoursMer), sum(ia.HoursJeu),\n" +
                    "sum(ia.HoursVen), sum(ia.HoursSam)\n" +
                    "FROM\n" +
                    "(SELECT a.no_employe, b.prenom, b.nom, d.code_projet, c.sous_projet,\n" +
                    "(SELECT iia.nom FROM general_fonction AS iia WHERE iia.no_fonction = b.no_fonction) AS FonctionBaseEmpl,\n" +
                    "(SELECT iib.nom FROM general_departement AS iib WHERE iib.no_departement = a.no_departement) AS DeptDansPunch,\n" +
                    "(SELECT iic.nom FROM general_departement_tache AS iic WHERE iic.no_tache = a.no_tache) AS TacheDansPunch, \n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 6 THEN 1 ELSE 0 END) AS HoursDim,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 0 THEN 1 ELSE 0 END) AS HoursLun,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 1 THEN 1 ELSE 0 END) AS HoursMar,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 2 THEN 1 ELSE 0 END) AS HoursMer,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 3 THEN 1 ELSE 0 END) AS HoursJeu,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 4 THEN 1 ELSE 0 END) AS HoursVen,\n" +
                    "(TIMESTAMPDIFF(SECOND, a.debut, a.fin)/3600.0) * (CASE WEEKDAY(a.debut) WHEN 5 THEN 1 ELSE 0 END) AS HoursSam\n" +
                    "FROM general_punch AS a\n" +
                    "INNER JOIN general_employe AS b ON b.no_employe = a.no_employe\n" +
                    "LEFT OUTER JOIN projet_sous_projet AS c ON a.no_item = c.no_projet\n" +
                    "LEFT OUTER JOIN projet AS d on c.no_parent = d.no_projet\n" +
                    "WHERE a.debut>='2011-01-01' AND a.debut <'2011-03-06' AND a.code NOT IN ('r','pe')) AS ia\n" +
                    "GROUP BY ia.no_employe, ia.prenom, ia.nom, ia.code_projet, ia.sous_projet, ia.FonctionBaseEmpl, ia.DeptDansPunch, ia.TacheDansPunch\n" +
                    "ORDER BY ia.no_employe, ia.code_projet, ia.sous_projet";

    @Autowired
    private NamedParameterJdbcTemplate jdbc;

    public List<EmpStats> getX() {
        return jdbc.query(sql, Collections.singletonMap("id", "1"),
                (rs, rowNum) ->
                        EmpStats.builder()
                        .no_employe(rs.getString(1))
                        .prenom(rs.getString(2))
                        .nom(rs.getString(3))
                        .projet(rs.getString(4))
                        .sous_projet(rs.getString(5))
                        .function(rs.getString(6))
                        .dept(rs.getString(7))
                        .tache(rs.getString(8))
                        .hours(new double[]{rs.getDouble(9),rs.getDouble(10),rs.getDouble(11),rs.getDouble(12),rs.getDouble(13),rs.getDouble(14),rs.getDouble(15)})
                        .build()
        );
    }


    public List<String> getProjets(String dateMin) {
        return jdbc.queryForList("select code_projet from projet where cree_quand >= :dateCreation order by cree_quand", Map.of("dateCreation", dateMin), String.class);
    }

    public List<Piece> getPieces(String noProjet) {
        String sql= "SELECT \n" +
                "    a.id,\n" +
                "    p.code_projet,\n" +
                "    p.titre,\n" +
                "    a.marque_assemblage,\n" +
                "    a.marque_piece,\n" +
                "    a.quantite,\n" +
                "    a.cree_quand,\n" +
                "    p.metrique,\n" +
                "    IFNULL(pp.no_dessin, pp2.no_dessin) as no_dessin,\n" +
                "    IFNULL(pp.poids,  pm.poids) as poids, \n" +
                "    IFNULL(pp.poids_assemblage, pp2.poids_assemblage) as poids_assemblage,\n" +
                "    IFNULL(pp.type, pm.type) as type, \n" +
                "    IFNULL(pp.longueur, pm.longueur) as longueur, \n" +
                "    IFNULL(pp.description, pm.description) as description, \n" +
                "    concat(\"http://intranet/data/projet/\",p.chemin,\"/_dessins/\",pd.fichier) as dessin\n" +
                "FROM projet_dessin_kiss_assemblage AS a\n" +
                "INNER JOIN projet AS p ON p.no_projet = a.no_projet\n" +
                "LEFT JOIN projet_dessin_kiss AS pp ON pp.no_projet = a.no_projet AND pp.marque_piece = a.marque_piece and pp.marque_assemblage = a.marque_assemblage\n" +
                "LEFT JOIN projet_dessin_kiss AS pp2 ON pp2.no_projet = a.no_projet AND pp2.marque_piece = a.marque_assemblage and  pp2.marque_assemblage = a.marque_assemblage\n" +
                "LEFT JOIN projet_dessin as pd on pd.no_projet = a.no_projet and pd.no_dessin = IFNULL(pp.no_dessin, pp2.no_dessin)\n" +
                "LEFT JOIN projet_dessin_kiss_materiel AS pm ON pm.no_projet = a.no_projet AND pm.marque_piece = a.marque_piece\n" +
                "WHERE code_projet = :projectId \n" +
                "ORDER BY a.marque_assemblage,  a.Id;"    ;

        final TreeSet<String> badLengths = new TreeSet<>();
        List<Piece> liste = jdbc.query(sql, Map.of("projectId", noProjet), (rs, rowNum) -> {
                double longueur = -1;
                try {
                    longueur = rs.getDouble("longueur");
                } catch (Exception e){
                    badLengths.add(rs.getString("longueur"));
                };
                return Piece.builder()
                        .id(rs.getString("id"))
                        .projet(rs.getString("code_projet"))
                        .metric(rs.getString("metrique").equals("1"))
                        .titreProjet(rs.getString("titre"))
                        .assemblage(rs.getString("marque_assemblage"))
                        .piece(rs.getString("marque_piece"))
                        .quantite(rs.getInt("quantite"))
                        .creation(rs.getDate("cree_quand"))
                        .dessin(rs.getString("no_dessin"))
                        .poids(rs.getDouble("poids"))
                        .poidsAssemblage(rs.getDouble("poids_assemblage"))
                        .type(rs.getString("type"))
                        .longueur(longueur)
                        .description(rs.getString("description"))
                        .url(rs.getString("dessin"))
                        .build();

            });
        if (!badLengths.isEmpty()) {
            log.info("{} : {}", noProjet, badLengths.toString());
        }
        return liste;
    }
}
