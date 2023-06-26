package com.ipc.ctrlproxy.config;

import com.google.common.collect.Streams;
import com.ipc.ctrlproxy.model.robotsoudeur.*;
import com.ipc.ctrlproxy.dao.LaincoIntranetDAO;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.apache.poi.common.usermodel.HyperlinkType;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Slf4j
//@Component
public class RobotSoudeur implements InitializingBean {

    @Autowired
    private LaincoIntranetDAO dao;

    private List<PoutrePerimetre> pps = new ArrayList<>();

    private List<PoutrePeriGousset> ppgs = new ArrayList<>();
    private List<PoutreGousset> pgs = new ArrayList<>();
    private List<PoutreGousset> cgs = new ArrayList<>();

    private List<Poutre> ps = new ArrayList<>();
    private List<Colonne> cs = new ArrayList<>();
    private List<Piece> vbs = new ArrayList<>();

    private SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");

    @Override
    public void afterPropertiesSet() throws Exception
    {/*
        List<String> projets = dao.getProjets("2019-01-01");
        for (String projet : projets) {
            analyseProject(projet);
        }
        createExcel();
        log.info("done");*/
    }

    private void analyseProject(String pid) throws Exception
    {
        List<Piece> list = dao.getPieces(pid);
        TreeMap<String, Assemblage> assemblages = new TreeMap<>();

        for (Piece p : list) {
            if (!assemblages.containsKey(p.getAssemblage())) {
                assemblages.put(p.getAssemblage(),new Assemblage(p.getAssemblage()));
            }
            Assemblage assemblage = assemblages.get(p.getAssemblage());
            if (p.getAssemblage().equalsIgnoreCase(p.getPiece())) {
                assemblage.setMaster(p);
            }
            else {
                assemblage.addPiece(p);
            }
        }

        // recalcul des poids assemblage pour les vieux projets
        for (Assemblage a: assemblages.values()) {
            if (a.getMaster() != null && a.getMaster().getPoidsAssemblage()<=0) {
                double poids = 0;
                for (Piece p : a.getPieces().values()) {
                    poids += p.getPoids();
                }
                a.getMaster().setPoidsAssemblage(poids);
            }
        }

        // recherche des poutres avec périmêtre(s)
        TreeSet<String> PP_TYPES = new TreeSet<>(Arrays.asList("W"));
        for (Assemblage a: assemblages.values()) {
            if (a.getMaster()!= null
                    && a.getMaster().getAssemblage().startsWith("B")
                    && Character.isDigit(a.getMaster().getAssemblage().charAt(1))
                    && a.getMaster().getType() != null
                    && PP_TYPES.contains(a.getMaster().getType()))
            {
                ps.add(Poutre.builder().maitre(a.getMaster()).assemblage(a).build());
                PoutrePerimetre match=null;
                for (Piece p : a.getPieces().values()) {
                    if (!p.getPiece().startsWith(a.getMaster().getPiece()) && a.getMaster().getLongueur() > 0 && p.getLongueur() >= (a.getMaster().getLongueur() * 0.9)) {
                        if (match==null) {
                            match = PoutrePerimetre.builder().assemblage(a).maitre(a.getMaster()).build();
                            pps.add(match);
                        }
                        match.getPerimetres().add(p);
                    }
                }
            }
        }

        // rechercher les poutres avec gousset
        TreeSet<String> PG_TYPES = new TreeSet<>(Arrays.asList("W", "HSS"));
        for (Assemblage a: assemblages.values()) {
            if (a.getMaster()!= null &&
                    a.getMaster().getAssemblage().startsWith("B") &&
                    a.getMaster().getType() != null &&
                    PG_TYPES.contains(a.getMaster().getType()) &&
                    Character.isDigit(a.getMaster().getAssemblage().charAt(1)))
            {
                ps.add(Poutre.builder().maitre(a.getMaster()).assemblage(a).build());
                PoutreGousset pg = null;
                for (Piece p : a.getPieces().values()) {
                    if (isGousset(p)) {
                        if (pg == null) {
                            pg = PoutreGousset.builder().assemblage(a).maitre(a.getMaster()).build();
                            pgs.add(pg);
                        }
                        pg.getGoussets().add(p);
                    }
                }
            }
        }

        // recherche les poutres peri-gousset
        Map<String, PoutrePerimetre> ppmap = pps.stream().filter(pp->pp.getMaitre().getProjet().equals(pid)).collect(Collectors.toMap(pp->pp.getMaitre().getId(), pp->pp));
        Map<String, PoutreGousset> pgmap = pgs.stream().filter(pg->pg.getMaitre().getProjet().equals(pid)).collect(Collectors.toMap(pg->pg.getMaitre().getId(), pg->pg));
        for (String ppId : ppmap.keySet()) {
            if (pgmap.containsKey(ppId)) {
                PoutrePerimetre pp = ppmap.get(ppId);
                pps.remove(pp);
                PoutreGousset pg = pgmap.get(ppId);
                pgs.remove(pg);
                ppgs.add(PoutrePeriGousset
                                .builder()
                                .maitre(pp.getMaitre())
                                .assemblage(pp.getAssemblage())
                                .perimetres(pp.getPerimetres())
                                .goussets(pg.getGoussets())
                                .build());
            }
        }

        // rechercher les colonnes avec gousset
        TreeSet<String> CG_TYPES = new TreeSet<>(Arrays.asList("W", "HSS"));
        for (Assemblage a: assemblages.values()) {
            if (a.getMaster()!= null
                    && a.getMaster().getAssemblage().startsWith("C")
                    && a.getMaster().getType() != null
                    && CG_TYPES.contains(a.getMaster().getType())
                    && Character.isDigit(a.getMaster().getAssemblage().charAt(1))
                    && StringUtils.countOccurrencesOf(a.getMaster().getDescription().toLowerCase(), "x") == 2)
            {
                cs.add(Colonne.builder().assemblage(a).maitre(a.getMaster()).build());
                PoutreGousset pg = null;
                int count = 0;
                for (Piece p : a.getPieces().values()) {
                    if (isGousset(p)) {
                        count++;
                        if (pg == null) {
                            pg = PoutreGousset.builder().assemblage(a).maitre(a.getMaster()).build();
                        }
                        pg.getGoussets().add(p);
                    }
                }
                if (count>1) {
                    cgs.add(pg);
                }
            }
        }

        // rechercher les vertical braces
        TreeSet<String> VB_TYPES = new TreeSet<>(Arrays.asList("W", "HSS"));
        for (Assemblage a: assemblages.values()) {
            if (a.getMaster()!=null
                && a.getMaster().getAssemblage().startsWith("VB")
                && VB_TYPES.contains(a.getMaster().getType()))
            {
                vbs.add(a.getMaster());
            }
        }

    }

