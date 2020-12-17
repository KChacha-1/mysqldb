-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: applicant
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Capitalization`
--

DROP TABLE IF EXISTS `Capitalization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitalization` (
  `Capitalization_ID` varchar(10) NOT NULL,
  `Round_Type` varchar(10) DEFAULT NULL,
  `Investor` varchar(50) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Number_Of_Shares` int DEFAULT NULL,
  `Capital_Invested` int DEFAULT NULL,
  `Percent_Ownership` int DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Capitalization_ID`),
  KEY `Capitial_PK` (`Applicant_ID`),
  KEY `country_name` (`Country_ID`),
  KEY `owned_perecent` (`Percent_Ownership`),
  CONSTRAINT `Capitial_PK` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capitalization`
--

LOCK TABLES `Capitalization` WRITE;
/*!40000 ALTER TABLE `Capitalization` DISABLE KEYS */;
INSERT INTO `Capitalization` VALUES ('AC1','Equity','Warren Buffet','US',300000,23300000,40,'Apple5'),('AC2','Debt','CCP','CN',3000,3999999,13,'Apple5'),('AC3','Debt','DE','DE',344,33333,10,'Apple5'),('AC4','Equity','Aussie Guy','AU',32323,43343,10,'Apple5'),('MC1','Equity','Jack Ma','CN',3393,33888,10,'Msft4'),('MC2','Equity','NSA','US',39933,39393,20,'Msft4'),('TC1','Debt','CCP','CN',100000,10000000,22,'Tesla6'),('TC2','Debt','Ukraine','UA',3434,343434,20,'Tesla6'),('TC3','Debt','Maduro','VE',48484,484994,23,'Tesla6');
/*!40000 ALTER TABLE `Capitalization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company_Application`
--

DROP TABLE IF EXISTS `Company_Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company_Application` (
  `Applicant_ID` varchar(10) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Company_Name` varchar(50) DEFAULT NULL,
  `EIN` varchar(50) DEFAULT NULL,
  `DBA` varchar(50) DEFAULT NULL,
  `DUN` varchar(50) DEFAULT NULL,
  `Entity_Type` varchar(50) DEFAULT NULL,
  `CompanyHQ_Address` varchar(50) DEFAULT NULL,
  `CompanyHQ_Unit_Number` varchar(10) DEFAULT NULL,
  `Zip_Code` varchar(5) DEFAULT NULL,
  `State_ID` varchar(2) DEFAULT NULL,
  `Company_Description` varchar(500) DEFAULT NULL,
  `NAICS_ID` varchar(2) DEFAULT NULL,
  `Fin_ID` varchar(10) DEFAULT NULL,
  `Primary_Sector_ID` int DEFAULT NULL,
  `Secondary_Sector_ID` int DEFAULT NULL,
  `Tertiary_Sector_ID` int DEFAULT NULL,
  `Regulatory_Issues` tinyint(1) DEFAULT NULL,
  `Regulatory_Action` varchar(50) DEFAULT NULL,
  `Convicted_Felonies` tinyint(1) DEFAULT NULL,
  `Company_Taxes` tinyint(1) DEFAULT NULL,
  `DCSA_Clearance` enum('yes','no','on hold') DEFAULT NULL,
  `SF-328` enum('yes','no','in process') DEFAULT NULL,
  `Foreign_Owned_ID` varchar(10) DEFAULT NULL,
  `Contract_ID` varchar(10) DEFAULT NULL,
  `Cyber_Key` varchar(10) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Patent_Number` varchar(50) DEFAULT NULL,
  `Customer_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Applicant_ID`),
  KEY `Company_Application___fk` (`State_ID`),
  KEY `Company_Application_Cyber_Cyber_Key_fk` (`Cyber_Key`),
  KEY `Company_Application_Tertiary_Sector_Tertiary_Sector_ID_fk` (`Tertiary_Sector_ID`),
  KEY `Company_Application_Primary_Sector_Primary_Sector_ID_fk` (`Primary_Sector_ID`),
  KEY `Company_Application_Secondary_Sector_Secondary_Sector_ID_fk` (`Secondary_Sector_ID`),
  KEY `Company_Application_NAICS_Physical_Products_NAICS_ID_fk` (`NAICS_ID`),
  KEY `Company_Application_Revenue_By_Customer_Customer_ID_fk` (`Customer_ID`),
  KEY `Company_Application_Company_Ownership_Foriegn_Owned_ID_fk` (`Foreign_Owned_ID`),
  KEY `by_comp_name` (`DBA`),
  KEY `comp_app` (`Applicant_ID`),
  CONSTRAINT `Company_Application___fk` FOREIGN KEY (`State_ID`) REFERENCES `State` (`State_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Company_Application_Company_Ownership_Foriegn_Owned_ID_fk` FOREIGN KEY (`Foreign_Owned_ID`) REFERENCES `Company_Ownership` (`Foriegn_Owned_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Company_Application_Cyber_Cyber_Key_fk` FOREIGN KEY (`Cyber_Key`) REFERENCES `Cyber` (`Cyber_Key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Company_Application_Revenue_By_Customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `Revenue_By_Customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company_Application`
--

LOCK TABLES `Company_Application` WRITE;
/*!40000 ALTER TABLE `Company_Application` DISABLE KEYS */;
INSERT INTO `Company_Application` VALUES ('Apple5','Tim','Apple','2343434','TApple@icloud.com','Apple Inc','23232344','Apple','4244242443','C','1 Mountain View Rd, Palo Alto','1','94304','CA','Electronics','2','2',2,NULL,NULL,0,NULL,0,1,'yes','no',NULL,NULL,NULL,NULL,NULL,NULL),('Msft4','Bill','Gates','3833838833','Bgates@bing.com','Microsoft Inc','339029309','Microsoft','392093209','C','3223 in ,Seattle','1','23232','WA','Computer Software','3','3',3,NULL,NULL,0,NULL,0,1,'yes','no',NULL,NULL,NULL,NULL,NULL,NULL),('Tesla6','Elon','MusK','1233434344','ElonMusk@tesla.com','Tesla Inc','1290329203','Tesla','14-828-4255','C','3500 Deer Creek Rd, Palo Alto','1','94304','CA','Electric Cars','1','1',1,NULL,NULL,0,NULL,0,1,'no','no',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Company_Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company_Ownership`
--

DROP TABLE IF EXISTS `Company_Ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company_Ownership` (
  `Foriegn_Owned_ID` varchar(10) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Foriegn_isthere` tinyint(1) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Foriegn_Owned_ID`),
  KEY `Company_Ownership_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Company_Ownership_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company_Ownership`
--

LOCK TABLES `Company_Ownership` WRITE;
/*!40000 ALTER TABLE `Company_Ownership` DISABLE KEYS */;
INSERT INTO `Company_Ownership` VALUES ('AF1','Tim Cook',1,'CN','Apple5'),('MF1','Bill Gates',1,'US','MSFT4'),('TF1','Elon Musk',1,'US','Tesla6');
/*!40000 ALTER TABLE `Company_Ownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `Country_ID` varchar(2) NOT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  `Risk_Factor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES ('AD','Andorra','Low Risk'),('AE','United Arab Emirates','Low Risk'),('AF','Afghanistan','Low Risk'),('AG','Antigua and Barbuda','Low Risk'),('AI','Anguilla','Low Risk'),('AL','Albania','Low Risk'),('AM','Armenia','Low Risk'),('AN','Netherlands Antilles','Low Risk'),('AO','Angola','Low Risk'),('AQ','Antarctica','Low Risk'),('AR','Argentina','Low Risk'),('AS','American Samoa','Low Risk'),('AT','Austria','Low Risk'),('AU','Australia','Low Risk'),('AW','Aruba','Low Risk'),('AZ','Azerbaijan','Low Risk'),('BA','Bosnia and Herzegovina','Low Risk'),('BB','Barbados','Low Risk'),('BD','Bangladesh','Low Risk'),('BE','Belgium','Low Risk'),('BF','Burkina Faso','Low Risk'),('BG','Bulgaria','Low Risk'),('BH','Bahrain','Low Risk'),('BI','Burundi','Low Risk'),('BJ','Benin','Low Risk'),('BM','Bermuda','Low Risk'),('BN','Brunei','Low Risk'),('BO','Bolivia','Low Risk'),('BR','Brazil','Low Risk'),('BS','Bahamas','Low Risk'),('BT','Bhutan','Low Risk'),('BV','Bouvet Island','Low Risk'),('BW','Botswana','Low Risk'),('BY','Belarus','Low Risk'),('BZ','Belize','Low Risk'),('CA','Canada','Low Risk'),('CC','Cocos [Keeling] Islands','Low Risk'),('CD','Congo [DRC]','Low Risk'),('CF','Central African Republic','Low Risk'),('CG','Congo [Republic]','Low Risk'),('CH','Switzerland','Low Risk'),('CI','Côte d\'Ivoire','Low Risk'),('CK','Cook Islands','Low Risk'),('CL','Chile','Low Risk'),('CM','Cameroon','Low Risk'),('CN','China','High Risk'),('CR','Costa Rica','Low Risk'),('CU','Cuba','Low Risk'),('CV','Cape Verde','Low Risk'),('CX','Christmas Island','Low Risk'),('CY','Cyprus','Low Risk'),('CZ','Czech Republic','Low Risk'),('DE','Germany','Low Risk'),('DJ','Djibouti','Low Risk'),('DK','Denmark','Low Risk'),('DM','Dominica','Low Risk'),('DO','Dominican Republic','Low Risk'),('DZ','Algeria','Low Risk'),('EC','Ecuador','Low Risk'),('EE','Estonia','Low Risk'),('EG','Egypt','Low Risk'),('EH','Western Sahara','Low Risk'),('ER','Eritrea','Low Risk'),('ES','Spain','Low Risk'),('ET','Ethiopia','Low Risk'),('FI','Finland','Low Risk'),('FJ','Fiji','Low Risk'),('FK','Falkland Islands [Islas Malvinas]','Low Risk'),('FM','Micronesia','Low Risk'),('FO','Faroe Islands','Low Risk'),('FR','France','Low Risk'),('GA','Gabon','Low Risk'),('GB','United Kingdom','Low Risk'),('GD','Grenada','Low Risk'),('GE','Georgia','Low Risk'),('GF','French Guiana','Low Risk'),('GG','Guernsey','Low Risk'),('GH','Ghana','Low Risk'),('GI','Gibraltar','Low Risk'),('GL','Greenland','Low Risk'),('GM','Gambia','Low Risk'),('GN','Guinea','Low Risk'),('GP','Guadeloupe','Low Risk'),('GQ','Equatorial Guinea','Low Risk'),('GR','Greece','Low Risk'),('GS','South Georgia and the South Sandwich Islands','Low Risk'),('GT','Guatemala','Low Risk'),('GU','Guam','Low Risk'),('GW','Guinea-Bissau','Low Risk'),('GY','Guyana','Low Risk'),('GZ','Gaza Strip','Low Risk'),('HK','Hong Kong','Low Risk'),('HM','Heard Island and McDonald Islands','Low Risk'),('HN','Honduras','Low Risk'),('HR','Croatia','Low Risk'),('HT','Haiti','Low Risk'),('HU','Hungary','Low Risk'),('ID','Indonesia','Low Risk'),('IE','Ireland','Low Risk'),('IL','Israel','Low Risk'),('IM','Isle of Man','Low Risk'),('IN','India','Low Risk'),('IO','British Indian Ocean Territory','Low Risk'),('IQ','Iraq','Low Risk'),('IR','Iran','High Risk'),('IS','Iceland','Low Risk'),('IT','Italy','Low Risk'),('JE','Jersey','Low Risk'),('JM','Jamaica','Low Risk'),('JO','Jordan','Low Risk'),('JP','Japan','Low Risk'),('KE','Kenya','Low Risk'),('KG','Kyrgyzstan','Low Risk'),('KH','Cambodia','Low Risk'),('KI','Kiribati','Low Risk'),('KM','Comoros','Low Risk'),('KN','Saint Kitts and Nevis','Low Risk'),('KP','North Korea','Low Risk'),('KR','South Korea','Low Risk'),('KW','Kuwait','Low Risk'),('KY','Cayman Islands','Low Risk'),('KZ','Kazakhstan','Low Risk'),('LA','Laos','Low Risk'),('LB','Lebanon','Low Risk'),('LC','Saint Lucia','Low Risk'),('LI','Liechtenstein','Low Risk'),('LK','Sri Lanka','Low Risk'),('LR','Liberia','Low Risk'),('LS','Lesotho','Low Risk'),('LT','Lithuania','Low Risk'),('LU','Luxembourg','Low Risk'),('LV','Latvia','Low Risk'),('LY','Libya','Low Risk'),('MA','Morocco','Low Risk'),('MC','Monaco','Low Risk'),('MD','Moldova','Low Risk'),('ME','Montenegro','Low Risk'),('MG','Madagascar','Low Risk'),('MH','Marshall Islands','Low Risk'),('MK','Macedonia [FYROM]','Low Risk'),('ML','Mali','Low Risk'),('MM','Myanmar [Burma]','Low Risk'),('MN','Mongolia','Low Risk'),('MO','Macau','Low Risk'),('MP','Northern Mariana Islands','Low Risk'),('MQ','Martinique','Low Risk'),('MR','Mauritania','Low Risk'),('MS','Montserrat','Low Risk'),('MT','Malta','Low Risk'),('MU','Mauritius','Low Risk'),('MV','Maldives','Low Risk'),('MW','Malawi','Low Risk'),('MX','Mexico','Low Risk'),('MY','Malaysia','Low Risk'),('MZ','Mozambique','Low Risk'),('NA','Namibia','Low Risk'),('NC','New Caledonia','Low Risk'),('NE','Niger','Low Risk'),('NF','Norfolk Island','Low Risk'),('NG','Nigeria','Low Risk'),('NI','Nicaragua','Low Risk'),('NL','Netherlands','Low Risk'),('NO','Norway','Low Risk'),('NP','Nepal','Low Risk'),('NR','Nauru','Low Risk'),('NU','Niue','Low Risk'),('NZ','New Zealand','Low Risk'),('OM','Oman','Low Risk'),('PA','Panama','Low Risk'),('PE','Peru','Low Risk'),('PF','French Polynesia','Low Risk'),('PG','Papua New Guinea','Low Risk'),('PH','Philippines','Low Risk'),('PK','Pakistan','Low Risk'),('PL','Poland','Low Risk'),('PM','Saint Pierre and Miquelon','Low Risk'),('PN','Pitcairn Islands','Low Risk'),('PR','Puerto Rico','Low Risk'),('PS','Palestinian Territories','Low Risk'),('PT','Portugal','Low Risk'),('PW','Palau','Low Risk'),('PY','Paraguay','Low Risk'),('QA','Qatar','Low Risk'),('RE','Réunion','Low Risk'),('RO','Romania','Low Risk'),('RS','Serbia','Low Risk'),('RU','Russia','Low Risk'),('RW','Rwanda','Low Risk'),('SA','Saudi Arabia','Low Risk'),('SB','Solomon Islands','Low Risk'),('SC','Seychelles','Low Risk'),('SD','Sudan','Low Risk'),('SE','Sweden','Low Risk'),('SG','Singapore','Low Risk'),('SH','Saint Helena','Low Risk'),('SI','Slovenia','Low Risk'),('SJ','Svalbard and Jan Mayen','Low Risk'),('SK','Slovakia','Low Risk'),('SL','Sierra Leone','Low Risk'),('SM','San Marino','Low Risk'),('SN','Senegal','Low Risk'),('SO','Somalia','High Risk'),('SR','Suriname','Low Risk'),('ST','São Tomé and Príncipe','Low Risk'),('SV','El Salvador','Low Risk'),('SY','Syria','Low Risk'),('SZ','Swaziland','Low Risk'),('TC','Turks and Caicos Islands','Low Risk'),('TD','Chad','Low Risk'),('TF','French Southern Territories','Low Risk'),('TG','Togo','Low Risk'),('TH','Thailand','Low Risk'),('TJ','Tajikistan','Low Risk'),('TK','Tokelau','Low Risk'),('TL','Timor-Leste','Low Risk'),('TM','Turkmenistan','Low Risk'),('TN','Tunisia','Low Risk'),('TO','Tonga','Low Risk'),('TR','Turkey','Low Risk'),('TT','Trinidad and Tobago','Low Risk'),('TV','Tuvalu','Low Risk'),('TW','Taiwan','Low Risk'),('TZ','Tanzania','Low Risk'),('UA','Ukraine','High Risk'),('UG','Uganda','Low Risk'),('UM','U.S. Minor Outlying Islands','Low Risk'),('US','United States','Low Risk'),('UY','Uruguay','Low Risk'),('UZ','Uzbekistan','Low Risk'),('VA','Vatican City','Low Risk'),('VC','Saint Vincent and the Grenadines','Low Risk'),('VE','Venezuela','High Risk'),('VG','British Virgin Islands','Low Risk'),('VI','U.S. Virgin Islands','Low Risk'),('VN','Vietnam','Low Risk'),('VU','Vanuatu','Low Risk'),('WF','Wallis and Futuna','Low Risk'),('WS','Samoa','Low Risk'),('XK','Kosovo','Low Risk'),('YE','Yemen','Low Risk'),('YT','Mayotte','Low Risk'),('ZA','South Africa','Low Risk'),('ZM','Zambia','Low Risk'),('ZW','Zimbabwe','Low Risk');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cyber`
--

DROP TABLE IF EXISTS `Cyber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cyber` (
  `Cyber_Key` varchar(10) NOT NULL,
  `CMMC` tinyint(1) DEFAULT NULL,
  `Audits` tinyint(1) DEFAULT NULL,
  `System_Security_Plan` tinyint(1) DEFAULT NULL,
  `Auth_users` tinyint(1) DEFAULT NULL,
  `Auth_Transactions` tinyint(1) DEFAULT NULL,
  `Verify_Connections` tinyint(1) DEFAULT NULL,
  `Info_Control` tinyint(1) DEFAULT NULL,
  `Auth_ID` tinyint(1) DEFAULT NULL,
  `Sanitize` tinyint(1) DEFAULT NULL,
  `Auth_Physical` tinyint(1) DEFAULT NULL,
  `On_SIte_Security` tinyint(1) DEFAULT NULL,
  `Subnets` tinyint(1) DEFAULT NULL,
  `Vulnerabilities` tinyint(1) DEFAULT NULL,
  `Antivirus` tinyint(1) DEFAULT NULL,
  `Security_Patches` tinyint(1) DEFAULT NULL,
  `Security_Scans` tinyint(1) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cyber_Key`),
  KEY `Cyber_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Cyber_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cyber`
--

LOCK TABLES `Cyber` WRITE;
/*!40000 ALTER TABLE `Cyber` DISABLE KEYS */;
INSERT INTO `Cyber` VALUES ('TCY1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Cyber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entity`
--

DROP TABLE IF EXISTS `Entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entity` (
  `Entity_Type` varchar(50) NOT NULL,
  `Entity_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Entity_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity`
--

LOCK TABLES `Entity` WRITE;
/*!40000 ALTER TABLE `Entity` DISABLE KEYS */;
INSERT INTO `Entity` VALUES ('B','B-Corp'),('C','C-Corp'),('LLC','Limited Liability Company'),('LLP','Limited Liability Partnership'),('S','S-Corp');
/*!40000 ALTER TABLE `Entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financing_Round`
--

DROP TABLE IF EXISTS `Financing_Round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Financing_Round` (
  `Fin_ID` varchar(10) NOT NULL,
  `Equity_Round_Financing` tinyint(1) DEFAULT NULL,
  `Financing_Type` varchar(10) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Fin_ID`),
  KEY `Financing_Round_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Financing_Round_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financing_Round`
--

LOCK TABLES `Financing_Round` WRITE;
/*!40000 ALTER TABLE `Financing_Round` DISABLE KEYS */;
/*!40000 ALTER TABLE `Financing_Round` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Foreign_Owned_Entities`
--

DROP TABLE IF EXISTS `Foreign_Owned_Entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Foreign_Owned_Entities` (
  `Foriegn_Owned_ID` varchar(10) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  `Foreign_isthere` tinyint(1) NOT NULL,
  PRIMARY KEY (`Foriegn_Owned_ID`),
  KEY `Foreign_Owned_Entities_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `Foreign_Owned_Entities_Country_Country_ID_fk` (`Country_ID`),
  CONSTRAINT `Foreign_Owned_Entities_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Foreign_Owned_Entities_Country_Country_ID_fk` FOREIGN KEY (`Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Foreign_Owned_Entities`
--

LOCK TABLES `Foreign_Owned_Entities` WRITE;
/*!40000 ALTER TABLE `Foreign_Owned_Entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Foreign_Owned_Entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAICS_Physical_Products`
--

DROP TABLE IF EXISTS `NAICS_Physical_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAICS_Physical_Products` (
  `NAICS_ID` varchar(2) NOT NULL,
  `Physical_Products` tinyint(1) DEFAULT NULL,
  `Material_Name/Type` varchar(50) DEFAULT NULL,
  `Percent_Of_Component` int DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NAICS_ID`),
  KEY `NAICS_Physical_Products_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `NAICS_Physical_Products_Country_Country_ID_fk` (`Country_ID`),
  CONSTRAINT `NAICS_Physical_Products_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NAICS_Physical_Products_Country_Country_ID_fk` FOREIGN KEY (`Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAICS_Physical_Products`
--

LOCK TABLES `NAICS_Physical_Products` WRITE;
/*!40000 ALTER TABLE `NAICS_Physical_Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAICS_Physical_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Other_Business_(Branch)`
--

DROP TABLE IF EXISTS `Other_Business_(Branch)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Other_Business_(Branch)` (
  `Other_Branch_ID` varchar(10) NOT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  `State_ID` varchar(2) DEFAULT NULL,
  `Other_Address` varchar(50) DEFAULT NULL,
  `Other_ZIp` varchar(5) DEFAULT NULL,
  `Other_Unit` int DEFAULT NULL,
  PRIMARY KEY (`Other_Branch_ID`),
  KEY `Other_Business_(Branch)_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `Other_Business_(Branch)_State_State_ID_fk` (`State_ID`),
  CONSTRAINT `Other_Business_(Branch)_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Other_Business_(Branch)_State_State_ID_fk` FOREIGN KEY (`State_ID`) REFERENCES `State` (`State_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Other_Business_(Branch)`
--

LOCK TABLES `Other_Business_(Branch)` WRITE;
/*!40000 ALTER TABLE `Other_Business_(Branch)` DISABLE KEYS */;
/*!40000 ALTER TABLE `Other_Business_(Branch)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patent`
--

DROP TABLE IF EXISTS `Patent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patent` (
  `Patent_Number` varchar(50) NOT NULL,
  `Patent_Name` varchar(50) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Patent_Number`),
  KEY `Patent_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `Patent_Country_Country_ID_fk` (`Country_ID`),
  CONSTRAINT `Patent_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Patent_Country_Country_ID_fk` FOREIGN KEY (`Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patent`
--

LOCK TABLES `Patent` WRITE;
/*!40000 ALTER TABLE `Patent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_To_Foreign_Entities`
--

DROP TABLE IF EXISTS `Payment_To_Foreign_Entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment_To_Foreign_Entities` (
  `Contract_ID` int NOT NULL,
  `Contract_Option` tinyint(1) DEFAULT NULL,
  `Contract_Name` varchar(50) DEFAULT NULL,
  `Country_ID` varchar(50) DEFAULT NULL,
  `Applicant_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Contract_ID`),
  KEY `Payment_To_Foreign_Entities_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `Payment_To_Foreign_Entities_Country_Country_ID_fk` (`Country_ID`),
  CONSTRAINT `Payment_To_Foreign_Entities_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Payment_To_Foreign_Entities_Country_Country_ID_fk` FOREIGN KEY (`Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_To_Foreign_Entities`
--

LOCK TABLES `Payment_To_Foreign_Entities` WRITE;
/*!40000 ALTER TABLE `Payment_To_Foreign_Entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment_To_Foreign_Entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Primary_Sector`
--

DROP TABLE IF EXISTS `Primary_Sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Primary_Sector` (
  `Primary_Sector_ID` int NOT NULL,
  `Sector_ID` int DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Primary_Sector_ID`),
  KEY `Primary Sector_Sector_List_Sector_ID_fk` (`Sector_ID`),
  KEY `Primary_Sector_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Primary Sector_Sector_List_Sector_ID_fk` FOREIGN KEY (`Sector_ID`) REFERENCES `Sector_List` (`Sector_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Primary_Sector_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Primary_Sector`
--

LOCK TABLES `Primary_Sector` WRITE;
/*!40000 ALTER TABLE `Primary_Sector` DISABLE KEYS */;
INSERT INTO `Primary_Sector` VALUES (1,18,'Tesla6'),(2,15,'Apple5');
/*!40000 ALTER TABLE `Primary_Sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Revenue_By_Customer`
--

DROP TABLE IF EXISTS `Revenue_By_Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Revenue_By_Customer` (
  `Customer_ID` varchar(10) NOT NULL,
  `Customer_Name` varchar(50) DEFAULT NULL,
  `Country_ID` varchar(2) DEFAULT NULL,
  `Percent_of_Revenue` int DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `Revenue_By_Customer_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  KEY `Revenue_By_Customer_Country_Country_ID_fk` (`Country_ID`),
  CONSTRAINT `Revenue_By_Customer_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Revenue_By_Customer_Country_Country_ID_fk` FOREIGN KEY (`Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revenue_By_Customer`
--

LOCK TABLES `Revenue_By_Customer` WRITE;
/*!40000 ALTER TABLE `Revenue_By_Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Revenue_By_Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Secondary_Sector`
--

DROP TABLE IF EXISTS `Secondary_Sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Secondary_Sector` (
  `Secondary_Sector_ID` int NOT NULL,
  `Sector_ID` int DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Secondary_Sector_ID`),
  KEY `Secondary Sector_Sector_List_Sector_ID_fk` (`Sector_ID`),
  KEY `Secondary_Sector_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Secondary Sector_Sector_List_Sector_ID_fk` FOREIGN KEY (`Sector_ID`) REFERENCES `Sector_List` (`Sector_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Secondary_Sector_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Secondary_Sector`
--

LOCK TABLES `Secondary_Sector` WRITE;
/*!40000 ALTER TABLE `Secondary_Sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `Secondary_Sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sector_List`
--

DROP TABLE IF EXISTS `Sector_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sector_List` (
  `Sector_ID` int NOT NULL,
  `Sector_Name` varchar(20) NOT NULL,
  `Sub_Sector_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Sector_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sector_List`
--

LOCK TABLES `Sector_List` WRITE;
/*!40000 ALTER TABLE `Sector_List` DISABLE KEYS */;
INSERT INTO `Sector_List` VALUES (1,'Biotechnology','Nanobiology'),(2,'Biotechnology','Synthetic biology'),(3,'Biotechnology','Genomic and genetic '),(4,'Biotechnology','Neurotech'),(5,'Artificial intellige','Neural networks and '),(6,'Artificial intellige',' Evolution and genet'),(7,'Artificial intellige','Reinforcement learni'),(8,'Position, Navigation','Position, Navigation'),(9,'Microprocessor techn','Systems-on-Chip (SoC'),(10,'Microprocessor techn','Stacked Memory on Ch'),(11,'Advanced computing t','Memory-centric logic'),(12,'Data analytics techn','Visualization'),(13,'Data analytics techn','Automated analysis a'),(14,'Data analytics techn','Context-aware comput'),(15,'Quantum information ','Quantum computing'),(16,'Quantum information ','Quantum encryption'),(17,'Quantum information ','Quantum sensing'),(18,'Logistics technology','Mobile electric powe'),(19,'Logistics technology','Modeling and simulat'),(20,'Logistics technology','Total asset visibili'),(21,'Logistics technology','Distribution-based L'),(22,'Additive manufacturi','Additive manufacturi'),(23,'Robotics','Micro-drone and micr'),(24,'Robotics','Swarming technology'),(25,'Robotics','Self-assembling robo'),(26,'Robotics','Molecular robotics'),(27,'Robotics','Robot compliers'),(28,'Robotics','Smart Dust'),(29,'Brain-computer inter','Neural-controlled in'),(30,'Brain-computer inter','Mind-machine interfa'),(31,'Brain-computer inter','Direct neural interf'),(32,'Brain-computer inter','Brain-machine interf'),(33,'Hypersonics','Flight control algor'),(34,'Hypersonics','Propulsion technolog'),(35,'Hypersonics','Thermal protection s'),(36,'Hypersonics','Specialized material'),(37,'Advanced Materials','Adaptive camouflage'),(38,'Advanced Materials','Functional textiles'),(39,'Advanced Materials','Biomaterials'),(40,'Advanced surveillanc','Faceprint and voicep');
/*!40000 ALTER TABLE `Sector_List` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `State`
--

DROP TABLE IF EXISTS `State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `State` (
  `State_ID` varchar(2) NOT NULL,
  `State_Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`State_ID`),
  KEY `Key` (`State_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `State`
--

LOCK TABLES `State` WRITE;
/*!40000 ALTER TABLE `State` DISABLE KEYS */;
INSERT INTO `State` VALUES ('AL','Alabama'),('AK','Alaska'),('AZ','Arizona'),('AR','Arkansas'),('CA','California'),('CO','Colorado'),('CT','Connecticu'),('DE','Delaware'),('DC','District o'),('FL','Florida'),('GA','Georgia'),('HI','Hawaii'),('ID','Idaho'),('IL','Illinois'),('IN','Indiana'),('IA','Iowa'),('KS','Kansas'),('KY','Kentucky'),('LA','Louisiana'),('ME','Maine'),('MD','Maryland'),('MA','Massachuse'),('MI','Michigan'),('MN','Minnesota'),('MS','Mississipp'),('MO','Missouri'),('MT','Montana'),('NE','Nebraska'),('NV','Nevada'),('NH','New Hampsh'),('NJ','New Jersey'),('NM','New Mexico'),('NY','New York'),('NC','North Caro'),('ND','North Dako'),('OH','Ohio'),('OK','Oklahoma'),('OR','Oregon'),('PA','Pennsylvan'),('RI','Rhode Isla'),('SC','South Caro'),('SD','South Dako'),('St','State_Name'),('TN','Tennessee'),('TX','Texas'),('UT','Utah'),('VT','Vermont'),('VA','Virginia'),('WA','Washington'),('WV','West Virgi'),('WI','Wisconsin'),('WY','Wyoming');
/*!40000 ALTER TABLE `State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tertiary_Sector`
--

DROP TABLE IF EXISTS `Tertiary_Sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tertiary_Sector` (
  `Tertiary_Sector_ID` int NOT NULL,
  `Sector_ID` int DEFAULT NULL,
  `Applicant_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Tertiary_Sector_ID`),
  KEY `Tertiary_Sector_Sector_List_Sector_ID_fk` (`Sector_ID`),
  KEY `Tertiary_Sector_Company_Application_Applicant_ID_fk` (`Applicant_ID`),
  CONSTRAINT `Tertiary_Sector_Company_Application_Applicant_ID_fk` FOREIGN KEY (`Applicant_ID`) REFERENCES `Company_Application` (`Applicant_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Tertiary_Sector_Sector_List_Sector_ID_fk` FOREIGN KEY (`Sector_ID`) REFERENCES `Sector_List` (`Sector_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tertiary_Sector`
--

LOCK TABLES `Tertiary_Sector` WRITE;
/*!40000 ALTER TABLE `Tertiary_Sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tertiary_Sector` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 14:07:51
