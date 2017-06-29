-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: kitodo
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(9) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_x_process`
--

DROP TABLE IF EXISTS `batch_x_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_x_process` (
  `process_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  PRIMARY KEY (`process_id`,`batch_id`),
  KEY `FK_ProzesseID` (`process_id`),
  KEY `FK_BatchID` (`batch_id`),
  CONSTRAINT `FK_batch_x_process_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_batch_x_process_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_x_process`
--

LOCK TABLES `batch_x_process` WRITE;
/*!40000 ALTER TABLE `batch_x_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_x_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docket`
--

DROP TABLE IF EXISTS `docket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docket`
--

LOCK TABLES `docket` WRITE;
/*!40000 ALTER TABLE `docket` DISABLE KEYS */;
INSERT INTO `docket` VALUES (1,'default','docket.xsl','INDEX');
/*!40000 ALTER TABLE `docket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numericvalue` double DEFAULT NULL,
  `stringValue` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProzesseID` (`process_id`),
  CONSTRAINT `FK_history_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldapGroup`
--

DROP TABLE IF EXISTS `ldapGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldapGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `homeDirectory` varchar(255) DEFAULT NULL,
  `gidNumber` varchar(255) DEFAULT NULL,
  `userDn` varchar(255) DEFAULT NULL,
  `objectClasses` varchar(255) DEFAULT NULL,
  `sambaSid` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `gecos` varchar(255) DEFAULT NULL,
  `loginShell` varchar(255) DEFAULT NULL,
  `sambaAcctFlags` varchar(255) DEFAULT NULL,
  `sambaLogonScript` varchar(255) DEFAULT NULL,
  `sambaPrimaryGroupSid` varchar(255) DEFAULT NULL,
  `sambaPasswordMustChange` varchar(255) DEFAULT NULL,
  `sambaPasswordHistory` varchar(255) DEFAULT NULL,
  `sambaLogonHours` varchar(255) DEFAULT NULL,
  `sambaKickoffTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldapGroup`
--

LOCK TABLES `ldapGroup` WRITE;
/*!40000 ALTER TABLE `ldapGroup` DISABLE KEYS */;
INSERT INTO `ldapGroup` VALUES (2,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ldapGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `outputName` varchar(255) DEFAULT NULL,
  `template` tinyint(1) DEFAULT NULL,
  `inChoiceListShown` tinyint(1) DEFAULT NULL,
  `sortHelperStatus` varchar(255) DEFAULT NULL,
  `sortHelperImages` int(11) DEFAULT NULL,
  `sortHelperArticles` int(11) DEFAULT NULL,
  `sortHelperDocstructs` int(11) DEFAULT NULL,
  `sortHelperMetadata` int(11) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `wikiField` longtext,
  `project_id` int(11) DEFAULT NULL,
  `ruleset_id` int(11) DEFAULT NULL,
  `docket_id` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  `processBaseUri` tinyblob,
  PRIMARY KEY (`id`),
  KEY `FK_ProjekteID` (`project_id`),
  KEY `FK_MetadatenKonfigurationID` (`ruleset_id`),
  KEY `FK_DocketID` (`docket_id`),
  CONSTRAINT `FK_process_docket_id` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  CONSTRAINT `FK_process_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_process_ruleset_id` FOREIGN KEY (`ruleset_id`) REFERENCES `ruleset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (1,'Example_Workflow',NULL,1,0,'000014086',0,0,0,0,'2016-10-01 16:49:48',NULL,1,1,1,'INDEX',NULL);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_x_property`
--

DROP TABLE IF EXISTS `process_x_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_x_property` (
  `process_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  KEY `FK_process_x_property_process_id` (`process_id`),
  KEY `FK_process_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_process_x_property_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_process_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_x_property`
--

LOCK TABLES `process_x_property` WRITE;
/*!40000 ALTER TABLE `process_x_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_x_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `useDmsImport` tinyint(1) DEFAULT NULL,
  `dmsImportTimeOut` int(11) DEFAULT NULL,
  `dmsImportRootPath` varchar(255) DEFAULT NULL,
  `dmsImportImagesPath` varchar(255) DEFAULT NULL,
  `dmsImportSuccessPath` varchar(255) DEFAULT NULL,
  `dmsImportErrorPath` varchar(255) DEFAULT NULL,
  `dmsImportCreateProcessFolder` tinyint(1) DEFAULT NULL,
  `fileFormatInternal` varchar(255) DEFAULT NULL,
  `fileFormatDmsExport` varchar(255) DEFAULT NULL,
  `metsRightsOwner` varchar(255) DEFAULT NULL,
  `metsRightsOwnerLogo` varchar(255) DEFAULT NULL,
  `metsRightsOwnerSite` varchar(255) DEFAULT NULL,
  `metsRightsOwnerMail` varchar(255) DEFAULT NULL,
  `metsDigiprovReference` varchar(255) DEFAULT NULL,
  `metsDigiprovPresentation` varchar(255) DEFAULT NULL,
  `metsDigiprovReferenceAnchor` varchar(255) DEFAULT NULL,
  `metsDigiprovPresentationAnchor` varchar(255) DEFAULT NULL,
  `metsPointerPath` varchar(255) DEFAULT NULL,
  `metsPointerPathAnchor` varchar(255) DEFAULT NULL,
  `metsPurl` varchar(255) DEFAULT NULL,
  `metsContentId` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `numberOfPages` int(11) DEFAULT NULL,
  `numberOfVolumes` int(11) DEFAULT NULL,
  `projectIsArchived` tinyint(1) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Example Project',1,3600000,'/usr/local/kitodo/hotfolder/','/usr/local/kitodo/hotfolder/','/usr/local/kitodo/success/','/usr/local/kitodo/error_mets/',0,'Mets','Mets','Digital Library Kitodo','http://www.example.com/fileadmin/groups/kitodo/Logo/kitodo_logo_rgb.png','http://www.example.com','info@kitodo.org','http://www.example.com/DB=1/PPN?PPN=$(meta.topstruct.CatalogIDDigital)','http://www.example.com/resolver?id=$(meta.topstruct.CatalogIDDigital)','http://www.example.com/DB=1/PPN?PPN=$(meta.topstruct.CatalogIDDigital)','http://www.example.com/resolver?id=$(meta.topstruct.CatalogIDDigital)','http://www.example.com/content/$(meta.CatalogIDDigital)/$(meta.topstruct.CatalogIDDigital).xml','http://www.example.com/content/$(meta.firstchild.CatalogIDDigital)/$(meta.topstruct.CatalogIDDigital).xml ','http://www.example.com/resolver?id=$(meta.CatalogIDDigital)','','2016-01-01 00:00:00','2019-12-31 00:00:00',0,0,0,'INDEX');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectFileGroup`
--

DROP TABLE IF EXISTS `projectFileGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectFileGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `previewImage` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProjekteID` (`project_id`),
  CONSTRAINT `FK_projectFileGroup_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectFileGroup`
--

LOCK TABLES `projectFileGroup` WRITE;
/*!40000 ALTER TABLE `projectFileGroup` DISABLE KEYS */;
INSERT INTO `projectFileGroup` VALUES (1,'MAX','http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/max/','image/jpeg','jpg','',0,1),(2,'DEFAULT','http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/default/','image/jpeg','jpg','',0,1),(3,'THUMBS','http://www.example.com/content/$(meta.CatalogIDDigital)/jpgs/thumbs/','image/jpeg','jpg','',0,1),(4,'FULLTEXT','http://www.example.com/content/$(meta.CatalogIDDigital)/ocr/alto/','text/xml','xml','',0,1),(5,'DOWNLOAD','http://www.example.com/content/$(meta.CatalogIDDigital)/pdf/','application/pdf','pdf','',0,1);
/*!40000 ALTER TABLE `projectFileGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_x_user`
--

DROP TABLE IF EXISTS `project_x_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_x_user` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  KEY `FK_ProjekteID` (`project_id`),
  KEY `FK_BenutzerID` (`user_id`),
  CONSTRAINT `FK_project_x_user_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_project_x_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_x_user`
--

LOCK TABLES `project_x_user` WRITE;
/*!40000 ALTER TABLE `project_x_user` DISABLE KEYS */;
INSERT INTO `project_x_user` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `project_x_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `value` longtext,
  `obligatory` tinyint(1) DEFAULT NULL,
  `dataType` int(11) DEFAULT NULL,
  `choice` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `container` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruleset`
--

DROP TABLE IF EXISTS `ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruleset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `orderMetadataByRuleset` tinyint(1) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruleset`
--

LOCK TABLES `ruleset` WRITE;
/*!40000 ALTER TABLE `ruleset` DISABLE KEYS */;
INSERT INTO `ruleset` VALUES (1,'SLUBDD','ruleset_slubdd.xml',0,'INDEX'),(2,'SUBHH','ruleset_subhh.xml',0,'INDEX');
/*!40000 ALTER TABLE `ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `processingStatus` int(11) DEFAULT NULL,
  `editType` int(11) DEFAULT NULL,
  `processingTime` datetime DEFAULT NULL,
  `processingBegin` datetime DEFAULT NULL,
  `processingEnd` datetime DEFAULT NULL,
  `homeDirectory` smallint(6) DEFAULT NULL,
  `typeMetadata` tinyint(1) DEFAULT NULL,
  `typeAutomatic` tinyint(1) DEFAULT NULL,
  `typeImportFileUpload` tinyint(1) DEFAULT NULL,
  `typeExportRussian` tinyint(1) DEFAULT NULL,
  `typeImagesRead` tinyint(1) DEFAULT NULL,
  `typeImagesWrite` tinyint(1) DEFAULT NULL,
  `typeExportDms` tinyint(1) DEFAULT NULL,
  `typeAcceptModule` tinyint(1) DEFAULT NULL,
  `typeAcceptClose` tinyint(1) DEFAULT NULL,
  `typeAcceptModuleAndClose` tinyint(1) DEFAULT NULL,
  `typeScriptStep` tinyint(1) DEFAULT NULL,
  `scriptName1` varchar(255) DEFAULT NULL,
  `typeAutomaticScriptPath` varchar(255) DEFAULT NULL,
  `scriptName2` varchar(255) DEFAULT NULL,
  `typeAutomaticScriptPath2` varchar(255) DEFAULT NULL,
  `scriptName3` varchar(255) DEFAULT NULL,
  `typeAutomaticScriptPath3` varchar(255) DEFAULT NULL,
  `scriptName4` varchar(255) DEFAULT NULL,
  `typeAutomaticScriptPath4` varchar(255) DEFAULT NULL,
  `scriptName5` varchar(255) DEFAULT NULL,
  `typeAutomaticScriptPath5` varchar(255) DEFAULT NULL,
  `typeCloseVerify` tinyint(1) DEFAULT NULL,
  `typeModuleName` varchar(255) DEFAULT NULL,
  `batchStep` tinyint(1) DEFAULT NULL,
  `stepPlugin` varchar(255) DEFAULT NULL,
  `validationPlugin` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'This field contains information about user, which works on this task.',
  `process_id` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProzesseID` (`process_id`),
  KEY `FK_BearbeitungsBenutzerID` (`user_id`),
  CONSTRAINT `FK_task_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`),
  CONSTRAINT `FK_task_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Scanning',0,1,1,4,'2016-03-02 11:38:28',NULL,NULL,0,0,0,0,0,1,1,0,0,0,0,0,'','','','','','','','','','',0,NULL,0,'','',1,1,'INDEX'),(2,'QC',0,2,0,4,'2016-02-03 16:49:48',NULL,NULL,0,0,0,0,0,1,0,0,0,0,0,0,'','','','','','','','','','',0,NULL,0,'','',1,1,'INDEX'),(3,'Structure and metadata',0,3,0,4,'2016-02-03 16:49:48',NULL,NULL,0,1,0,0,0,0,0,0,1,0,0,0,'','','','','','','','','','',0,NULL,0,'','',1,1,'INDEX'),(4,'Export DMS',0,4,0,4,'2016-02-03 16:49:48',NULL,NULL,0,0,0,0,0,0,0,1,0,0,0,0,'','','','','','','','','','',0,NULL,0,'','',1,1,'INDEX');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_x_user`
--

DROP TABLE IF EXISTS `task_x_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_x_user` (
  `user_id` int(11) NOT NULL COMMENT 'This field contains information about users, which are allowed to work on this task.',
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  KEY `FK_SchritteID` (`task_id`),
  KEY `FK_BenutzerID` (`user_id`),
  CONSTRAINT `FK_task_x_user_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_task_x_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_x_user`
--

LOCK TABLES `task_x_user` WRITE;
/*!40000 ALTER TABLE `task_x_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_x_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_x_userGroup`
--

DROP TABLE IF EXISTS `task_x_userGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_x_userGroup` (
  `userGroup_id` int(11) NOT NULL COMMENT 'This field contains information about user''s groups, which are allowed to work on this task.',
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`userGroup_id`),
  KEY `FK_SchritteID` (`task_id`),
  KEY `FK_BenutzerGruppenID` (`userGroup_id`),
  CONSTRAINT `FK_task_x_userGroup_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_task_x_userGroup_userGroup_id` FOREIGN KEY (`userGroup_id`) REFERENCES `userGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_x_userGroup`
--

LOCK TABLES `task_x_userGroup` WRITE;
/*!40000 ALTER TABLE `task_x_userGroup` DISABLE KEYS */;
INSERT INTO `task_x_userGroup` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(5,3),(1,4),(6,4);
/*!40000 ALTER TABLE `task_x_userGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(255) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProzesseID` (`process_id`),
  CONSTRAINT `FK_template_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_x_property`
--

DROP TABLE IF EXISTS `template_x_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_x_property` (
  `template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  KEY `FK_template_x_property_template_id` (`template_id`),
  KEY `FK_template_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_template_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_template_x_property_template_id` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_x_property`
--

LOCK TABLES `template_x_property` WRITE;
/*!40000 ALTER TABLE `template_x_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_x_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `ldapLogin` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `metadataLanguage` varchar(255) DEFAULT NULL,
  `css` varchar(255) DEFAULT NULL,
  `withMassDownload` tinyint(1) DEFAULT NULL,
  `configProductionDateShow` tinyint(1) DEFAULT NULL,
  `tableSize` int(11) DEFAULT NULL,
  `sessionTimeout` int(11) DEFAULT NULL,
  `ldapGroup_id` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LdapgruppenID` (`ldapGroup_id`),
  CONSTRAINT `FK_user_ldapGroup_id` FOREIGN KEY (`ldapGroup_id`) REFERENCES `ldapGroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','Admin','testAdmin',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX'),(2,'test','Scanning','testScanning',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX'),(3,'test','QC','testQC',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX'),(4,'test','Imaging','testImaging',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX'),(5,'test','MetaData','testMetaData',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX'),(6,'test','Projectmanagement','testProjectmanagement',NULL,'OvEJ00yyYZQ=',1,NULL,'Göttingen','de',NULL,0,0,10,NULL,2,'INDEX');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userGroup`
--

DROP TABLE IF EXISTS `userGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userGroup`
--

LOCK TABLES `userGroup` WRITE;
/*!40000 ALTER TABLE `userGroup` DISABLE KEYS */;
INSERT INTO `userGroup` VALUES (1,'Administration',1,'INDEX'),(2,'Scanning',3,'INDEX'),(3,'QualityControl',3,'INDEX'),(4,'Imaging',3,'INDEX'),(5,'Metadata',3,'INDEX'),(6,'Projectmanagement',2,'INDEX');
/*!40000 ALTER TABLE `userGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_x_property`
--

DROP TABLE IF EXISTS `user_x_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_x_property` (
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  KEY `FK_user_x_property_user_id` (`user_id`),
  KEY `FK_user_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_user_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_user_x_property_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_x_property`
--

LOCK TABLES `user_x_property` WRITE;
/*!40000 ALTER TABLE `user_x_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_x_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_x_userGroup`
--

DROP TABLE IF EXISTS `user_x_userGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_x_userGroup` (
  `userGroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`,`userGroup_id`),
  KEY `FK_BenutzerGruppenID` (`userGroup_id`),
  KEY `FK_BenutzerID` (`user_id`),
  CONSTRAINT `FK_user_x_userGroup_userGroup_id` FOREIGN KEY (`userGroup_id`) REFERENCES `userGroup` (`id`),
  CONSTRAINT `FK_user_x_userGroup_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_x_userGroup`
--

LOCK TABLES `user_x_userGroup` WRITE;
/*!40000 ALTER TABLE `user_x_userGroup` DISABLE KEYS */;
INSERT INTO `user_x_userGroup` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `user_x_userGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workpiece`
--

DROP TABLE IF EXISTS `workpiece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workpiece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) NOT NULL,
  `indexAction` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProzesseID` (`process_id`),
  CONSTRAINT `FK_workpiece_process_id` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workpiece`
--

LOCK TABLES `workpiece` WRITE;
/*!40000 ALTER TABLE `workpiece` DISABLE KEYS */;
/*!40000 ALTER TABLE `workpiece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workpiece_x_property`
--

DROP TABLE IF EXISTS `workpiece_x_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workpiece_x_property` (
  `workpiece_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  KEY `FK_workpiece_x_property_workpiece_id` (`workpiece_id`),
  KEY `FK_workpiece_x_property_property_id` (`property_id`),
  CONSTRAINT `FK_workpiece_x_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_workpiece_x_property_workpiece_id` FOREIGN KEY (`workpiece_id`) REFERENCES `workpiece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workpiece_x_property`
--

LOCK TABLES `workpiece_x_property` WRITE;
/*!40000 ALTER TABLE `workpiece_x_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `workpiece_x_property` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-29 15:42:35
