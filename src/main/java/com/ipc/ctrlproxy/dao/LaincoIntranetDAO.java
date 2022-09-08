package com.ipc.ctrlproxy.dao;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@Slf4j
@Component
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
}
