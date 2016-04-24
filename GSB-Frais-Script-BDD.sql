-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: GsbFrais
-- ------------------------------------------------------
-- Server version	5.5.46-0+deb7u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Comptable`
--

DROP TABLE IF EXISTS `Comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comptable` (
  `idComptable` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) DEFAULT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idComptable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comptable`
--

LOCK TABLES `Comptable` WRITE;
/*!40000 ALTER TABLE `Comptable` DISABLE KEYS */;
INSERT INTO `Comptable` VALUES (1,'admin','azerty','PEQUERY','Grégory');
/*!40000 ALTER TABLE `Comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Etat`
--

DROP TABLE IF EXISTS `Etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Etat` (
  `idEtat` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(3) DEFAULT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idEtat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etat`
--

LOCK TABLES `Etat` WRITE;
/*!40000 ALTER TABLE `Etat` DISABLE KEYS */;
INSERT INTO `Etat` VALUES (1,'RB','Remboursée'),(2,'CL','Saisie clôturée'),(3,'CR','Fiche créée, saisie en cours'),(4,'VA','Validée et mise en paiement'),(5,'EG','Enregistré');
/*!40000 ALTER TABLE `Etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FicheFrais`
--

DROP TABLE IF EXISTS `FicheFrais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FicheFrais` (
  `idFiche` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreation` date DEFAULT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtatFiche` int(11) DEFAULT NULL,
  `idVisiteur` int(11) DEFAULT NULL,
  `idEtatFraisForfait` int(11) DEFAULT NULL,
  `idEtatFraisHorsClassification` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFiche`),
  KEY `FK_FicheFrais_EtatFiche` (`idEtatFiche`),
  KEY `FK_FicheFrais_EtatFraisForfait` (`idEtatFraisForfait`),
  KEY `FK_FicheFrais_EtatFraisHorsClassification` (`idEtatFraisHorsClassification`),
  KEY `FK_FicheFrais_Visiteur` (`idVisiteur`),
  CONSTRAINT `FK_FicheFrais_Visiteur` FOREIGN KEY (`idVisiteur`) REFERENCES `Visiteur` (`idVisiteur`),
  CONSTRAINT `FK_FicheFrais_EtatFiche` FOREIGN KEY (`idEtatFiche`) REFERENCES `Etat` (`idEtat`),
  CONSTRAINT `FK_FicheFrais_EtatFraisForfait` FOREIGN KEY (`idEtatFraisForfait`) REFERENCES `Etat` (`idEtat`),
  CONSTRAINT `FK_FicheFrais_EtatFraisHorsClassification` FOREIGN KEY (`idEtatFraisHorsClassification`) REFERENCES `Etat` (`idEtat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FicheFrais`
--

LOCK TABLES `FicheFrais` WRITE;
/*!40000 ALTER TABLE `FicheFrais` DISABLE KEYS */;
INSERT INTO `FicheFrais` VALUES (1,'2015-10-01',2,200.00,'2015-10-20',1,1,1,1),(2,'2014-01-01',2,199.00,'2016-01-30',3,2,1,1),(3,'2015-01-01',2,199.00,'2016-01-30',3,2,1,1),(4,'2015-11-01',1,2000.00,'2015-11-19',1,8,1,1),(5,'2015-12-01',0,150.00,'2015-12-21',1,7,1,1),(6,'2016-01-01',2,199.00,'2016-01-30',3,2,1,1),(7,'2016-02-01',1,50.00,'2016-02-25',1,10,1,1),(8,'2016-03-01',3,78.00,'2016-03-16',1,5,1,1);
/*!40000 ALTER TABLE `FicheFrais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FraisForfait`
--

DROP TABLE IF EXISTS `FraisForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FraisForfait` (
  `idFrais` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(3) DEFAULT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idFrais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FraisForfait`
--

LOCK TABLES `FraisForfait` WRITE;
/*!40000 ALTER TABLE `FraisForfait` DISABLE KEYS */;
INSERT INTO `FraisForfait` VALUES (1,'ETP','Forfait Etape',110.00),(2,'KM','Frais Kilométrique',0.62),(3,'NUI','Nuitée Hôtel',80.00),(4,'REP','Repas Restaurant',25.00);
/*!40000 ALTER TABLE `FraisForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LigneFraisForfait`
--

DROP TABLE IF EXISTS `LigneFraisForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LigneFraisForfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `dateFrais` date DEFAULT NULL,
  `idFicheFrais` int(11) DEFAULT NULL,
  `idFrais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LigneFraisForfait_FicheFrais` (`idFicheFrais`),
  KEY `FK_LigneFraisForfait_FraisForfait` (`idFrais`),
  CONSTRAINT `FK_LigneFraisForfait_FraisForfait` FOREIGN KEY (`idFrais`) REFERENCES `FraisForfait` (`idFrais`),
  CONSTRAINT `FK_LigneFraisForfait_FicheFrais` FOREIGN KEY (`idFicheFrais`) REFERENCES `FicheFrais` (`idFiche`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LigneFraisForfait`
--

LOCK TABLES `LigneFraisForfait` WRITE;
/*!40000 ALTER TABLE `LigneFraisForfait` DISABLE KEYS */;
INSERT INTO `LigneFraisForfait` VALUES (1,4,'2016-02-15',1,1),(2,3,'2016-02-15',1,2),(3,0,'2016-02-15',1,3),(4,0,'2016-02-15',1,4),(5,2,'2016-02-15',2,1),(6,1,'2016-02-15',2,2),(7,2,'2016-02-15',2,3),(8,1,'2016-02-15',2,4),(9,4,'2016-02-15',3,2),(10,3,'2016-02-15',3,4),(11,4,'2016-02-15',3,1),(12,3,'2016-02-15',3,3),(13,2,'2016-02-15',4,1),(14,1,'2016-02-15',4,3),(15,2,'2016-02-15',4,2),(16,1,'2016-02-15',4,4),(17,4,'2016-02-15',5,1),(18,3,'2016-02-15',5,4),(19,4,'2016-02-15',5,2),(20,3,'2016-02-15',5,3),(21,2,'2016-02-15',6,1),(22,2,'2016-02-15',6,2),(23,2,'2016-02-15',6,3),(24,1,'2016-02-15',6,4);
/*!40000 ALTER TABLE `LigneFraisForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LigneFraisHorsForfait`
--

DROP TABLE IF EXISTS `LigneFraisHorsForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LigneFraisHorsForfait` (
  `idLigneFraisHorsForfait` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) DEFAULT NULL,
  `dateFrais` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `idFiche` int(11) DEFAULT NULL,
  `idEtat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLigneFraisHorsForfait`),
  KEY `FK_LigneFraisHorsForfait_FicheFrais` (`idFiche`),
  KEY `FK_LigneFraisHorsForfait_Etat` (`idEtat`),
  CONSTRAINT `FK_LigneFraisHorsForfait_Etat` FOREIGN KEY (`idEtat`) REFERENCES `Etat` (`idEtat`),
  CONSTRAINT `FK_LigneFraisHorsForfait_FicheFrais` FOREIGN KEY (`idFiche`) REFERENCES `FicheFrais` (`idFiche`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LigneFraisHorsForfait`
--

LOCK TABLES `LigneFraisHorsForfait` WRITE;
/*!40000 ALTER TABLE `LigneFraisHorsForfait` DISABLE KEYS */;
INSERT INTO `LigneFraisHorsForfait` VALUES (1,'Voiture','2015-12-31',164999.00,1,1),(2,'Appartement','2016-03-18',299999.00,2,1),(3,'Téléphone','2016-02-25',699.00,3,1),(4,'Ordinateur','2016-01-28',999.00,4,1),(5,'Secret','2015-06-12',50.00,5,1),(6,'Retard','2015-08-14',29.00,6,1);
/*!40000 ALTER TABLE `LigneFraisHorsForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visiteur`
--

DROP TABLE IF EXISTS `Visiteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visiteur` (
  `idVisiteur` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(3) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `mdp` varchar(30) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `codePostal` varchar(7) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visiteur`
--

LOCK TABLES `Visiteur` WRITE;
/*!40000 ALTER TABLE `Visiteur` DISABLE KEYS */;
INSERT INTO `Visiteur` VALUES (1,'a13','Villechalane','Louis','lvillachane','jux7g','8 rue des Charmes','46000','Cahors','2005-12-21'),(2,'a17','Andre','David','dandre','oppg5','1 rue Petit','46200','Lalbenque','1998-11-23'),(3,'a55','Bedos','Christian','cbedos','gmhxd','1 rue Peranud','46250','Montcuq','1995-01-12'),(4,'a93','Tusseau','Louis','ltusseau','ktp3s','22 rue des Ternes','46123','Gramat','2000-05-01'),(5,'b13','Bentot','Pascal','pbentot','doyw1','11 allée des Cerises','46512','Bessines','1992-07-09'),(6,'b16','Bioret','Luc','lbioret','hrjfs','1 Avenue gambetta','46000','Cahors','1998-05-11'),(7,'b19','Bunisset','Francis','fbunisset','4vbnd','10 rue des Perles','93100','Montreuil','1987-10-21'),(8,'b25','Bunisset','Denise','dbunisset','s1y1r','23 rue Manin','75019','paris','2010-12-05'),(9,'b28','Cacheux','Bernard','bcacheux','uf7r3','114 rue Blanche','75017','Paris','2009-11-12'),(10,'b34','Cadic','Eric','ecadic','6u8dc','123 avenue de la République','75011','Paris','2008-09-23'),(11,'b4','Charoze','Catherine','ccharoze','u817o','100 rue Petit','75019','Paris','2005-11-12'),(12,'b50','Clepkens','Christophe','cclepkens','bw1us','12 allée des Anges','93230','Romainville','2003-08-11'),(13,'b59','Cottin','Vincenne','vcottin','2hoh9','36 rue Des Roches','93100','Monteuil','2001-11-18'),(14,'c14','Daburon','François','fdaburon','7oqpv','13 rue de Chanzy','94000','Créteil','2002-02-11'),(15,'c3','De','Philippe','pde','gk9kx','13 rue Barthes','94000','Créteil','2010-12-14'),(16,'c54','Debelle','Michel','mdebelle','od5rt','181 avenue Barbusse','93210','Rosny','2006-11-23'),(17,'d13','Debelle','Jeanne','jdebelle','nvwqq','134 allée des Joncs','44000','Nantes','2000-05-11'),(18,'d51','Debroise','Michel','mdebroise','sghkb','2 Bld Jourdain','44000','Nantes','2001-04-17'),(19,'e22','Desmarquest','Nathalie','ndesmarquest','f1fob','14 Place d Arc','45000','Orléans','2005-11-12'),(20,'e24','Desnost','Pierre','pdesnost','4k2o5','16 avenue des Cèdres','23200','Guéret','2001-02-05'),(21,'e39','Dudouit','Frédéric','fdudouit','44im8','18 rue de l église','23120','GrandBourg','2000-08-01'),(22,'e49','Duncombe','Claude','cduncombe','qf77j','19 rue de la tour','23100','La souteraine','1987-10-10'),(23,'e5','Enault-Pascreau','Céline','cenault','y2qdu','25 place de la gare','23200','Gueret','1995-09-01'),(24,'e52','Eynde','Valérie','veynde','i7sn3','3 Grand Place','13015','Marseille','1999-11-01'),(25,'f21','Finck','Jacques','jfinck','mpb3t','10 avenue du Prado','13002','Marseille','2001-11-10'),(26,'f39','Frémont','Fernande','ffremont','xs5tq','4 route de la mer','13012','Allauh','1998-10-01'),(27,'f4','Gest','Alain','agest','dywvt','30 avenue de la mer','13025','Berre','1985-11-01');
/*!40000 ALTER TABLE `Visiteur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-24  9:11:26