    private double getMetric(String s) {
        Pattern p = Pattern.compile("(\\d*)\\s*(\\d+)/(\\d+)");
        Matcher m = p.matcher(s.replace("-", " "));
        if (m.matches()) {
            double inch = 0;
            if (!Strings.isBlank(m.group(1))) {
                inch += Integer.parseInt(m.group(1));
            }
            if (!Strings.isBlank(m.group(2))) {
                double numerator = Integer.parseInt(m.group(2));
                double denominator = Integer.parseInt(m.group(3));
                inch += (numerator/denominator);
            }

            return inch*25.4;
        }
        else {
            throw new RuntimeException("Unable to parse non metric");
        }
    }

    private boolean isGousset(Piece p) {
        if ("PL".equals(p.getType())) {
            try {
                if (p.getDescription() != null) {
                    List<Double> dim = Arrays.stream(p.getDescription().split("x")).map(s -> p.isMetric()?Double.parseDouble(s):getMetric(s)).sorted().collect(Collectors.toList());
                    if (dim.size()==2) {
                        dim.add(p.getLongueur());
                    }
                    return dim.get(0) >= 9.5 && dim.get(1) >= 200 && dim.get(2) >= 300;
                }
            }
            catch (Exception e) {}
        }
        return false;
    }

    private void createExcel() throws Exception
    {
        String HEADERS_PP[] = new String[]{"PROJET", "NO_PROJET", "ID", "ASSEMBLAGE", "PIECE", "QUANTITE", "CREATION", "DESSIN", "POIDS_PIECE", "POIDS_ASSEMBLAGE", "TYPE", "LONGUEUR", "DESCRIPTION", "GROUPE_LONGUEUR", "LIEN"};
        Workbook wb = new XSSFWorkbook();
        CreationHelper createHelper = wb.getCreationHelper();

        CellStyle hlink_style = wb.createCellStyle();
        Font hlink_font = wb.createFont();
        hlink_font.setUnderline(Font.U_SINGLE);
        hlink_font.setColor(IndexedColors.BLUE.getIndex());
        hlink_style.setFont(hlink_font);


        Sheet sheet0a = wb.createSheet("Poutres");
        Row header0a = sheet0a.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header0a.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(ps.stream(), (pp, index) -> new AbstractMap.SimpleImmutableEntry<Poutre, Long>(pp, index))
                .forEach(entry -> {
                    Row row = sheet0a.createRow(entry.getValue().intValue()+1);
                    Poutre p = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, p.getMaitre(), getCategorieLongueurPoutres(p.getMaitre().getLongueur()));
                });


