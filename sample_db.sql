-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: mafia
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Current Database: `mafia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mafia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mafia`;

--
-- Table structure for table `Actions`
--

DROP TABLE IF EXISTS `Actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `rapid` binary(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actions`
--

LOCK TABLES `Actions` WRITE;
/*!40000 ALTER TABLE `Actions` DISABLE KEYS */;
INSERT INTO `Actions` VALUES (1,'Check for vampire','Check if a chosen person is a vampire',_binary '1'),(2,'Check for sheriff','Check if a chosen person is a sheriff',_binary '1'),(3,'Check for civilians','Check if a chosen person is a civilian',_binary '1'),(4,'Attack','Attack a person. The result depends on the role of the victim and a number of attackers',_binary '0'),(5,'Defend','Defend a person from an attack. The result depend on the number of attackers and defenders.',_binary '0'),(6,'Check for werewolveness','Check if a person is a werewolf',_binary '1');
/*!40000 ALTER TABLE `Actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fractions`
--

DROP TABLE IF EXISTS `Fractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fractions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fractions`
--

LOCK TABLES `Fractions` WRITE;
/*!40000 ALTER TABLE `Fractions` DISABLE KEYS */;
INSERT INTO `Fractions` VALUES (1,'Vampires'),(2,'Werewolf'),(3,'Civilians');
/*!40000 ALTER TABLE `Fractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FractionsAndRoles`
--

DROP TABLE IF EXISTS `FractionsAndRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FractionsAndRoles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `fraction` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FractionsAndRoles_fk0` (`role`),
  KEY `FractionsAndRoles_fk1` (`fraction`),
  CONSTRAINT `FractionsAndRoles_fk0` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`),
  CONSTRAINT `FractionsAndRoles_fk1` FOREIGN KEY (`fraction`) REFERENCES `Fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FractionsAndRoles`
--

LOCK TABLES `FractionsAndRoles` WRITE;
/*!40000 ALTER TABLE `FractionsAndRoles` DISABLE KEYS */;
INSERT INTO `FractionsAndRoles` VALUES (1,3,1),(2,1,3),(3,2,3),(4,4,2);
/*!40000 ALTER TABLE `FractionsAndRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phases`
--

DROP TABLE IF EXISTS `Phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Phases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `active` binary(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phases`
--

LOCK TABLES `Phases` WRITE;
/*!40000 ALTER TABLE `Phases` DISABLE KEYS */;
INSERT INTO `Phases` VALUES (1,'Check',_binary '0'),(2,'Active actions',_binary '0');
/*!40000 ALTER TABLE `Phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhasesAndActions`
--

DROP TABLE IF EXISTS `PhasesAndActions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhasesAndActions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `action` int NOT NULL,
  `phase` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PhasesAndActions_fk0` (`role`),
  KEY `PhasesAndActions_fk1` (`action`),
  KEY `PhasesAndActions_fk2` (`phase`),
  CONSTRAINT `PhasesAndActions_fk0` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`),
  CONSTRAINT `PhasesAndActions_fk1` FOREIGN KEY (`action`) REFERENCES `Actions` (`id`),
  CONSTRAINT `PhasesAndActions_fk2` FOREIGN KEY (`phase`) REFERENCES `Phases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhasesAndActions`
--

LOCK TABLES `PhasesAndActions` WRITE;
/*!40000 ALTER TABLE `PhasesAndActions` DISABLE KEYS */;
INSERT INTO `PhasesAndActions` VALUES (1,1,3,1),(2,2,2,1),(3,3,1,1),(4,4,6,1),(5,1,5,2),(6,2,4,2),(7,3,4,2),(8,4,4,2);
/*!40000 ALTER TABLE `PhasesAndActions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaySet`
--

DROP TABLE IF EXISTS `PlaySet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaySet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player` int NOT NULL,
  `role` int NOT NULL,
  `state` int NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PlaySet_fk0` (`player`),
  KEY `PlaySet_fk1` (`role`),
  KEY `PlaySet_fk2` (`state`),
  CONSTRAINT `PlaySet_fk0` FOREIGN KEY (`player`) REFERENCES `Players` (`id`),
  CONSTRAINT `PlaySet_fk1` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`),
  CONSTRAINT `PlaySet_fk2` FOREIGN KEY (`state`) REFERENCES `States` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaySet`
--

LOCK TABLES `PlaySet` WRITE;
/*!40000 ALTER TABLE `PlaySet` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlaySet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `avalible` binary(1) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,'Ivan',_binary '1',NULL),(2,'Vasilij',_binary '1',NULL),(3,'Maria',_binary '1',NULL),(4,'Drakula',_binary '0',NULL);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requests`
--

DROP TABLE IF EXISTS `Requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `palyer` int NOT NULL,
  `action` int NOT NULL,
  `victim` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Requests_fk0` (`palyer`),
  KEY `Requests_fk1` (`action`),
  KEY `Requests_fk2` (`victim`),
  CONSTRAINT `Requests_fk0` FOREIGN KEY (`palyer`) REFERENCES `Players` (`id`),
  CONSTRAINT `Requests_fk1` FOREIGN KEY (`action`) REFERENCES `Actions` (`id`),
  CONSTRAINT `Requests_fk2` FOREIGN KEY (`victim`) REFERENCES `Players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requests`
--

LOCK TABLES `Requests` WRITE;
/*!40000 ALTER TABLE `Requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Civilian','A common man. Civilians can cooperate for defend.'),(2,'Sheriff','Sheriff is a part of civilians party. Sheriffs may try to kill.'),(3,'Vampire','Vampires can kill.'),(4,'Werewolf','Werewolves can kill.');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `States` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
INSERT INTO `States` VALUES (1,'Alive'),(2,'Dead');
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-20 21:53:47
