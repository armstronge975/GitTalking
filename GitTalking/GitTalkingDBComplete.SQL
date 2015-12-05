CREATE DATABASE  IF NOT EXISTS `gittalking` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gittalking`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gittalking
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` varchar(20) NOT NULL,
  `admin_firstname` varchar(45) DEFAULT NULL,
  `admin_lastname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='Admin user with admin rights.  Links to User table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES ('1001','Emily','Armstrong',AES_ENCRYPT('pikachu<3','.key.')),('1002','Richard','Connell',AES_ENCRYPT('bacon','.key.')),('1003','Eric','Cislo',AES_ENCRYPT('bacon','.key.')),(1004,'Mike','Kidney',AES_ENCRYPT('bacon','.key.')),('1005','Paiman','Irani',AES_ENCRYPT('bacon','.key.')),('1006','Iain','St. John',AES_ENCRYPT('bacon','.key.')),('1007','Kimberly','Gero',AES_ENCRYPT('bacon','.key.'));
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GitTalking user group information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (2001,'Avengers'),(2002,'JusticeLeague'),(2003,'Serenity'),(2004,'Voyager');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_repsitory`
--

DROP TABLE IF EXISTS `local_repsitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_repsitory` (
  `localrepsitory_id` int(11) NOT NULL,
  `open_cases` varchar(45) DEFAULT NULL,
  `push_request` varchar(45) DEFAULT NULL,
  `pull_request` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`localrepsitory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_repsitory`
--

LOCK TABLES `local_repsitory` WRITE;
/*!40000 ALTER TABLE `local_repsitory` DISABLE KEYS */;
INSERT INTO `local_repsitory` VALUES (4001,'3','push20151129_230pm','pull20151101_300pm'),(4002,'2','push20151129_235pm','pull20151120_510pm');
/*!40000 ALTER TABLE `local_repsitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_repository`
--

DROP TABLE IF EXISTS `master_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_repository` (
  `mastreposit_id` int(11) NOT NULL,
  `push_request` varchar(45) DEFAULT NULL,
  `pull_request` varchar(45) DEFAULT NULL,
  `open_cases` varchar(45) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mastreposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Master repository from git.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_repository`
--

LOCK TABLES `master_repository` WRITE;
/*!40000 ALTER TABLE `master_repository` DISABLE KEYS */;
INSERT INTO `master_repository` VALUES (5001,'push20151129_235pm','pull20151120_510pm','2','https://github.com/Avengers/Release2016_1'),(5002,'push20151129_235pm','pull20151120_510pm','2','https://github.com/JusticeLeague/Release2016_2'),(5003,'push20151129_235pm','pull20151120_510pm','2','https://github.com/Serenity/Release2016_3');
/*!40000 ALTER TABLE `master_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message` (
  `priv_id` int(11) NOT NULL,
  `private_messagecontent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stored the private message content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message`
--

LOCK TABLES `private_message` WRITE;
/*!40000 ALTER TABLE `private_message` DISABLE KEYS */;
INSERT INTO `private_message` VALUES (7001,'I dont thing we can do what the client asked');
/*!40000 ALTER TABLE `private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (3001,'Release2016_1','started'),(3002,'Release2016_2','planning'),(3003,'Release2016_3','phase1'),(3004,'Release2016_4','phase2');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_message`
--

DROP TABLE IF EXISTS `public_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_message` (
  `pub_id` int(11) NOT NULL,
  `public_messagecontent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='publick message content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_message`
--

LOCK TABLES `public_message` WRITE;
/*!40000 ALTER TABLE `public_message` DISABLE KEYS */;
INSERT INTO `public_message` VALUES (8001,'Lets get started everyone!');
/*!40000 ALTER TABLE `public_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_users`
--

DROP TABLE IF EXISTS `standard_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard_users` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `account_type` varchar(7) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9006 DEFAULT CHARSET=utf8 COMMENT='Standard users are users other than admin users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_users`
--

LOCK TABLES `standard_users` WRITE;
/*!40000 ALTER TABLE `standard_users` DISABLE KEYS */;
INSERT INTO `standard_users` VALUES ('Greg','Greg','Baxter','public','bax@gmail.com',AES_ENCRYPT('tooObvi','.key.')),('ADeetu','Arrtu','Deetu','private','deetu@gmail.com',AES_ENCRYPT('tooObvi','.key.')),('flowers','Jane','Rose','public','jrose@yahoo.com',AES_ENCRYPT('tooObvi','.key.')),('mkyson','Tony','Tyson','public','tyson@hotmail.com',AES_ENCRYPT('tooObvi','.key.')),('fsaltz','Francine','Salter','public','fran@aol.com',AES_ENCRYPT('tooObvi','.key.'));
/*!40000 ALTER TABLE `standard_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `timeline_id` int(11) NOT NULL,
  `timeline_content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`timeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Social tmeline content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (10001,'Welcome to GitTalking'),(10002,'Lets Get started'),(10003,'Please feel free to post on the timeline now');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-29 21:40:19
