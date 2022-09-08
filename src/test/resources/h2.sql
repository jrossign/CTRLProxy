

--
-- Table structure for table achat_commande
--

DROP TABLE IF EXISTS achat_commande;

CREATE TABLE achat_commande
(
  Id int(11) NOT NULL ,
  no_commande smallint(6)  DEFAULT NULL,
  code_commande char(12) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT 0,
  no_formulaire tinyint(3) NOT NULL DEFAULT 1,
  code_activite varchar(2) NOT NULL DEFAULT 'i',
  no_activite smallint(5)  NOT NULL DEFAULT 0,
  activite_editable tinyint(1)  NOT NULL DEFAULT 1,
  no_compte smallint(6)  NOT NULL DEFAULT 0,
  no_departement smallint(6)  DEFAULT NULL,
  reference char(1) NOT NULL DEFAULT 'l',
  langage char(2) NOT NULL DEFAULT 'fr',
  devise_code varchar(3) DEFAULT 'CAN',
  unite_mesure char(1) NOT NULL DEFAULT 'i',
  projet varchar(100) DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  bon_ouvert tinyint(1)  NOT NULL DEFAULT 0,
  bon_ouvert_approuvee_quand datetime DEFAULT NULL,
  bon_ouvert_approuvee_qui smallint(6) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT 1,
  no_societe smallint(5)  DEFAULT NULL,
  no_contact smallint(5)  NOT NULL DEFAULT 0,
  fournisseur_contact varchar(100) DEFAULT NULL,
  livraison_emplacement varchar(100) DEFAULT NULL,
  livraison_adresse varchar(250) DEFAULT '',
  livraison_telephone varchar(20) DEFAULT NULL,
  livraison_fax varchar(20) DEFAULT NULL,
  livraison_contact varchar(100) DEFAULT NULL,
  livraison_date date DEFAULT NULL,
  livraison_par varchar(30) DEFAULT NULL,
  date_commande date DEFAULT NULL,
  no_type_transmission tinyint(3)  DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL,
  courriel_cc varchar(255) DEFAULT NULL,
  fax varchar(20) DEFAULT NULL,
  sous_total float(12) NOT NULL DEFAULT 0.00,
  total_transport float(7)  NOT NULL DEFAULT 0.00,
  no_taxe tinyint(3)  NOT NULL DEFAULT 3,
  tps_taux float(5)  DEFAULT NULL,
  tps_total float(10) DEFAULT NULL,
  tvq_taux float(5)  DEFAULT NULL,
  tvq_total float(10) DEFAULT NULL,
  tvh_taux float(6)  DEFAULT NULL,
  tvh_total float(10) DEFAULT NULL,
  total float(12) NOT NULL DEFAULT 0.00,
  notes_fournisseur text,
  notes_interne varchar(2000) DEFAULT NULL,
  mill_test tinyint(1)  NOT NULL DEFAULT 0,
  conditions text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  imprimee_quand datetime DEFAULT NULL,
  imprimee_qui smallint(5)  DEFAULT NULL,
  approuvee_quand datetime DEFAULT NULL,
  approuvee_qui smallint(5)  DEFAULT NULL,
  refusee_quand datetime DEFAULT NULL,
  refusee_qui smallint(6)  DEFAULT NULL,
  refusee_raison text,
  fichier varchar(100) DEFAULT NULL,
  fabtrol_ponumber varchar(30) DEFAULT NULL
);

--
-- Table structure for table achat_commande_condition
--

DROP TABLE IF EXISTS achat_commande_condition;

CREATE TABLE achat_commande_condition (
  Id int(11) NOT NULL ,
  nom varchar(100) DEFAULT NULL,
  note text
                                      )  ;

--
-- Table structure for table achat_commande_details
--

DROP TABLE IF EXISTS achat_commande_details;

