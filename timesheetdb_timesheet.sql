CREATE DATABASE  IF NOT EXISTS `timesheetdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `timesheetdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: timesheetdb
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `idTimesheet` int(11) NOT NULL AUTO_INCREMENT,
  `month_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `workHour` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTimesheet`),
  KEY `fk_m_id_idx` (`month_id`),
  KEY `fk_e_id_idx` (`emp_id`),
  CONSTRAINT `fk_e_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_id` FOREIGN KEY (`month_id`) REFERENCES `month` (`idMonth`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (35,8,6,'R',1,'',8),(36,8,6,'R',2,'',8),(37,8,6,'W',3,'',0),(38,8,6,'W',4,'',0),(39,8,6,'SL',5,'Sick',0),(40,8,6,'R',6,'',8),(41,8,6,'R',7,'',8),(42,8,6,'R',8,'',8),(43,8,6,'R',9,'',8),(44,8,6,'W',10,'',0),(45,8,6,'W',11,'',0),(46,8,6,'H',12,'',0),(47,8,6,'H',13,'',0),(48,8,6,'R',14,'',8),(49,8,6,'R',15,'',8),(50,8,6,'R',16,'',8),(51,8,6,'W',17,'',0),(52,8,6,'W',18,'',0),(53,8,6,'R',19,'',8),(54,8,6,'R',20,'',8),(55,8,6,'R',21,'',8),(56,8,6,'R',22,'',8),(57,8,6,'R',23,'',8),(58,8,6,'W',24,'',0),(59,8,6,'W',25,'',0),(60,8,6,'R',26,'',8),(61,8,6,'R',27,'',8),(62,8,6,'NF',28,'',0),(63,8,6,'NF',29,'',0),(64,8,6,'NF',30,'',0),(65,8,6,'W',31,'',0),(66,8,7,'R',1,'',8),(67,8,7,'R',2,'',8),(68,8,7,'W',3,'',0),(69,8,7,'W',4,'',0),(70,8,7,'R',5,'',8),(71,8,7,'R',6,'',8),(72,8,7,'R',7,'',8),(73,8,7,'R',8,'',8),(74,8,7,'R',9,'',8),(75,8,7,'W',10,'',0),(76,8,7,'W',11,'',0),(77,8,7,'H',12,'',0),(78,8,7,'H',13,'',0),(79,8,7,'R',14,'',8),(80,8,7,'R',15,'',8),(81,8,7,'R',16,'',8),(82,8,7,'W',17,'',0),(83,8,7,'W',18,'',0),(84,8,7,'R',19,'',8),(85,8,7,'R',20,'',8),(86,8,7,'R',21,'',8),(87,8,7,'R',22,'',8),(88,8,7,'R',23,'',8),(89,8,7,'W',24,'',0),(90,8,7,'W',25,'',0),(91,8,7,'R',26,'',8),(92,8,7,'R',27,'',8),(93,8,7,'NF',28,'',0),(94,8,7,'NF',29,'',0),(95,8,7,'NF',30,'',0),(96,8,7,'W',31,'',0),(97,8,8,'R',1,'',8),(98,8,8,'R',2,'',8),(99,8,8,'W',3,'',0),(100,8,8,'W',4,'',0),(101,8,8,'NF',5,'',0),(102,8,8,'NF',6,'',0),(103,8,8,'NF',7,'',0),(104,8,8,'NF',8,'',0),(105,8,8,'NF',9,'',0),(106,8,8,'W',10,'',0),(107,8,8,'W',11,'',0),(108,8,8,'H',12,'',0),(109,8,8,'H',13,'',0),(110,8,8,'NF',14,'',0),(111,8,8,'NF',15,'',0),(112,8,8,'NF',16,'',0),(113,8,8,'W',17,'',0),(114,8,8,'W',18,'',0),(115,8,8,'NF',19,'',0),(116,8,8,'NF',20,'',0),(117,8,8,'NF',21,'',0),(118,8,8,'NF',22,'',0),(119,8,8,'NF',23,'',0),(120,8,8,'W',24,'',0),(121,8,8,'W',25,'',0),(122,8,8,'NF',26,'',0),(123,8,8,'NF',27,'',0),(124,8,8,'NF',28,'',0),(125,8,8,'NF',29,'',0),(126,8,8,'NF',30,'',0),(127,8,8,'W',31,'',0),(128,9,6,'NF',1,NULL,0);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-27 11:59:49
