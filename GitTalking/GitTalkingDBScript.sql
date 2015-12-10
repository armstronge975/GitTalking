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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comments_id` varchar(20) NOT NULL,
  `comment_content` varchar(45) DEFAULT NULL,
  `comment_like` int(20) DEFAULT NULL,
  PRIMARY KEY (`comments_id`),
  CONSTRAINT `comment_user_id` FOREIGN KEY (`comments_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` varchar(20) NOT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  `group_user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_user_id_idx` (`group_user_id`),
  CONSTRAINT `group_user_id` FOREIGN KEY (`group_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GitTalking user group information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('2001','Avengers',NULL),('2002','JusticeLeague',NULL),('2003','Serenity',NULL),('2004','Voyager',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `pub_id` int(11) NOT NULL,
  `public_messagecontent` varchar(300) DEFAULT NULL,
  `to_user_fk` varchar(300) DEFAULT NULL,
  `from_user_fk` varchar(300) DEFAULT NULL,
  `time_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  PRIMARY KEY (`pub_id`),
  KEY `to_user_fk` (`to_user_fk`),
  KEY `from_user_fk` (`from_user_fk`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`to_user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`from_user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='publick message content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (8001,'Lets get started everyone!','1002','1003','2015-12-09 03:31:45',0,0),(8002,'Leggo!','1002','1005','2015-12-09 03:31:45',0,0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
  `project_user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `project_user_id_idx` (`project_user_id`),
  CONSTRAINT `project_user_id` FOREIGN KEY (`project_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (3001,'Release2016_1','started',NULL),(3002,'Release2016_2','planning',NULL),(3003,'Release2016_3','phase1',NULL),(3004,'Release2016_4','phase2',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `reposit_id` varchar(20) NOT NULL,
  `push_request` varchar(45) DEFAULT NULL,
  `pull_request` varchar(45) DEFAULT NULL,
  `open_cases` varchar(45) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `repository_group_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reposit_id`),
  KEY `repository_group_id_idx` (`repository_group_id`),
  CONSTRAINT `repository_group_id` FOREIGN KEY (`repository_group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Master repository from git.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES ('5001','push20151129_235pm','pull20151120_510pm','2','https://github.com/Avengers/Release2016_1',NULL),('5002','push20151129_235pm','pull20151120_510pm','2','https://github.com/JusticeLeague/Release2016_2',NULL),('5003','push20151129_235pm','pull20151120_510pm','2','https://github.com/Serenity/Release2016_3',NULL);
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `timeline_id` int(11) NOT NULL,
  `timeline_content` varchar(45) DEFAULT NULL,
  `user_id_fk` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`timeline_id`),
  KEY `user_id_fk` (`user_id_fk`),
  CONSTRAINT `timeline_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Social tmeline content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (10001,'Welcome to GitTalking','1001'),(10002,'Lets Get started','1002'),(10003,'Please feel free to post on the timeline now','1003'),(10004,'No information available','1004'),(10005,'No information available','1005'),(10006,'No information available','1006'),(10007,'No information available','1007'),(10008,'Hey guys my name is Greg.','Greg'),(10009,'Currently studying for my masters in CS','ADeetu'),(10010,'No information available','flowers'),(10011,'No information available','mkyson'),(10012,'No information available','fsaltz');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `account_type` varchar(7) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varbinary(250) DEFAULT NULL,
  `user_level` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Standard users are users other than admin users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1001','Emily','Armstrong','private','emily@gmail.com','.pˆe∑\«t\◊,Øx|Ñ','admin'),('1002','Richard','Connell','private','rich@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('1003','Eric','Cislo','private','eric@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('1004','Mike','Kidney','private','mike@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('1005','Paiman','Irani','private','paiman@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('1006','Iain','St. John','private','iain@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('1007','Kimberly','Gero','private','kim@gmail.com','§í÷©4¯Ñû\n∏±I','admin'),('ADeetu','Arrtu','Deetu','private','deetu@gmail.com','pÕù\œ%3qX6q\€6¡ç\Ã','standard'),('flowers','Jane','Rose','public','jrose@yahoo.com','pÕù\œ%3qX6q\€6¡ç\Ã','standard'),('fsaltz','Francine','Salter','public','fran@aol.com','pÕù\œ%3qX6q\€6¡ç\Ã','standard'),('Greg','Greg','Baxter','public','bax@gmail.com','pÕù\œ%3qX6q\€6¡ç\Ã','standard'),('mkyson','Tony','Tyson','public','tyson@hotmail.com','pÕù\œ%3qX6q\€6¡ç\Ã','standard');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-08 23:17:07