CREATE TABLE achat_commande_details (
  Id int(11) NOT NULL ,
  no_commande smallint(6)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '0',
  ordre tinyint(3)  DEFAULT NULL,
  no_reception tinyint(3)  NOT NULL DEFAULT '1',
  reference varchar(10) DEFAULT NULL,
  ponumber varchar(30) DEFAULT NULL,
  code_activite varchar(3) DEFAULT NULL,
  no_activite smallint(5)  NOT NULL DEFAULT '0',
  no_produit smallint(5)  NOT NULL DEFAULT '0',
  code_produit varchar(30) DEFAULT NULL,
  no_compte smallint(6)  NOT NULL DEFAULT '0',
  marque_piece varchar(8) DEFAULT NULL,
  quantite float(10) NOT NULL DEFAULT '0.00',
  quantite_modifiee float(10) DEFAULT NULL,
  quantite_approbation tinyint(1) NOT NULL DEFAULT '1',
  unite_mesure varchar(30) DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  description text,
  grade varchar(20) DEFAULT NULL,
  longueur varchar(15) DEFAULT NULL,
  poids varchar(20) DEFAULT NULL,
  marque varchar(20) DEFAULT NULL,
  prix_unitaire float(12) DEFAULT NULL,
  unite varchar(10) DEFAULT NULL,
  total float(12) DEFAULT NULL,
  dim_i varchar(20) DEFAULT NULL,
  dim_m varchar(20) DEFAULT NULL,
  longueur_i varchar(20) DEFAULT NULL,
  longueur_m mediumint(9) DEFAULT NULL,
  poids_i varchar(20) DEFAULT NULL,
  poids_m varchar(20) DEFAULT NULL,
  prix_unitaire_i float(10) DEFAULT NULL,
  prix_unitaire_m float(10) DEFAULT NULL,
  reception_quantite float(10) DEFAULT NULL,
  reception_bo tinyint(1)  NOT NULL DEFAULT '0',
  reception_cancel tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table achat_commande_etat
--

DROP TABLE IF EXISTS achat_commande_etat;

CREATE TABLE achat_commande_etat (
  Id tinyint(3) NOT NULL ,
  no_etat tinyint(3) DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table achat_commande_fichier
--

DROP TABLE IF EXISTS achat_commande_fichier;

CREATE TABLE achat_commande_fichier (
  no_fichier mediumint(8)  NOT NULL DEFAULT '0',
  no_commande mediumint(8)  DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL) ;

--
-- Table structure for table achat_commande_type
--

DROP TABLE IF EXISTS achat_commande_type;

CREATE TABLE achat_commande_type (
  no_type tinyint(3) NOT NULL DEFAULT '0',
  code varchar(5) DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  montant_maximum float(8)  NOT NULL DEFAULT '0.00') ;

--
-- Table structure for table achat_compte
--

DROP TABLE IF EXISTS achat_compte;

CREATE TABLE achat_compte (
  no_compte smallint(6)  NOT NULL DEFAULT '0',
  nom varchar(100) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table achat_fournisseur_approbation
--

DROP TABLE IF EXISTS achat_fournisseur_approbation;

CREATE TABLE achat_fournisseur_approbation (
  no_approbation int(11) NOT NULL ,
  no_societe smallint(6)  DEFAULT NULL,
  date_approbation date DEFAULT NULL,
  no_etat tinyint(3)  DEFAULT NULL,
  commentaire varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table achat_fournisseur_etat
--

DROP TABLE IF EXISTS achat_fournisseur_etat;

CREATE TABLE achat_fournisseur_etat (
  no_etat tinyint(3) NOT NULL ,
  nom varchar(25) DEFAULT NULL,
  couleur char(7) NOT NULL DEFAULT '#FFFFFF')  ;

--
-- Table structure for table achat_item
--

DROP TABLE IF EXISTS achat_item;

CREATE TABLE achat_item (
  Id int(11) NOT NULL ,
  no_item smallint(6)  DEFAULT NULL,
  no_categorie tinyint(3)  NOT NULL DEFAULT '0',
  code_interne varchar(20) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  grandeur varchar(50) DEFAULT NULL,
  no_marque smallint(5)  NOT NULL DEFAULT '1',
  notes varchar(100) DEFAULT NULL,
  image varchar(20) DEFAULT NULL,
  ordre tinyint(3)  NOT NULL DEFAULT '10',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table achat_item_categorie
--

DROP TABLE IF EXISTS achat_item_categorie;

CREATE TABLE achat_item_categorie (
  Id int(11) NOT NULL ,
  no_categorie smallint(5)  DEFAULT NULL,
  no_parent smallint(6)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table achat_item_consommation
--

DROP TABLE IF EXISTS achat_item_consommation;

CREATE TABLE achat_item_consommation (
  Id int(11) NOT NULL ,
  no_item smallint(6)  NOT NULL DEFAULT '0',
  no_employe smallint(5) NOT NULL DEFAULT '0',
  quantite smallint(4)  NOT NULL DEFAULT '0',
  date date DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table achat_item_marque
--

DROP TABLE IF EXISTS achat_item_marque;

CREATE TABLE achat_item_marque (
  no_marque smallint(6)  NOT NULL ,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table achat_item_requisition
--

DROP TABLE IF EXISTS achat_item_requisition;

CREATE TABLE achat_item_requisition (
  no_requisition mediumint(9)  NOT NULL DEFAULT '0',
  date_requise date DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table achat_item_requisition_details
--

DROP TABLE IF EXISTS achat_item_requisition_details;

CREATE TABLE achat_item_requisition_details (
  Id int(11) NOT NULL ,
  no_requisition mediumint(9)  NOT NULL DEFAULT '0',
  no_item smallint(5)  NOT NULL DEFAULT '0',
  quantite varchar(30) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '0',
  creation_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table achat_item_requisition_etat
--

DROP TABLE IF EXISTS achat_item_requisition_etat;

CREATE TABLE achat_item_requisition_etat (
  no_etat tinyint(3)  NOT NULL ,
  nom varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table achat_produit
--

DROP TABLE IF EXISTS achat_produit;

CREATE TABLE achat_produit (
  no_produit int(11) NOT NULL ,
  no_item smallint(5)  DEFAULT NULL,
  no_societe smallint(5)  DEFAULT NULL,
  code_produit varchar(30) DEFAULT NULL,
  no_unite tinyint(3)  DEFAULT NULL,
  quantite_unitaire varchar(7) DEFAULT NULL,
  prix decimal(10) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  approuvee_quand datetime DEFAULT NULL,
  approuvee_qui smallint(5)  DEFAULT NULL,
  prix_quand datetime DEFAULT NULL,
  prix_qui smallint(5)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table achat_produit_historique
--

DROP TABLE IF EXISTS achat_produit_historique;

CREATE TABLE achat_produit_historique (
  Id int(11) NOT NULL ,
  no_produit smallint(5)  DEFAULT NULL,
  prix decimal(10) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2012
--

DROP TABLE IF EXISTS acomba_charte_2012;

CREATE TABLE acomba_charte_2012 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2013
--

DROP TABLE IF EXISTS acomba_charte_2013;

CREATE TABLE acomba_charte_2013 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2014
--

DROP TABLE IF EXISTS acomba_charte_2014;

CREATE TABLE acomba_charte_2014 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2015
--

DROP TABLE IF EXISTS acomba_charte_2015;

CREATE TABLE acomba_charte_2015 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2016
--

DROP TABLE IF EXISTS acomba_charte_2016;

CREATE TABLE acomba_charte_2016 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2017
--

DROP TABLE IF EXISTS acomba_charte_2017;

CREATE TABLE acomba_charte_2017 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2018
--

DROP TABLE IF EXISTS acomba_charte_2018;

CREATE TABLE acomba_charte_2018 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2019
--

DROP TABLE IF EXISTS acomba_charte_2019;

CREATE TABLE acomba_charte_2019 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_charte_2020
--

DROP TABLE IF EXISTS acomba_charte_2020;

CREATE TABLE acomba_charte_2020 (
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  ChNumber decimal(10,0) NOT NULL DEFAULT '0',
  ChCategory decimal(10,0) DEFAULT NULL,
  ChDescription varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_compte
--

DROP TABLE IF EXISTS acomba_compte;

CREATE TABLE acomba_compte (
  Id int(11) NOT NULL ,
  ChStatus decimal(10,0) DEFAULT NULL,
  ChUnique decimal(10,0) DEFAULT NULL,
  ChUsed decimal(10,0) DEFAULT NULL,
  ChArchived decimal(10,0) DEFAULT NULL,
  ChUniqueUser decimal(10,0) DEFAULT NULL,
  ChTimeModified datetime DEFAULT NULL,
  no_compte decimal(10,0) DEFAULT NULL,
  ChCategory decimal(10,0) DEFAULT NULL,
  description varchar(60) DEFAULT NULL,
  ChActive decimal(10,0) DEFAULT NULL,
  ChCheckNumber decimal(10,0) DEFAULT NULL,
  ChDepositNumber decimal(10,0) DEFAULT NULL,
  ChAliasNumber decimal(10,0) DEFAULT NULL,
  ChAlwaysUseAlias decimal(10,0) DEFAULT NULL,
  ChCurrentSession decimal(10,0) DEFAULT NULL,
  ChAliasDesc varchar(60) DEFAULT NULL,
  ChGIFI decimal(10,0) DEFAULT NULL,
  ChBalances0 double DEFAULT NULL,
  ChBalances1 double DEFAULT NULL,
  ChBalances2 double DEFAULT NULL,
  ChBalances3 double DEFAULT NULL,
  ChBalances4 double DEFAULT NULL,
  ChBalances5 double DEFAULT NULL,
  ChBalances6 double DEFAULT NULL,
  ChBalances7 double DEFAULT NULL,
  ChBalances8 double DEFAULT NULL,
  ChBalances9 double DEFAULT NULL,
  ChBalances10 double DEFAULT NULL,
  ChBalances11 double DEFAULT NULL,
  ChBalances12 double DEFAULT NULL,
  ChBalances13 double DEFAULT NULL,
  ChBudgets1_0 double DEFAULT NULL,
  ChBudgets1_1 double DEFAULT NULL,
  ChBudgets1_2 double DEFAULT NULL,
  ChBudgets1_3 double DEFAULT NULL,
  ChBudgets1_4 double DEFAULT NULL,
  ChBudgets1_5 double DEFAULT NULL,
  ChBudgets1_6 double DEFAULT NULL,
  ChBudgets1_7 double DEFAULT NULL,
  ChBudgets1_8 double DEFAULT NULL,
  ChBudgets1_9 double DEFAULT NULL,
  ChBudgets1_10 double DEFAULT NULL,
  ChBudgets1_11 double DEFAULT NULL,
  ChBudgets1_12 double DEFAULT NULL,
  ChBudgets1_13 double DEFAULT NULL,
  ChBudgets2_0 double DEFAULT NULL,
  ChBudgets2_1 double DEFAULT NULL,
  ChBudgets2_2 double DEFAULT NULL,
  ChBudgets2_3 double DEFAULT NULL,
  ChBudgets2_4 double DEFAULT NULL,
  ChBudgets2_5 double DEFAULT NULL,
  ChBudgets2_6 double DEFAULT NULL,
  ChBudgets2_7 double DEFAULT NULL,
  ChBudgets2_8 double DEFAULT NULL,
  ChBudgets2_9 double DEFAULT NULL,
  ChBudgets2_10 double DEFAULT NULL,
  ChBudgets2_11 double DEFAULT NULL,
  ChBudgets2_12 double DEFAULT NULL,
  ChBudgets2_13 double DEFAULT NULL,
  ChBudgets3_0 double DEFAULT NULL,
  ChBudgets3_1 double DEFAULT NULL,
  ChBudgets3_2 double DEFAULT NULL,
  ChBudgets3_3 double DEFAULT NULL,
  ChBudgets3_4 double DEFAULT NULL,
  ChBudgets3_5 double DEFAULT NULL,
  ChBudgets3_6 double DEFAULT NULL,
  ChBudgets3_7 double DEFAULT NULL,
  ChBudgets3_8 double DEFAULT NULL,
  ChBudgets3_9 double DEFAULT NULL,
  ChBudgets3_10 double DEFAULT NULL,
  ChBudgets3_11 double DEFAULT NULL,
  ChBudgets3_12 double DEFAULT NULL,
  ChBudgets3_13 double DEFAULT NULL,
  ChNumCharters decimal(10,0) DEFAULT NULL,
  ChOFXAccount varchar(32) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_journal
--

DROP TABLE IF EXISTS acomba_journal;

CREATE TABLE acomba_journal (
  Id int(11) NOT NULL ,
  no_reference mediumint(9)  DEFAULT NULL,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  date_transaction datetime DEFAULT NULL,
  no_journal mediumint(9)  DEFAULT NULL,
  date date DEFAULT NULL,
  periode tinyint(3)  DEFAULT NULL,
  description varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table acomba_journal_details
--

DROP TABLE IF EXISTS acomba_journal_details;

CREATE TABLE acomba_journal_details (
  Id int(11) NOT NULL ,
  no_reference mediumint(8)  DEFAULT NULL,
  no_journal mediumint(9)  DEFAULT NULL,
  no_compte int(11)  DEFAULT NULL,
  no_projet smallint(5)  DEFAULT NULL,
  no_temp smallint(6)  DEFAULT NULL,
  projet varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  montant decimal(10) NOT NULL DEFAULT '0.00',
  montant2 decimal(10) DEFAULT NULL,
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table acomba_project
--

DROP TABLE IF EXISTS acomba_project;

CREATE TABLE acomba_project (
  PrStatus decimal(10,0) DEFAULT NULL,
  PrUnique decimal(10,0) DEFAULT NULL,
  PrUsed decimal(10,0) DEFAULT NULL,
  PrUniqueUser decimal(10,0) DEFAULT NULL,
  PrTimeModified datetime DEFAULT NULL,
  PrType decimal(10,0) DEFAULT NULL,
  PrNumber varchar(15) DEFAULT NULL,
  PrDescription varchar(90) DEFAULT NULL,
  PrCurrentSession decimal(10,0) DEFAULT NULL,
  PrSegmentsCP1 decimal(10,0) DEFAULT NULL,
  PrSegmentsCP2 decimal(10,0) DEFAULT NULL,
  PrSegmentsCP3 decimal(10,0) DEFAULT NULL,
  PrDates1 datetime DEFAULT NULL,
  PrDates2 datetime DEFAULT NULL,
  PrDates3 datetime DEFAULT NULL,
  PrProjectStatus decimal(10,0) DEFAULT NULL,
  PrBudgets1_0 double DEFAULT NULL,
  PrBudgets1_1 double DEFAULT NULL,
  PrBudgets1_2 double DEFAULT NULL,
  PrBudgets1_3 double DEFAULT NULL,
  PrBudgets1_4 double DEFAULT NULL,
  PrBudgets1_5 double DEFAULT NULL,
  PrBudgets1_6 double DEFAULT NULL,
  PrBudgets1_7 double DEFAULT NULL,
  PrBudgets1_8 double DEFAULT NULL,
  PrBudgets1_9 double DEFAULT NULL,
  PrBudgets1_10 double DEFAULT NULL,
  PrBudgets1_11 double DEFAULT NULL,
  PrBudgets1_12 double DEFAULT NULL,
  PrBudgets1_13 double DEFAULT NULL,
  PrBudgets2_0 double DEFAULT NULL,
  PrBudgets2_1 double DEFAULT NULL,
  PrBudgets2_2 double DEFAULT NULL,
  PrBudgets2_3 double DEFAULT NULL,
  PrBudgets2_4 double DEFAULT NULL,
  PrBudgets2_5 double DEFAULT NULL,
  PrBudgets2_6 double DEFAULT NULL,
  PrBudgets2_7 double DEFAULT NULL,
  PrBudgets2_8 double DEFAULT NULL,
  PrBudgets2_9 double DEFAULT NULL,
  PrBudgets2_10 double DEFAULT NULL,
  PrBudgets2_11 double DEFAULT NULL,
  PrBudgets2_12 double DEFAULT NULL,
  PrBudgets2_13 double DEFAULT NULL,
  PrBudgets3_0 double DEFAULT NULL,
  PrBudgets3_1 double DEFAULT NULL,
  PrBudgets3_2 double DEFAULT NULL,
  PrBudgets3_3 double DEFAULT NULL,
  PrBudgets3_4 double DEFAULT NULL,
  PrBudgets3_5 double DEFAULT NULL,
  PrBudgets3_6 double DEFAULT NULL,
  PrBudgets3_7 double DEFAULT NULL,
  PrBudgets3_8 double DEFAULT NULL,
  PrBudgets3_9 double DEFAULT NULL,
  PrBudgets3_10 double DEFAULT NULL,
  PrBudgets3_11 double DEFAULT NULL,
  PrBudgets3_12 double DEFAULT NULL,
  PrBudgets3_13 double DEFAULT NULL,
  PrCCQ_Contract decimal(10,0) DEFAULT NULL,
  PrCCQ_Estimate double DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL
) ;

--
-- Table structure for table acomba_transgldetail
--

DROP TABLE IF EXISTS acomba_transgldetail;

CREATE TABLE acomba_transgldetail (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2012
--

DROP TABLE IF EXISTS acomba_transgldetail_2012;

CREATE TABLE acomba_transgldetail_2012 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2013
--

DROP TABLE IF EXISTS acomba_transgldetail_2013;

CREATE TABLE acomba_transgldetail_2013 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2014
--

DROP TABLE IF EXISTS acomba_transgldetail_2014;

CREATE TABLE acomba_transgldetail_2014 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2015
--

DROP TABLE IF EXISTS acomba_transgldetail_2015;

CREATE TABLE acomba_transgldetail_2015 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2016
--

DROP TABLE IF EXISTS acomba_transgldetail_2016;

CREATE TABLE acomba_transgldetail_2016 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL)  ;

--
-- Table structure for table acomba_transgldetail_2017
--

DROP TABLE IF EXISTS acomba_transgldetail_2017;

CREATE TABLE acomba_transgldetail_2017 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL
) ;

--
-- Table structure for table acomba_transgldetail_2018
--

DROP TABLE IF EXISTS acomba_transgldetail_2018;

CREATE TABLE acomba_transgldetail_2018 (
  PGStatus decimal(10,0) DEFAULT NULL,
  PGUnique decimal(10,0) DEFAULT NULL,
  PGJournalCP decimal(10,0) DEFAULT NULL,
  PGJournalUnique decimal(10,0) DEFAULT NULL,
  PGJournalType decimal(10,0) DEFAULT NULL,
  PGCharterCP decimal(10,0) DEFAULT NULL,
  PGCharterNumber decimal(10,0) DEFAULT NULL,
  PGCategory decimal(10,0) DEFAULT NULL,
  PGProjectCP decimal(10,0) DEFAULT NULL,
  PGProjectNumber varchar(7) DEFAULT NULL,
  PGDescription varchar(90) DEFAULT NULL,
  PGPeriod decimal(10,0) DEFAULT NULL,
  PGDate datetime DEFAULT NULL,
  PGReconciliationDate datetime DEFAULT NULL,
  PGFlags decimal(10,0) DEFAULT NULL,
  PGAmount double DEFAULT NULL,
  TaNum decimal(10,0) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL
) ;

--
-- Table structure for table acomba_transglheader
--

DROP TABLE IF EXISTS acomba_transglheader;

CREATE TABLE acomba_transglheader (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table acomba_transglheader_2012
--

DROP TABLE IF EXISTS acomba_transglheader_2012;

CREATE TABLE acomba_transglheader_2012 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0') ;

--
-- Table structure for table acomba_transglheader_2013
--

DROP TABLE IF EXISTS acomba_transglheader_2013;

CREATE TABLE acomba_transglheader_2013 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0') ;

--
-- Table structure for table acomba_transglheader_2014
--

DROP TABLE IF EXISTS acomba_transglheader_2014;

CREATE TABLE acomba_transglheader_2014 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0') ;

--
-- Table structure for table acomba_transglheader_2015
--

DROP TABLE IF EXISTS acomba_transglheader_2015;

CREATE TABLE acomba_transglheader_2015 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0') ;

--
-- Table structure for table acomba_transglheader_2016
--

DROP TABLE IF EXISTS acomba_transglheader_2016;

CREATE TABLE acomba_transglheader_2016 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) NOT NULL DEFAULT '0') ;

--
-- Table structure for table acomba_transglheader_2017
--

DROP TABLE IF EXISTS acomba_transglheader_2017;

CREATE TABLE acomba_transglheader_2017 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL
) ;

--
-- Table structure for table acomba_transglheader_2018
--

DROP TABLE IF EXISTS acomba_transglheader_2018;

CREATE TABLE acomba_transglheader_2018 (
  JoStatus decimal(10,0) DEFAULT NULL,
  JoUnique decimal(10,0) DEFAULT NULL,
  JoUniqueUser decimal(10,0) DEFAULT NULL,
  JoTimeModified datetime DEFAULT NULL,
  JoType decimal(10,0) DEFAULT NULL,
  JoPeriod decimal(10,0) DEFAULT NULL,
  JoFlags decimal(10,0) DEFAULT NULL,
  JoBankCP decimal(10,0) DEFAULT NULL,
  JoBankNumber decimal(10,0) DEFAULT NULL,
  JoTransactionNumber decimal(10,0) DEFAULT NULL,
  JoDate datetime DEFAULT NULL,
  JoAmount double DEFAULT NULL,
  JoDescription varchar(255) DEFAULT NULL,
  JoCurrentSession decimal(10,0) DEFAULT NULL,
  TGNumPosts decimal(10,0) DEFAULT NULL,
  TGCheckGLUsed decimal(10,0) DEFAULT NULL,
  CGStatus decimal(10,0) DEFAULT NULL,
  CGUnique decimal(10,0) DEFAULT NULL,
  CGType decimal(10,0) DEFAULT NULL,
  CGBankCP decimal(10,0) DEFAULT NULL,
  CGBankNumber decimal(10,0) DEFAULT NULL,
  CGNumber decimal(10,0) DEFAULT NULL,
  CGBatchJournalCP decimal(10,0) DEFAULT NULL,
  CGDate datetime DEFAULT NULL,
  CGAmount double DEFAULT NULL,
  CGDatePrinted datetime DEFAULT NULL,
  CGName varchar(30) DEFAULT NULL,
  CGCareOf varchar(30) DEFAULT NULL,
  CGAddress varchar(30) DEFAULT NULL,
  CGCity varchar(30) DEFAULT NULL,
  CGPostalCode varchar(11) DEFAULT NULL,
  CGPhone varchar(11) DEFAULT NULL,
  CGComments varchar(255) DEFAULT NULL,
  RecCardPos decimal(10,0) DEFAULT NULL
) ;

--
-- Table structure for table ad_groupes
--

DROP TABLE IF EXISTS ad_groupes;

CREATE TABLE ad_groupes (
  Id tinyint(3)  NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  acces varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table ad_groupes_usagers
--

DROP TABLE IF EXISTS ad_groupes_usagers;

CREATE TABLE ad_groupes_usagers (
  Id mediumint(8)  NOT NULL ,
  groupe varchar(50) DEFAULT NULL,
  usager varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table ad_usagers
--

DROP TABLE IF EXISTS ad_usagers;

CREATE TABLE ad_usagers (
  Id tinyint(3)  NOT NULL ,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table archive_achat_commande
--

DROP TABLE IF EXISTS archive_achat_commande;

CREATE TABLE archive_achat_commande (
  Id int(11) NOT NULL,
  no_commande smallint(6)  DEFAULT NULL,
  code_commande char(12) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  no_formulaire tinyint(3) NOT NULL DEFAULT '1',
  code_activite varchar(2) NOT NULL DEFAULT 'i',
  no_activite smallint(5)  NOT NULL DEFAULT '0',
  activite_editable tinyint(3)  NOT NULL DEFAULT '1',
  no_compte smallint(6)  NOT NULL DEFAULT '0',
  no_departement smallint(6)  DEFAULT NULL,
  reference char(1) DEFAULT NULL,
  langage char(2) NOT NULL DEFAULT 'fr',
  devise_code varchar(3) DEFAULT 'CAN',
  unite_mesure char(1) NOT NULL DEFAULT 'i',
  projet varchar(100) DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  bon_ouvert tinyint(1)  NOT NULL DEFAULT '0',
  bon_ouvert_approuvee_quand datetime DEFAULT NULL,
  bon_ouvert_approuvee_qui smallint(6) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  no_societe smallint(5)  DEFAULT NULL,
  no_contact smallint(5)  NOT NULL DEFAULT '0',
  fournisseur_contact varchar(100) DEFAULT NULL,
  livraison_emplacement varchar(100) DEFAULT NULL,
  livraison_adresse varchar(250) DEFAULT '',
  livraison_telephone varchar(20) DEFAULT NULL,
  livraison_fax varchar(20) DEFAULT NULL,
  livraison_contact varchar(100) DEFAULT NULL,
  livraison_date date DEFAULT NULL,
  livraison_par varchar(30) DEFAULT NULL,
  date_commande date DEFAULT NULL,
  no_type_transmission tinyint(3)  DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL,
  courriel_cc varchar(255) DEFAULT NULL,
  fax varchar(20) DEFAULT NULL,
  sous_total float(12)  NOT NULL DEFAULT '0.00',
  total_transport float(7)  NOT NULL DEFAULT '0.00',
  no_taxe tinyint(3)  NOT NULL DEFAULT '0',
  tps_taux float(5)  DEFAULT NULL,
  tps_total float(8)  DEFAULT NULL,
  tvq_taux float(5)  DEFAULT NULL,
  tvq_total float(8)  DEFAULT NULL,
  tvh_taux float(6)  DEFAULT NULL,
  tvh_total float(8)  DEFAULT NULL,
  total float(12)  NOT NULL DEFAULT '0.00',
  notes_fournisseur text,
  notes_interne varchar(255) DEFAULT NULL,
  mill_test tinyint(1)  NOT NULL DEFAULT '0',
  conditions text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  imprimee_quand datetime DEFAULT NULL,
  imprimee_qui smallint(5)  DEFAULT NULL,
  approuvee_quand datetime DEFAULT NULL,
  approuvee_qui smallint(5)  DEFAULT NULL,
  refusee_quand datetime DEFAULT NULL,
  refusee_qui smallint(6)  DEFAULT NULL,
  refusee_raison text,
  fichier varchar(100) DEFAULT NULL,
  fabtrol_ponumber varchar(30) DEFAULT NULL) ;

--
-- Table structure for table archive_achat_commande_details
--

DROP TABLE IF EXISTS archive_achat_commande_details;

CREATE TABLE archive_achat_commande_details (
  Id int(11) NOT NULL,
  no_commande smallint(6)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  DEFAULT NULL,
  no_reception tinyint(3)  NOT NULL DEFAULT '1',
  reference varchar(10) DEFAULT NULL,
  ponumber varchar(30) DEFAULT NULL,
  code_activite varchar(3) DEFAULT NULL,
  no_activite smallint(5)  NOT NULL DEFAULT '0',
  no_produit smallint(5)  DEFAULT NULL,
  code_produit varchar(30) DEFAULT NULL,
  no_compte smallint(6)  NOT NULL DEFAULT '0',
  marque_piece varchar(8) DEFAULT NULL,
  quantite float(10) DEFAULT NULL,
  quantite_modifiee float(10) DEFAULT NULL,
  quantite_approbation tinyint(1) NOT NULL DEFAULT '1',
  unite_mesure varchar(30) DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  description text,
  grade varchar(20) DEFAULT NULL,
  longueur varchar(20) DEFAULT NULL,
  poids varchar(10) DEFAULT NULL,
  marque varchar(20) DEFAULT NULL,
  prix_unitaire float(12) DEFAULT NULL,
  unite varchar(10) DEFAULT NULL,
  total float(12) DEFAULT NULL,
  dim_i varchar(20) DEFAULT NULL,
  dim_m varchar(20) DEFAULT NULL,
  longueur_i varchar(20) DEFAULT NULL,
  longueur_m varchar(20) DEFAULT NULL,
  poids_i varchar(20) DEFAULT NULL,
  poids_m varchar(20) DEFAULT NULL,
  prix_unitaire_i float(6) DEFAULT NULL,
  prix_unitaire_m float(6) DEFAULT NULL,
  reception_quantite float(8) DEFAULT NULL,
  reception_bo tinyint(1) NOT NULL DEFAULT '0',
  reception_cancel tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table comptabilite_devises
--

DROP TABLE IF EXISTS comptabilite_devises;

CREATE TABLE comptabilite_devises (
  Id int(11)  NOT NULL ,
  code char(3) NOT NULL DEFAULT '',
  nom varchar(30) DEFAULT NULL,
  externe varchar(5) DEFAULT NULL,
  taux decimal(7) DEFAULT NULL,
  conversion decimal(7) DEFAULT NULL,
  update_quand datetime DEFAULT NULL)  ;

--
-- Table structure for table comptabilite_devises_historique
--

DROP TABLE IF EXISTS comptabilite_devises_historique;

CREATE TABLE comptabilite_devises_historique (
  Id int(11) NOT NULL ,
  date date DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  taux float(6) NOT NULL DEFAULT '0.0000',
  conversion float(6) NOT NULL DEFAULT '0.0000')  ;

--
-- Table structure for table comptabilite_taxe
--

DROP TABLE IF EXISTS comptabilite_taxe;

CREATE TABLE comptabilite_taxe (
  Id tinyint(3)  NOT NULL ,
  no_taxe tinyint(3)  NOT NULL DEFAULT '0',
  description varchar(40) DEFAULT NULL,
  taux_tps decimal(5,3)  NOT NULL DEFAULT '0.000',
  taux_tvq decimal(5,3)  NOT NULL DEFAULT '0.000',
  taux_tvh decimal(5,3)  NOT NULL DEFAULT '0.000')  ;

--
-- Table structure for table evaluation
--

DROP TABLE IF EXISTS evaluation;

CREATE TABLE evaluation (
  no_evaluation smallint(6)  NOT NULL DEFAULT '0',
  version_module tinyint(3)  NOT NULL DEFAULT '2',
  no_employe smallint(5)  DEFAULT NULL,
  no_modele smallint(5)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  date_embauche date DEFAULT NULL,
  anciennete decimal(3,1)  NOT NULL DEFAULT '0.0',
  no_poste smallint(5)  NOT NULL DEFAULT '0',
  experience_poste decimal(3,1)  NOT NULL DEFAULT '0.0',
  experience_pertinente decimal(3,1)  NOT NULL DEFAULT '0.0',
  taux_horaire float(4) NOT NULL DEFAULT '0.00',
  vacance tinyint(3)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  bilan_points varchar(5) DEFAULT NULL,
  bilan_autre_fonction varchar(3) NOT NULL DEFAULT 'NON',
  bilan_autre_fonction_details text,
  bilan_plan_profesionnel_5ans text,
  bilan_points_ameliorer text,
  modification_salaire float(4) NOT NULL DEFAULT '0.00',
  modification_vacance tinyint(3) NOT NULL DEFAULT '0',
  modification_salaire_avantage varchar(255) DEFAULT NULL,
  modification_date_effective date DEFAULT NULL,
  plan_action_enrichissements_taches varchar(255) DEFAULT NULL,
  plan_action_mutation varchar(255) DEFAULT NULL,
  plan_action_affectations_speciales varchar(255) DEFAULT NULL,
  plan_action_modification_poste varchar(255) DEFAULT NULL,
  formation_critiques_court_terme varchar(255) DEFAULT NULL,
  formation_perfectionnement_long_terme varchar(255) DEFAULT NULL,
  objectif_principale_prochaine_periode text,
  commentaires_generaux text,
  commentaires_employe text,
  termine tinyint(1)  NOT NULL DEFAULT '0',
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(6)  DEFAULT NULL,
  rh_fait_quand datetime DEFAULT NULL,
  rh_fait_qui smallint(6) DEFAULT NULL,
  intranet tinyint(1)  NOT NULL DEFAULT '0') ;

--
-- Table structure for table evaluation_modele
--

DROP TABLE IF EXISTS evaluation_modele;

CREATE TABLE evaluation_modele (
  no_modele smallint(6)  NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table evaluation_modele_categorie
--

DROP TABLE IF EXISTS evaluation_modele_categorie;

CREATE TABLE evaluation_modele_categorie (
  Id int(11) NOT NULL ,
  no_categorie tinyint(3)  NOT NULL DEFAULT '0',
  no_modele smallint(5)  NOT NULL DEFAULT '0',
  version tinyint(3)  NOT NULL DEFAULT '1',
  description varchar(75) DEFAULT NULL,
  pourcentage tinyint(3)  NOT NULL DEFAULT '100',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table evaluation_modele_categorie_critere
--

DROP TABLE IF EXISTS evaluation_modele_categorie_critere;

CREATE TABLE evaluation_modele_categorie_critere (
  Id int(11) NOT NULL ,
  no_categorie tinyint(3)  NOT NULL DEFAULT '0',
  no_critere smallint(5)  NOT NULL DEFAULT '0',
  no_modele smallint(5)  NOT NULL DEFAULT '0',
  version tinyint(3)  NOT NULL DEFAULT '1',
  pourcentage tinyint(3)  NOT NULL DEFAULT '100',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table evaluation_modele_critere
--

DROP TABLE IF EXISTS evaluation_modele_critere;

CREATE TABLE evaluation_modele_critere (
  no_critere smallint(5)  NOT NULL ,
  description varchar(100) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table evaluation_resultat
--

DROP TABLE IF EXISTS evaluation_resultat;

CREATE TABLE evaluation_resultat (
  Id int(11) NOT NULL ,
  no_evaluation smallint(6) DEFAULT NULL,
  no_categorie tinyint(3)  DEFAULT NULL,
  no_critere smallint(5)  DEFAULT NULL,
  resultat tinyint(3) NOT NULL DEFAULT '-1')  ;

--
-- Table structure for table evaluation_resultat_commentaires
--

DROP TABLE IF EXISTS evaluation_resultat_commentaires;

CREATE TABLE evaluation_resultat_commentaires (
  Id int(11) NOT NULL ,
  no_evaluation smallint(5)  DEFAULT NULL,
  no_categorie tinyint(3)  DEFAULT NULL,
  no_critere smallint(5)  DEFAULT NULL,
  no_employe smallint(5)  DEFAULT NULL,
  commentaires text)  ;

--
-- Table structure for table fabtrol_ftprice_base
--

DROP TABLE IF EXISTS fabtrol_ftprice_base;

CREATE TABLE fabtrol_ftprice_base (
  AISCGROUP varchar(1) DEFAULT NULL,
  CATEGORY varchar(3) DEFAULT NULL,
  COSTPER double DEFAULT NULL,
  CSTHISTORY mediumtext,
  DESCRIP mediumtext,
  DIM varchar(24) DEFAULT NULL,
  FILEKEY decimal(6,0) DEFAULT NULL,
  FIXMETVAL varchar(1) DEFAULT NULL,
  FLNGMM decimal(7) DEFAULT NULL,
  FLNGTHICK decimal(5) DEFAULT NULL,
  GRADE varchar(1) DEFAULT NULL,
  GRADENAME varchar(16) DEFAULT NULL,
  GROUPID varchar(1) DEFAULT NULL,
  HISTDATE datetime DEFAULT NULL,
  HISTORY varchar(8) DEFAULT NULL,
  KILOPER double DEFAULT NULL,
  LISTCODE varchar(3) DEFAULT NULL,
  METRIC varchar(24) DEFAULT NULL,
  MILLFRAC varchar(5) DEFAULT NULL,
  MILLFT decimal(3,0) DEFAULT NULL,
  MILLIN decimal(3,0) DEFAULT NULL,
  MILLLINEAR decimal(7) DEFAULT NULL,
  MILLMILL decimal(6,0) DEFAULT NULL,
  ORDERKEY double DEFAULT NULL,
  PHASE varchar(6) DEFAULT NULL,
  PKEY int(11) NOT NULL DEFAULT '0',
  PRICEGROUP varchar(3) DEFAULT NULL,
  SERIAL varchar(23) DEFAULT NULL,
  SERIALSIZEID int(11) DEFAULT NULL,
  SURFPER decimal(6,3) DEFAULT NULL,
  SURFPERM2 decimal(6,3) DEFAULT NULL,
  TYPE varchar(3) DEFAULT NULL,
  WTPER double DEFAULT NULL) ;

--
-- Table structure for table formation
--

DROP TABLE IF EXISTS formation;

CREATE TABLE formation (
  Id mediumint(9)  NOT NULL ,
  no_formation mediumint(9)  DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  no_demande smallint(5)  NOT NULL DEFAULT '0',
  titre varchar(75) DEFAULT NULL,
  description text,
  no_type tinyint(3)  NOT NULL DEFAULT '1',
  no_societe smallint(5)  DEFAULT NULL,
  responsable_code char(1) DEFAULT NULL,
  responsable_no smallint(5)  NOT NULL DEFAULT '0',
  endroit varchar(255) DEFAULT NULL,
  nbr_heure varchar(10) DEFAULT NULL,
  ressources text,
  departement_100 tinyint(1)  NOT NULL DEFAULT '0',
  departement_200 tinyint(1)  NOT NULL DEFAULT '0',
  departement_300 tinyint(1)  NOT NULL DEFAULT '0',
  departement_400 tinyint(1)  NOT NULL DEFAULT '0',
  departement_500 tinyint(1)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table formation_etat
--

DROP TABLE IF EXISTS formation_etat;

CREATE TABLE formation_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table formation_type
--

DROP TABLE IF EXISTS formation_type;

CREATE TABLE formation_type (
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table general_activite
--

DROP TABLE IF EXISTS general_activite;

CREATE TABLE general_activite (
  Id tinyint(3) NOT NULL ,
  code char(2) DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_calendrier_note
--

DROP TABLE IF EXISTS general_calendrier_note;

CREATE TABLE general_calendrier_note (
  Id int(11) NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  date date DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  details varchar(125) DEFAULT '',
  public tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_communication
--

DROP TABLE IF EXISTS general_communication;

CREATE TABLE general_communication (
  no_communication mediumint(8)  NOT NULL DEFAULT '0',
  description text,
  fichier varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table general_contact
--

DROP TABLE IF EXISTS general_contact;

CREATE TABLE general_contact (
  no_contact smallint(6) NOT NULL DEFAULT '0',
  nom varchar(50) DEFAULT NULL,
  titre varchar(50) DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL,
  cellulaire varchar(20) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table general_date_conge
--

DROP TABLE IF EXISTS general_date_conge;

CREATE TABLE general_date_conge (
  Id int(11) NOT NULL ,
  date date DEFAULT NULL,
  description varchar(75) DEFAULT NULL,
  ferie tinyint(1)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_departement
--

DROP TABLE IF EXISTS general_departement;

CREATE TABLE general_departement (
  Id tinyint(3)  NOT NULL ,
  no_departement smallint(5)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  avantages_sociaux decimal(4)  NOT NULL DEFAULT '0.00',
  csst decimal(4,0)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_departement_tache
--

DROP TABLE IF EXISTS general_departement_tache;

CREATE TABLE general_departement_tache (
  Id smallint(6)  NOT NULL ,
  no_departement smallint(6)  DEFAULT NULL,
  no_tache smallint(6)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  budget tinyint(1)  NOT NULL DEFAULT '0',
  defaut tinyint(1)  NOT NULL DEFAULT '0',
  code_p tinyint(1)  NOT NULL DEFAULT '1',
  code_s tinyint(1)  NOT NULL DEFAULT '1',
  code_rd tinyint(1)  NOT NULL DEFAULT '1',
  code_f tinyint(1)  NOT NULL DEFAULT '1',
  code_i tinyint(1)  NOT NULL DEFAULT '1',
  module_punch tinyint(1)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  no_tache_unique tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe
--

DROP TABLE IF EXISTS general_employe;

CREATE TABLE general_employe (
  Id smallint(6) NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  webmaster tinyint(1)  NOT NULL DEFAULT '0',
  date_embauche date DEFAULT NULL,
  date_reembauche date DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  usager varchar(30) NOT NULL DEFAULT 'usine',
  adpassword varchar(30) DEFAULT NULL,
  ordinateur varchar(50) DEFAULT NULL,
  nip varchar(15) DEFAULT NULL,
  actif tinyint(1) NOT NULL DEFAULT '1',
  prenom varchar(50) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  initiale varchar(5) DEFAULT NULL,
  sexe char(1) NOT NULL DEFAULT 'M',
  adresse varchar(75) DEFAULT NULL,
  ville varchar(50) DEFAULT NULL,
  province varchar(30) NOT NULL DEFAULT 'QC',
  code_postal varchar(7) DEFAULT NULL,
  telephone varchar(20) DEFAULT NULL,
  cellulaire varchar(20) DEFAULT NULL,
  cellulaire_bottin tinyint(1)  NOT NULL DEFAULT '0',
  courriel varchar(50) DEFAULT NULL,
  office365_email varchar(50) DEFAULT NULL,
  office365_password varchar(20) DEFAULT NULL,
  notes text,
  nas varchar(11) DEFAULT NULL,
  vacance tinyint(3)  NOT NULL DEFAULT '4',
  nbr_journee_maladie_max tinyint(2)  NOT NULL DEFAULT '3',
  taux_horaire decimal(4)  NOT NULL DEFAULT '0.00',
  total_prime decimal(4)  NOT NULL DEFAULT '0.00',
  frais_marginaux tinyint(3)  NOT NULL DEFAULT '0',
  charges_sociales decimal(4)  NOT NULL DEFAULT '0.00',
  taux_horaire_total decimal(5)  NOT NULL DEFAULT '0.00',
  heure_semaine float(4) NOT NULL DEFAULT '40.00',
  heure_jour varchar(3) NOT NULL DEFAULT '8',
  nbr_jour_semaine tinyint(3)  NOT NULL DEFAULT '5',
  horaire_jour_0 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_1 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_2 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_3 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_4 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_5 tinyint(1)  NOT NULL DEFAULT '0',
  horaire_jour_6 tinyint(1)  NOT NULL DEFAULT '0',
  quart varchar(10) DEFAULT 'jour',
  no_division smallint(5)  NOT NULL DEFAULT '99',
  no_service smallint(5)  NOT NULL DEFAULT '999',
  salaire_fixe tinyint(1)  NOT NULL DEFAULT '0',
  heure_arrivee_maximale varchar(5) DEFAULT '07:00',
  titre varchar(150) DEFAULT NULL,
  signature_fonction varchar(255) DEFAULT NULL,
  extension varchar(10) DEFAULT NULL,
  no_fonction smallint(6)  NOT NULL DEFAULT '0',
  no_departement smallint(6)  NOT NULL DEFAULT '0',
  no_tache smallint(6)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  disponibilite_actif tinyint(1)  NOT NULL DEFAULT '0',
  disponibilite_no_etat tinyint(3)  NOT NULL DEFAULT '3',
  disponibilite_note varchar(255) DEFAULT NULL,
  module_punch tinyint(1)  NOT NULL DEFAULT '1',
  employe_location tinyint(1)  NOT NULL DEFAULT '0',
  employe_usa tinyint(1)  NOT NULL DEFAULT '0',
  lunch_auto tinyint(3)  NOT NULL DEFAULT '1',
  tache_auto tinyint(1)  NOT NULL DEFAULT '0',
  module_fete tinyint(1)  NOT NULL DEFAULT '1',
  module_bon_commande tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_assembleur tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_inspecteur tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_soudeur tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_chauffeur tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_fourniture tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_rapport tinyint(1)  NOT NULL DEFAULT '0',
  fabrication_responsable tinyint(1)  NOT NULL DEFAULT '0',
  punch_temps_reel tinyint(1)  NOT NULL DEFAULT '0',
  bottin tinyint(1)  NOT NULL DEFAULT '0',
  projet_maximize tinyint(1)  NOT NULL DEFAULT '1',
  editer_liste_materiel tinyint(1)  NOT NULL DEFAULT '0',
  representant tinyint(1)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  banque_negative tinyint(1)  NOT NULL DEFAULT '0',
  banque_negative_maximum_semaine varchar(4) DEFAULT '8',
  banque_negative_minimum varchar(4) NOT NULL DEFAULT '60',
  no_modele_evaluation smallint(5)  NOT NULL DEFAULT '0',
  allocation_cellulaire_max decimal(5) NOT NULL DEFAULT '0.00',
  smq_responsable tinyint(1)  NOT NULL DEFAULT '0',
  no_poste smallint(5)  NOT NULL DEFAULT '0',
  classe varchar(2) DEFAULT NULL,
  facteur_surtemps decimal(2,1) DEFAULT '1.5')  ;

--
-- Table structure for table general_employe_allocation_cellulaire
--

DROP TABLE IF EXISTS general_employe_allocation_cellulaire;

CREATE TABLE general_employe_allocation_cellulaire (
  no_allocation mediumint(9)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  NOT NULL DEFAULT '0',
  annee smallint(5)  NOT NULL DEFAULT '0',
  mois tinyint(3)  NOT NULL DEFAULT '0',
  montant decimal(5)  NOT NULL DEFAULT '0.00',
  commentaires text,
  fichier varchar(20) DEFAULT NULL,
  derogation_montant decimal(6)  DEFAULT NULL,
  derogation_commentaires text,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  no_approbation smallint(5)  NOT NULL DEFAULT '0',
  no_demande smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_allocation_cellulaire_approbation
--

DROP TABLE IF EXISTS general_employe_allocation_cellulaire_approbation;

CREATE TABLE general_employe_allocation_cellulaire_approbation (
  no_approbation smallint(5)  NOT NULL DEFAULT '0',
  sous_total varchar(10) DEFAULT NULL,
  taux_tps varchar(10) DEFAULT NULL,
  tps varchar(10) DEFAULT NULL,
  taux_tvq varchar(10) DEFAULT NULL,
  tvq varchar(10) DEFAULT NULL,
  total varchar(10) DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_allocation_demande
--

DROP TABLE IF EXISTS general_employe_allocation_demande;

CREATE TABLE general_employe_allocation_demande (
  no_demande smallint(6) NOT NULL DEFAULT '0',
  no_employe smallint(5)  NOT NULL DEFAULT '0',
  commentaire varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0',
  transmission_quand datetime DEFAULT NULL,
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(5)  NOT NULL DEFAULT '0',
  traitement_quand datetime DEFAULT NULL,
  traitement_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_allocation_deplacement
--

DROP TABLE IF EXISTS general_employe_allocation_deplacement;

CREATE TABLE general_employe_allocation_deplacement (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  date date DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  no_item mediumint(8)  NOT NULL DEFAULT '0',
  adresse1 varchar(255) DEFAULT NULL,
  adresse2 varchar(255) DEFAULT NULL,
  distance varchar(10) DEFAULT NULL,
  temps varchar(10) DEFAULT NULL,
  aller_retour tinyint(1)  NOT NULL DEFAULT '0',
  summit tinyint(1)  NOT NULL DEFAULT '0',
  transport_lourd tinyint(1)  NOT NULL DEFAULT '0',
  representation tinyint(1)  NOT NULL DEFAULT '0',
  google_data mediumtext,
  commentaires varchar(255) DEFAULT NULL,
  derogation_distance varchar(10) DEFAULT NULL,
  derogation_commentaires varchar(255) DEFAULT NULL,
  derogation_fichier varchar(100) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  taux_km decimal(4) DEFAULT NULL,
  no_approbation smallint(5)  NOT NULL DEFAULT '0',
  no_demande smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_allocation_deplacement_approbation
--

DROP TABLE IF EXISTS general_employe_allocation_deplacement_approbation;

CREATE TABLE general_employe_allocation_deplacement_approbation (
  Id mediumint(9)  NOT NULL ,
  no_approbation smallint(5)  DEFAULT NULL,
  taux_km varchar(10) DEFAULT NULL,
  sous_total varchar(10) DEFAULT NULL,
  taux_tps varchar(10) DEFAULT NULL,
  tps varchar(10) DEFAULT NULL,
  taux_tvq varchar(10) DEFAULT NULL,
  tvq varchar(10) DEFAULT NULL,
  total varchar(10) DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_allocation_deplacement_historique
--

DROP TABLE IF EXISTS general_employe_allocation_deplacement_historique;

CREATE TABLE general_employe_allocation_deplacement_historique (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  date date DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  no_item mediumint(8)  NOT NULL DEFAULT '0',
  adresse1 varchar(255) DEFAULT NULL,
  adresse2 varchar(255) DEFAULT NULL,
  distance varchar(10) DEFAULT NULL,
  aller_retour tinyint(1)  NOT NULL DEFAULT '0',
  summit tinyint(3)  NOT NULL DEFAULT '0',
  google_data text,
  commentaires varchar(255) DEFAULT NULL,
  derogation_distance varchar(10) DEFAULT NULL,
  derogation_commentaires varchar(255) DEFAULT NULL,
  derogation_fichier varchar(100) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_allocation_divers
--

DROP TABLE IF EXISTS general_employe_allocation_divers;

CREATE TABLE general_employe_allocation_divers (
  no_allocation smallint(6)  NOT NULL DEFAULT '0',
  no_demande smallint(5)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  DEFAULT NULL,
  date date DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  no_item smallint(5)  NOT NULL DEFAULT '0',
  description text,
  sous_total decimal(6)  DEFAULT NULL,
  taux_tps varchar(10) DEFAULT NULL,
  tps decimal(6)  NOT NULL DEFAULT '0.00',
  taux_tvq varchar(10) DEFAULT NULL,
  tvq decimal(6)  NOT NULL DEFAULT '0.00',
  montant decimal(6)  NOT NULL DEFAULT '0.00',
  fichier varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL) ;

--
-- Table structure for table general_employe_allocation_repas
--

DROP TABLE IF EXISTS general_employe_allocation_repas;

CREATE TABLE general_employe_allocation_repas (
  no_allocation mediumint(9)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  NOT NULL DEFAULT '0',
  annee smallint(6)  DEFAULT NULL,
  semaine tinyint(3)  DEFAULT NULL,
  dimanche_no_projet smallint(5) NOT NULL DEFAULT '-1',
  dimanche_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  dimanche_diner tinyint(1)  NOT NULL DEFAULT '0',
  dimanche_souper tinyint(1)  NOT NULL DEFAULT '0',
  lundi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  lundi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  lundi_diner tinyint(1)  NOT NULL DEFAULT '0',
  lundi_souper tinyint(1)  NOT NULL DEFAULT '0',
  mardi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  mardi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  mardi_diner tinyint(1)  NOT NULL DEFAULT '0',
  mardi_souper tinyint(1)  NOT NULL DEFAULT '0',
  mercredi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  mercredi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  mercredi_diner tinyint(1)  NOT NULL DEFAULT '0',
  mercredi_souper tinyint(1)  NOT NULL DEFAULT '0',
  jeudi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  jeudi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  jeudi_diner tinyint(1)  NOT NULL DEFAULT '0',
  jeudi_souper tinyint(1)  NOT NULL DEFAULT '0',
  vendredi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  vendredi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  vendredi_diner tinyint(1)  NOT NULL DEFAULT '0',
  vendredi_souper tinyint(1)  NOT NULL DEFAULT '0',
  samedi_no_projet smallint(5) NOT NULL DEFAULT '-1',
  samedi_dejeuner tinyint(1)  NOT NULL DEFAULT '0',
  samedi_diner tinyint(1)  NOT NULL DEFAULT '0',
  samedi_souper tinyint(1)  NOT NULL DEFAULT '0',
  commentaires varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  NOT NULL DEFAULT '0',
  no_approbation smallint(5)  NOT NULL DEFAULT '0',
  no_demande smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_allocation_repas_approbation
--

DROP TABLE IF EXISTS general_employe_allocation_repas_approbation;

CREATE TABLE general_employe_allocation_repas_approbation (
  no_approbation smallint(5)  NOT NULL DEFAULT '0',
  allocation_dejeuner decimal(5)  NOT NULL DEFAULT '0.00',
  allocation_diner decimal(5)  NOT NULL DEFAULT '0.00',
  allocation_souper decimal(5)  NOT NULL DEFAULT '0.00',
  total_dejeuner decimal(6)  NOT NULL DEFAULT '0.00',
  total_diner decimal(6)  NOT NULL DEFAULT '0.00',
  total_souper decimal(6)  NOT NULL DEFAULT '0.00',
  sous_total decimal(7)  NOT NULL DEFAULT '0.00',
  tps_taux decimal(5)  NOT NULL DEFAULT '0.0000',
  tps_total decimal(6)  NOT NULL DEFAULT '0.00',
  tvq_taux decimal(5)  NOT NULL DEFAULT '0.0000',
  tvq_total decimal(6)  NOT NULL DEFAULT '0.0000',
  total decimal(7)  NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_avantage
--

DROP TABLE IF EXISTS general_employe_avantage;

CREATE TABLE general_employe_avantage (
  no_avantage tinyint(3)  NOT NULL ,
  description varchar(30) DEFAULT NULL,
  montant decimal(6)  NOT NULL DEFAULT '0.00',
  G varchar(5) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_employe_avantage_employe
--

DROP TABLE IF EXISTS general_employe_avantage_employe;

CREATE TABLE general_employe_avantage_employe (
  no_employe smallint(6)  NOT NULL DEFAULT '0',
  no_avantage tinyint(3)  NOT NULL DEFAULT '0'
) ;

--
-- Table structure for table general_employe_avantage_historique
--

DROP TABLE IF EXISTS general_employe_avantage_historique;

CREATE TABLE general_employe_avantage_historique (
  Id int(11) NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  no_avantage tinyint(3)  DEFAULT NULL,
  paye_montant decimal(6)  NOT NULL DEFAULT '0.00',
  paye_quand date DEFAULT NULL,
  paye_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_banque_maladie
--

DROP TABLE IF EXISTS general_employe_banque_maladie;

CREATE TABLE general_employe_banque_maladie (
  Id int(11) NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  annee smallint(5)  NOT NULL DEFAULT '0',
  semaine smallint(5)  NOT NULL DEFAULT '0',
  temps mediumint(9) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_banque_temps
--

DROP TABLE IF EXISTS general_employe_banque_temps;

CREATE TABLE general_employe_banque_temps (
  Id int(11) NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  annee smallint(6)  DEFAULT NULL,
  semaine smallint(5) DEFAULT NULL,
  temps mediumint(9) DEFAULT NULL,
  regulier smallint(5) NOT NULL DEFAULT '0',
  surtemps smallint(5) NOT NULL DEFAULT '0',
  note varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_banque_vacance
--

DROP TABLE IF EXISTS general_employe_banque_vacance;

CREATE TABLE general_employe_banque_vacance (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  annee smallint(5)  DEFAULT NULL,
  semaine tinyint(3)  DEFAULT NULL,
  montant decimal(8) DEFAULT NULL,
  solde_cumule decimal(8)  NOT NULL DEFAULT '0.00',
  solde decimal(8)  DEFAULT NULL,
  note varchar(75) DEFAULT NULL,
  feuille_temps tinyint(3)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_competence
--

DROP TABLE IF EXISTS general_employe_competence;

CREATE TABLE general_employe_competence (
  no_competence smallint(6) NOT NULL DEFAULT '0',
  no_employe smallint(6) DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '1',
  description varchar(255) DEFAULT NULL,
  formateur varchar(50) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  date_rappel date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_employe_competence_type
--

DROP TABLE IF EXISTS general_employe_competence_type;

CREATE TABLE general_employe_competence_type (
  no_type tinyint(3)  NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  description varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_deduction
--

DROP TABLE IF EXISTS general_employe_deduction;

CREATE TABLE general_employe_deduction (
  no_deduction smallint(6) NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  no_employe smallint(5)  DEFAULT NULL,
  valeur1 varchar(30) DEFAULT NULL,
  valeur2 varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_deduction_type
--

DROP TABLE IF EXISTS general_employe_deduction_type;

CREATE TABLE general_employe_deduction_type (
  no_type tinyint(3)  NOT NULL ,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_departement
--

DROP TABLE IF EXISTS general_employe_departement;

CREATE TABLE general_employe_departement (
  Id smallint(6)  NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_disponibilite_etat
--

DROP TABLE IF EXISTS general_employe_disponibilite_etat;

CREATE TABLE general_employe_disponibilite_etat (
  no_etat tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  image varchar(30) DEFAULT NULL,
  fond char(7) DEFAULT NULL,
  texte char(7) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_division
--

DROP TABLE IF EXISTS general_employe_division;

CREATE TABLE general_employe_division (
  no_division smallint(6) NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_etat
--

DROP TABLE IF EXISTS general_employe_etat;

CREATE TABLE general_employe_etat (
  no_etat tinyint(3)  NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  actif tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_etat_historique
--

DROP TABLE IF EXISTS general_employe_etat_historique;

CREATE TABLE general_employe_etat_historique (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  no_etat tinyint(3)  DEFAULT NULL,
  date date DEFAULT NULL,
  note text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_historique
--

DROP TABLE IF EXISTS general_employe_historique;

CREATE TABLE general_employe_historique (
  Id int(11) NOT NULL ,
  no_employe smallint(6)  NOT NULL DEFAULT '0',
  champ varchar(100) DEFAULT NULL,
  valeur_avant varchar(255) DEFAULT NULL,
  valeur_apres varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_materiel
--

DROP TABLE IF EXISTS general_employe_materiel;

CREATE TABLE general_employe_materiel (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  no_materiel smallint(5)  DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  date_pret date DEFAULT NULL,
  date_retour date DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL) ;

--
-- Table structure for table general_employe_note
--

DROP TABLE IF EXISTS general_employe_note;

CREATE TABLE general_employe_note (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  DEFAULT NULL,
  date date DEFAULT NULL,
  note text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_employe_poste
--

DROP TABLE IF EXISTS general_employe_poste;

CREATE TABLE general_employe_poste (
  no_poste smallint(6)  NOT NULL ,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_poste_classe
--

DROP TABLE IF EXISTS general_employe_poste_classe;

CREATE TABLE general_employe_poste_classe (
  no_poste smallint(6)  NOT NULL DEFAULT '0',
  classe varchar(2) NOT NULL DEFAULT 'A',
  experience varchar(20) DEFAULT NULL,
  autres_criteres varchar(255) DEFAULT NULL
) ;

--
-- Table structure for table general_employe_prime
--

DROP TABLE IF EXISTS general_employe_prime;

CREATE TABLE general_employe_prime (
  no_prime tinyint(3)  NOT NULL ,
  description varchar(30) DEFAULT NULL,
  montant decimal(5)  NOT NULL DEFAULT '0.00',
  G varchar(5) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_employe_prime_employe
--

DROP TABLE IF EXISTS general_employe_prime_employe;

CREATE TABLE general_employe_prime_employe (
  no_employe smallint(5)  NOT NULL DEFAULT '0',
  no_prime tinyint(3)  NOT NULL DEFAULT '0'
) ;

--
-- Table structure for table general_employe_service
--

DROP TABLE IF EXISTS general_employe_service;

CREATE TABLE general_employe_service (
  no_service smallint(5) NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_statut
--

DROP TABLE IF EXISTS general_employe_statut;

CREATE TABLE general_employe_statut (
  no_statut tinyint(3)  NOT NULL ,
  nom varchar(25) DEFAULT NULL)  ;

--
-- Table structure for table general_employe_statut_employe
--

DROP TABLE IF EXISTS general_employe_statut_employe;

CREATE TABLE general_employe_statut_employe (
  no_employe smallint(6)  NOT NULL ,
  no_statut tinyint(3)  NOT NULL DEFAULT '0'
)  ;

--
-- Table structure for table general_employe_vacance
--

DROP TABLE IF EXISTS general_employe_vacance;

CREATE TABLE general_employe_vacance (
  Id int(11) NOT NULL ,
  no_demande smallint(6)  DEFAULT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '1',
  parental tinyint(1)  NOT NULL DEFAULT '0',
  commentaires text,
  no_departement_bak smallint(4)  DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  refusee_quand datetime DEFAULT NULL,
  refusee_qui smallint(5)  NOT NULL DEFAULT '0',
  refusee_commentaires text,
  approuvee_quand datetime DEFAULT NULL,
  approuvee_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_employe_vacance_type
--

DROP TABLE IF EXISTS general_employe_vacance_type;

CREATE TABLE general_employe_vacance_type (
  no_type tinyint(3)  NOT NULL ,
  nom varchar(30) DEFAULT NULL,
  couleur varchar(7) DEFAULT NULL,
  actif tinyint(1) NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_fonction
--

DROP TABLE IF EXISTS general_fonction;

CREATE TABLE general_fonction (
  Id smallint(6)  NOT NULL ,
  no_fonction smallint(6)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  nom_en varchar(30) DEFAULT NULL,
  groupe varchar(20) DEFAULT NULL,
  taux_horaire float(5) NOT NULL DEFAULT '0.00',
  frais_fixe float(4) NOT NULL DEFAULT '0.00',
  profit float(4) NOT NULL DEFAULT '0.00',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  module_soumission tinyint(1) NOT NULL DEFAULT '0',
  module_vente tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_formulaire
--

DROP TABLE IF EXISTS general_formulaire;

CREATE TABLE general_formulaire (
  Id smallint(6)  NOT NULL ,
  no_formulaire smallint(6)  DEFAULT NULL,
  code varchar(20) DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  note text,
  nbr_champs tinyint(3)  NOT NULL DEFAULT '0',
  version smallint(4)  NOT NULL DEFAULT '1',
  version_header tinyint(3)  NOT NULL DEFAULT '2',
  version_footer tinyint(3)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_fourniture
--

DROP TABLE IF EXISTS general_fourniture;

CREATE TABLE general_fourniture (
  no_fourniture smallint(6)  NOT NULL DEFAULT '0',
  nom varchar(50) DEFAULT NULL,
  actif tinyint(3)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table general_fourniture_consommation
--

DROP TABLE IF EXISTS general_fourniture_consommation;

CREATE TABLE general_fourniture_consommation (
  Id int(11) NOT NULL ,
  no_fourniture tinyint(3)  DEFAULT NULL,
  no_employe smallint(6) NOT NULL DEFAULT '0',
  no_departement smallint(5)  NOT NULL DEFAULT '0',
  quantite smallint(5) DEFAULT NULL,
  date date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_ingenieur
--

DROP TABLE IF EXISTS general_ingenieur;

CREATE TABLE general_ingenieur (
  Id smallint(6)  NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  assemblage tinyint(1)  NOT NULL DEFAULT '0',
  conception tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_ios_device
--

DROP TABLE IF EXISTS general_ios_device;

CREATE TABLE general_ios_device (
  id int(11) NOT NULL ,
  no_employe smallint(6) NOT NULL,
  token varchar(90) NOT NULL,
  last_registration timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  app_no smallint(2)  NOT NULL)  ;

--
-- Table structure for table general_ios_device_msg
--

DROP TABLE IF EXISTS general_ios_device_msg;

CREATE TABLE general_ios_device_msg (
  id int(10)  NOT NULL ,
  no_employe smallint(6)  NOT NULL,
  message varchar(225) NOT NULL,
  msg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  pushed smallint(1) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_licence
--

DROP TABLE IF EXISTS general_licence;

CREATE TABLE general_licence (
  no_licence mediumint(9)  NOT NULL ,
  no_parent mediumint(9)  NOT NULL DEFAULT '0',
  description text,
  prix decimal(10)  NOT NULL DEFAULT '0.00',
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  date_rappel date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1',
  supprimer tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_licence_fichier
--

DROP TABLE IF EXISTS general_licence_fichier;

CREATE TABLE general_licence_fichier (
  Id int(11) NOT NULL ,
  no_licence mediumint(8)  DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_location
--

DROP TABLE IF EXISTS general_location;

CREATE TABLE general_location (
  Id smallint(6)  NOT NULL ,
  no_location tinyint(3)  DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  tarif_heure decimal(8) DEFAULT NULL,
  tarif_jour decimal(8) DEFAULT NULL,
  tarif_semaine decimal(8) DEFAULT NULL,
  tarif_mois decimal(8) DEFAULT NULL,
  cout_transport decimal(8) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_materiel
--

DROP TABLE IF EXISTS general_materiel;

CREATE TABLE general_materiel (
  no_materiel smallint(6) NOT NULL DEFAULT '0',
  nom varchar(100) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_message
--

DROP TABLE IF EXISTS general_message;

CREATE TABLE general_message (
  Id int(11)  NOT NULL ,
  no_message int(11)  DEFAULT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  message text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_message_archive
--

DROP TABLE IF EXISTS general_message_archive;

CREATE TABLE general_message_archive (
  Id int(11)  NOT NULL ,
  no_message int(11)  DEFAULT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  message text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  archive_quand datetime DEFAULT NULL)  ;

--
-- Table structure for table general_no_auto
--

DROP TABLE IF EXISTS general_no_auto;

CREATE TABLE general_no_auto (
  ID int(11) NOT NULL ,
  objet varchar(50) DEFAULT NULL,
  numero mediumint(8)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table general_politique_interne
--

DROP TABLE IF EXISTS general_politique_interne;

CREATE TABLE general_politique_interne (
  no_politique smallint(6)  NOT NULL DEFAULT '0',
  numero varchar(10) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  fichier varchar(20) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table general_punch
--

DROP TABLE IF EXISTS general_punch;

CREATE TABLE general_punch (
  Id int(11) NOT NULL ,
  no_employe smallint(5)  NOT NULL DEFAULT '0',
  code varchar(2) DEFAULT NULL,
  no_item smallint(6)  DEFAULT NULL,
  activite_reference varchar(10) DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  no_departement_employe smallint(6)  NOT NULL DEFAULT '0',
  no_fonction_employe smallint(5)  NOT NULL DEFAULT '0',
  no_tache smallint(6)  NOT NULL DEFAULT '0',
  tache varchar(30) DEFAULT NULL,
  debut datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  taux_horaire float(4) NOT NULL DEFAULT '0.00',
  frais_fixe float(4) NOT NULL DEFAULT '0.00',
  profit float(4) NOT NULL DEFAULT '0.00',
  taux_horaire_total decimal(5)  NOT NULL DEFAULT '0.00',
  taux_horaire_fonction decimal(5)  NOT NULL DEFAULT '0.00',
  commentaires text,
  modifie tinyint(1)  NOT NULL DEFAULT '0',
  lock tinyint(1)  NOT NULL DEFAULT '0',
  approuve tinyint(1) NOT NULL DEFAULT '0',
  conge tinyint(1)  NOT NULL DEFAULT '0',
  ajustement tinyint(1)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  compagnonnage tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_punch_approbateur
--

DROP TABLE IF EXISTS general_punch_approbateur;

CREATE TABLE general_punch_approbateur (
  Id smallint(6)  NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  no_approbateur smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_punch_fermeture
--

DROP TABLE IF EXISTS general_punch_fermeture;

CREATE TABLE general_punch_fermeture (
  Id mediumint(9)  NOT NULL ,
  no_employe smallint(6)  DEFAULT NULL,
  annee smallint(6)  DEFAULT NULL,
  semaine tinyint(3)  DEFAULT NULL,
  taux_horaire float(4) NOT NULL DEFAULT '0.00',
  no_departement smallint(6)  NOT NULL DEFAULT '0',
  a smallint(6) NOT NULL DEFAULT '0',
  a1 smallint(6) NOT NULL DEFAULT '0',
  b smallint(6) NOT NULL DEFAULT '0',
  b1 smallint(6) NOT NULL DEFAULT '0',
  c smallint(6)  NOT NULL DEFAULT '0',
  d smallint(5) NOT NULL DEFAULT '0',
  d_avant smallint(6) NOT NULL DEFAULT '0',
  banque smallint(6) NOT NULL DEFAULT '0',
  banque_regulier smallint(6) NOT NULL DEFAULT '0',
  banque_surtemps smallint(6) NOT NULL DEFAULT '0',
  banque_avant mediumint(9) NOT NULL DEFAULT '0',
  vacance_pourcentage tinyint(3)  NOT NULL DEFAULT '0',
  vacance decimal(8)  NOT NULL DEFAULT '0.00',
  vacance_avant decimal(8)  NOT NULL DEFAULT '0.00',
  vacance_ref_annee smallint(6)  NOT NULL DEFAULT '0',
  vacance_ref_semaine tinyint(3)  NOT NULL DEFAULT '0',
  surtemps_type char(1) NOT NULL DEFAULT 's',
  surtemps_facteur decimal(3) NOT NULL DEFAULT '1.50',
  surtemps_commentaire varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  approuvee_quand datetime DEFAULT NULL,
  approuvee_qui smallint(6)  DEFAULT NULL,
  commentaires text,
  version tinyint(1)  NOT NULL DEFAULT '3')  ;

--
-- Table structure for table general_punch_historique
--

DROP TABLE IF EXISTS general_punch_historique;

CREATE TABLE general_punch_historique (
  Id int(11) NOT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  code varchar(2) DEFAULT NULL,
  no_item smallint(6)  DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  no_tache smallint(6)  NOT NULL DEFAULT '0',
  tache varchar(30) DEFAULT NULL,
  debut datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  taux_horaire float(4) NOT NULL DEFAULT '0.00',
  commentaires text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table general_punch_usine
--

DROP TABLE IF EXISTS general_punch_usine;

CREATE TABLE general_punch_usine (
  Id int(11)  NOT NULL ,
  no_punch mediumint(9) DEFAULT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  debut datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL,
  a_approuver tinyint(1)  NOT NULL DEFAULT '0',
  approbation_commentaires varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table general_punch_usine_activite
--

DROP TABLE IF EXISTS general_punch_usine_activite;

CREATE TABLE general_punch_usine_activite (
  Id int(11) NOT NULL ,
  no_punch mediumint(9) DEFAULT NULL,
  no_employe smallint(6)  DEFAULT NULL,
  code varchar(2) DEFAULT NULL,
  no_item smallint(6)  DEFAULT NULL,
  no_tache smallint(5) NOT NULL DEFAULT '401',
  debut datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  modifie tinyint(1)  NOT NULL DEFAULT '0',
  commentaires varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_requisition_informatique
--

DROP TABLE IF EXISTS general_requisition_informatique;

CREATE TABLE general_requisition_informatique (
  Id int(11) NOT NULL ,
  no_ri smallint(6)  DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  description text,
  fichier_1 varchar(20) DEFAULT NULL,
  fichier_2 varchar(20) DEFAULT NULL,
  fichier_3 varchar(20) DEFAULT NULL,
  importance smallint(5)  NOT NULL DEFAULT '10',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  archive tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_requisition_informatique_type
--

DROP TABLE IF EXISTS general_requisition_informatique_type;

CREATE TABLE general_requisition_informatique_type (
  Id tinyint(3) NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table general_salle_conference
--

DROP TABLE IF EXISTS general_salle_conference;

CREATE TABLE general_salle_conference (
  no_salle tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(75) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table general_salle_conference_reservation
--

DROP TABLE IF EXISTS general_salle_conference_reservation;

CREATE TABLE general_salle_conference_reservation (
  Id int(11) NOT NULL ,
  debut datetime DEFAULT NULL,
  fin datetime DEFAULT NULL,
  no_salle tinyint(3)  DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_semaine
--

DROP TABLE IF EXISTS general_semaine;

CREATE TABLE general_semaine (
  Id int(11) NOT NULL ,
  no_semaine smallint(6) DEFAULT NULL,
  semaine_mysql tinyint(3)  DEFAULT NULL,
  semaine_php tinyint(3)  DEFAULT NULL,
  premier_jour date DEFAULT NULL,
  annee smallint(6) DEFAULT NULL,
  date_debut datetime DEFAULT NULL,
  date_fin datetime DEFAULT NULL)  ;

--
-- Table structure for table general_sondage
--

DROP TABLE IF EXISTS general_sondage;

CREATE TABLE general_sondage (
  no_sondage smallint(6) NOT NULL ,
  nom varchar(100) DEFAULT NULL,
  type varchar(20) NOT NULL DEFAULT 'quotidien',
  actif tinyint(3)  NOT NULL DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table general_sondage_details
--

DROP TABLE IF EXISTS general_sondage_details;

CREATE TABLE general_sondage_details (
  Id int(11) NOT NULL ,
  no_sondage smallint(6)  DEFAULT NULL,
  no_question smallint(6)  DEFAULT NULL,
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_sondage_employe
--

DROP TABLE IF EXISTS general_sondage_employe;

CREATE TABLE general_sondage_employe (
  Id int(11) NOT NULL ,
  no_sondage smallint(6)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  DEFAULT NULL,
  date date DEFAULT NULL,
  sondage_quand datetime DEFAULT NULL) ;

--
-- Table structure for table general_sondage_reponse
--

DROP TABLE IF EXISTS general_sondage_reponse;

CREATE TABLE general_sondage_reponse (
  Id int(11) NOT NULL ,
  no_question smallint(5)  DEFAULT NULL,
  reponse varchar(255) DEFAULT '')  ;

--
-- Table structure for table general_soudage_question
--

DROP TABLE IF EXISTS general_soudage_question;

CREATE TABLE general_soudage_question (
  no_question smallint(6) NOT NULL ,
  description text,
  type varchar(10) NOT NULL DEFAULT 'oui_non')  ;

--
-- Table structure for table general_tache
--

DROP TABLE IF EXISTS general_tache;

CREATE TABLE general_tache (
  no_tache tinyint(3)  NOT NULL ,
  nom varchar(40) DEFAULT '')  ;

--
-- Table structure for table general_type_communication
--

DROP TABLE IF EXISTS general_type_communication;

CREATE TABLE general_type_communication (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  image varchar(30) DEFAULT NULL,
  e_s tinyint(1) NOT NULL DEFAULT '0',
  e_r tinyint(1)  NOT NULL DEFAULT '0',
  r_s tinyint(1)  NOT NULL DEFAULT '0',
  r_r tinyint(1)  NOT NULL DEFAULT '0',
  ra tinyint(1)  NOT NULL DEFAULT '0',
  ed tinyint(1)  NOT NULL DEFAULT '0',
  achat tinyint(1)  NOT NULL DEFAULT '1',
  vente tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table general_unite_mesure
--

DROP TABLE IF EXISTS general_unite_mesure;

CREATE TABLE general_unite_mesure (
  Id smallint(6) NOT NULL ,
  no_unite tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table intranet_message_rh
--

DROP TABLE IF EXISTS intranet_message_rh;

CREATE TABLE intranet_message_rh (
  Id int(11) NOT NULL ,
  ordinateur varchar(50) DEFAULT NULL,
  ip varchar(20) DEFAULT NULL,
  message text,
  date datetime DEFAULT NULL)  ;

--
-- Table structure for table materiel
--

DROP TABLE IF EXISTS materiel;

CREATE TABLE materiel (
  Id smallint(5)  NOT NULL ,
  pos smallint(6)  DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  Prp varchar(15) DEFAULT NULL,
  Dsg varchar(20) DEFAULT NULL,
  Dsg_i varchar(20) DEFAULT NULL,
  Ds_i varchar(20) DEFAULT NULL,
  A varchar(10) DEFAULT NULL,
  Avl varchar(10) DEFAULT NULL,
  B varchar(10) DEFAULT NULL,
  B_i varchar(10) DEFAULT NULL,
  B1 varchar(10) DEFAULT NULL,
  B1_i varchar(10) DEFAULT NULL,
  B2 varchar(10) DEFAULT NULL,
  B2_i varchar(10) DEFAULT NULL,
  BetX varchar(10) DEFAULT NULL,
  BT varchar(10) DEFAULT NULL,
  BT1 varchar(10) DEFAULT NULL,
  BT2 varchar(10) DEFAULT NULL,
  C varchar(10) DEFAULT NULL,
  Crt varchar(10) DEFAULT NULL,
  Cw varchar(10) DEFAULT NULL,
  D varchar(10) DEFAULT NULL,
  D_i varchar(10) DEFAULT NULL,
  Dn_i varchar(10) DEFAULT NULL,
  Dnom varchar(10) DEFAULT NULL,
  DT varchar(10) DEFAULT NULL,
  Grp varchar(10) DEFAULT NULL,
  HW varchar(10) DEFAULT NULL,
  Ix varchar(10) DEFAULT NULL,
  Ixy varchar(10) DEFAULT NULL,
  Iy varchar(10) DEFAULT NULL,
  J varchar(10) DEFAULT NULL,
  K varchar(10) DEFAULT NULL,
  K1 varchar(10) DEFAULT NULL,
  Mass varchar(10) DEFAULT NULL,
  Omeg varchar(10) DEFAULT NULL,
  Qf varchar(10) DEFAULT NULL,
  Qw varchar(10) DEFAULT NULL,
  RI varchar(10) DEFAULT NULL,
  RO varchar(10) DEFAULT NULL,
  Rmin varchar(10) DEFAULT NULL,
  Rmax varchar(10) DEFAULT NULL,
  Rop varchar(10) DEFAULT NULL,
  Rx varchar(10) DEFAULT NULL,
  Rxp varchar(10) DEFAULT NULL,
  Ry varchar(10) DEFAULT NULL,
  Ry0 varchar(10) DEFAULT NULL,
  Ry8 varchar(10) DEFAULT NULL,
  Ry12 varchar(10) DEFAULT NULL,
  Ry16 varchar(10) DEFAULT NULL,
  Ry20 varchar(10) DEFAULT NULL,
  Ryp varchar(10) DEFAULT NULL,
  SA varchar(10) DEFAULT NULL,
  SA_i varchar(10) DEFAULT NULL,
  Shp varchar(10) DEFAULT NULL,
  Slp varchar(10) DEFAULT NULL,
  Sw varchar(10) DEFAULT NULL,
  Sx varchar(10) DEFAULT NULL,
  Sx1 varchar(10) DEFAULT NULL,
  Sx2 varchar(10) DEFAULT NULL,
  Sy varchar(10) DEFAULT NULL,
  T varchar(10) DEFAULT NULL,
  T_i varchar(10) DEFAULT NULL,
  T_2 varchar(10) DEFAULT NULL,
  T_2_i varchar(10) DEFAULT NULL,
  T1 varchar(10) DEFAULT NULL,
  T2 varchar(10) DEFAULT NULL,
  TanA varchar(10) DEFAULT NULL,
  Tdes varchar(10) DEFAULT NULL,
  Use varchar(10) DEFAULT NULL,
  W varchar(10) DEFAULT NULL,
  W_i varchar(10) DEFAULT NULL,
  Wn varchar(10) DEFAULT NULL,
  Wt_i varchar(10) DEFAULT NULL,
  X varchar(10) DEFAULT NULL,
  Xo varchar(10) DEFAULT NULL,
  Xop varchar(10) DEFAULT NULL,
  Y varchar(10) DEFAULT NULL,
  Yo varchar(10) DEFAULT NULL,
  Yop varchar(10) DEFAULT NULL,
  Yt varchar(10) DEFAULT NULL,
  Zx varchar(10) DEFAULT NULL,
  Zy varchar(10) DEFAULT NULL,
  cout_unitaire varchar(10) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table materiel_assemblage_piece
--

DROP TABLE IF EXISTS materiel_assemblage_piece;

CREATE TABLE materiel_assemblage_piece (
  Id tinyint(3) NOT NULL ,
  no_item tinyint(3)  DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  perte varchar(30) DEFAULT NULL,
  note text,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table materiel_assemblage_piece_acier
--

DROP TABLE IF EXISTS materiel_assemblage_piece_acier;

CREATE TABLE materiel_assemblage_piece_acier (
  Id smallint(6)  NOT NULL ,
  no_item tinyint(3)  DEFAULT NULL,
  fabtrol_pkey mediumint(8)  DEFAULT NULL,
  mId mediumint(9)  NOT NULL DEFAULT '0',
  type varchar(3) DEFAULT NULL,
  description varchar(20) DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL,
  largeur varchar(10) DEFAULT NULL,
  longueur varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table materiel_assemblage_piece_divers
--

DROP TABLE IF EXISTS materiel_assemblage_piece_divers;

CREATE TABLE materiel_assemblage_piece_divers (
  Id smallint(6)  NOT NULL ,
  no_item tinyint(3)  DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  couts float(7) NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL) ;

--
-- Table structure for table materiel_assemblage_piece_fourniture
--

DROP TABLE IF EXISTS materiel_assemblage_piece_fourniture;

CREATE TABLE materiel_assemblage_piece_fourniture (
  Id smallint(6)  NOT NULL ,
  no_item tinyint(3)  DEFAULT NULL,
  fabtrol_pkey mediumint(8)  DEFAULT NULL,
  mId smallint(6)  NOT NULL DEFAULT '0',
  type varchar(3) DEFAULT NULL,
  description varchar(20) DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_assemblage_piece_item
--

DROP TABLE IF EXISTS materiel_assemblage_piece_item;

CREATE TABLE materiel_assemblage_piece_item (
  Id smallint(6)  NOT NULL ,
  no_item smallint(5)  DEFAULT NULL,
  no_reference smallint(5)  DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_assemblage_piece_operation
--

DROP TABLE IF EXISTS materiel_assemblage_piece_operation;

CREATE TABLE materiel_assemblage_piece_operation (
  Id smallint(6)  NOT NULL ,
  no_item tinyint(3)  DEFAULT NULL,
  no_operation tinyint(3)  DEFAULT NULL,
  temps varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table materiel_historique
--

DROP TABLE IF EXISTS materiel_historique;

CREATE TABLE materiel_historique (
  Id int(11) NOT NULL ,
  materielId smallint(5)  DEFAULT NULL,
  champ varchar(20) DEFAULT NULL,
  valeur_avant varchar(20) DEFAULT NULL,
  valeur_apres varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_item
--

DROP TABLE IF EXISTS materiel_item;

CREATE TABLE materiel_item (
  Id int(11) NOT NULL ,
  type varchar(5) DEFAULT NULL,
  description_m varchar(20) DEFAULT NULL,
  description_i varchar(20) DEFAULT NULL,
  diametre varchar(10) DEFAULT NULL,
  diametre_m varchar(10) DEFAULT NULL,
  diametre_i varchar(10) DEFAULT NULL,
  longueur_m varchar(10) DEFAULT NULL,
  longueur_i varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table materiel_longueur
--

DROP TABLE IF EXISTS materiel_longueur;

CREATE TABLE materiel_longueur (
  Id int(11) NOT NULL ,
  type varchar(3) DEFAULT NULL,
  longueur_m varchar(4) DEFAULT NULL,
  longueur_i varchar(4) DEFAULT NULL)  ;

--
-- Table structure for table materiel_norme_nuance
--

DROP TABLE IF EXISTS materiel_norme_nuance;

CREATE TABLE materiel_norme_nuance (
  Id int(11) NOT NULL ,
  type varchar(3) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  grade_fabtrol varchar(20) DEFAULT NULL,
  norme varchar(75) DEFAULT NULL,
  nuance_m varchar(75) DEFAULT NULL,
  description_m varchar(20) DEFAULT NULL,
  nuance_i varchar(75) DEFAULT NULL,
  description_i varchar(20) DEFAULT NULL,
  fusible tinyint(1)  NOT NULL DEFAULT '0',
  FY smallint(4)  DEFAULT NULL,
  FU smallint(5)  DEFAULT NULL,
  RYFY smallint(5)  DEFAULT NULL,
  RTFU float(5)  DEFAULT NULL
)  ;

--
-- Table structure for table materiel_norme_nuance_bak
--

DROP TABLE IF EXISTS materiel_norme_nuance_bak;

CREATE TABLE materiel_norme_nuance_bak (
  Id int(11) NOT NULL ,
  type varchar(3) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  grade_fabtrol varchar(20) DEFAULT NULL,
  norme varchar(75) DEFAULT NULL,
  nuance_m varchar(75) DEFAULT NULL,
  nuance_i varchar(75) DEFAULT NULL,
  fusible tinyint(1)  NOT NULL DEFAULT '0',
  FY smallint(4)  DEFAULT NULL,
  FU smallint(5)  DEFAULT NULL,
  RYFY smallint(5)  DEFAULT NULL,
  RTFU float(5)  DEFAULT NULL
)  ;

--
-- Table structure for table materiel_operation
--

DROP TABLE IF EXISTS materiel_operation;

CREATE TABLE materiel_operation (
  Id tinyint(3)  NOT NULL ,
  no_operation tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table materiel_poutrelle
--

DROP TABLE IF EXISTS materiel_poutrelle;

CREATE TABLE materiel_poutrelle (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  image varchar(75) DEFAULT NULL)  ;

--
-- Table structure for table materiel_prix
--

DROP TABLE IF EXISTS materiel_prix;

CREATE TABLE materiel_prix (
  Id int(11) NOT NULL ,
  type varchar(3) DEFAULT NULL,
  description varchar(20) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  prix float(8)  NOT NULL DEFAULT '0.0000',
  prix_date date DEFAULT NULL,
  prix_reference varchar(30) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_prix_historique
--

DROP TABLE IF EXISTS materiel_prix_historique;

CREATE TABLE materiel_prix_historique (
  Id int(11) NOT NULL ,
  type varchar(3) DEFAULT NULL,
  description varchar(20) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  prix float(8)  NOT NULL DEFAULT '0.0000',
  prix_date date DEFAULT NULL,
  prix_reference varchar(30) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_standard
--

DROP TABLE IF EXISTS materiel_standard;

CREATE TABLE materiel_standard (
  Id int(11) NOT NULL ,
  marque_piece varchar(10) DEFAULT NULL,
  groupe varchar(10) DEFAULT NULL,
  parent varchar(10) DEFAULT NULL,
  pdf varchar(20) DEFAULT NULL,
  nc1 varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table materiel_standard_transaction
--

DROP TABLE IF EXISTS materiel_standard_transaction;

CREATE TABLE materiel_standard_transaction (
  Id int(11) NOT NULL ,
  marque_piece varchar(10) DEFAULT NULL,
  quantite smallint(6) NOT NULL DEFAULT '0',
  reference varchar(20) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table materiel_tablier_metallique
--

DROP TABLE IF EXISTS materiel_tablier_metallique;

CREATE TABLE materiel_tablier_metallique (
  Id int(11) NOT NULL ,
  no_tablier smallint(4)  DEFAULT NULL,
  position varchar(10) DEFAULT NULL,
  produit varchar(75) DEFAULT NULL,
  profondeur_m varchar(10) DEFAULT NULL,
  profondeur_i varchar(10) DEFAULT NULL,
  calibre tinyint(3)  DEFAULT NULL,
  poids_m varchar(10) DEFAULT NULL,
  poids_i varchar(10) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table materiel_tablier_metallique_finition
--

DROP TABLE IF EXISTS materiel_tablier_metallique_finition;

CREATE TABLE materiel_tablier_metallique_finition (
  Id tinyint(3) NOT NULL ,
  no_finition tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table materiel_tablier_metallique_prix
--

DROP TABLE IF EXISTS materiel_tablier_metallique_prix;

CREATE TABLE materiel_tablier_metallique_prix (
  Id int(11) NOT NULL ,
  no_tablier smallint(5)  DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  prix_avec_poutrelles float(4)  NOT NULL DEFAULT '0.00',
  prix_sans_poutrelles float(4)  NOT NULL DEFAULT '0.00',
  prix_extra_surface float(4)  NOT NULL DEFAULT '0.00',
  prix_quand date DEFAULT NULL,
  prix_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table materiel_type
--

DROP TABLE IF EXISTS materiel_type;

CREATE TABLE materiel_type (
  Id tinyint(3)  NOT NULL ,
  type varchar(5) DEFAULT NULL,
  format varchar(15) DEFAULT NULL,
  unite varchar(10) DEFAULT NULL,
  standard tinyint(1)  NOT NULL DEFAULT '0',
  description varchar(50) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  longueur_1 smallint(6)  NOT NULL DEFAULT '0',
  longueur_2 smallint(6)  NOT NULL DEFAULT '0',
  longueur_3 smallint(6)  NOT NULL DEFAULT '0',
  longueur_4 smallint(6)  NOT NULL DEFAULT '0',
  longueur_5 smallint(6)  NOT NULL DEFAULT '0',
  longueur_6 smallint(6)  NOT NULL DEFAULT '0',
  longueur_7 smallint(6)  NOT NULL DEFAULT '0',
  longueur_8 smallint(6)  NOT NULL DEFAULT '0',
  longueur_9 smallint(6)  NOT NULL DEFAULT '0',
  longueur_10 smallint(6)  NOT NULL DEFAULT '0',
  garder_reste smallint(6)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  inventaire_poids int(10)  NOT NULL DEFAULT '0',
  inventaire_prix decimal(10)  NOT NULL DEFAULT '0.00',
  inventaire_perte tinyint(3) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table materiel_type_inventaire
--

DROP TABLE IF EXISTS materiel_type_inventaire;

CREATE TABLE materiel_type_inventaire (
  Id int(11) NOT NULL ,
  no_commande mediumint(9) DEFAULT NULL,
  activite_code varchar(3) DEFAULT NULL,
  activite_no smallint(6) DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  poids int(11) DEFAULT NULL,
  prix decimal(10) DEFAULT NULL)  ;

--
-- Table structure for table materiel_usage
--

DROP TABLE IF EXISTS materiel_usage;

CREATE TABLE materiel_usage (
  Id tinyint(3) NOT NULL ,
  code varchar(3) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  configuration text,
  sousMateriel tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table outil_fusible
--

DROP TABLE IF EXISTS outil_fusible;

CREATE TABLE outil_fusible (
  Id int(11) NOT NULL ,
  token varchar(13) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '4',
  CSA_S16_version char(2) NOT NULL DEFAULT '09',
  CSA_A23p3_version char(2) DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  code_hss varchar(10) DEFAULT NULL,
  code_w varchar(10) NOT NULL DEFAULT '345',
  code_contreventement_hss varchar(10) DEFAULT NULL,
  code_l varchar(10) DEFAULT NULL,
  code_poutre_hss varchar(10) DEFAULT NULL,
  code_poutre_w varchar(10) NOT NULL DEFAULT '345',
  unite char(1) NOT NULL DEFAULT 'i',
  IE float(3) NOT NULL DEFAULT '1.00',
  defaut_R0 varchar(5) NOT NULL DEFAULT '1.3',
  defaut_RD varchar(5) NOT NULL DEFAULT '4',
  defaut_K varchar(5) NOT NULL DEFAULT '0.9',
  defaut_LF varchar(5) NOT NULL DEFAULT '400',
  defaut_ancrage_projection varchar(5) NOT NULL DEFAULT '150',
  defaut_armature_F_prime varchar(5) NOT NULL DEFAULT '25',
  defaut_armature_recouvrement varchar(5) NOT NULL DEFAULT '50',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5) DEFAULT NULL,
  createur varchar(100) DEFAULT NULL,
  edition_qui smallint(5)  DEFAULT NULL,
  supprimee_quand datetime DEFAULT NULL,
  supprimee_qui smallint(6)  DEFAULT NULL,
  confirmee_quand datetime DEFAULT NULL,
  confirmee_qui smallint(6) DEFAULT NULL,
  transmis_quand datetime DEFAULT NULL,
  transmis_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_cv
--

DROP TABLE IF EXISTS outil_fusible_cv;

CREATE TABLE outil_fusible_cv (
  Id int(11) NOT NULL ,
  token varchar(13) DEFAULT NULL,
  no_cv tinyint(3)  DEFAULT NULL,
  identification varchar(25) DEFAULT NULL,
  description varchar(50) DEFAULT NULL,
  quantite tinyint(3) NOT NULL DEFAULT '1',
  no_base tinyint(3)  NOT NULL DEFAULT '0',
  axe_gauche_nom varchar(5) DEFAULT NULL,
  axe_gauche_type varchar(3) DEFAULT NULL,
  axe_gauche_description varchar(24) DEFAULT NULL,
  axe_gauche_sens char(1) NOT NULL DEFAULT 'd',
  axe_gauche_CD varchar(15) DEFAULT NULL,
  axe_gauche_epaisseur_grout varchar(5) DEFAULT '25.4',
  axe_gauche_quantite_ancrage tinyint(1)  NOT NULL DEFAULT '0',
  axe_gauche_no_ancrage tinyint(3)  NOT NULL DEFAULT '0',
  axe_gauche_longueur_ancrage varchar(4) DEFAULT NULL,
  axe_gauche_projection varchar(15) DEFAULT NULL,
  axe_gauche_L_cle varchar(15) DEFAULT NULL,
  axe_gauche_F_prime varchar(15) DEFAULT NULL,
  axe_gauche_quantite_armature varchar(5) DEFAULT NULL,
  axe_gauche_no_armature tinyint(3) NOT NULL DEFAULT '0',
  axe_gauche_recouvrement varchar(15) DEFAULT NULL,
  axe_gauche_S_max varchar(15) DEFAULT '50',
  axe_droite_nom varchar(5) DEFAULT NULL,
  axe_droite_type varchar(3) DEFAULT NULL,
  axe_droite_description varchar(24) DEFAULT NULL,
  axe_droite_sens char(1) NOT NULL DEFAULT 'd',
  axe_droite_CD varchar(15) DEFAULT NULL,
  axe_droite_epaisseur_grout varchar(5) DEFAULT '25.4',
  axe_droite_quantite_ancrage tinyint(1)  NOT NULL DEFAULT '0',
  axe_droite_no_ancrage tinyint(3)  NOT NULL DEFAULT '0',
  axe_droite_longueur_ancrage varchar(4) DEFAULT NULL,
  axe_droite_projection varchar(15) DEFAULT NULL,
  axe_droite_L_cle varchar(15) DEFAULT NULL,
  axe_droite_F_prime varchar(15) DEFAULT NULL,
  axe_droite_quantite_armature varchar(5) DEFAULT NULL,
  axe_droite_no_armature tinyint(3)  NOT NULL DEFAULT '0',
  axe_droite_recouvrement varchar(15) DEFAULT NULL,
  axe_droite_S_max varchar(15) DEFAULT '50',
  axe_largeur varchar(15) DEFAULT NULL,
  image1 varchar(12) DEFAULT NULL,
  image2 varchar(12) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_cv_niveau
--

DROP TABLE IF EXISTS outil_fusible_cv_niveau;

CREATE TABLE outil_fusible_cv_niveau (
  Id int(11) NOT NULL ,
  token varchar(13) DEFAULT NULL,
  no_cv tinyint(3)  DEFAULT NULL,
  no_niveau tinyint(3)  DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  RD varchar(5) DEFAULT NULL,
  R0 varchar(5) DEFAULT NULL,
  K varchar(5) DEFAULT NULL,
  girt tinyint(1)  NOT NULL DEFAULT '1',
  profile_type varchar(3) DEFAULT NULL,
  profile_description varchar(24) DEFAULT NULL,
  poutre_type varchar(3) DEFAULT NULL,
  poutre_description varchar(24) DEFAULT NULL,
  poutre_sens char(1) DEFAULT NULL,
  effort_CE varchar(15) DEFAULT NULL,
  effort_TE varchar(15) DEFAULT NULL,
  fusible tinyint(1)  NOT NULL DEFAULT '1',
  fusible_no_fusible smallint(6)  NOT NULL DEFAULT '0',
  fusible_numero varchar(10) DEFAULT NULL,
  fusible_version tinyint(2) NOT NULL DEFAULT '0',
  fusible_no_inventaire smallint(5)  NOT NULL DEFAULT '0',
  fusible_deplacement_ta varchar(15) DEFAULT NULL,
  fusible_deplacement_td varchar(15) DEFAULT NULL,
  fusible_BF varchar(5) DEFAULT NULL,
  fusible_LF varchar(5) DEFAULT NULL,
  fusible_D varchar(5) DEFAULT NULL,
  fusible_LW varchar(5) DEFAULT NULL,
  boite_no_boite smallint(6)  NOT NULL DEFAULT '0',
  boite_numero varchar(10) DEFAULT NULL,
  boite_A varchar(8) DEFAULT NULL,
  boite_B varchar(8) DEFAULT NULL,
  boite_C varchar(8) DEFAULT NULL,
  boite_T varchar(5) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_cv_niveau_type
--

DROP TABLE IF EXISTS outil_fusible_cv_niveau_type;

CREATE TABLE outil_fusible_cv_niveau_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  sigle char(1) DEFAULT NULL,
  image varchar(100) DEFAULT NULL,
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_inventaire
--

DROP TABLE IF EXISTS outil_fusible_inventaire;

CREATE TABLE outil_fusible_inventaire (
  Id int(11) NOT NULL ,
  no_inventaire smallint(6) DEFAULT NULL,
  no_parent smallint(5)  NOT NULL DEFAULT '0',
  quantite tinyint(3)  DEFAULT NULL,
  type varchar(3) NOT NULL DEFAULT 'PL',
  epaisseur varchar(5) DEFAULT NULL,
  largeur varchar(5) DEFAULT NULL,
  longueur varchar(5) DEFAULT NULL,
  FU varchar(10) DEFAULT NULL,
  FY varchar(10) DEFAULT NULL,
  EU varchar(5) DEFAULT NULL,
  ESH varchar(5) DEFAULT NULL,
  E varchar(6) NOT NULL DEFAULT '200000',
  no_mill_test varchar(20) DEFAULT NULL,
  disponible tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table outil_fusible_inventaire_test
--

DROP TABLE IF EXISTS outil_fusible_inventaire_test;

CREATE TABLE outil_fusible_inventaire_test (
  Id int(11) NOT NULL ,
  no_inventaire smallint(6)  DEFAULT NULL,
  epsylon varchar(30) DEFAULT NULL,
  sigma varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_lot_corniere
--

DROP TABLE IF EXISTS outil_fusible_lot_corniere;

CREATE TABLE outil_fusible_lot_corniere (
  Id int(11) NOT NULL ,
  no_lot smallint(5)  DEFAULT NULL,
  description varchar(20) DEFAULT NULL,
  bon_commande varchar(50) DEFAULT NULL,
  mill_test varchar(50) DEFAULT NULL,
  rapport_test_materiau varchar(50) DEFAULT NULL,
  disponible tinyint(1)  NOT NULL DEFAULT '1',
  FY smallint(4) DEFAULT NULL,
  FU smallint(4) DEFAULT NULL,
  ESH decimal(6,5) NOT NULL DEFAULT '0.00000',
  EU decimal(4,3)  NOT NULL DEFAULT '0.000',
  E mediumint(8)  NOT NULL DEFAULT '200000',
  C1 decimal(4) NOT NULL DEFAULT '0.00',
  C2 decimal(4) NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_lot_corniere_courbe
--

DROP TABLE IF EXISTS outil_fusible_lot_corniere_courbe;

CREATE TABLE outil_fusible_lot_corniere_courbe (
  Id int(11) NOT NULL ,
  no_lot smallint(5)  NOT NULL DEFAULT '1',
  epsylon varchar(30) DEFAULT NULL,
  sigma varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_lot_corniere_inventaire
--

DROP TABLE IF EXISTS outil_fusible_lot_corniere_inventaire;

CREATE TABLE outil_fusible_lot_corniere_inventaire (
  Id int(11) NOT NULL ,
  no_inevnatire int(11)  DEFAULT NULL,
  no_lot smallint(5)  DEFAULT NULL,
  longueur smallint(5)  DEFAULT NULL,
  reste smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_niveau
--

DROP TABLE IF EXISTS outil_fusible_niveau;

CREATE TABLE outil_fusible_niveau (
  Id int(11) NOT NULL ,
  token varchar(13) DEFAULT NULL,
  no_niveau tinyint(3) DEFAULT '0',
  nom varchar(15) DEFAULT NULL,
  elevation mediumint(8) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table outil_fusible_parametre_analyse
--

DROP TABLE IF EXISTS outil_fusible_parametre_analyse;

CREATE TABLE outil_fusible_parametre_analyse (
  Id int(11) NOT NULL ,
  token varchar(13) DEFAULT NULL,
  D varchar(5) DEFAULT NULL,
  operation1 char(1) DEFAULT NULL,
  L varchar(5) DEFAULT NULL,
  operation2 char(1) DEFAULT NULL,
  S varchar(5) DEFAULT NULL,
  operation3 char(1) DEFAULT NULL,
  E varchar(5) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_parametre_analyse_standard
--

DROP TABLE IF EXISTS outil_fusible_parametre_analyse_standard;

CREATE TABLE outil_fusible_parametre_analyse_standard (
  Id tinyint(3)  NOT NULL ,
  D varchar(5) DEFAULT NULL,
  operation1 char(1) DEFAULT NULL,
  L varchar(5) DEFAULT NULL,
  operation2 char(1) DEFAULT NULL,
  S varchar(5) DEFAULT NULL,
  operation3 char(1) DEFAULT NULL,
  E varchar(5) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_parametre_conception
--

DROP TABLE IF EXISTS outil_fusible_parametre_conception;

CREATE TABLE outil_fusible_parametre_conception (
  Id tinyint(3)  NOT NULL ,
  nom varchar(15) DEFAULT NULL,
  code varchar(30) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  valeur varchar(5) DEFAULT NULL,
  eval tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table outil_fusible_standard_ancrage
--

DROP TABLE IF EXISTS outil_fusible_standard_ancrage;

CREATE TABLE outil_fusible_standard_ancrage (
  Id tinyint(3) NOT NULL ,
  no_ancrage tinyint(3)  DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  diametre varchar(5) DEFAULT NULL,
  diametre_i varchar(5) DEFAULT NULL,
  longueur varchar(4) DEFAULT NULL,
  code varchar(6) DEFAULT NULL,
  norme varchar(30) DEFAULT NULL,
  VR varchar(7) DEFAULT NULL,
  TR varchar(7) DEFAULT NULL,
  FUB varchar(3) DEFAULT NULL,
  ABH_ECROU varchar(5) DEFAULT NULL,
  ABH_WASHER varchar(5) DEFAULT NULL)  ;

--
-- Table structure for table outil_fusible_type_armature
--

DROP TABLE IF EXISTS outil_fusible_type_armature;

CREATE TABLE outil_fusible_type_armature (
  Id tinyint(3) NOT NULL ,
  no_armature tinyint(3)  DEFAULT NULL,
  no_bar varchar(5) DEFAULT NULL,
  aire varchar(5) DEFAULT NULL,
  diametre varchar(5) DEFAULT NULL,
  FY varchar(3) DEFAULT NULL,
  FY_Ksi varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table production_equipement
--

DROP TABLE IF EXISTS production_equipement;

CREATE TABLE production_equipement (
  Id smallint(6)  NOT NULL ,
  no_equipement smallint(5)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  actif tinyint(3)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table production_equipement_inspection
--

DROP TABLE IF EXISTS production_equipement_inspection;

CREATE TABLE production_equipement_inspection (
  Id int(11) NOT NULL ,
  no_inspection smallint(6)  DEFAULT NULL,
  no_equipement tinyint(3)  DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  terminee_quand datetime DEFAULT NULL,
  terminee_qui smallint(5)  DEFAULT NULL,
  action_corrective_urgente tinyint(1)  NOT NULL DEFAULT '0',
  action_corrective_urgente_commentaires text)  ;

--
-- Table structure for table production_equipement_inspection_critere
--

DROP TABLE IF EXISTS production_equipement_inspection_critere;

CREATE TABLE production_equipement_inspection_critere (
  Id int(11) NOT NULL ,
  no_equipement smallint(5)  DEFAULT NULL,
  version tinyint(3) NOT NULL DEFAULT '1',
  no_critere tinyint(3)  DEFAULT NULL,
  categorie varchar(50) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  indicateur varchar(20) DEFAULT NULL,
  type varchar(20) NOT NULL DEFAULT 'RADIO',
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table production_equipement_inspection_details
--

DROP TABLE IF EXISTS production_equipement_inspection_details;

CREATE TABLE production_equipement_inspection_details (
  Id int(11) NOT NULL ,
  no_inspection smallint(5)  DEFAULT NULL,
  no_critere tinyint(3)  DEFAULT NULL,
  resultat1 varchar(30) DEFAULT NULL,
  resultat2 varchar(30) DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table production_finition
--

DROP TABLE IF EXISTS production_finition;

CREATE TABLE production_finition (
  Id tinyint(3) NOT NULL ,
  no_finition tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  code varchar(4) DEFAULT NULL)  ;

--
-- Table structure for table production_finition_preparation
--

DROP TABLE IF EXISTS production_finition_preparation;

CREATE TABLE production_finition_preparation (
  Id tinyint(3) NOT NULL ,
  code varchar(9) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table production_inventaire
--

DROP TABLE IF EXISTS production_inventaire;

CREATE TABLE production_inventaire (
  Id int(11) NOT NULL ,
  achat_code_activite varchar(3) NOT NULL DEFAULT 'p',
  achat_no_activite smallint(5)  NOT NULL DEFAULT '0',
  type varchar(5) DEFAULT NULL,
  description varchar(30) DEFAULT NULL,
  nuance varchar(10) DEFAULT NULL,
  longueur mediumint(8)  NOT NULL DEFAULT '0',
  prix_unitaire float(6) NOT NULL DEFAULT '0.0000',
  fournisseur varchar(30) DEFAULT NULL,
  no_stock varchar(15) DEFAULT NULL,
  no_commande mediumint(9)  NOT NULL DEFAULT '0',
  reception tinyint(1)  NOT NULL DEFAULT '0',
  no_inventaire smallint(5) NOT NULL DEFAULT '0',
  mill_test varchar(30) DEFAULT NULL,
  reservation_code_activite varchar(3) DEFAULT NULL,
  reservation_no_activite smallint(5)  NOT NULL DEFAULT '0',
  production_code_activite varchar(3) DEFAULT NULL,
  production_no_activite smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table production_lot
--

DROP TABLE IF EXISTS production_lot;

CREATE TABLE production_lot (
  Id int(11) NOT NULL ,
  activite_code varchar(5) DEFAULT NULL,
  activite_no smallint(6)  DEFAULT NULL,
  no_lot tinyint(3)  DEFAULT NULL,
  code_lot varchar(5) NOT NULL DEFAULT '0',
  numero_lot tinyint(3)  NOT NULL DEFAULT '1',
  description varchar(100) DEFAULT NULL,
  couleur_fond char(7) DEFAULT NULL,
  couleur_texte char(7) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table production_lot_achat
--

DROP TABLE IF EXISTS production_lot_achat;

CREATE TABLE production_lot_achat (
  Id int(11) NOT NULL ,
  no_lot smallint(6) DEFAULT NULL,
  activite_code varchar(3) DEFAULT NULL,
  activite_no smallint(6) DEFAULT NULL,
  description varchar(75) DEFAULT NULL,
  kiss tinyint(1)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table production_lot_standard
--

DROP TABLE IF EXISTS production_lot_standard;

CREATE TABLE production_lot_standard (
  Id tinyint(3)  NOT NULL ,
  code varchar(5) DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  fond char(7) NOT NULL DEFAULT '#FFFFFF',
  texte char(7) NOT NULL DEFAULT '#000000',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table production_nesting
--

DROP TABLE IF EXISTS production_nesting;

CREATE TABLE production_nesting (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_liste mediumint(9)  DEFAULT NULL,
  no_nesting smallint(5)  DEFAULT NULL,
  titre varchar(50) DEFAULT NULL,
  remarques varchar(255) DEFAULT NULL,
  no_poste tinyint(3)  NOT NULL DEFAULT '1',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  NOT NULL DEFAULT '10',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  tf char(6) DEFAULT NULL)  ;

--
-- Table structure for table production_nesting_bar
--

DROP TABLE IF EXISTS production_nesting_bar;

CREATE TABLE production_nesting_bar (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_liste mediumint(9)  NOT NULL DEFAULT '0',
  no_nesting smallint(5)  DEFAULT NULL,
  filenum mediumint(9) DEFAULT NULL,
  no_bar tinyint(3)  NOT NULL DEFAULT '1',
  quantite tinyint(3)  DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  description_m varchar(30) DEFAULT NULL,
  description_i varchar(30) DEFAULT NULL,
  description_cam varchar(30) DEFAULT NULL,
  nuance varchar(10) DEFAULT NULL,
  longueur mediumint(8)  NOT NULL DEFAULT '0',
  longueur_cam mediumint(9)  NOT NULL DEFAULT '0',
  prix_unitaire float(6) NOT NULL DEFAULT '0.0000',
  fournisseur varchar(30) DEFAULT NULL,
  no_inventaire varchar(15) DEFAULT NULL,
  reste mediumint(9) NOT NULL DEFAULT '0',
  reste_cam mediumint(9)  NOT NULL DEFAULT '0',
  fabtrol_ponumber varchar(30) DEFAULT NULL,
  fabtrol_orderkey smallint(4)  NOT NULL DEFAULT '0',
  winsteel_fait tinyint(1)  NOT NULL DEFAULT '0',
  hold tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table production_nesting_bar_unique
--

DROP TABLE IF EXISTS production_nesting_bar_unique;

CREATE TABLE production_nesting_bar_unique (
  Id int(11) NOT NULL ,
  no_projet smallint(6) DEFAULT NULL,
  no_liste mediumint(9) DEFAULT NULL,
  no_nesting smallint(6) DEFAULT NULL,
  filenum mediumint(9) DEFAULT NULL,
  no_bar tinyint(3)  DEFAULT NULL,
  no_bar_cam tinyint(3)  NOT NULL DEFAULT '0',
  uniqid varchar(13) DEFAULT NULL,
  no_inventaire varchar(15) DEFAULT NULL,
  fabtrol_ponumber varchar(30) DEFAULT NULL,
  fabtrol_orderkey smallint(5)  NOT NULL DEFAULT '0',
  mill_test varchar(30) DEFAULT NULL,
  commencee tinyint(1)  NOT NULL DEFAULT '0',
  commencee_quand datetime DEFAULT NULL,
  commencee_qui smallint(6)  NOT NULL DEFAULT '0',
  completee tinyint(1)  NOT NULL DEFAULT '0',
  completee_quand datetime DEFAULT NULL,
  completee_qui smallint(5)  NOT NULL DEFAULT '0',
  reste mediumint(9)  NOT NULL DEFAULT '0',
  reste_coupe mediumint(8)  NOT NULL DEFAULT '0',
  notes varchar(255) DEFAULT NULL,
  _CAM text)  ;

--
-- Table structure for table production_nesting_bar_unique_item
--

DROP TABLE IF EXISTS production_nesting_bar_unique_item;

CREATE TABLE production_nesting_bar_unique_item (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_liste mediumint(8)  DEFAULT NULL,
  bar_uniqid varchar(13) DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  no_membrure int(11)  DEFAULT NULL)  ;

--
-- Table structure for table production_nesting_etat
--

DROP TABLE IF EXISTS production_nesting_etat;

CREATE TABLE production_nesting_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(26) DEFAULT NULL)  ;

--
-- Table structure for table production_nesting_item
--

DROP TABLE IF EXISTS production_nesting_item;

CREATE TABLE production_nesting_item (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_liste mediumint(9)  DEFAULT NULL,
  no_nesting smallint(5)  DEFAULT NULL,
  filenum mediumint(9) DEFAULT NULL,
  no_bar tinyint(3)  DEFAULT NULL,
  quantite tinyint(3)  DEFAULT NULL,
  quantite_cam tinyint(3)  DEFAULT NULL,
  no_dessin mediumint(9)  NOT NULL DEFAULT '0',
  marque_piece varchar(15) DEFAULT NULL,
  longueur mediumint(8)  DEFAULT NULL,
  longueur_cam mediumint(8)  DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  _CAM text)  ;

--
-- Table structure for table production_nesting_item_unique
--

DROP TABLE IF EXISTS production_nesting_item_unique;

CREATE TABLE production_nesting_item_unique (
  Id int(11) NOT NULL ,
  no_liste mediumint(8)  DEFAULT NULL,
  uniqid char(13) DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  no_membrure int(11)  DEFAULT NULL)  ;

--
-- Table structure for table production_nesting_poste
--

DROP TABLE IF EXISTS production_nesting_poste;

CREATE TABLE production_nesting_poste (
  no_poste tinyint(3)  NOT NULL ,
  nom varchar(25) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table production_non_conformite_categorie
--

DROP TABLE IF EXISTS production_non_conformite_categorie;

CREATE TABLE production_non_conformite_categorie (
  Id int(11) NOT NULL ,
  no_categorie tinyint(3)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL)  ;

--
-- Table structure for table production_non_conformite_code
--

DROP TABLE IF EXISTS production_non_conformite_code;

CREATE TABLE production_non_conformite_code (
  Id int(11) NOT NULL ,
  no_code tinyint(3)  DEFAULT NULL,
  no_categorie tinyint(3)  DEFAULT NULL,
  nom varchar(75) DEFAULT NULL)  ;

--
-- Table structure for table production_non_conformite_historique
--

DROP TABLE IF EXISTS production_non_conformite_historique;

CREATE TABLE production_non_conformite_historique (
  Id int(11) NOT NULL ,
  no_evenement smallint(5)  DEFAULT NULL,
  code_activite varchar(5) DEFAULT NULL,
  no_activite smallint(6)  DEFAULT NULL,
  no_membrure int(11)  DEFAULT NULL,
  no_code tinyint(3)  DEFAULT NULL,
  inspecteur_qui smallint(5)  DEFAULT NULL,
  inspecteur_quand datetime DEFAULT NULL,
  assembleur_qui smallint(5)  DEFAULT NULL,
  remarques text,
  correction_inspecteur_qui smallint(5)  DEFAULT NULL,
  correction_inspecteur_quand smallint(6) DEFAULT NULL,
  correction_assembleur_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table production_non_conformite_historique_photo
--

DROP TABLE IF EXISTS production_non_conformite_historique_photo;

CREATE TABLE production_non_conformite_historique_photo (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_membrure int(11)  DEFAULT NULL,
  photo varchar(100) DEFAULT NULL)  ;

--
-- Table structure for table production_piece_fabrique
--

DROP TABLE IF EXISTS production_piece_fabrique;

CREATE TABLE production_piece_fabrique (
  Id int(11) NOT NULL ,
  no_transmission mediumint(9)  NOT NULL DEFAULT '0',
  no_projet smallint(6)  DEFAULT NULL,
  marque_piece varchar(12) DEFAULT NULL,
  quantite smallint(5)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table production_piece_transmission
--

DROP TABLE IF EXISTS production_piece_transmission;

CREATE TABLE production_piece_transmission (
  Id int(11) NOT NULL ,
  no_transmission mediumint(9)  DEFAULT NULL,
  transmission varchar(8) DEFAULT NULL,
  standard tinyint(1)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table production_piece_transmission_page
--

DROP TABLE IF EXISTS production_piece_transmission_page;

CREATE TABLE production_piece_transmission_page (
  Id int(11) NOT NULL ,
  no_transmission mediumint(9) DEFAULT NULL,
  no_page tinyint(3)  DEFAULT NULL,
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  nuance varchar(8) DEFAULT NULL,
  terminee_quand datetime DEFAULT NULL,
  terminee_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table production_piece_transmission_piece
--

DROP TABLE IF EXISTS production_piece_transmission_piece;

CREATE TABLE production_piece_transmission_piece (
  Id int(11) NOT NULL ,
  no_transmission mediumint(8)  DEFAULT NULL,
  no_page tinyint(3)  DEFAULT NULL,
  no_projet mediumint(8)  DEFAULT NULL,
  no_dessin mediumint(8)  NOT NULL DEFAULT '0',
  marque_piece varchar(10) DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL,
  longueur varchar(20) DEFAULT NULL,
  terminer tinyint(1)  NOT NULL DEFAULT '0',
  notes varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table projet
--

DROP TABLE IF EXISTS projet;

CREATE TABLE projet (
  Id smallint(6)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  version_module_check tinyint(3)  NOT NULL DEFAULT '1',
  version_module_sketch tinyint(3)  NOT NULL DEFAULT '1',
  version_module_drawing tinyint(3)  NOT NULL DEFAULT '1',
  version_module_subcontracting tinyint(3)  NOT NULL DEFAULT '1',
  version_module_plan tinyint(3)  NOT NULL DEFAULT '1',
  version_module_nonconformite tinyint(3)  NOT NULL DEFAULT '1',
  version_production tinyint(3)  NOT NULL DEFAULT '1',
  version_module_spreadsheet tinyint(3)  NOT NULL DEFAULT '2',
  CSA_S16_version char(2) NOT NULL DEFAULT '09',
  AISC_325_11_version char(2) NOT NULL DEFAULT '14',
  code_projet char(4) DEFAULT NULL,
  titre varchar(85) DEFAULT NULL,
  titre_externe varchar(50) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  description text,
  chemin varchar(100) DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  no_categorie_type tinyint(3)  NOT NULL DEFAULT '0',
  confidentiel tinyint(1)  NOT NULL DEFAULT '0',
  no_type_construction tinyint(3)  NOT NULL DEFAULT '0',
  lainco_us tinyint(1)  NOT NULL DEFAULT '0',
  reference_client varchar(20) DEFAULT NULL,
  no_societe smallint(6)  DEFAULT NULL,
  societe_nom varchar(75) DEFAULT NULL,
  societe_adresse varchar(100) DEFAULT NULL,
  societe_ville varchar(50) DEFAULT NULL,
  societe_province varchar(50) DEFAULT NULL,
  societe_pays varchar(50) DEFAULT NULL,
  societe_code_postal varchar(15) DEFAULT NULL,
  societe_telephone varchar(30) DEFAULT NULL,
  societe_fax varchar(30) DEFAULT NULL,
  no_contact smallint(6)  DEFAULT NULL,
  contact_prenom varchar(50) DEFAULT NULL,
  contact_nom varchar(50) DEFAULT NULL,
  contact_telephone varchar(30) DEFAULT NULL,
  contact_cellulaire varchar(30) DEFAULT NULL,
  contact_courriel varchar(75) DEFAULT NULL,
  nom_dossier varchar(100) DEFAULT NULL,
  soumission varchar(20) DEFAULT NULL,
  no_soumission smallint(6)  NOT NULL DEFAULT '0',
  bon_commande varchar(75) DEFAULT NULL,
  no_gerant smallint(6)  NOT NULL DEFAULT '0',
  no_estimateur smallint(6)  NOT NULL DEFAULT '0',
  no_vendeur smallint(6)  NOT NULL DEFAULT '0',
  no_cp_conception smallint(6)  NOT NULL DEFAULT '0',
  no_cp_detaillage smallint(6)  NOT NULL DEFAULT '0',
  no_cp_production smallint(6)  NOT NULL DEFAULT '0',
  metrique tinyint(1)  NOT NULL DEFAULT '0',
  finition varchar(100) DEFAULT NULL,
  notes text,
  version_sds2 varchar(5) DEFAULT NULL,
  fabtrol_projet varchar(10) DEFAULT NULL,
  date_debut_travaux_usine date DEFAULT NULL,
  date_debut_travaux_chantier date DEFAULT NULL,
  date_fin_travaux_chantier date DEFAULT NULL,
  date_fin_travaux_entrepreneur date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  chantier_adresse varchar(100) DEFAULT NULL,
  chantier_rue_transversale varchar(50) DEFAULT NULL,
  chantier_ville varchar(75) DEFAULT NULL,
  chantier_province varchar(50) DEFAULT NULL,
  chantier_pays varchar(50) DEFAULT 'Canada',
  chantier_code_postal varchar(15) DEFAULT NULL,
  chantier_telephone varchar(30) DEFAULT NULL,
  chantier_fax varchar(30) DEFAULT NULL,
  chantier_google_map text,
  chantier_exigences text,
  chantier_notes text,
  chantier_distance varchar(10) DEFAULT NULL,
  date_debut date DEFAULT NULL,
  en_production tinyint(1)  NOT NULL DEFAULT '0',
  projet_summit tinyint(1)  NOT NULL DEFAULT '0',
  budget_fabrication_ajustement_frais_marginaux varchar(6) NOT NULL DEFAULT '100',
  budget_conception_ajustement_frais_marginaux varchar(6) NOT NULL DEFAULT '100',
  budget_detaillage_ajustement_frais_marginaux varchar(6) NOT NULL DEFAULT '100',
  budget_construction_ajustement_frais_marginaux varchar(6) NOT NULL DEFAULT '100',
  no_vente smallint(5)  NOT NULL DEFAULT '0',
  denoncable_client tinyint(3)  NOT NULL DEFAULT '1',
  denonciation_client_quand datetime DEFAULT NULL,
  denonciation_client_qui smallint(6)  DEFAULT NULL,
  denoncable_caution tinyint(3)  NOT NULL DEFAULT '1',
  denonciation_caution_quand datetime DEFAULT NULL,
  denonciation_caution_qui smallint(5)  DEFAULT NULL,
  grade_confirmation_quand datetime DEFAULT NULL,
  grade_confirmation_qui smallint(6) NOT NULL DEFAULT '0',
  inclusion_activite_conception tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_activite_detaillage tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_activite_fabrication tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_activite_construction tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_activite_autre tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_activite_autre_description varchar(100) DEFAULT NULL,
  inclusion_fourniture_boulons_ancrage tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_voie_roulement tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_elements_coules_beton tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_elements_coules_murs_prefabriques tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_metaux_ouvres tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_ligne_vie_autres_cables_permanents tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_caillebotis tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_fourniture_autre tinyint(3)  NOT NULL DEFAULT '0',
  inclusion_fourniture_autre_description varchar(100) DEFAULT NULL,
  exclusion text,
  norme_activite_csa_s16 tinyint(1)  NOT NULL DEFAULT '0',
  norme_activite_aisc_325_11 tinyint(1)  NOT NULL DEFAULT '0',
  norme_activite_autre tinyint(1)  NOT NULL DEFAULT '0',
  norme_activite_autre_description varchar(100) DEFAULT NULL,
  norme_soudage_w59 tinyint(1)  NOT NULL DEFAULT '0',
  norme_soudage_w59_c12 tinyint(1)  NOT NULL DEFAULT '0',
  norme_soudage_aisc_a_ws_d1p1 tinyint(1)  NOT NULL DEFAULT '0',
  norme_soudage_autre tinyint(1)  NOT NULL DEFAULT '0',
  norme_soudage_autre_description varchar(100) DEFAULT NULL,
  spec_division_plan varchar(100) DEFAULT NULL,
  spec_conception_responsable_ingenieur smallint(6)  NOT NULL DEFAULT '0',
  spec_conception_responsable_charge_projet smallint(5)  NOT NULL DEFAULT '0',
  spec_conception_responsable_coordonnateur smallint(5)  NOT NULL DEFAULT '0',
  spec_conception_version_revit varchar(4) DEFAULT NULL,
  spec_conception_plan_architecture_reception tinyint(1)  NOT NULL DEFAULT '0',
  spec_conception_plan_architecture_reception_quand datetime DEFAULT NULL,
  spec_conception_plan_architecture_reception_qui smallint(6)  NOT NULL DEFAULT '0',
  spec_conception_plan_type_revision varchar(15) DEFAULT NULL,
  spec_conception_plan_type_revision_quand datetime DEFAULT NULL,
  spec_conception_plan_type_revision_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_budget
--

DROP TABLE IF EXISTS projet_budget;

CREATE TABLE projet_budget (
  Id smallint(6)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  vente varchar(20) DEFAULT NULL,
  administration_montant varchar(20) DEFAULT NULL,
  profit_montant varchar(20) DEFAULT NULL,
  bon_commande varchar(75) DEFAULT NULL,
  achat_ajustement_cout_unitaire_budget varchar(4) NOT NULL DEFAULT '1',
  achat_cout_unitaire_cible varchar(10) DEFAULT NULL,
  achat_bon_commande_max float(10)  NOT NULL DEFAULT '10000.00',
  fabrication_matiere_premiere varchar(20) DEFAULT NULL,
  fabrication_fourniture_fabrication varchar(20) DEFAULT NULL,
  fabrication_cout_sous_traitance varchar(20) DEFAULT NULL,
  conception_cout_sous_traitance varchar(20) DEFAULT NULL,
  detaillage_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_cintrage_courbage_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_cintrage_courbage_cout_transport varchar(20) DEFAULT NULL,
  finition_galvanisation_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_galvanisation_cout_transport varchar(20) DEFAULT NULL,
  finition_peinture_sablage_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_peinture_sablage_cout_transport varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_poutrelles varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_fermes varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_tablier varchar(20) DEFAULT NULL,
  montage_contingence_fabrication varchar(20) DEFAULT NULL,
  montage_contingence_monteur varchar(20) DEFAULT NULL,
  montage_cout_sous_traitance varchar(20) DEFAULT NULL,
  transport_cout_sous_traitance varchar(20) DEFAULT NULL,
  construction_depenses_divers varchar(20) DEFAULT NULL,
  stats_surface_totale_budget varchar(20) DEFAULT NULL,
  stats_surface_totale_reel varchar(20) DEFAULT NULL,
  stats_fabrication_poids_acier_interne_budget varchar(20) DEFAULT NULL,
  stats_fabrication_poids_acier_interne_reel varchar(20) DEFAULT NULL,
  stats_fabrication_poids_acier_externe_budget varchar(20) DEFAULT NULL,
  stats_fabrication_poids_acier_externe_reel varchar(20) DEFAULT NULL,
  stats_detaillage_poids_acier_interne_budget varchar(20) DEFAULT NULL,
  stats_detaillage_poids_acier_interne_reel varchar(20) DEFAULT NULL,
  stats_detaillage_poids_acier_externe_budget varchar(20) DEFAULT NULL,
  stats_detaillage_poids_acier_externe_reel varchar(20) DEFAULT NULL,
  stats_detaillage_nombre_dessins_interne varchar(20) DEFAULT NULL,
  stats_detaillage_nombre_dessins_externe varchar(20) DEFAULT NULL,
  stats_finition_cintrage_courbage_poids_acier_budget varchar(20) DEFAULT NULL,
  stats_finition_cintrage_courbage_poids_acier_reel varchar(20) DEFAULT NULL,
  stats_finition_cintrage_courbage_nombre_pieces_budget varchar(20) DEFAULT NULL,
  stats_finition_cintrage_courbage_nombre_pieces_reel varchar(20) DEFAULT NULL,
  stats_finition_galvanisation_poids_acier_budget varchar(20) DEFAULT NULL,
  stats_finition_galvanisation_poids_acier_reel varchar(20) DEFAULT NULL,
  stats_finition_peinture_sablage_poids_acier_budget varchar(20) DEFAULT NULL,
  stats_finition_peinture_sablage_poids_acier_reel varchar(20) DEFAULT NULL,
  stats_finition_peinture_sablage_surface_traitement_budget varchar(20) DEFAULT NULL,
  stats_finition_peinture_sablage_surface_traitement_reel varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_poutrelles_budget varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_poutrelles_reel varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_fermes_budget varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_fermes_reel varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_tablier_budget varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_poids_tablier_reel varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_surface_tablier_budget varchar(20) DEFAULT NULL,
  stats_poutrelle_tablier_surface_tablier_reel varchar(20) DEFAULT NULL,
  stats_transport_nombre_remorque_budget varchar(20) DEFAULT NULL,
  stats_transport_nombre_remorque_reel varchar(20) DEFAULT NULL,
  stats_transport_cout_remorque_budget varchar(20) DEFAULT NULL,
  stats_transport_cout_remorque_reel varchar(20) DEFAULT NULL,
  stats_construction_cout_fondation_budget varchar(20) DEFAULT NULL,
  stats_construction_cout_fondation_reel varchar(20) DEFAULT NULL,
  stats_construction_cout_structure_budget varchar(20) DEFAULT NULL,
  stats_construction_cout_structure_reel varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_configuration
--

DROP TABLE IF EXISTS projet_budget_configuration;

CREATE TABLE projet_budget_configuration (
  Id int(11) NOT NULL ,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  loyer_administration varchar(20) DEFAULT NULL,
  loyer_conception varchar(20) DEFAULT NULL,
  loyer_detaillage varchar(20) DEFAULT NULL,
  loyer_construction varchar(20) DEFAULT NULL,
  heures_fabrication varchar(20) DEFAULT NULL,
  heures_detaillage varchar(20) DEFAULT NULL,
  heures_conception varchar(20) DEFAULT NULL,
  heures_construction varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_ecriture
--

DROP TABLE IF EXISTS projet_budget_ecriture;

CREATE TABLE projet_budget_ecriture (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  annee smallint(5)  DEFAULT NULL,
  mois tinyint(1) DEFAULT NULL,
  produit_en_cours varchar(20) DEFAULT NULL,
  fabrication_depenses_encourues varchar(20) DEFAULT NULL,
  conception_depenses_encourues varchar(20) DEFAULT NULL,
  detaillage_depenses_encourues varchar(20) DEFAULT NULL,
  finition_cintrage_courbage_depenses_encourues varchar(20) DEFAULT NULL,
  finition_galvanisation_depenses_encourues varchar(20) DEFAULT NULL,
  finition_peinture_sablage_depenses_encourues varchar(20) DEFAULT NULL,
  poutrelle_tablier_depenses_encourues varchar(20) DEFAULT NULL,
  montage_depenses_encourues varchar(20) DEFAULT NULL,
  transport_depenses_encourues varchar(20) DEFAULT NULL,
  construction_depenses_encourues varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_fonction
--

DROP TABLE IF EXISTS projet_budget_fonction;

CREATE TABLE projet_budget_fonction (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  no_fonction tinyint(3)  DEFAULT NULL,
  nbr_heure smallint(5)  DEFAULT NULL,
  frais_marginaux varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_item
--

DROP TABLE IF EXISTS projet_budget_item;

CREATE TABLE projet_budget_item (
  no_item tinyint(3)  NOT NULL DEFAULT '0',
  description varchar(255) DEFAULT NULL,
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_prevision_mensuel
--

DROP TABLE IF EXISTS projet_budget_prevision_mensuel;

CREATE TABLE projet_budget_prevision_mensuel (
  Id int(11) NOT NULL ,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  periode tinyint(3)  DEFAULT NULL,
  vente varchar(20) DEFAULT NULL,
  frais_administration varchar(20) DEFAULT NULL,
  fabrication_matiere_premiere varchar(20) DEFAULT NULL,
  fabrication_fourniture varchar(20) DEFAULT NULL,
  fabrication_main_oeuvre varchar(20) DEFAULT NULL,
  fabrication_frais_generaux varchar(20) DEFAULT NULL,
  fabrication_sous_traitance varchar(20) DEFAULT NULL,
  detaillage_main_oeuvre_ingenierie varchar(20) DEFAULT NULL,
  detaillage_main_oeuvre_detailleur varchar(20) DEFAULT NULL,
  detaillage_frais_generaux varchar(20) DEFAULT NULL,
  detaillage_sous_traitance varchar(20) DEFAULT NULL,
  conception_main_oeuvre_ingenierie varchar(20) DEFAULT NULL,
  conception_main_oeuvre_dessinateur varchar(20) DEFAULT NULL,
  conception_frais_generaux varchar(20) DEFAULT NULL,
  conception_sous_traitance varchar(20) DEFAULT NULL,
  construction_main_oeuvre_gestion varchar(20) DEFAULT NULL,
  construction_frais_generaux varchar(20) DEFAULT NULL,
  construction_depenses_chantier varchar(20) DEFAULT NULL,
  sous_traitance_cintrage_courbage varchar(20) DEFAULT NULL,
  sous_traitance_galvanisation varchar(20) DEFAULT NULL,
  sous_traitance_peinture_sablage varchar(20) DEFAULT NULL,
  sous_traitance_poutrelles varchar(20) DEFAULT NULL,
  sous_traitance_tablier_metallique varchar(20) DEFAULT NULL,
  sous_traitance_montage varchar(20) DEFAULT NULL,
  sous_traitance_transport varchar(20) DEFAULT NULL,
  sous_traitance_depenses_divers varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_budget_production
--

DROP TABLE IF EXISTS projet_budget_production;

CREATE TABLE projet_budget_production (
  Id int(11) NOT NULL ,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  no_projet mediumint(9) DEFAULT NULL,
  couleur varchar(7) NOT NULL DEFAULT '#c0c0c0',
  vente varchar(20) DEFAULT NULL,
  frais_administration varchar(20) DEFAULT NULL,
  profit varchar(20) DEFAULT NULL,
  fabrication_date_debut date DEFAULT NULL,
  fabrication_date_fin date DEFAULT NULL,
  fabrication_heures varchar(20) DEFAULT NULL,
  fabrication_matiere_premiere varchar(20) DEFAULT NULL,
  fabrication_fourniture varchar(20) DEFAULT NULL,
  fabrication_main_oeuvre varchar(20) DEFAULT NULL,
  fabrication_frais_generaux varchar(20) DEFAULT NULL,
  fabrication_sous_traitance varchar(20) DEFAULT NULL,
  detaillage_date_debut date DEFAULT NULL,
  detaillage_date_fin date DEFAULT NULL,
  detaillage_heures varchar(20) DEFAULT NULL,
  detaillage_main_oeuvre_ingenierie varchar(20) DEFAULT NULL,
  detaillage_main_oeuvre_detailleur varchar(20) DEFAULT NULL,
  detaillage_frais_generaux varchar(20) DEFAULT NULL,
  detaillage_sous_traitance varchar(20) DEFAULT NULL,
  conception_date_debut date DEFAULT NULL,
  conception_date_fin date DEFAULT NULL,
  conception_heures varchar(20) DEFAULT NULL,
  conception_main_oeuvre_ingenierie varchar(20) DEFAULT NULL,
  conception_main_oeuvre_dessinateur varchar(20) DEFAULT NULL,
  conception_frais_generaux varchar(20) DEFAULT NULL,
  conception_sous_traitance varchar(20) DEFAULT NULL,
  construction_date_debut date DEFAULT NULL,
  construction_date_fin date DEFAULT NULL,
  construction_heures varchar(20) DEFAULT NULL,
  construction_main_oeuvre_gestion varchar(20) DEFAULT NULL,
  construction_frais_generaux varchar(20) DEFAULT NULL,
  construction_depenses_chantier varchar(20) DEFAULT NULL,
  sous_traitance_cintrage_courbage varchar(20) DEFAULT NULL,
  sous_traitance_galvanisation varchar(20) DEFAULT NULL,
  sous_traitance_peinture_sablage varchar(20) DEFAULT NULL,
  sous_traitance_poutrelles_tablier_metallique varchar(20) DEFAULT NULL,
  sous_traitance_montage varchar(20) DEFAULT NULL,
  sous_traitance_transport varchar(20) DEFAULT NULL,
  sous_traitance_depenses_divers varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_changement
--

DROP TABLE IF EXISTS projet_changement;

CREATE TABLE projet_changement (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_changement smallint(5)  DEFAULT NULL,
  type char(4) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  extra tinyint(1)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_changement_modification
--

DROP TABLE IF EXISTS projet_changement_modification;

CREATE TABLE projet_changement_modification (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_changement smallint(5)  DEFAULT NULL,
  no_modification tinyint(3)  DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  date date DEFAULT NULL,
  no_employe smallint(6)  NOT NULL DEFAULT '0',
  no_croquis tinyint(3)  NOT NULL DEFAULT '0',
  plan varchar(20) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  terminee_quand datetime DEFAULT NULL,
  terminee_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_changement_modification_etat
--

DROP TABLE IF EXISTS projet_changement_modification_etat;

CREATE TABLE projet_changement_modification_etat (
  Id tinyint(3) NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_changement_modification_fichier
--

DROP TABLE IF EXISTS projet_changement_modification_fichier;

CREATE TABLE projet_changement_modification_fichier (
  Id int(11) NOT NULL ,
  modifId mediumint(9)  NOT NULL DEFAULT '0',
  no_projet smallint(5)  DEFAULT NULL,
  no_document mediumint(8)  NOT NULL DEFAULT '0',
  fichier varchar(100) DEFAULT NULL) ;

--
-- Table structure for table projet_contact
--

DROP TABLE IF EXISTS projet_contact;

CREATE TABLE projet_contact (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_contact smallint(6)  DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  no_profession tinyint(3)  NOT NULL DEFAULT '0',
  profession varchar(75) DEFAULT NULL,
  no_responsabilite tinyint(3)  NOT NULL DEFAULT '0',
  responsabilite varchar(75) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  prenom varchar(50) DEFAULT NULL,
  societe varchar(100) DEFAULT NULL,
  adresse varchar(100) DEFAULT NULL,
  ville varchar(100) DEFAULT NULL,
  province varchar(100) DEFAULT 'Québec',
  code_postal varchar(15) DEFAULT NULL,
  pays varchar(50) NOT NULL DEFAULT 'Canada',
  telephone varchar(30) DEFAULT NULL,
  cellulaire varchar(30) DEFAULT NULL,
  fax varchar(30) DEFAULT NULL,
  courriel varchar(200) DEFAULT NULL,
  notes varchar(200) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  contact_id smallint(6)  DEFAULT NULL,
  upload_quand datetime DEFAULT NULL,
  upload_qui smallint(6)  DEFAULT NULL,
  context varchar(150) DEFAULT NULL)  ;

--
-- Table structure for table projet_contact_profession
--

DROP TABLE IF EXISTS projet_contact_profession;

CREATE TABLE projet_contact_profession (
  Id tinyint(3)  NOT NULL ,
  no_profession tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_contact_responsabilite
--

DROP TABLE IF EXISTS projet_contact_responsabilite;

CREATE TABLE projet_contact_responsabilite (
  Id tinyint(3)  NOT NULL ,
  no_responsabilite tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_contact_type
--

DROP TABLE IF EXISTS projet_contact_type;

CREATE TABLE projet_contact_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_contact_type_profession
--

DROP TABLE IF EXISTS projet_contact_type_profession;

CREATE TABLE projet_contact_type_profession (
  Id smallint(6)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  no_profession tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table projet_contact_type_responsabilite
--

DROP TABLE IF EXISTS projet_contact_type_responsabilite;

CREATE TABLE projet_contact_type_responsabilite (
  Id smallint(6)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  no_responsabilite tinyint(3)  DEFAULT NULL,
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_courriel
--

DROP TABLE IF EXISTS projet_courriel;

CREATE TABLE projet_courriel (
  Id mediumint(9)  NOT NULL ,
  no_transaction mediumint(9)  DEFAULT NULL,
  no_projet smallint(6)  DEFAULT NULL,
  de varchar(75) DEFAULT NULL,
  a varchar(75) DEFAULT NULL,
  cc text,
  sujet varchar(255) DEFAULT NULL,
  entete_message text,
  message mediumtext,
  pied_message text,
  nom_zip varchar(100) DEFAULT NULL,
  max_mb_zip tinyint(3) NOT NULL DEFAULT '5',
  fichiers text,
  images text,
  lien_fichier tinyint(1)  NOT NULL DEFAULT '0',
  lang char(2) NOT NULL DEFAULT 'fr',
  cree_qui smallint(6)  DEFAULT NULL,
  erreur tinyint(1)  NOT NULL DEFAULT '0',
  envoye_quand datetime DEFAULT NULL)  ;

--
-- Table structure for table projet_croquis
--

DROP TABLE IF EXISTS projet_croquis;

CREATE TABLE projet_croquis (
  Id int(11) NOT NULL ,
  no_projet smallint(6) DEFAULT NULL,
  no_croquis smallint(5)  DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  commentaires varchar(100) DEFAULT NULL,
  sequence varchar(25) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  fichier varchar(75) DEFAULT NULL,
  no_document smallint(5)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  hold tinyint(1)  NOT NULL DEFAULT '0',
  cancel tinyint(1)  NOT NULL DEFAULT '0',
  date_echeance date DEFAULT NULL,
  priorite tinyint(3)  NOT NULL DEFAULT '3',
  date_transmission date DEFAULT NULL,
  no_transmission smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_croquis_etat
--

DROP TABLE IF EXISTS projet_croquis_etat;

CREATE TABLE projet_croquis_etat (
  no_etat tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  fond varchar(7) DEFAULT '#FFFFFF',
  texte varchar(7) NOT NULL DEFAULT '#000000',
  ordre tinyint(3)  DEFAULT '0')  ;

--
-- Table structure for table projet_croquis_historique
--

DROP TABLE IF EXISTS projet_croquis_historique;

CREATE TABLE projet_croquis_historique (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_croquis smallint(5)  DEFAULT NULL,
  no_etat tinyint(3)  DEFAULT NULL,
  fichier varchar(31) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_croquis_transmission
--

DROP TABLE IF EXISTS projet_croquis_transmission;

CREATE TABLE projet_croquis_transmission (
  no_transmission mediumint(8)  NOT NULL DEFAULT '0',
  no_projet smallint(6)  NOT NULL DEFAULT '0',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  courriel_no_employe smallint(6)  NOT NULL DEFAULT '0',
  courriel_objet varchar(255) DEFAULT NULL,
  courriel_message text,
  formulaire_T varchar(10) DEFAULT NULL,
  formulaire_destinataire varchar(75) DEFAULT NULL,
  formulaire_compagnie varchar(75) DEFAULT NULL,
  formulaire_courriel varchar(75) DEFAULT NULL,
  formulaire_telephone varchar(30) DEFAULT NULL,
  formulaire_date varchar(30) DEFAULT NULL,
  formulaire_type varchar(50) DEFAULT NULL,
  formulaire_envoyeur varchar(75) DEFAULT NULL,
  formulaire_notes text,
  formulaire_croquis text,
  formulaire_nbr_croquis varchar(4) DEFAULT NULL) ;

--
-- Table structure for table projet_croquis_transmission_details
--

DROP TABLE IF EXISTS projet_croquis_transmission_details;

CREATE TABLE projet_croquis_transmission_details (
  no_transmission mediumint(8)  NOT NULL DEFAULT '0',
  no_projet smallint(5)  NOT NULL DEFAULT '0',
  no_croquis mediumint(9)  NOT NULL DEFAULT '0'
) ;

--
-- Table structure for table projet_croquis_type
--

DROP TABLE IF EXISTS projet_croquis_type;

CREATE TABLE projet_croquis_type (
  Id tinyint(3) NOT NULL ,
  no_type tinyint(3) DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table projet_denonciation
--

DROP TABLE IF EXISTS projet_denonciation;

CREATE TABLE projet_denonciation (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_societe mediumint(9)  DEFAULT NULL,
  montant varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin
--

DROP TABLE IF EXISTS projet_dessin;

CREATE TABLE projet_dessin (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  dessin varchar(20) DEFAULT NULL,
  format char(1) DEFAULT 'B',
  description varchar(30) DEFAULT NULL,
  commentaire varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  createur varchar(75) DEFAULT NULL,
  externe tinyint(1)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '2',
  fichier varchar(20) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '0',
  verifie tinyint(1)  NOT NULL DEFAULT '0',
  verification_fichier varchar(20) DEFAULT NULL,
  verification_version tinyint(3)  NOT NULL DEFAULT '0',
  verification_no_etat tinyint(3)  NOT NULL DEFAULT '0',
  verification_modification_quand datetime DEFAULT NULL,
  verification_modification_qui smallint(6)  NOT NULL DEFAULT '0',
  verification_progression_qui smallint(4)  NOT NULL DEFAULT '0',
  verification_backcheck_fait tinyint(1)  NOT NULL DEFAULT '0',
  verification_dessin_corrige tinyint(1)  NOT NULL DEFAULT '0',
  verification_commentaire varchar(255) DEFAULT NULL,
  verification_quand datetime DEFAULT NULL,
  verification_qui smallint(6)  NOT NULL DEFAULT '0',
  verificateur varchar(75) DEFAULT NULL,
  approbateur varchar(75) DEFAULT NULL,
  tvc varchar(20) DEFAULT NULL,
  tvc_code tinyint(1)  NOT NULL DEFAULT '1',
  ta varchar(20) DEFAULT NULL,
  ta_code tinyint(1)  NOT NULL DEFAULT '1',
  tc varchar(20) DEFAULT NULL,
  tc_code varchar(2) DEFAULT NULL,
  comp tinyint(1)  NOT NULL DEFAULT '0',
  nc1 tinyint(1)  NOT NULL DEFAULT '0',
  kiss tinyint(1)  NOT NULL DEFAULT '0',
  pdf tinyint(1)  NOT NULL DEFAULT '0',
  tf varchar(20) DEFAULT NULL,
  tf_actif tinyint(1) NOT NULL DEFAULT '0',
  t varchar(20) DEFAULT NULL,
  t_date date DEFAULT NULL,
  hold tinyint(1)  NOT NULL DEFAULT '0',
  hold_note varchar(255) DEFAULT NULL,
  hold_production tinyint(1)  NOT NULL DEFAULT '0',
  cancel tinyint(1)  NOT NULL DEFAULT '0',
  cancel_note varchar(255) DEFAULT NULL,
  cancel_production tinyint(1) NOT NULL DEFAULT '0',
  no_lot_production mediumint(8) NOT NULL DEFAULT '-1',
  no_lot_achat mediumint(8) NOT NULL DEFAULT '0',
  no_commande mediumint(8)  NOT NULL DEFAULT '0',
  no_liste_coupe mediumint(9)  NOT NULL DEFAULT '0',
  no_liste_boulon mediumint(9)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_dessin_emission
--

DROP TABLE IF EXISTS projet_dessin_emission;

CREATE TABLE projet_dessin_emission (
  Id mediumint(9)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  type char(2) NOT NULL DEFAULT 'A',
  no_transmission char(3) DEFAULT NULL,
  no_transaction smallint(6)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '0',
  fichier varchar(20) DEFAULT NULL,
  verification_quand datetime DEFAULT NULL,
  verification_qui smallint(6) DEFAULT NULL,
  verificateur varchar(75) DEFAULT NULL,
  envoyee_quand datetime DEFAULT NULL,
  envoyee_qui smallint(6) DEFAULT NULL,
  transmission_cc varchar(100) DEFAULT NULL,
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(6) DEFAULT NULL,
  approbation_code varchar(3) DEFAULT NULL,
  approbation_commentaires text,
  approbation_commentaires_transmission text,
  approbation_fichier varchar(200) DEFAULT NULL,
  approbateur varchar(75) DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_emission_formulaire
--

DROP TABLE IF EXISTS projet_dessin_emission_formulaire;

CREATE TABLE projet_dessin_emission_formulaire (
  Id int(11) NOT NULL ,
  no_transaction smallint(6)  DEFAULT NULL,
  T varchar(10) DEFAULT NULL,
  destinataire varchar(75) DEFAULT NULL,
  compagnie varchar(75) DEFAULT NULL,
  courriel varchar(75) DEFAULT NULL,
  telephone varchar(30) DEFAULT NULL,
  date varchar(30) DEFAULT NULL,
  type varchar(50) DEFAULT NULL,
  envoyeur varchar(75) DEFAULT NULL,
  notes text,
  dessin text,
  nbr_dessin varchar(4) DEFAULT NULL,
  plan_montage text,
  cc text,
  lang char(2) NOT NULL DEFAULT 'fr',
  formulaire mediumtext)  ;

--
-- Table structure for table projet_dessin_etat
--

DROP TABLE IF EXISTS projet_dessin_etat;

CREATE TABLE projet_dessin_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  fond varchar(7) DEFAULT NULL,
  texte varchar(7) NOT NULL DEFAULT '#000000',
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_historique
--

DROP TABLE IF EXISTS projet_dessin_historique;

CREATE TABLE projet_dessin_historique (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_dessin mediumint(9)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  DEFAULT NULL,
  note varchar(200) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss
--

DROP TABLE IF EXISTS projet_dessin_kiss;

CREATE TABLE projet_dessin_kiss (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  poids float(7)  NOT NULL DEFAULT '0.00',
  poids_assemblage decimal(10)  NOT NULL DEFAULT '0.00',
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  description_m varchar(24) DEFAULT NULL,
  description_i varchar(24) DEFAULT NULL,
  nuance varchar(8) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  W varchar(75) DEFAULT NULL,
  M varchar(50) DEFAULT NULL,
  S varchar(20) DEFAULT NULL,
  sequence varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  transmission smallint(6)  NOT NULL DEFAULT '0',
  imprimee tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_dessin_kiss_assemblage
--

DROP TABLE IF EXISTS projet_dessin_kiss_assemblage;

CREATE TABLE projet_dessin_kiss_assemblage (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  quantite smallint(4) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_conversion
--

DROP TABLE IF EXISTS projet_dessin_kiss_conversion;

CREATE TABLE projet_dessin_kiss_conversion (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  action char(1) DEFAULT NULL,
  type varchar(15) DEFAULT NULL,
  type_rechercher varchar(5) DEFAULT NULL,
  rechercher varchar(20) DEFAULT NULL,
  remplacer varchar(20) DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_divers
--

DROP TABLE IF EXISTS projet_dessin_kiss_divers;

CREATE TABLE projet_dessin_kiss_divers (
  Id int(11)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  nuance varchar(12) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_import
--

DROP TABLE IF EXISTS projet_dessin_kiss_import;

CREATE TABLE projet_dessin_kiss_import (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  dessin varchar(20) DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  poids decimal(7) NOT NULL DEFAULT '0.00',
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  description_m varchar(24) DEFAULT NULL,
  description_i varchar(24) DEFAULT NULL,
  nuance varchar(12) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  W varchar(75) DEFAULT NULL,
  M varchar(50) DEFAULT NULL,
  S varchar(20) DEFAULT NULL,
  sequence varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_import_assemblage
--

DROP TABLE IF EXISTS projet_dessin_kiss_import_assemblage;

CREATE TABLE projet_dessin_kiss_import_assemblage (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  quantite smallint(4) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_import_complement
--

DROP TABLE IF EXISTS projet_dessin_kiss_import_complement;

CREATE TABLE projet_dessin_kiss_import_complement (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_dessin mediumint(8)  NOT NULL DEFAULT '0',
  marque_piece varchar(16) DEFAULT NULL,
  no_membrure int(11) DEFAULT NULL,
  numero smallint(5)  NOT NULL DEFAULT '1',
  sequence varchar(15) DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  description varchar(30) DEFAULT NULL,
  longueur varchar(20) DEFAULT NULL,
  grade varchar(20) DEFAULT NULL,
  sketch_gauche varchar(50) DEFAULT NULL,
  sketch_droit varchar(50) DEFAULT NULL,
  commentaires varchar(255) DEFAULT NULL,
  code varchar(10) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL
) ;

--
-- Table structure for table projet_dessin_kiss_import_divers
--

DROP TABLE IF EXISTS projet_dessin_kiss_import_divers;

CREATE TABLE projet_dessin_kiss_import_divers (
  Id int(11)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  nuance varchar(12) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  code varchar(12) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_import_materiel
--

DROP TABLE IF EXISTS projet_dessin_kiss_import_materiel;

CREATE TABLE projet_dessin_kiss_import_materiel (
  Id int(11)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_piece varchar(20) DEFAULT NULL,
  poids float(7) NOT NULL DEFAULT '0.00',
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  description_m varchar(24) DEFAULT NULL,
  description_i varchar(24) DEFAULT NULL,
  nuance varchar(12) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  code varchar(12) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_import_operation
--

DROP TABLE IF EXISTS projet_dessin_kiss_import_operation;

CREATE TABLE projet_dessin_kiss_import_operation (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  type varchar(15) DEFAULT NULL,
  quantite varchar(6) DEFAULT NULL,
  dimension_1 varchar(9) DEFAULT NULL,
  dimension_2 varchar(9) DEFAULT NULL,
  notes varchar(40) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_kiss_materiel
--

DROP TABLE IF EXISTS projet_dessin_kiss_materiel;

CREATE TABLE projet_dessin_kiss_materiel (
  Id int(11)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  poids decimal(7) NOT NULL DEFAULT '0.00',
  type varchar(4) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  description_m varchar(24) DEFAULT NULL,
  description_i varchar(24) DEFAULT NULL,
  nuance varchar(8) DEFAULT NULL,
  longueur varchar(9) DEFAULT NULL,
  finition varchar(24) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  nc1 tinyint(1)  NOT NULL DEFAULT '0',
  pdf tinyint(1)  NOT NULL DEFAULT '0',
  transmission smallint(6) NOT NULL DEFAULT '0',
  imprimee tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_dessin_kiss_operation
--

DROP TABLE IF EXISTS projet_dessin_kiss_operation;

CREATE TABLE projet_dessin_kiss_operation (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  marque_assemblage varchar(16) DEFAULT NULL,
  marque_piece varchar(16) DEFAULT NULL,
  type varchar(15) DEFAULT NULL,
  quantite varchar(6) DEFAULT NULL,
  dimension_1 varchar(9) DEFAULT NULL,
  dimension_2 varchar(9) DEFAULT NULL,
  notes varchar(40) DEFAULT NULL,
  source varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_dessin_membrure
--

DROP TABLE IF EXISTS projet_dessin_membrure;

CREATE TABLE projet_dessin_membrure (
  no_membrure int(11)  NOT NULL DEFAULT '0',
  no_projet smallint(5)  NOT NULL DEFAULT '0',
  no_dessin mediumint(8)  NOT NULL DEFAULT '0',
  marque_piece varchar(16) DEFAULT NULL,
  numero smallint(5)  NOT NULL DEFAULT '1',
  sequence varchar(15) DEFAULT NULL,
  poids decimal(8)  NOT NULL DEFAULT '0.00',
  type varchar(5) DEFAULT NULL,
  description_i varchar(30) DEFAULT NULL,
  description_m varchar(30) DEFAULT NULL,
  longueur varchar(30) DEFAULT NULL,
  nuance varchar(15) DEFAULT NULL,
  code_barre tinyint(1)  NOT NULL DEFAULT '0',
  usine_quand datetime DEFAULT NULL,
  usine_actif tinyint(1)  NOT NULL DEFAULT '0',
  verification_quand datetime DEFAULT NULL,
  verification_qui smallint(6)  DEFAULT NULL,
  verification_finale_quand datetime DEFAULT NULL,
  verification_finale_qui smallint(5)  DEFAULT NULL,
  assemblage_qui smallint(5)  DEFAULT NULL,
  soudage_qui smallint(6)  NOT NULL DEFAULT '0',
  cancel tinyint(1)  NOT NULL DEFAULT '0',
  no_transport mediumint(9) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_dessin_verification_etat
--

DROP TABLE IF EXISTS projet_dessin_verification_etat;

CREATE TABLE projet_dessin_verification_etat (
  no_etat tinyint(3) NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  fond varchar(7) NOT NULL DEFAULT '#FFFFFF',
  texte varchar(7) NOT NULL DEFAULT '#000000',
  ordre tinyint(3)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1',
  verificateur tinyint(3)  NOT NULL DEFAULT '0',
  detailleur tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_dessin_verification_historique
--

DROP TABLE IF EXISTS projet_dessin_verification_historique;

CREATE TABLE projet_dessin_verification_historique (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '0',
  commentaire varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_document
--

DROP TABLE IF EXISTS projet_document;

CREATE TABLE projet_document (
  Id mediumint(9)  NOT NULL ,
  no_document mediumint(9)  DEFAULT NULL,
  no_reference smallint(6)  NOT NULL DEFAULT '0',
  no_projet smallint(6)  DEFAULT NULL,
  no_fichier smallint(6)  NOT NULL DEFAULT '1',
  no_type tinyint(3)  DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  description varchar(200) DEFAULT NULL,
  fichier varchar(200) DEFAULT NULL,
  no_societe mediumint(9)  DEFAULT NULL,
  societe varchar(100) DEFAULT NULL,
  code varchar(2) DEFAULT NULL,
  no_item smallint(6)  DEFAULT NULL,
  expediteur varchar(200) DEFAULT NULL,
  archive tinyint(1)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_document_type
--

DROP TABLE IF EXISTS projet_document_type;

CREATE TABLE projet_document_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  no_parent tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  no_departement smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_etat
--

DROP TABLE IF EXISTS projet_etat;

CREATE TABLE projet_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table projet_feuille_calcul
--

DROP TABLE IF EXISTS projet_feuille_calcul;

CREATE TABLE projet_feuille_calcul (
  no_feuille int(11) NOT NULL ,
  no_projet mediumint(9)  NOT NULL DEFAULT '0',
  version tinyint(3)  NOT NULL DEFAULT '2',
  titre varchar(50) DEFAULT NULL,
  matieres_premieres_pieces_principales_poids varchar(20) DEFAULT NULL,
  matieres_premieres_pieces_principales_couts varchar(20) DEFAULT NULL,
  matieres_premieres_connections_poids_pourcentage varchar(20) DEFAULT NULL,
  matieres_premieres_pertes_couts varchar(20) DEFAULT NULL,
  fournitures_fabrications_couts varchar(20) DEFAULT NULL,
  main_doeuvre_conception_honoraires_professionnels_s_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_honoraires_professionnels_f_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_depenses_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_usine_temps varchar(20) DEFAULT NULL,
  main_doeuvre_usine_taux varchar(20) DEFAULT NULL,
  main_doeuvre_dessin_temps varchar(20) DEFAULT NULL,
  main_doeuvre_dessin_taux varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_ing_connexions_interne_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_ing_connexions_st_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_depenses_cout varchar(20) DEFAULT NULL,
  main_doeuvre_fabrication_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_ingenierie_temps varchar(20) DEFAULT NULL,
  main_doeuvre_conception_ingenierie_taux varchar(20) DEFAULT NULL,
  main_doeuvre_conception_dessin_temps varchar(20) DEFAULT NULL,
  main_doeuvre_conception_dessin_taux varchar(20) DEFAULT NULL,
  main_doeuvre_fondation_temps varchar(20) DEFAULT NULL,
  main_doeuvre_fondation_taux varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_chantier_temps varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_chantier_taux varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_bureau_temps varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_bureau_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_quantite varchar(20) DEFAULT NULL,
  finition_galvanisation_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_cout varchar(20) DEFAULT NULL,
  finition_galvanisation_preparation_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_preparation_cout varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_quantite varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_cout varchar(20) DEFAULT NULL,
  finition_traitement_peinture_unite varchar(10) NOT NULL DEFAULT 'pi&sup2;',
  finition_traitement_peinture_quantite varchar(20) DEFAULT NULL,
  finition_traitement_peinture_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_preparation_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_prepartion_cout varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_quantite varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_cout varchar(20) DEFAULT NULL,
  finition_fini_architectural_unite varchar(10) NOT NULL DEFAULT 'pi&sup2;',
  finition_fini_architectural_quantite varchar(20) DEFAULT NULL,
  finition_fini_architectural_taux varchar(20) DEFAULT NULL,
  finition_fini_architectural_cout varchar(20) DEFAULT NULL,
  poutrelles_fournisseur varchar(100) DEFAULT NULL,
  poutrelles_unite varchar(20) DEFAULT NULL,
  poutrelles_poids varchar(20) DEFAULT NULL,
  poutrelles_couts varchar(20) DEFAULT NULL,
  tablier_metallique_fournisseur varchar(100) DEFAULT NULL,
  tablier_metallique_superficie varchar(20) DEFAULT NULL,
  tablier_metallique_couts varchar(20) DEFAULT NULL,
  montage_monteur varchar(100) DEFAULT NULL,
  montage_quantite varchar(20) DEFAULT NULL,
  montage_duree varchar(20) DEFAULT NULL,
  montage_couts varchar(20) DEFAULT NULL,
  montage_contingence_pourcentage varchar(20) DEFAULT NULL,
  montage_pension_couts varchar(20) DEFAULT NULL,
  montage_clous_vis_couts varchar(20) DEFAULT NULL,
  transport_lainco_quantite varchar(20) DEFAULT NULL,
  transport_lainco_taux varchar(20) DEFAULT NULL,
  transport_regulier_quantite varchar(20) DEFAULT NULL,
  transport_regulier_taux varchar(20) DEFAULT NULL,
  transport_couts varchar(20) DEFAULT NULL,
  vente_fabrication_frais_fixe varchar(20) DEFAULT NULL,
  vente_fabrication_ponderation varchar(20) DEFAULT NULL,
  vente_fabrication_benefices varchar(20) DEFAULT NULL,
  vente_sous_traitance_extra_pourcentage varchar(20) DEFAULT NULL,
  vente_sous_traitance_benefices_pourcentage varchar(20) DEFAULT NULL,
  vente_totale varchar(20) DEFAULT NULL,
  dep_200_avancement varchar(10) DEFAULT NULL,
  dep_200_cout_structures varchar(20) DEFAULT NULL,
  dep_200_cout_fondations varchar(20) DEFAULT NULL,
  dep_200_depenses varchar(20) DEFAULT NULL,
  dep_200_sous_traitance varchar(20) DEFAULT NULL,
  dep_300_cout_structures varchar(20) DEFAULT NULL,
  dep_300_pourcentage_stick varchar(10) DEFAULT NULL,
  dep_300_pourcentage_3d varchar(10) DEFAULT NULL,
  dep_300_pourcentage_2d varchar(10) DEFAULT NULL,
  dep_300_pourcentage_gestion varchar(10) DEFAULT NULL,
  dep_300_avancement_stick varchar(10) DEFAULT NULL,
  dep_300_avancement_3d varchar(10) DEFAULT NULL,
  dep_300_avancement_2d varchar(10) DEFAULT NULL,
  dep_300_avancement_gestion varchar(10) DEFAULT NULL,
  dep_400_avancement varchar(10) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0'
)  ;

--
-- Table structure for table projet_feuille_calcul_items
--

DROP TABLE IF EXISTS projet_feuille_calcul_items;

CREATE TABLE projet_feuille_calcul_items (
  Id int(11) NOT NULL ,
  no_feuille int(11)  DEFAULT NULL,
  item varchar(100) DEFAULT NULL,
  quantite varchar(20) DEFAULT NULL,
  taux varchar(20) DEFAULT NULL,
  couts varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_formulaire
--

DROP TABLE IF EXISTS projet_formulaire;

CREATE TABLE projet_formulaire (
  Id int(11)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_reference mediumint(9)  DEFAULT NULL,
  no_formulaire smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  note text,
  nbr_champs tinyint(3)  NOT NULL DEFAULT '0',
  version smallint(4)  NOT NULL DEFAULT '1',
  version_header tinyint(3)  NOT NULL DEFAULT '1',
  version_footer tinyint(3)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_formulaire_details
--

DROP TABLE IF EXISTS projet_formulaire_details;

CREATE TABLE projet_formulaire_details (
  Id int(11)  NOT NULL ,
  no_formulaire smallint(6)  DEFAULT NULL,
  no_reference mediumint(9)  DEFAULT NULL,
  no_champ tinyint(3)  DEFAULT NULL,
  valeur text)  ;

--
-- Table structure for table projet_historique
--

DROP TABLE IF EXISTS projet_historique;

CREATE TABLE projet_historique (
  Id smallint(6)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  item varchar(100) DEFAULT NULL,
  valeur_avant varchar(100) DEFAULT NULL,
  valeur_apres varchar(100) DEFAULT NULL,
  note varchar(100) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_non_conformite
--

DROP TABLE IF EXISTS projet_non_conformite;

CREATE TABLE projet_non_conformite (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  quantite tinyint(3)  DEFAULT NULL,
  commentaires text,
  reference varchar(30) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  fichier1 varchar(20) DEFAULT NULL,
  fichier2 varchar(20) DEFAULT NULL,
  fichier3 varchar(20) DEFAULT NULL,
  fichier4 varchar(20) DEFAULT NULL,
  fichier5 varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  no_transmission mediumint(8) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_non_conformite_code
--

DROP TABLE IF EXISTS projet_non_conformite_code;

CREATE TABLE projet_non_conformite_code (
  Id smallint(5)  NOT NULL ,
  code varchar(5) DEFAULT NULL,
  groupe varchar(50) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  correction text)  ;

--
-- Table structure for table projet_non_conformite_transmission
--

DROP TABLE IF EXISTS projet_non_conformite_transmission;

CREATE TABLE projet_non_conformite_transmission (
  no_transmission int(11) NOT NULL DEFAULT '0',
  no_projet smallint(6)  DEFAULT NULL,
  objet varchar(255) DEFAULT NULL,
  message text,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0') ;

--
-- Table structure for table projet_non_conformite_transmission_destinataire
--

DROP TABLE IF EXISTS projet_non_conformite_transmission_destinataire;

CREATE TABLE projet_non_conformite_transmission_destinataire (
  Id int(11) NOT NULL ,
  no_transmission mediumint(8)  NOT NULL DEFAULT '0',
  no_projet smallint(6)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_plan
--

DROP TABLE IF EXISTS projet_plan;

CREATE TABLE projet_plan (
  no_plan mediumint(8)  NOT NULL DEFAULT '0',
  no_parent mediumint(8)  NOT NULL DEFAULT '0',
  no_projet smallint(5)  DEFAULT NULL,
  plan varchar(15) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  revision varchar(2) NOT NULL DEFAULT '0',
  no_type tinyint(3)  DEFAULT NULL,
  pdf varchar(20) DEFAULT NULL,
  pdf_date date DEFAULT NULL,
  pdf_qui smallint(6) DEFAULT NULL,
  pdf_groupe tinyint(1)  NOT NULL DEFAULT '0',
  dwg varchar(20) DEFAULT NULL,
  dwg_date date DEFAULT NULL,
  dwg_qui smallint(6) DEFAULT NULL,
  no_emission mediumint(8)  NOT NULL DEFAULT '0',
  sceau tinyint(1)  NOT NULL DEFAULT '0',
  emis_construction tinyint(1)  NOT NULL DEFAULT '0',
  notes varchar(255) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  DEFAULT NULL) ;

--
-- Table structure for table projet_plan_emission
--

DROP TABLE IF EXISTS projet_plan_emission;

CREATE TABLE projet_plan_emission (
  no_emission mediumint(8)  NOT NULL DEFAULT '0',
  no_projet smallint(6)  NOT NULL DEFAULT '0',
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  description varchar(50) DEFAULT NULL,
  emission varchar(10) DEFAULT NULL,
  revision varchar(3) NOT NULL DEFAULT '0',
  sceau_requis tinyint(1)  NOT NULL DEFAULT '0',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  courriel_destinataire varchar(10) DEFAULT NULL,
  courriel_langage char(2) NOT NULL DEFAULT 'fr',
  courriel_objet varchar(255) DEFAULT NULL,
  courriel_message text,
  courriel_confirmation_lecture tinyint(1)  NOT NULL DEFAULT '1',
  transmission_quand datetime DEFAULT NULL,
  transmission_qui smallint(5)  DEFAULT NULL,
  transmission_avant_sceau tinyint(1)  NOT NULL DEFAULT '0',
  transmission_approbation tinyint(1)  NOT NULL DEFAULT '0',
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(5)  NOT NULL DEFAULT '0') ;

--
-- Table structure for table projet_plan_emission_cc
--

DROP TABLE IF EXISTS projet_plan_emission_cc;

CREATE TABLE projet_plan_emission_cc (
  Id int(11) NOT NULL ,
  no_emission mediumint(9)  NOT NULL DEFAULT '0',
  code varchar(2) DEFAULT NULL,
  numero smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_plan_emission_plan
--

DROP TABLE IF EXISTS projet_plan_emission_plan;

CREATE TABLE projet_plan_emission_plan (
  Id int(11) NOT NULL ,
  no_emission mediumint(8)  NOT NULL DEFAULT '0',
  no_plan mediumint(9)  NOT NULL DEFAULT '0',
  no_projet smallint(5)  DEFAULT NULL,
  revision varchar(2) DEFAULT NULL,
  pdf varchar(20) DEFAULT NULL,
  dwg varchar(20) DEFAULT NULL,
  transmission_quand datetime DEFAULT NULL,
  transmission_qui smallint(6)  NOT NULL DEFAULT '0',
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_plan_emission_type
--

DROP TABLE IF EXISTS projet_plan_emission_type;

CREATE TABLE projet_plan_emission_type (
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  revision char(1) NOT NULL DEFAULT 'n',
  sceau_requis tinyint(1)  NOT NULL DEFAULT '0',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_plan_type
--

DROP TABLE IF EXISTS projet_plan_type;

CREATE TABLE projet_plan_type (
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  code varchar(3) DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table projet_production_lot
--

DROP TABLE IF EXISTS projet_production_lot;

CREATE TABLE projet_production_lot (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  lot varchar(10) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  externe tinyint(1)  NOT NULL DEFAULT '0',
  no_employe smallint(6)  DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  cree_quand datetime DEFAULT NULL)  ;

--
-- Table structure for table projet_production_lot_dessin
--

DROP TABLE IF EXISTS projet_production_lot_dessin;

CREATE TABLE projet_production_lot_dessin (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  lot varchar(10) DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  version tinyint(2)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_punch_verification
--

DROP TABLE IF EXISTS projet_punch_verification;

CREATE TABLE projet_punch_verification (
  no_verification int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  date date DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table projet_sous_projet
--

DROP TABLE IF EXISTS projet_sous_projet;

CREATE TABLE projet_sous_projet (
  Id smallint(6)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_parent smallint(6)  DEFAULT NULL,
  general tinyint(1)  NOT NULL DEFAULT '0',
  code_projet char(4) DEFAULT NULL,
  sous_projet char(3) DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  no_type_construction tinyint(3)  NOT NULL DEFAULT '0',
  soumission varchar(20) DEFAULT NULL,
  bon_commande varchar(20) DEFAULT NULL,
  titre varchar(255) DEFAULT NULL,
  notes text,
  no_item_vente mediumint(8)  NOT NULL DEFAULT '0',
  dep_100 tinyint(3)  NOT NULL DEFAULT '1',
  dep_200 tinyint(1)  NOT NULL DEFAULT '1',
  dep_300 tinyint(1)  NOT NULL DEFAULT '1',
  dep_400 tinyint(1)  NOT NULL DEFAULT '1',
  dep_500 tinyint(1)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_sous_projet_dessin
--

DROP TABLE IF EXISTS projet_sous_projet_dessin;

CREATE TABLE projet_sous_projet_dessin (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_parent smallint(5)  DEFAULT NULL,
  no_dessin mediumint(8)  DEFAULT NULL,
  fait_quand datetime DEFAULT NULL,
  fait_qui smallint(5)  DEFAULT NULL
)  ;

--
-- Table structure for table projet_sous_projet_fichier
--

DROP TABLE IF EXISTS projet_sous_projet_fichier;

CREATE TABLE projet_sous_projet_fichier (
  Id int(11) NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_document mediumint(8)  NOT NULL DEFAULT '0',
  fichier varchar(100) DEFAULT NULL)  ;

--
-- Table structure for table projet_sous_projet_standard
--

DROP TABLE IF EXISTS projet_sous_projet_standard;

CREATE TABLE projet_sous_projet_standard (
  no_sous_projet tinyint(3)  NOT NULL ,
  titre varchar(50) DEFAULT NULL,
  dep_100 tinyint(1)  NOT NULL DEFAULT '1',
  dep_200 tinyint(1)  NOT NULL DEFAULT '1',
  dep_300 tinyint(1)  NOT NULL DEFAULT '1',
  dep_400 tinyint(1)  NOT NULL DEFAULT '1',
  dep_500 tinyint(1)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_sous_projet_type
--

DROP TABLE IF EXISTS projet_sous_projet_type;

CREATE TABLE projet_sous_projet_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  facturable tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table projet_spec_detaillage
--

DROP TABLE IF EXISTS projet_spec_detaillage;

CREATE TABLE projet_spec_detaillage (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  responsable_charge_projet smallint(5)  NOT NULL DEFAULT '0',
  responsable_charge_projet2 smallint(5)  NOT NULL DEFAULT '0',
  responsable_verificateur smallint(5)  NOT NULL DEFAULT '0',
  responsable_coordonnateur smallint(5)  NOT NULL DEFAULT '0',
  approbation varchar(12) DEFAULT NULL,
  approbation_no_destinataire smallint(5)  NOT NULL DEFAULT '0',
  approbation_no_cc varchar(20) DEFAULT NULL,
  approbation_diffusion_courriel tinyint(1)  NOT NULL DEFAULT '0',
  approbation_diffusion_papier tinyint(1)  NOT NULL DEFAULT '0',
  approbation_diffusion_papier_nbr varchar(20) DEFAULT NULL,
  approbation_diffusion_autre tinyint(1)  NOT NULL DEFAULT '0',
  approbation_diffusion_autre_description varchar(50) DEFAULT NULL,
  inclusion_plan_dessins_ancrages tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_soufflage_entremises tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_cablage_securite tinyint(1)  NOT NULL DEFAULT '0',
  inclusion_cablage_securite_type varchar(10) NOT NULL DEFAULT '0',
  inclusion_cablage_securite_autre_fichier varchar(100) DEFAULT NULL,
  inclusion_plaques_fermeture_pontage tinyint(1)  NOT NULL DEFAULT '0',
  connexion_opt1_l1 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_opt1_l2 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_opt1_l3 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_opt1_l4 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_opt1_l5 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_opt1_l6 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_opt2_l1 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_opt2_l2 varchar(20) NOT NULL DEFAULT 'CLIPS SOUDES/BOUL.',
  connexion_opt2_l3 varchar(20) NOT NULL DEFAULT 'KNIFE CONNECTION',
  connexion_opt2_l4 varchar(20) NOT NULL DEFAULT 'CLIPS SOUDES/BOUL.',
  connexion_opt2_l5 varchar(20) NOT NULL DEFAULT 'KNIFE CONNECTION',
  connexion_opt2_l6 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_galv_l1 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_galv_l2 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_galv_l3 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_galv_l4 varchar(20) NOT NULL DEFAULT 'END PLATE',
  connexion_galv_l5 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_galv_l6 varchar(20) NOT NULL DEFAULT 'SHEAR PLATE',
  connexion_nombre_rangees_boulons varchar(10) DEFAULT NULL,
  connexion_nombre_rangees_boulons_autre_description varchar(50) DEFAULT NULL,
  connexion_nombre_rangees_boulons_quand datetime DEFAULT NULL,
  connexion_nombre_rangees_boulons_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_charges_ponderees varchar(3) DEFAULT NULL,
  connexion_charges_ponderees_non_description varchar(50) DEFAULT NULL,
  connexion_charges_ponderees_quand datetime DEFAULT NULL,
  connexion_charges_ponderees_qui smallint(5)  NOT NULL DEFAULT '0',
  connexion_design_UDL varchar(10) DEFAULT NULL,
  connexion_design_UDL_autre_description varchar(50) DEFAULT NULL,
  connexion_design_UDL_quand datetime DEFAULT NULL,
  connexion_design_UDL_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_charges_axiales varchar(3) DEFAULT NULL,
  connexion_charges_axiales_non_description varchar(50) DEFAULT NULL,
  connexion_charges_axiales_quand datetime DEFAULT NULL,
  connexion_charges_axiales_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_contreventements_verticaux varchar(20) DEFAULT NULL,
  connexion_contreventements_verticaux_autre_description varchar(50) DEFAULT NULL,
  connexion_contreventements_verticaux_quand datetime DEFAULT NULL,
  connexion_contreventements_verticaux_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_contreventements_horizontaux varchar(50) DEFAULT NULL,
  connexion_contreventements_horizontaux_quand datetime DEFAULT NULL,
  connexion_contreventements_horizontaux_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_poutres_composees_charge varchar(50) DEFAULT NULL,
  connexion_poutres_composees_charge_quand datetime DEFAULT NULL,
  connexion_poutres_composees_charge_qui smallint(6)  NOT NULL DEFAULT '0',
  connexion_tiges_entremise varchar(20) DEFAULT NULL,
  connexion_tiges_entremise_autre_description varchar(50) DEFAULT NULL,
  connexion_tiges_entremise_quand datetime DEFAULT NULL,
  connexion_tiges_entremise_qui mediumint(9)  NOT NULL DEFAULT '0',
  connexion_boulons varchar(255) DEFAULT NULL,
  verification_version_SDS2 varchar(20) DEFAULT NULL,
  verification_grade_acier_connexion_dc tinyint(1) NOT NULL DEFAULT '0',
  verification_grade_acier_connexion_dc_quand datetime DEFAULT NULL,
  verification_grade_acier_connexion_dc_qui smallint(6)  NOT NULL DEFAULT '0',
  verification_grade_acier_connexion_sfc tinyint(1)  NOT NULL DEFAULT '0',
  verification_grade_acier_connexion_sfc_quand datetime DEFAULT NULL,
  verification_grade_acier_connexion_sfc_qui smallint(5)  NOT NULL DEFAULT '0',
  verification_grade_acier tinyint(1)  NOT NULL DEFAULT '0',
  verification_grade_acier_quand datetime DEFAULT NULL,
  verification_grade_acier_qui smallint(5)  NOT NULL DEFAULT '0',
  verification_marques_prefixes tinyint(1)  NOT NULL DEFAULT '0',
  verification_marques_prefixes_quand datetime DEFAULT NULL,
  verification_marques_prefixes_qui smallint(5)  NOT NULL DEFAULT '0',
  verification_cartouche tinyint(1)  NOT NULL DEFAULT '0',
  verification_cartouche_quand datetime DEFAULT NULL,
  verification_cartouche_qui smallint(5)  NOT NULL DEFAULT '0',
  notes text)  ;

--
-- Table structure for table projet_spec_fabrication
--

DROP TABLE IF EXISTS projet_spec_fabrication;

CREATE TABLE projet_spec_fabrication (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  responsable_acheteur smallint(5)  NOT NULL DEFAULT '0',
  responsable_coordonnateur smallint(5)  NOT NULL DEFAULT '0',
  essais_non_destructifs varchar(20) DEFAULT NULL,
  essais_non_destructifs_ultrasons tinyint(1)  NOT NULL DEFAULT '0',
  essais_non_destructifs_ultrasons_notes varchar(255) DEFAULT NULL,
  essais_non_destructifs_particules_magnetiques tinyint(1)  NOT NULL DEFAULT '0',
  essais_non_destructifs_particules_magnetiques_notes varchar(255) DEFAULT NULL,
  essais_non_destructifs_radiographies tinyint(1)  NOT NULL DEFAULT '0',
  essais_non_destructifs_radiographies_notes varchar(255) DEFAULT NULL,
  marquage_pieces_etiquettes_metalliques tinyint(1)  NOT NULL DEFAULT '0',
  marquage_pieces_embossage_interdit tinyint(1)  NOT NULL DEFAULT '0',
  marquage_pieces_autre tinyint(1)  NOT NULL DEFAULT '0',
  marquage_pieces_autre_notes varchar(255) DEFAULT NULL,
  nettoyage_acier_soudures_uniformes_lisses tinyint(1)  NOT NULL DEFAULT '0',
  nettoyage_acier_nettoyer tinyint(1)  NOT NULL DEFAULT '0',
  nettoyage_adoucir_bords_coupants tinyint(1)  NOT NULL DEFAULT '0',
  nettoyage_autre tinyint(1)  NOT NULL DEFAULT '0',
  nettoyage_autre_notes varchar(255) DEFAULT NULL,
  soudage_soudures_completes_raidisseurs tinyint(1)  NOT NULL DEFAULT '0',
  soudage_autre tinyint(1)  NOT NULL DEFAULT '0',
  soudage_autre_notes varchar(255) DEFAULT NULL,
  achat_acier_bleu tinyint(1)  NOT NULL DEFAULT '0',
  achat_acier_autre tinyint(1)  NOT NULL DEFAULT '0',
  achat_acier_autre_notes varchar(255) DEFAULT NULL,
  inspection_client varchar(3) NOT NULL DEFAULT '0',
  inspection_client_notes varchar(255) DEFAULT NULL,
  notes text)  ;

--
-- Table structure for table projet_spec_materiel
--

DROP TABLE IF EXISTS projet_spec_materiel;

CREATE TABLE projet_spec_materiel (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  type varchar(5) DEFAULT NULL,
  description varchar(50) DEFAULT NULL,
  code varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi
--

DROP TABLE IF EXISTS projet_suivi;

CREATE TABLE projet_suivi (
  Id int(11) NOT NULL ,
  no_transaction mediumint(9)  DEFAULT NULL,
  no_projet smallint(5)  DEFAULT NULL,
  no_reference mediumint(8)  NOT NULL DEFAULT '0',
  no_parent mediumint(8)  NOT NULL DEFAULT '0',
  code_item varchar(7) DEFAULT NULL,
  description text,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  type char(1) DEFAULT NULL,
  expediteur_code varchar(3) DEFAULT NULL,
  expediteur_no mediumint(8)  DEFAULT NULL,
  expediteur_nom varchar(75) DEFAULT NULL,
  expediteur_courriel varchar(75) DEFAULT NULL,
  destinataire_code varchar(3) DEFAULT NULL,
  destinataire_no mediumint(8)  DEFAULT NULL,
  destinataire_nom varchar(75) DEFAULT NULL,
  destinataire_courriel varchar(75) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  transmission_quand datetime DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_cc
--

DROP TABLE IF EXISTS projet_suivi_cc;

CREATE TABLE projet_suivi_cc (
  Id mediumint(9)  NOT NULL ,
  no_transaction mediumint(9)  DEFAULT NULL,
  no_projet smallint(5)  DEFAULT NULL,
  code_cc varchar(2) DEFAULT NULL,
  no_cc smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_etat
--

DROP TABLE IF EXISTS projet_suivi_etat;

CREATE TABLE projet_suivi_etat (
  Id tinyint(3) NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  fond char(7) NOT NULL DEFAULT '#FFFFFF',
  texte char(7) NOT NULL DEFAULT '#000000',
  ordre tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_fichier
--

DROP TABLE IF EXISTS projet_suivi_fichier;

CREATE TABLE projet_suivi_fichier (
  Id int(11) NOT NULL ,
  no_transaction mediumint(8)  DEFAULT NULL,
  no_projet smallint(5)  DEFAULT NULL,
  no_document mediumint(8)  NOT NULL DEFAULT '0',
  fichier varchar(100) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_groupe
--

DROP TABLE IF EXISTS projet_suivi_groupe;

CREATE TABLE projet_suivi_groupe (
  Id int(11) NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  no_groupe tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  destinataire char(10) DEFAULT NULL,
  cc varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_item
--

DROP TABLE IF EXISTS projet_suivi_item;

CREATE TABLE projet_suivi_item (
  Id mediumint(9)  NOT NULL ,
  no_projet smallint(6)  DEFAULT NULL,
  sous_projet varchar(2) NOT NULL DEFAULT '00',
  no_item smallint(6)  DEFAULT NULL,
  no_transaction mediumint(9)  NOT NULL DEFAULT '0',
  no_departement smallint(5)  DEFAULT NULL,
  rfi tinyint(1)  NOT NULL DEFAULT '0',
  code_item varchar(15) DEFAULT NULL,
  description text,
  date_max date DEFAULT NULL,
  reponseId mediumint(9)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_item_etat
--

DROP TABLE IF EXISTS projet_suivi_item_etat;

CREATE TABLE projet_suivi_item_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_item_fichier
--

DROP TABLE IF EXISTS projet_suivi_item_fichier;

CREATE TABLE projet_suivi_item_fichier (
  Id mediumint(9)  NOT NULL ,
  itemId mediumint(9)  DEFAULT NULL,
  no_document mediumint(9)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_item_rappel
--

DROP TABLE IF EXISTS projet_suivi_item_rappel;

CREATE TABLE projet_suivi_item_rappel (
  Id mediumint(9)  NOT NULL ,
  itemId mediumint(9)  DEFAULT NULL,
  no_transaction mediumint(9)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_rappel
--

DROP TABLE IF EXISTS projet_suivi_rappel;

CREATE TABLE projet_suivi_rappel (
  Id mediumint(9)  NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_rappel smallint(5)  DEFAULT NULL,
  destinataire_code varchar(3) DEFAULT NULL,
  destinataire_no smallint(5)  DEFAULT NULL,
  destinataire_nom varchar(75) DEFAULT NULL,
  destinataire_courriel varchar(75) DEFAULT NULL,
  objet varchar(255) DEFAULT NULL,
  message text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_rappel_cc
--

DROP TABLE IF EXISTS projet_suivi_rappel_cc;

CREATE TABLE projet_suivi_rappel_cc (
  Id mediumint(9)  NOT NULL ,
  no_projet smallint(5)  DEFAULT NULL,
  no_rappel smallint(5)  DEFAULT NULL,
  code_cc varchar(2) DEFAULT NULL,
  no_cc smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_rappel_item
--

DROP TABLE IF EXISTS projet_suivi_rappel_item;

CREATE TABLE projet_suivi_rappel_item (
  Id int(11) NOT NULL ,
  no_projet smallint(6) DEFAULT NULL,
  no_rappel smallint(5)  DEFAULT NULL,
  no_transaction mediumint(8)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_transaction
--

DROP TABLE IF EXISTS projet_suivi_transaction;

CREATE TABLE projet_suivi_transaction (
  Id mediumint(9)  NOT NULL ,
  no_transaction mediumint(9)  DEFAULT NULL,
  no_projet smallint(6)  DEFAULT NULL,
  code char(1) DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  no_type_communication tinyint(3)  DEFAULT NULL,
  code_expediteur varchar(2) DEFAULT NULL,
  no_expediteur smallint(6)  DEFAULT NULL,
  code_destinataire varchar(2) DEFAULT NULL,
  no_destinataire smallint(6)  DEFAULT NULL,
  no_document mediumint(9)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  creation_date datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_transaction_cc
--

DROP TABLE IF EXISTS projet_suivi_transaction_cc;

CREATE TABLE projet_suivi_transaction_cc (
  Id mediumint(9)  NOT NULL ,
  no_transaction mediumint(9)  DEFAULT NULL,
  code varchar(2) DEFAULT NULL,
  no_item smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  courriel varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table projet_suivi_transaction_type
--

DROP TABLE IF EXISTS projet_suivi_transaction_type;

CREATE TABLE projet_suivi_transaction_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  e tinyint(1)  NOT NULL DEFAULT '0',
  r tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_suivi_transaction_type_communication
--

DROP TABLE IF EXISTS projet_suivi_transaction_type_communication;

CREATE TABLE projet_suivi_transaction_type_communication (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  image varchar(30) DEFAULT NULL,
  e_s tinyint(1) NOT NULL DEFAULT '0',
  e_r tinyint(1)  NOT NULL DEFAULT '0',
  r_s tinyint(1)  NOT NULL DEFAULT '0',
  r_r tinyint(1)  NOT NULL DEFAULT '0',
  ra tinyint(1)  NOT NULL DEFAULT '0',
  ed tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table projet_type
--

DROP TABLE IF EXISTS projet_type;

CREATE TABLE projet_type (
  Id int(11) NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table projet_type_categorie
--

DROP TABLE IF EXISTS projet_type_categorie;

CREATE TABLE projet_type_categorie (
  no_categorie tinyint(3)  NOT NULL ,
  no_type tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table projet_type_construction
--

DROP TABLE IF EXISTS projet_type_construction;

CREATE TABLE projet_type_construction (
  Id tinyint(3)  NOT NULL ,
  no_type_construction tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table rnd
--

DROP TABLE IF EXISTS rnd;

CREATE TABLE rnd (
  Id mediumint(9)  NOT NULL ,
  no_rnd mediumint(9)  DEFAULT NULL,
  code varchar(5) DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(150) DEFAULT NULL,
  description text,
  objectifs text,
  incertitudes text,
  hypothese text,
  problematique text,
  no_responsable smallint(6)  DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  en_production tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table rnd_etat
--

DROP TABLE IF EXISTS rnd_etat;

CREATE TABLE rnd_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table rnd_type
--

DROP TABLE IF EXISTS rnd_type;

CREATE TABLE rnd_type (
  Id tinyint(3)  NOT NULL ,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table smq_departement
--

DROP TABLE IF EXISTS smq_departement;

CREATE TABLE smq_departement (
  no_departement smallint(6)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  code varchar(2) DEFAULT NULL) ;

--
-- Table structure for table smq_departement_responsable
--

DROP TABLE IF EXISTS smq_departement_responsable;

CREATE TABLE smq_departement_responsable (
  Id smallint(5)  NOT NULL ,
  no_departement smallint(6)  NOT NULL DEFAULT '0',
  no_employe smallint(5)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_document
--

DROP TABLE IF EXISTS smq_document;

CREATE TABLE smq_document (
  no_document int(11) NOT NULL ,
  no_parent int(11)  NOT NULL DEFAULT '0',
  externe tinyint(1)  NOT NULL DEFAULT '0',
  reference varchar(100) DEFAULT NULL,
  no_type smallint(5)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  numero smallint(4) DEFAULT NULL,
  nom varchar(60) DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  revision varchar(20) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  mots_cles varchar(100) DEFAULT NULL,
  date date DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  no_societe smallint(5)  NOT NULL DEFAULT '1',
  societe varchar(40) DEFAULT NULL,
  no_emetteur smallint(5)  NOT NULL DEFAULT '0',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0',
  approbation_demande varchar(30) DEFAULT NULL,
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(5)  NOT NULL DEFAULT '0',
  suppression_quand datetime DEFAULT NULL,
  suppression_qui smallint(5)  NOT NULL DEFAULT '0',
  archive tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_document_reference
--

DROP TABLE IF EXISTS smq_document_reference;

CREATE TABLE smq_document_reference (
  Id int(11) NOT NULL ,
  no_document mediumint(8)  NOT NULL DEFAULT '0',
  no_reference mediumint(9)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_document_type
--

DROP TABLE IF EXISTS smq_document_type;

CREATE TABLE smq_document_type (
  no_type smallint(6) NOT NULL ,
  no_parent smallint(6)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL,
  code varchar(1) DEFAULT NULL,
  externe tinyint(1)  NOT NULL DEFAULT '0',
  actif tinyint(1)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table smq_nonconformite_cout
--

DROP TABLE IF EXISTS smq_nonconformite_cout;

CREATE TABLE smq_nonconformite_cout (
  Id int(11) NOT NULL ,
  code varchar(3) DEFAULT NULL,
  numero smallint(6)  DEFAULT NULL,
  description varchar(50) DEFAULT NULL,
  cout mediumint(8)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_dac
--

DROP TABLE IF EXISTS smq_nonconformite_dac;

CREATE TABLE smq_nonconformite_dac (
  no_dac int(11) NOT NULL ,
  numero smallint(5)  DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  date date DEFAULT NULL,
  titre varchar(75) DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  no_emetteur smallint(5)  DEFAULT NULL,
  responsable char(1) NOT NULL DEFAULT 'e',
  description text,
  cause text,
  actions_description text,
  action_plan tinyint(1)  NOT NULL DEFAULT '0',
  no_plan smallint(6)  NOT NULL DEFAULT '0',
  couts varchar(20) DEFAULT NULL,
  no_responsable_verification smallint(5)  NOT NULL DEFAULT '0',
  date_verification date DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0',
  annulation_quand datetime DEFAULT NULL,
  annulation_qui smallint(6)  NOT NULL DEFAULT '0',
  annulation_raison varchar(100) DEFAULT NULL,
  fermeture_quand datetime DEFAULT NULL,
  fermeture_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_etat
--

DROP TABLE IF EXISTS smq_nonconformite_etat;

CREATE TABLE smq_nonconformite_etat (
  no_etat tinyint(3) NOT NULL ,
  nom varchar(25) DEFAULT NULL,
  nc tinyint(1)  NOT NULL DEFAULT '0',
  ncg tinyint(1)  NOT NULL DEFAULT '0',
  oa tinyint(1)  NOT NULL DEFAULT '0',
  dac tinyint(1)  NOT NULL DEFAULT '0',
  modifiable tinyint(1)  NOT NULL DEFAULT '1',
  reouverture tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_fichier
--

DROP TABLE IF EXISTS smq_nonconformite_fichier;

CREATE TABLE smq_nonconformite_fichier (
  no_fichier int(11) NOT NULL ,
  code varchar(3) DEFAULT NULL,
  numero mediumint(9) DEFAULT NULL,
  description varchar(50) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table smq_nonconformite_nc
--

DROP TABLE IF EXISTS smq_nonconformite_nc;

CREATE TABLE smq_nonconformite_nc (
  no_nc int(11) NOT NULL ,
  numero smallint(5) DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  no_projet smallint(6)  DEFAULT NULL,
  date date DEFAULT NULL,
  titre varchar(75) DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  no_emetteur smallint(5)  DEFAULT NULL,
  responsable char(1) NOT NULL DEFAULT 'e',
  description text,
  cause text,
  actions_description text,
  action_plan tinyint(3)  NOT NULL DEFAULT '0',
  no_plan smallint(5)  NOT NULL DEFAULT '0',
  couts varchar(20) DEFAULT NULL,
  impact_echeancier varchar(50) DEFAULT NULL,
  no_responsable_verification smallint(6)  NOT NULL DEFAULT '0',
  date_verification date DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  annulation_quand datetime DEFAULT NULL,
  annulation_qui smallint(6)  NOT NULL DEFAULT '0',
  annulation_raison varchar(100) DEFAULT NULL,
  fermeture_quand datetime DEFAULT NULL,
  fermeture_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_ncg
--

DROP TABLE IF EXISTS smq_nonconformite_ncg;

CREATE TABLE smq_nonconformite_ncg (
  no_ncg int(11) NOT NULL ,
  numero smallint(6) DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  date date DEFAULT NULL,
  titre varchar(75) DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  no_emetteur smallint(5)  DEFAULT NULL,
  responsable char(1) NOT NULL DEFAULT 'e',
  description text,
  cause text,
  actions_description text,
  action_plan tinyint(1)  NOT NULL DEFAULT '0',
  no_plan smallint(5)  NOT NULL DEFAULT '0',
  couts varchar(20) DEFAULT NULL,
  no_responsable_verification smallint(5)  DEFAULT NULL,
  date_verification date DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  annulation_quand datetime DEFAULT NULL,
  annulation_qui smallint(6)  NOT NULL DEFAULT '0',
  annulation_raison varchar(100) DEFAULT NULL,
  fermeture_quand datetime DEFAULT NULL,
  fermeture_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_oa
--

DROP TABLE IF EXISTS smq_nonconformite_oa;

CREATE TABLE smq_nonconformite_oa (
  no_oa int(11) NOT NULL ,
  numero smallint(6)  DEFAULT NULL,
  reference varchar(20) DEFAULT NULL,
  date date DEFAULT NULL,
  titre varchar(75) DEFAULT NULL,
  no_departement smallint(6)  DEFAULT NULL,
  no_emetteur smallint(6)  DEFAULT NULL,
  responsable char(1) NOT NULL DEFAULT 'e',
  description text,
  objectifs text,
  benefices_estimes varchar(75) DEFAULT NULL,
  contraintes_ressource varchar(100) DEFAULT NULL,
  projet_amelioration tinyint(1)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '4',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  DEFAULT NULL,
  annulation_quand datetime DEFAULT NULL,
  annulation_qui smallint(5)  NOT NULL DEFAULT '0',
  annulation_raison varchar(100) DEFAULT NULL,
  fermeture_quand datetime DEFAULT NULL,
  fermeture_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table smq_nonconformite_responsable
--

DROP TABLE IF EXISTS smq_nonconformite_responsable;

CREATE TABLE smq_nonconformite_responsable (
  no_responsable int(11) NOT NULL ,
  code varchar(3) DEFAULT NULL,
  numero smallint(6)  DEFAULT NULL,
  type char(1) NOT NULL DEFAULT 'e',
  no_reference smallint(5) DEFAULT NULL)  ;

--
-- Table structure for table smq_nonconformite_type
--

DROP TABLE IF EXISTS smq_nonconformite_type;

CREATE TABLE smq_nonconformite_type (
  no_type smallint(6) NOT NULL ,
  no_departement smallint(6) DEFAULT NULL,
  nom varchar(100) DEFAULT NULL)  ;

--
-- Table structure for table smq_plan_action
--

DROP TABLE IF EXISTS smq_plan_action;

CREATE TABLE smq_plan_action (
  no_plan mediumint(9) NOT NULL ,
  reference varchar(20) DEFAULT NULL,
  parent_code varchar(3) DEFAULT NULL,
  parent_numero mediumint(9)  NOT NULL DEFAULT '0',
  parent_reference varchar(20) DEFAULT NULL,
  date date DEFAULT NULL,
  titre varchar(75) DEFAULT NULL,
  objectifs text,
  no_responsable smallint(5)  NOT NULL DEFAULT '0',
  note varchar(255) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  actif tinyint(1) NOT NULL DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table smq_plan_action_tache
--

DROP TABLE IF EXISTS smq_plan_action_tache;

CREATE TABLE smq_plan_action_tache (
  no_tache int(11) NOT NULL ,
  no_plan mediumint(9) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  no_responsable smallint(5)  NOT NULL DEFAULT '0',
  date_due date DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  no_etat tinyint(3)  DEFAULT '1',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0') ;

--
-- Table structure for table smq_plan_action_tache_etat
--

DROP TABLE IF EXISTS smq_plan_action_tache_etat;

CREATE TABLE smq_plan_action_tache_etat (
  no_etat tinyint(3)  NOT NULL ,
  nom varchar(25) DEFAULT NULL)  ;

--
-- Table structure for table societe
--

DROP TABLE IF EXISTS societe;

CREATE TABLE societe (
  Id smallint(6) NOT NULL ,
  no_societe smallint(6)  DEFAULT NULL,
  nom varchar(100) DEFAULT NULL,
  prefixe varchar(15) DEFAULT NULL,
  adresse varchar(200) DEFAULT NULL,
  ville varchar(100) DEFAULT NULL,
  province varchar(50) DEFAULT 'Québec',
  pays varchar(30) NOT NULL DEFAULT 'Canada',
  distance varchar(10) DEFAULT NULL,
  code_postal varchar(15) DEFAULT NULL,
  telephone_1 varchar(30) DEFAULT NULL,
  telephone_2 varchar(30) DEFAULT NULL,
  fax varchar(20) DEFAULT NULL,
  web varchar(200) DEFAULT NULL,
  logo varchar(10) DEFAULT NULL,
  code_acces varchar(20) DEFAULT NULL,
  no_compte smallint(5)  NOT NULL DEFAULT '0',
  achat_no_taxe tinyint(3)  NOT NULL DEFAULT '3',
  achat_devise varchar(3) NOT NULL DEFAULT 'CAN',
  achat_langage char(2) NOT NULL DEFAULT 'fr',
  fournisseur_fabtrol varchar(30) DEFAULT NULL,
  soumission_pourcentage_profit float(3)  NOT NULL DEFAULT '5.0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1',
  approbation_quand date DEFAULT NULL,
  approbation_qui smallint(6)  NOT NULL DEFAULT '0',
  no_etat_approbation tinyint(3)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table societe_categorie
--

DROP TABLE IF EXISTS societe_categorie;

CREATE TABLE societe_categorie (
  no_categorie tinyint(3) NOT NULL ,
  nom varchar(50) DEFAULT NULL,
  achat tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table societe_categorie_societe
--

DROP TABLE IF EXISTS societe_categorie_societe;

CREATE TABLE societe_categorie_societe (
  Id int(11) NOT NULL ,
  no_societe smallint(6)  DEFAULT NULL,
  no_categorie tinyint(3)  DEFAULT NULL)  ;

--
-- Table structure for table societe_contact
--

DROP TABLE IF EXISTS societe_contact;

CREATE TABLE societe_contact (
  Id smallint(6) NOT NULL ,
  no_contact smallint(6)  DEFAULT NULL,
  no_societe smallint(6)  DEFAULT NULL,
  prenom varchar(50) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  titre varchar(100) DEFAULT NULL,
  telephone varchar(50) DEFAULT NULL,
  cellulaire varchar(50) DEFAULT NULL,
  courriel_1 varchar(100) DEFAULT NULL,
  nom_courriel_1 varchar(100) DEFAULT NULL,
  courriel_2 varchar(100) DEFAULT NULL,
  nom_courriel_2 varchar(100) DEFAULT NULL,
  categories varchar(100) DEFAULT NULL,
  initiales varchar(20) DEFAULT NULL,
  notes text,
  carte varchar(30) DEFAULT NULL,
  mot_cle varchar(100) DEFAULT NULL,
  actif tinyint(1)  NOT NULL DEFAULT '1',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table societe_contrat
--

DROP TABLE IF EXISTS societe_contrat;

CREATE TABLE societe_contrat (
  no_contrat smallint(6) NOT NULL DEFAULT '0',
  no_societe smallint(6) DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '1',
  description varchar(255) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  date_debut date DEFAULT NULL,
  date_fin date DEFAULT NULL,
  date_rappel date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  supprimee_quand datetime DEFAULT NULL,
  supprimee_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table societe_contrat_type
--

DROP TABLE IF EXISTS societe_contrat_type;

CREATE TABLE societe_contrat_type (
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(25) DEFAULT NULL,
  admin tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table societe_document
--

DROP TABLE IF EXISTS societe_document;

CREATE TABLE societe_document (
  Id int(11) NOT NULL ,
  no_societe smallint(6) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL,
  supprimee_quand datetime DEFAULT NULL,
  supprimee_qui smallint(6) DEFAULT NULL)  ;

--
-- Table structure for table soumission
--

DROP TABLE IF EXISTS soumission;

CREATE TABLE soumission (
  Id smallint(6)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  code char(5) DEFAULT NULL,
  version_module_spreadsheet tinyint(3)  NOT NULL DEFAULT '2',
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  confidentiel tinyint(1)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  titre varchar(255) DEFAULT NULL,
  titre_externe varchar(100) DEFAULT NULL,
  no_gerant smallint(6)  NOT NULL DEFAULT '0',
  no_estimateur smallint(6)  NOT NULL DEFAULT '0',
  no_vendeur smallint(6)  NOT NULL DEFAULT '0',
  no_cp_conception smallint(6)  NOT NULL DEFAULT '0',
  no_cp_detaillage smallint(6)  NOT NULL DEFAULT '0',
  no_appel smallint(6)  DEFAULT NULL,
  finition varchar(100) DEFAULT NULL,
  notes text,
  notes_gestion text,
  date_fermeture date DEFAULT NULL,
  date_suivi date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  prix_depose float(11) NOT NULL DEFAULT '0.00')  ;

--
-- Table structure for table soumission_ao
--

DROP TABLE IF EXISTS soumission_ao;

CREATE TABLE soumission_ao (
  no_appel int(11) NOT NULL DEFAULT '0',
  code varchar(10) DEFAULT NULL,
  titre varchar(50) DEFAULT NULL,
  no_type tinyint(3)  DEFAULT NULL,
  no_type_construction tinyint(3)  DEFAULT NULL,
  localisation varchar(150) DEFAULT NULL,
  debut_general date DEFAULT NULL,
  debut_structure date DEFAULT NULL,
  duree_projet varchar(30) DEFAULT NULL,
  fermeture_date date DEFAULT NULL,
  fermeture_heure time DEFAULT NULL,
  donnees_superficie int(11)  NOT NULL DEFAULT '0',
  donnees_tos smallint(5)  NOT NULL DEFAULT '0',
  donnees_grid varchar(30) DEFAULT NULL,
  donnees_poids int(11)  NOT NULL DEFAULT '0',
  donnees_valeur int(11)  NOT NULL DEFAULT '0',
  donnees_hrs_ingenierie mediumint(8)  NOT NULL DEFAULT '0',
  donnees_hrs_detaillage mediumint(8)  NOT NULL DEFAULT '0',
  donnees_hrs_fabrication mediumint(8)  NOT NULL DEFAULT '0',
  notes text,
  no_etat tinyint(3)  DEFAULT '1',
  no_soumission mediumint(9)  NOT NULL DEFAULT '0',
  fichier varchar(20) DEFAULT NULL,
  montant_depose varchar(20) NOT NULL DEFAULT '0',
  contrat_octroye tinyint(1)  NOT NULL DEFAULT '0',
  no_depot smallint(6)  NOT NULL DEFAULT '0',
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0',
  decision varchar(5) NOT NULL DEFAULT 'NULL',
  decision_estimateur smallint(6)  NOT NULL DEFAULT '0',
  decision_quand datetime DEFAULT NULL,
  decision_qui smallint(5)  NOT NULL DEFAULT '0',
  annulation_raison varchar(255) DEFAULT NULL,
  annulation_quand datetime DEFAULT NULL,
  annulation_qui smallint(6)  NOT NULL DEFAULT '0',
  annulation_etat tinyint(3)  NOT NULL DEFAULT '1') ;

--
-- Table structure for table soumission_ao_competiteur
--

DROP TABLE IF EXISTS soumission_ao_competiteur;

CREATE TABLE soumission_ao_competiteur (
  Id int(11) NOT NULL ,
  no_appel smallint(5)  NOT NULL DEFAULT '0',
  nom varchar(60) DEFAULT NULL,
  montant_depose varchar(20) NOT NULL DEFAULT '0',
  contrat_octroye tinyint(1) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_ao_entrepreneur
--

DROP TABLE IF EXISTS soumission_ao_entrepreneur;

CREATE TABLE soumission_ao_entrepreneur (
  Id int(11) NOT NULL ,
  no_appel smallint(5)  NOT NULL DEFAULT '0',
  nom varchar(60) DEFAULT NULL,
  invite tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_ao_etat
--

DROP TABLE IF EXISTS soumission_ao_etat;

CREATE TABLE soumission_ao_etat (
  no_etat tinyint(3)  NOT NULL ,
  nom varchar(30) DEFAULT NULL,
  modification tinyint(1) NOT NULL DEFAULT '1',
  ordre tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_ao_type
--

DROP TABLE IF EXISTS soumission_ao_type;

CREATE TABLE soumission_ao_type (
  no_type tinyint(3)  NOT NULL ,
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table soumission_ao_type_construction
--

DROP TABLE IF EXISTS soumission_ao_type_construction;

CREATE TABLE soumission_ao_type_construction (
  no_type tinyint(3)  NOT NULL ,
  nom varchar(30) DEFAULT NULL,
  valeur_pied_carre varchar(10) DEFAULT NULL,
  poids_pied_carre varchar(10) DEFAULT NULL,
  cout_fab_livre varchar(10) DEFAULT NULL,
  taux_fabrication varchar(10) DEFAULT NULL,
  ratio_fab_dessin varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table soumission_competiteur
--

DROP TABLE IF EXISTS soumission_competiteur;

CREATE TABLE soumission_competiteur (
  Id smallint(6)  NOT NULL ,
  no_competiteur smallint(6)  DEFAULT NULL,
  nom varchar(75) DEFAULT NULL)  ;

--
-- Table structure for table soumission_competiteur_prix
--

DROP TABLE IF EXISTS soumission_competiteur_prix;

CREATE TABLE soumission_competiteur_prix (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_competiteur smallint(6)  DEFAULT NULL,
  prix float(11) DEFAULT NULL,
  commentaires text,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_contact
--

DROP TABLE IF EXISTS soumission_contact;

CREATE TABLE soumission_contact (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_contact smallint(6)  DEFAULT NULL,
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  no_profession tinyint(3)  NOT NULL DEFAULT '0',
  profession varchar(50) DEFAULT NULL,
  no_responsabilite tinyint(3)  NOT NULL DEFAULT '0',
  responsabilite varchar(50) DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  prenom varchar(50) DEFAULT NULL,
  societe varchar(100) DEFAULT NULL,
  adresse varchar(100) DEFAULT NULL,
  ville varchar(100) DEFAULT NULL,
  province varchar(100) DEFAULT 'Québec',
  code_postal varchar(15) DEFAULT NULL,
  pays varchar(50) NOT NULL DEFAULT 'Canada',
  telephone varchar(30) DEFAULT NULL,
  cellulaire varchar(30) DEFAULT NULL,
  fax varchar(30) DEFAULT NULL,
  courriel varchar(200) DEFAULT NULL,
  notes varchar(200) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6)  DEFAULT NULL,
  upload_quand datetime DEFAULT NULL,
  upload_qui smallint(6)  DEFAULT NULL,
  context varchar(150) DEFAULT NULL)  ;

--
-- Table structure for table soumission_depot
--

DROP TABLE IF EXISTS soumission_depot;

CREATE TABLE soumission_depot (
  no_depot int(11) NOT NULL DEFAULT '0',
  no_soumission mediumint(9) DEFAULT NULL,
  description varchar(75) DEFAULT NULL,
  montant varchar(20) DEFAULT NULL,
  fichier varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6) DEFAULT NULL) ;

--
-- Table structure for table soumission_depot_entrepreneur
--

DROP TABLE IF EXISTS soumission_depot_entrepreneur;

CREATE TABLE soumission_depot_entrepreneur (
  Id int(11) NOT NULL ,
  no_depot int(11) DEFAULT NULL,
  entrepreneurId int(11) DEFAULT NULL)  ;

--
-- Table structure for table soumission_division
--

DROP TABLE IF EXISTS soumission_division;

CREATE TABLE soumission_division (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  no_categorie tinyint(3) NOT NULL DEFAULT '0',
  description varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table soumission_division_categorie
--

DROP TABLE IF EXISTS soumission_division_categorie;

CREATE TABLE soumission_division_categorie (
  Id int(11) NOT NULL ,
  no_categorie tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation
--

DROP TABLE IF EXISTS soumission_estimation;

CREATE TABLE soumission_estimation (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  unite_mesure char(1) NOT NULL DEFAULT 'i',
  titre varchar(50) DEFAULT NULL,
  description text,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  no_estimateur smallint(5)  DEFAULT NULL,
  date_fermeture date DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  fabrication_unite_mesure char(1) NOT NULL DEFAULT 'i',
  finition_unite_mesure char(1) NOT NULL DEFAULT 'i',
  poutrelle_tablier_unite_mesure char(1) NOT NULL DEFAULT 'i')  ;

--
-- Table structure for table soumission_estimation_division
--

DROP TABLE IF EXISTS soumission_estimation_division;

CREATE TABLE soumission_estimation_division (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(3) DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  fabrication_matiere_premiere varchar(12) DEFAULT NULL,
  fabrication_fourniture_fabrication varchar(12) DEFAULT NULL,
  fabrication_cout_main_oeuvre varchar(12) DEFAULT NULL,
  fabrication_cout_sous_traitance varchar(12) DEFAULT NULL,
  fabrication_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  fabrication_contingence_fabrication varchar(12) DEFAULT NULL,
  conception_cout_main_oeuvre varchar(12) DEFAULT NULL,
  conception_cout_sous_traitance varchar(12) DEFAULT NULL,
  conception_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  detaillage_cout_mian_oeuvre varchar(12) DEFAULT NULL,
  detaillage_cout_sous_traitance varchar(12) DEFAULT NULL,
  detaillage_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  finition_cintrage_courbage_cout_sous_traitance varchar(12) DEFAULT NULL,
  finition_cintrage_courbage_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  finition_cintrage_courbage_cout_transport varchar(12) DEFAULT NULL,
  finition_galvanisation_cout_sous_traitance varchar(12) DEFAULT NULL,
  finition_galvanisation_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  finition_galvanisation_cout_transport varchar(12) DEFAULT NULL,
  finition_peinture_sablage_cout_sous_traitance varchar(12) DEFAULT NULL,
  finition_peinture_sablage_cout_sous_traitance_note varchar(255) DEFAULT NULL,
  finition_peinture_sablage_cout_transport varchar(12) DEFAULT NULL,
  poutrelle_tablier_tonnage_poutrelles varchar(12) DEFAULT NULL,
  poutrelle_tablier_cout_poutrelles varchar(12) DEFAULT NULL,
  poutrelle_tablier_tonnage_fermes varchar(12) DEFAULT NULL,
  poutrelle_tablier_cout_fermes varchar(12) DEFAULT NULL,
  poutrelle_tablier_poids_tablier varchar(12) DEFAULT NULL,
  poutrelle_tablier_surface_tablier varchar(12) DEFAULT NULL,
  poutrelle_tablier_cout_tablier varchar(12) DEFAULT NULL,
  poutrelle_tablier_typea_poids varchar(12) DEFAULT NULL,
  poutrelle_tablier_typea_poids_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typea_chargea varchar(12) DEFAULT NULL,
  poutrelle_tablier_typea_chargea_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typea_chargeb varchar(12) DEFAULT NULL,
  poutrelle_tablier_typea_chargeb_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typea_dimc varchar(12) DEFAULT NULL,
  poutrelle_tablier_typea_dimc_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typeb_poids varchar(12) DEFAULT NULL,
  poutrelle_tablier_typeb_poids_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typec_chargea varchar(12) DEFAULT NULL,
  poutrelle_tablier_typec_chargea_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typec_chargeb varchar(12) DEFAULT NULL,
  poutrelle_tablier_typec_chargeb_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typec_dimc varchar(12) DEFAULT NULL,
  poutrelle_tablier_typec_dimc_remarque varchar(20) DEFAULT NULL,
  poutrelle_tablier_typed_cm varchar(12) DEFAULT NULL,
  poutrelle_tablier_typed_cm_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typed_cv varchar(12) DEFAULT NULL,
  poutrelle_tablier_typed_cv_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typed_non_pondere varchar(12) DEFAULT NULL,
  poutrelle_tablier_typed_non_pondere_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typee_moment_pond varchar(12) DEFAULT NULL,
  poutrelle_tablier_typee_moment_pond_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typef_dima varchar(12) DEFAULT NULL,
  poutrelle_tablier_typef_dima_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typef_cm varchar(12) DEFAULT NULL,
  poutrelle_tablier_typef_cm_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typef_cv varchar(12) DEFAULT NULL,
  poutrelle_tablier_typef_cv_remarque varchar(30) DEFAULT NULL,
  poutrelle_tablier_typef_defl_vive varchar(12) DEFAULT NULL,
  poutrelle_tablier_typef_defl_vive_remarque varchar(30) DEFAULT NULL,
  montage_contingence_fabrication varchar(12) DEFAULT NULL,
  montage_contingence_monteur varchar(12) DEFAULT NULL,
  montage_cout_sous_traitance varchar(12) DEFAULT NULL,
  transport_nbr_remorque varchar(5) DEFAULT NULL,
  transport_cout_remorque varchar(12) DEFAULT NULL,
  transport_cout_transport varchar(12) DEFAULT NULL,
  construction_cout_gestion varchar(12) DEFAULT NULL,
  construction_cout_gestion_pourcentage_fabrication varchar(2) NOT NULL DEFAULT '0',
  construction_cout_gestion_pourcentage_conception varchar(2) NOT NULL DEFAULT '0',
  construction_cout_gestion_pourcentage_detaillage varchar(2) NOT NULL DEFAULT '25',
  construction_depenses_divers varchar(12) DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_finition
--

DROP TABLE IF EXISTS soumission_estimation_division_finition;

CREATE TABLE soumission_estimation_division_finition (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  nbr_remorque smallint(5)  NOT NULL DEFAULT '0',
  cout_unitaire float(7)  NOT NULL DEFAULT '0.00')  ;

--
-- Table structure for table soumission_estimation_division_finition_usage
--

DROP TABLE IF EXISTS soumission_estimation_division_finition_usage;

CREATE TABLE soumission_estimation_division_finition_usage (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(3) DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  code_usage varchar(3) DEFAULT NULL,
  ajustement float(4)  NOT NULL DEFAULT '0.00',
  cout_unitaire varchar(12) DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_fonction
--

DROP TABLE IF EXISTS soumission_estimation_division_fonction;

CREATE TABLE soumission_estimation_division_fonction (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  no_fonction tinyint(3)  DEFAULT NULL,
  nbr_heure varchar(5) DEFAULT NULL,
  ajustement float(4) NOT NULL DEFAULT '0.00')  ;

--
-- Table structure for table soumission_estimation_division_poutrelle
--

DROP TABLE IF EXISTS soumission_estimation_division_poutrelle;

CREATE TABLE soumission_estimation_division_poutrelle (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  quantite varchar(10) DEFAULT NULL,
  liaison varchar(10) DEFAULT NULL,
  profondeur varchar(30) DEFAULT NULL,
  portee varchar(30) DEFAULT NULL,
  espacement varchar(30) DEFAULT NULL,
  charge_morte varchar(30) DEFAULT NULL,
  charge_neige varchar(30) DEFAULT NULL,
  charge_vent varchar(30) DEFAULT NULL,
  deflexion_s varchar(30) DEFAULT NULL,
  deflexion_ds varchar(30) DEFAULT NULL,
  inertie_minimale varchar(30) DEFAULT NULL,
  note varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_poutrelle_tablier_soumission
--

DROP TABLE IF EXISTS soumission_estimation_division_poutrelle_tablier_soumission;

CREATE TABLE soumission_estimation_division_poutrelle_tablier_soumission (
  Id int(11) NOT NULL ,
  no_soumission smallint(5)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_societe smallint(5)  DEFAULT NULL,
  no_contact smallint(6) DEFAULT NULL,
  no_transmission tinyint(3)  NOT NULL DEFAULT '0',
  remarques text,
  courriel_objet varchar(75) DEFAULT NULL,
  fichier varchar(50) DEFAULT NULL,
  soumission varchar(100) DEFAULT NULL,
  prix varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_poutrelle_tablier_soumission_f
--

DROP TABLE IF EXISTS soumission_estimation_division_poutrelle_tablier_soumission_f;

CREATE TABLE soumission_estimation_division_poutrelle_tablier_soumission_f (
  Id int(11) NOT NULL ,
  no_soumission smallint(5)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_transmission tinyint(3)  NOT NULL DEFAULT '0',
  description varchar(50) DEFAULT '',
  fichier varchar(20) DEFAULT NULL,
  prix varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_sous_traitance
--

DROP TABLE IF EXISTS soumission_estimation_division_sous_traitance;

CREATE TABLE soumission_estimation_division_sous_traitance (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  no_societe smallint(6)  DEFAULT NULL,
  fichier varchar(100) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(6) DEFAULT NULL) ;

--
-- Table structure for table soumission_estimation_division_tablier_metallique
--

DROP TABLE IF EXISTS soumission_estimation_division_tablier_metallique;

CREATE TABLE soumission_estimation_division_tablier_metallique (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  position varchar(10) DEFAULT NULL,
  produit varchar(30) DEFAULT NULL,
  profondeur tinyint(3)  DEFAULT NULL,
  calibre_22 varchar(20) DEFAULT NULL,
  calibre_20 varchar(20) DEFAULT NULL,
  calibre_18 varchar(20) DEFAULT NULL,
  calibre_16 varchar(20) DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  finition varchar(15) DEFAULT NULL)  ;

--
-- Table structure for table soumission_estimation_division_tablier_metallique_details
--

DROP TABLE IF EXISTS soumission_estimation_division_tablier_metallique_details;

CREATE TABLE soumission_estimation_division_tablier_metallique_details (
  Id int(11) NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_estimation tinyint(3)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_tablier smallint(6)  DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  finition varchar(15) DEFAULT NULL,
  bloc varchar(5) DEFAULT NULL,
  largeur varchar(10) DEFAULT NULL,
  longueur varchar(10) DEFAULT NULL,
  surface float(11)  NOT NULL DEFAULT '0.00')  ;

--
-- Table structure for table soumission_estimation_division_usage
--

DROP TABLE IF EXISTS soumission_estimation_division_usage;

CREATE TABLE soumission_estimation_division_usage (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(3) DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  code_usage varchar(3) DEFAULT NULL,
  fabrication_ajust_poids_sous_materiel float(4) NOT NULL DEFAULT '0.00',
  fabrication_pourcentage_poids_sous_materiel float(4) NOT NULL DEFAULT '0.00',
  fabrication_pertes_matiere_premiere varchar(10) DEFAULT NULL,
  fabrication_ajust_cout_main_oeuvre float(4) NOT NULL DEFAULT '0.00')  ;

--
-- Table structure for table soumission_estimation_etat
--

DROP TABLE IF EXISTS soumission_estimation_etat;

CREATE TABLE soumission_estimation_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  defaut tinyint(1)  NOT NULL DEFAULT '0',
  editable tinyint(1)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_estimation_releve_quantite
--

DROP TABLE IF EXISTS soumission_estimation_releve_quantite;

CREATE TABLE soumission_estimation_releve_quantite (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_estimation tinyint(5)  NOT NULL DEFAULT '0',
  no_item smallint(5)  DEFAULT NULL,
  quantite smallint(6) NOT NULL DEFAULT '0',
  type varchar(3) DEFAULT NULL,
  description varchar(24) DEFAULT NULL,
  code varchar(8) DEFAULT NULL,
  longueur mediumint(8) NOT NULL DEFAULT '0',
  code_usage varchar(5) DEFAULT NULL,
  temps float(5) DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  code_finition varchar(3) DEFAULT NULL,
  traitement varchar(20) DEFAULT NULL,
  no_division tinyint(3)  NOT NULL DEFAULT '0',
  poids float(8) DEFAULT NULL,
  prix_unitaire float(7) NOT NULL DEFAULT '0.0000',
  prix_unitaire_date date DEFAULT NULL,
  prix_unitaire_reference varchar(30) DEFAULT NULL,
  prix_unitaire_note varchar(30) DEFAULT NULL,
  sous_materiel text,
  sous_materiel_temps float(5) NOT NULL DEFAULT '0.00',
  sous_materiel_poids float(8) NOT NULL DEFAULT '0.00',
  sous_materiel_prix float(7) NOT NULL DEFAULT '0.0000')  ;

--
-- Table structure for table soumission_etat
--

DROP TABLE IF EXISTS soumission_etat;

CREATE TABLE soumission_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(30) DEFAULT NULL,
  termine tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_feuille_calcul
--

DROP TABLE IF EXISTS soumission_feuille_calcul;

CREATE TABLE soumission_feuille_calcul (
  no_feuille int(11) NOT NULL ,
  no_soumission mediumint(9)  NOT NULL DEFAULT '0',
  version tinyint(3)  NOT NULL DEFAULT '2',
  titre varchar(50) DEFAULT NULL,
  matieres_premieres_pieces_principales_poids varchar(20) DEFAULT NULL,
  matieres_premieres_pieces_principales_couts varchar(20) DEFAULT NULL,
  matieres_premieres_connections_poids_pourcentage varchar(20) DEFAULT NULL,
  matieres_premieres_pertes_couts varchar(20) DEFAULT NULL,
  fournitures_fabrications_couts varchar(20) DEFAULT NULL,
  main_doeuvre_conception_honoraires_professionnels_s_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_honoraires_professionnels_f_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_depenses_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_usine_temps varchar(20) DEFAULT NULL,
  main_doeuvre_usine_taux varchar(20) DEFAULT NULL,
  main_doeuvre_dessin_temps varchar(20) DEFAULT NULL,
  main_doeuvre_dessin_taux varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_ing_connexions_interne_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_ing_connexions_st_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_detaillage_depenses_cout varchar(20) DEFAULT NULL,
  main_doeuvre_fabrication_sous_traitance_cout varchar(20) DEFAULT NULL,
  main_doeuvre_conception_ingenierie_temps varchar(20) DEFAULT NULL,
  main_doeuvre_conception_ingenierie_taux varchar(20) DEFAULT NULL,
  main_doeuvre_conception_dessin_temps varchar(20) DEFAULT NULL,
  main_doeuvre_conception_dessin_taux varchar(20) DEFAULT NULL,
  main_doeuvre_fondation_temps varchar(20) DEFAULT NULL,
  main_doeuvre_fondation_taux varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_chantier_temps varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_chantier_taux varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_bureau_temps varchar(20) DEFAULT NULL,
  main_doeuvre_gestion_bureau_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_quantite varchar(20) DEFAULT NULL,
  finition_galvanisation_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_cout varchar(20) DEFAULT NULL,
  finition_galvanisation_preparation_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_preparation_cout varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_quantite varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_taux varchar(20) DEFAULT NULL,
  finition_galvanisation_transport_cout varchar(20) DEFAULT NULL,
  finition_traitement_peinture_unite varchar(10) NOT NULL DEFAULT 'pi&sup2;

',
  finition_traitement_peinture_quantite varchar(20) DEFAULT NULL,
  finition_traitement_peinture_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_preparation_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_prepartion_cout varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_quantite varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_taux varchar(20) DEFAULT NULL,
  finition_traitement_peinture_transport_cout varchar(20) DEFAULT NULL,
  finition_fini_architectural_unite varchar(10) NOT NULL DEFAULT 'pi&sup2;

',
  finition_fini_architectural_quantite varchar(20) DEFAULT NULL,
  finition_fini_architectural_taux varchar(20) DEFAULT NULL,
  finition_fini_architectural_cout varchar(20) DEFAULT NULL,
  poutrelles_fournisseur varchar(100) DEFAULT NULL,
  poutrelles_unite varchar(20) DEFAULT NULL,
  poutrelles_poids varchar(20) DEFAULT NULL,
  poutrelles_couts varchar(20) DEFAULT NULL,
  tablier_metallique_fournisseur varchar(100) DEFAULT NULL,
  tablier_metallique_superficie varchar(20) DEFAULT NULL,
  tablier_metallique_couts varchar(20) DEFAULT NULL,
  montage_monteur varchar(100) DEFAULT NULL,
  montage_quantite varchar(20) DEFAULT NULL,
  montage_duree varchar(20) DEFAULT NULL,
  montage_couts varchar(20) DEFAULT NULL,
  montage_contingence_pourcentage varchar(20) DEFAULT NULL,
  montage_pension_couts varchar(20) DEFAULT NULL,
  montage_clous_vis_couts varchar(20) DEFAULT NULL,
  transport_lainco_quantite varchar(20) DEFAULT NULL,
  transport_lainco_taux varchar(20) DEFAULT NULL,
  transport_regulier_quantite varchar(20) DEFAULT NULL,
  transport_regulier_taux varchar(20) DEFAULT NULL,
  transport_couts varchar(20) DEFAULT NULL,
  vente_fabrication_frais_fixe varchar(20) DEFAULT NULL,
  vente_fabrication_ponderation varchar(20) DEFAULT NULL,
  vente_fabrication_benefices varchar(20) DEFAULT NULL,
  vente_sous_traitance_extra_pourcentage varchar(20) DEFAULT NULL,
  vente_sous_traitance_benefices_pourcentage varchar(20) DEFAULT NULL,
  vente_totale varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0');

--
-- Table structure for table soumission_feuille_calcul_items
--

DROP TABLE IF EXISTS soumission_feuille_calcul_items;

CREATE TABLE soumission_feuille_calcul_items (
  Id int(11) NOT NULL ,
  no_feuille int(11)  DEFAULT NULL,
  item varchar(100) DEFAULT NULL,
  quantite varchar(20) DEFAULT NULL,
  taux varchar(20) DEFAULT NULL,
  couts varchar(20) DEFAULT NULL,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(6)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table soumission_finition
--

DROP TABLE IF EXISTS soumission_finition;

CREATE TABLE soumission_finition (
  Id int(11) NOT NULL ,
  no_soumission smallint(6) DEFAULT NULL,
  no_finition tinyint(3)  DEFAULT NULL,
  no_systeme tinyint(3)  DEFAULT NULL,
  description varchar(30) DEFAULT NULL,
  appret varchar(50) DEFAULT NULL,
  appret_autre_details varchar(50) DEFAULT NULL,
  couleur varchar(50) DEFAULT NULL,
  couleur_autre_details varchar(50) DEFAULT NULL,
  couleur_epaisseur varchar(10) DEFAULT NULL,
  preparation_code varchar(9) DEFAULT NULL,
  boulonnerie_galvanisee tinyint(3)  DEFAULT '0',
  boulonnerie_autre tinyint(1)  NOT NULL DEFAULT '0',
  boulonnerie_autre_details varchar(75) DEFAULT NULL,
  galvanisation_epaisseur varchar(10) DEFAULT NULL,
  acier_apparent tinyint(1)  NOT NULL DEFAULT '0',
  devis varchar(100) DEFAULT NULL,
  couche_base_peinture varchar(50) DEFAULT NULL,
  couche_base_couleur varchar(50) DEFAULT NULL,
  couche_base_couleur_epaisseur varchar(10) DEFAULT NULL,
  couche_intermediaire_peinture varchar(50) DEFAULT NULL,
  couche_intermediaire_couleur varchar(50) DEFAULT NULL,
  couche_intermediaire_couleur_epaisseur varchar(10) DEFAULT NULL,
  couche_finition_peinture varchar(50) DEFAULT NULL,
  couche_finition_couleur varchar(50) DEFAULT NULL,
  couche_finition_couleur_epaisseur varchar(10) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece;

CREATE TABLE soumission_materiel_assemblage_piece (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  perte varchar(30) DEFAULT NULL,
  note varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_acier
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_acier;

CREATE TABLE soumission_materiel_assemblage_piece_acier (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  fabtrol_pkey mediumint(9)  DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL,
  largeur varchar(10) DEFAULT NULL,
  longueur varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_divers
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_divers;

CREATE TABLE soumission_materiel_assemblage_piece_divers (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  couts float(7) NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_division
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_division;

CREATE TABLE soumission_materiel_assemblage_piece_division (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_projet smallint(6)  DEFAULT NULL,
  no_division tinyint(3)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  quantite smallint(6)  DEFAULT NULL,
  finition varchar(5) DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_fourniture
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_fourniture;

CREATE TABLE soumission_materiel_assemblage_piece_fourniture (
  Id smallint(6)  NOT NULL ,
  no_soumission smallint(5)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  fabtrol_pkey mediumint(8)  DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_item
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_item;

CREATE TABLE soumission_materiel_assemblage_piece_item (
  Id smallint(6)  NOT NULL ,
  no_soumission smallint(5)  DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  no_reference smallint(5)  DEFAULT NULL,
  quantite smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table soumission_materiel_assemblage_piece_operation
--

DROP TABLE IF EXISTS soumission_materiel_assemblage_piece_operation;

CREATE TABLE soumission_materiel_assemblage_piece_operation (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_item tinyint(3)  DEFAULT NULL,
  no_operation tinyint(3)  DEFAULT NULL,
  temps varchar(10) DEFAULT NULL)  ;

--
-- Table structure for table soumission_societe
--

DROP TABLE IF EXISTS soumission_societe;

CREATE TABLE soumission_societe (
  Id mediumint(9)  NOT NULL ,
  no_soumission smallint(6)  DEFAULT NULL,
  no_societe smallint(6)  DEFAULT NULL,
  societe_nom varchar(75) DEFAULT NULL,
  societe_adresse varchar(100) DEFAULT NULL,
  societe_ville varchar(75) DEFAULT NULL,
  societe_province varchar(50) DEFAULT NULL,
  societe_pays varchar(50) DEFAULT NULL,
  societe_code_postal varchar(15) DEFAULT NULL,
  societe_telephone varchar(30) DEFAULT NULL,
  societe_fax varchar(30) DEFAULT NULL,
  no_contact smallint(6)  DEFAULT NULL,
  contact_prenom varchar(50) DEFAULT NULL,
  contact_nom varchar(50) DEFAULT NULL,
  contact_telephone varchar(30) DEFAULT NULL,
  contact_cellulaire varchar(30) DEFAULT NULL,
  contact_courriel varchar(75) DEFAULT NULL)  ;

--
-- Table structure for table soumission_suivi
--

DROP TABLE IF EXISTS soumission_suivi;

CREATE TABLE soumission_suivi (
  no_suivi int(11) NOT NULL ,
  no_soumission smallint(6)  NOT NULL DEFAULT '0',
  date date DEFAULT NULL,
  date_suivi date DEFAULT NULL,
  commentaire text,
  creation_quand datetime DEFAULT NULL,
  creation_qui smallint(5)  NOT NULL DEFAULT '0') ;

--
-- Table structure for table soumission_type
--

DROP TABLE IF EXISTS soumission_type;

CREATE TABLE soumission_type (
  no_type tinyint(3)  NOT NULL DEFAULT '0',
  nom varchar(30) DEFAULT NULL)  ;

--
-- Table structure for table vente
--

DROP TABLE IF EXISTS vente;

CREATE TABLE vente (
  Id int(11) NOT NULL ,
  no_vente smallint(6)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '1',
  code_activite varchar(3) DEFAULT NULL,
  no_activite smallint(6)  DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  montant decimal(11) NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  fonction_confirmation_quand datetime DEFAULT NULL,
  fonction_confirmation_qui smallint(6) DEFAULT NULL,
  jour_facturation tinyint(3)  NOT NULL DEFAULT '25',
  facturation_actif tinyint(3)  NOT NULL DEFAULT '1')  ;

--
-- Table structure for table vente_divers
--

DROP TABLE IF EXISTS vente_divers;

CREATE TABLE vente_divers (
  Id mediumint(9)  NOT NULL ,
  no_vente mediumint(9)  DEFAULT NULL,
  no_location tinyint(3)  DEFAULT NULL,
  tarif_heure decimal(8) DEFAULT NULL,
  tarif_jour decimal(8) DEFAULT NULL,
  tarif_semaine decimal(8) DEFAULT NULL,
  tarif_mois decimal(8) DEFAULT NULL,
  cout_transport decimal(8) DEFAULT NULL)  ;

--
-- Table structure for table vente_etat
--

DROP TABLE IF EXISTS vente_etat;

CREATE TABLE vente_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(25) DEFAULT NULL,
  defaut tinyint(1)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table vente_fonction
--

DROP TABLE IF EXISTS vente_fonction;

CREATE TABLE vente_fonction (
  Id int(11) NOT NULL ,
  no_vente smallint(6)  DEFAULT NULL,
  no_fonction tinyint(3)  DEFAULT NULL,
  taux_horaire float(5) NOT NULL DEFAULT '0.00',
  afficher tinyint(1) NOT NULL DEFAULT '0')  ;

--
-- Table structure for table vente_item
--

DROP TABLE IF EXISTS vente_item;

CREATE TABLE vente_item (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  montant decimal(10) NOT NULL DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table vente_modification
--

DROP TABLE IF EXISTS vente_modification;

CREATE TABLE vente_modification (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  no_item mediumint(8)  DEFAULT NULL,
  no_modification tinyint(3)  DEFAULT NULL,
  version tinyint(3)  NOT NULL DEFAULT '0',
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  description varchar(100) DEFAULT NULL,
  reference varchar(50) DEFAULT NULL,
  notes text,
  affichage_taux_horaire tinyint(1)  NOT NULL DEFAULT '0',
  impact_echeancier text,
  montant_approuve decimal(11) NOT NULL DEFAULT '0.00',
  bon_commande varchar(50) DEFAULT NULL,
  vente_administration varchar(20) DEFAULT NULL,
  vente_profit varchar(20) DEFAULT NULL,
  fabrication_budget varchar(20) DEFAULT NULL,
  fabrication_matiere_premiere varchar(20) DEFAULT NULL,
  fabrication_fourniture_fabrication varchar(20) DEFAULT NULL,
  fabrication_cout_sous_traitance varchar(20) DEFAULT NULL,
  fabrication_avancement varchar(20) DEFAULT NULL,
  conception_budget varchar(20) DEFAULT NULL,
  conception_cout_sous_traitance varchar(20) DEFAULT NULL,
  conception_avancement varchar(20) DEFAULT NULL,
  detaillage_budget varchar(20) DEFAULT NULL,
  detaillage_cout_sous_traitance varchar(20) DEFAULT NULL,
  detaillage_avancement varchar(20) DEFAULT NULL,
  finition_cintrage_courbage_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_cintrage_courbage_cout_transport varchar(20) DEFAULT NULL,
  finition_galvanisation_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_galvanisation_cout_transport varchar(20) DEFAULT NULL,
  finition_peinture_sablage_cout_sous_traitance varchar(20) DEFAULT NULL,
  finition_peinture_sablage_cout_transport varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_poutrelles varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_fermes varchar(20) DEFAULT NULL,
  poutrelle_tablier_cout_tablier varchar(20) DEFAULT NULL,
  transport_cout_sous_traitance varchar(20) DEFAULT NULL,
  construction_depenses_divers varchar(20) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  action_quand datetime DEFAULT NULL,
  action_qui smallint(6) DEFAULT NULL,
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(5)  DEFAULT NULL,
  approbation_client tinyint(1)  NOT NULL DEFAULT '0',
  approbation_commentaires varchar(255) DEFAULT NULL,
  no_contact smallint(6) NOT NULL DEFAULT '0',
  fichier varchar(50) DEFAULT NULL)  ;

--
-- Table structure for table vente_modification_divers
--

DROP TABLE IF EXISTS vente_modification_divers;

CREATE TABLE vente_modification_divers (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  no_departement smallint(5)  NOT NULL DEFAULT '0',
  no_location tinyint(3)  NOT NULL DEFAULT '0',
  quantite varchar(10) NOT NULL DEFAULT '0',
  description varchar(100) DEFAULT NULL,
  taux decimal(10) DEFAULT NULL,
  unite varchar(10) DEFAULT NULL,
  transport decimal(10) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table vente_modification_etat
--

DROP TABLE IF EXISTS vente_modification_etat;

CREATE TABLE vente_modification_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  defaut tinyint(1)  NOT NULL DEFAULT '0',
  editable tinyint(1)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table vente_modification_fonction
--

DROP TABLE IF EXISTS vente_modification_fonction;

CREATE TABLE vente_modification_fonction (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  no_departement smallint(5)  DEFAULT NULL,
  no_fonction tinyint(3)  DEFAULT NULL,
  nbr_heure varchar(10) DEFAULT NULL,
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

--
-- Table structure for table vente_periode
--

DROP TABLE IF EXISTS vente_periode;

CREATE TABLE vente_periode (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  annee smallint(5)  DEFAULT NULL,
  mois tinyint(3)  DEFAULT NULL,
  no_etat tinyint(3)  NOT NULL DEFAULT '1',
  total decimal(10)  DEFAULT '0.00',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL,
  action_quand datetime DEFAULT NULL,
  action_qui smallint(5) DEFAULT NULL,
  action_commentaires varchar(255) DEFAULT NULL,
  approbation_quand datetime DEFAULT NULL,
  approbation_qui smallint(6)  DEFAULT NULL,
  approbation_client tinyint(1)  NOT NULL DEFAULT '0',
  approbation_commentaires varchar(255) DEFAULT NULL)  ;

--
-- Table structure for table vente_periode_etat
--

DROP TABLE IF EXISTS vente_periode_etat;

CREATE TABLE vente_periode_etat (
  Id tinyint(3)  NOT NULL ,
  no_etat tinyint(3)  DEFAULT NULL,
  nom varchar(50) DEFAULT NULL,
  defaut tinyint(1)  NOT NULL DEFAULT '0',
  editable tinyint(1)  NOT NULL DEFAULT '1',
  ordre tinyint(3)  NOT NULL DEFAULT '0')  ;

--
-- Table structure for table vente_periode_item
--

DROP TABLE IF EXISTS vente_periode_item;

CREATE TABLE vente_periode_item (
  Id int(11) NOT NULL ,
  no_vente smallint(5)  DEFAULT NULL,
  no_item smallint(5)  DEFAULT NULL,
  annee smallint(5)  DEFAULT NULL,
  mois tinyint(3)  DEFAULT NULL,
  montant decimal(10) NOT NULL DEFAULT '0.00',
  pourcentage_complete tinyint(3)  NOT NULL DEFAULT '0',
  cree_quand datetime DEFAULT NULL,
  cree_qui smallint(5)  DEFAULT NULL)  ;

-- Dump completed on 2022-04-25  9:06:40;