        Sheet sheet0b = wb.createSheet("Colonnes");
        Row header0b = sheet0b.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header0b.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(cs.stream(), (colonne, index) -> new AbstractMap.SimpleImmutableEntry<Colonne, Long>(colonne, index))
                .forEach(entry -> {
                    Row row = sheet0b.createRow(entry.getValue().intValue()+1);
                    Colonne c = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, c.getMaitre(), getCategorieLongueurColonnes(c.getMaitre().getLongueur()));
                });


        Sheet sheet1 = wb.createSheet("Poutre Périmêtre");
        Row header1 = sheet1.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header1.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(pps.stream(), (pp, index) -> new AbstractMap.SimpleImmutableEntry<PoutrePerimetre, Long>(pp, index))
                .forEach(entry -> {
                    Row row = sheet1.createRow(entry.getValue().intValue()+1);
                    PoutrePerimetre pp = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, pp.getMaitre(), getCategorieLongueurPoutres(pp.getMaitre().getLongueur()));
                });

        Sheet sheet2 = wb.createSheet("Poutre Gousset");
        Row header2 = sheet2.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header2.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(pgs.stream(), (pp, index) -> new AbstractMap.SimpleImmutableEntry<PoutreGousset, Long>(pp, index))
                .forEach(entry -> {
                    Row row = sheet2.createRow(entry.getValue().intValue()+1);
                    PoutreGousset pg = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, pg.getMaitre(), getCategorieLongueurPoutres(pg.getMaitre().getLongueur()));
                });

        Sheet sheet3 = wb.createSheet("Poutre Peri-Gousset");
        Row header3 = sheet3.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header3.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(ppgs.stream(), (ppg, index) -> new AbstractMap.SimpleImmutableEntry<PoutrePeriGousset, Long>(ppg, index))
                .forEach(entry -> {
                    Row row = sheet3.createRow(entry.getValue().intValue()+1);
                    PoutrePeriGousset ppg = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, ppg.getMaitre(), getCategorieLongueurPoutres(ppg.getMaitre().getLongueur()));
                });


        Sheet sheet4 = wb.createSheet("Colonne Gousset");
        Row header4 = sheet4.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header4.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(cgs.stream(), (pp, index) -> new AbstractMap.SimpleImmutableEntry<PoutreGousset, Long>(pp, index))
                .forEach(entry -> {
                    Row row = sheet4.createRow(entry.getValue().intValue()+1);
                    PoutreGousset pg = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, pg.getMaitre(), getCategorieLongueurColonnes(pg.getMaitre().getLongueur()));
                });
        
        Sheet sheet5 = wb.createSheet("Brace Verticale");
        Row header5 = sheet5.createRow(0);
        for (int i=0; i<HEADERS_PP.length; i++) {
            header5.createCell(i).setCellValue(HEADERS_PP[i]);
        }
        Streams.mapWithIndex(vbs.stream(), (vb, index) -> new AbstractMap.SimpleImmutableEntry<Piece, Long>(vb, index))
                .forEach(entry -> {
                    Row row = sheet5.createRow(entry.getValue().intValue()+1);
                    Piece p = entry.getKey();
                    addRowInfo(createHelper, hlink_style, row, p, getCategorieLongueurBraces(p.getLongueur()));
                });

        try (OutputStream fileOut = new FileOutputStream("workbook.xlsx")) {
            wb.write(fileOut);
        }

    }

    private void addRowInfo(CreationHelper createHelper, CellStyle hlink_style, Row row, Piece p, String categorieLongueur) {

        row.createCell(0).setCellValue(p.getTitreProjet());
        row.createCell(1).setCellValue(p.getProjet());
        row.createCell(2).setCellValue(p.getId());
        row.createCell(3).setCellValue(p.getAssemblage());
        row.createCell(4).setCellValue(p.getPiece());
        row.createCell(5).setCellValue(p.getQuantite());
        row.createCell(6).setCellValue(format.format(p.getCreation()));
        row.createCell(7).setCellValue(p.getDessin());
        row.createCell(8).setCellValue(p.getPoids());
        row.createCell(9).setCellValue(p.getPoidsAssemblage());
        row.createCell(10).setCellValue(p.getType());
        row.createCell(11).setCellValue(p.getLongueur());
        row.createCell(12).setCellValue(p.getDescription());
        row.createCell(13).setCellValue(categorieLongueur);

        if (p.getUrl() != null) {
            Hyperlink link = createHelper.createHyperlink(HyperlinkType.URL);
            link.setAddress(p.getUrl().replaceAll(" ", "%20").replace("intranet", "192.168.0.182"));
            Cell url = row.createCell(14);
            url.setCellValue("Lien vers le plan");
            url.setHyperlink(link);
            url.setCellStyle(hlink_style);
        }
    }

    private String getCategorieLongueurPoutres(double millis) {
        double pieds = millis / 304.8; // (millis / pied);
        if (pieds <20) {
            return "0-20";
        }
        if (pieds <35) {
            return "20-35";
        }
        if (pieds <40) {
            return "35-40";
        }
        if (pieds <45) {
            return "40-55";
        }
        if (pieds <50) {
            return "45-50";
        }
        return "50+";
    }
    private String getCategorieLongueurColonnes(double millis) {
        double pieds = millis / 304.8; // (millis / pied);
        if (pieds <20) {
            return "0-20";
        }
        if (pieds <35) {
            return "20-35";
        }
        if (pieds <40) {
            return "35-40";
        }
        if (pieds <45) {
            return "40-55";
        }
        if (pieds <50) {
            return "45-50";
        }
        return "50+";
    }
    private String getCategorieLongueurBraces(double millis) {
        double pieds = millis / 304.8; // (millis / pied);
        if (pieds <10) {
            return "0-10";
        }
        if (pieds <20) {
            return "10-20";
        }
        if (pieds <35) {
            return "20-35";
        }
        if (pieds <40) {
            return "35-40";
        }
        if (pieds <45) {
            return "40-45";
        }
        if (pieds <50) {
            return "45-50";
        }
        return "50+";
    }

}
