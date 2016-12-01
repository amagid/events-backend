-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `attendance_levels`
--

DROP TABLE IF EXISTS `attendance_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_levels`
--

LOCK TABLES `attendance_levels` WRITE;
/*!40000 ALTER TABLE `attendance_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_groups`
--

DROP TABLE IF EXISTS `cost_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_groups`
--

LOCK TABLES `cost_groups` WRITE;
/*!40000 ALTER TABLE `cost_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_types`
--

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT INTO `event_types` VALUES (1,'Other');
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `name` varchar(63) NOT NULL,
  `amountRaised` float NOT NULL DEFAULT '0',
  `rsvpRequired` tinyint(1) NOT NULL DEFAULT '0',
  `expectedAttendance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_sizes`
--

DROP TABLE IF EXISTS `merchant_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_sizes`
--

LOCK TABLES `merchant_sizes` WRITE;
/*!40000 ALTER TABLE `merchant_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_types`
--

DROP TABLE IF EXISTS `merchant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT 'Other',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_types`
--

LOCK TABLES `merchant_types` WRITE;
/*!40000 ALTER TABLE `merchant_types` DISABLE KEYS */;
INSERT INTO `merchant_types` VALUES (1,'Other');
/*!40000 ALTER TABLE `merchant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants` (
  `bigpie_id` varchar(31) DEFAULT NULL,
  `totalTransactionAmount` float DEFAULT '0',
  `totalGivebackYTD` float DEFAULT '0',
  `totalGiveback` float DEFAULT '0',
  `websiteURL` varchar(63) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(31) DEFAULT NULL,
  `street` varchar(31) DEFAULT NULL,
  `country` varchar(31) DEFAULT NULL,
  `contactFirstName` varchar(31) DEFAULT NULL,
  `contactLastName` varchar(31) DEFAULT NULL,
  `contactEmail` varchar(63) DEFAULT NULL,
  `contactPhone` varchar(15) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `bigpie_slug` varchar(63) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `hostedEvents` int(11) DEFAULT NULL,
  `suggestedGiveback` float DEFAULT NULL,
  `suggestedGivebackType` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsorInterest` tinyint(1) NOT NULL DEFAULT '0',
  `hostInterest` tinyint(1) NOT NULL DEFAULT '0',
  `about` text,
  `type` int(11) DEFAULT NULL,
  `capacityPerHour` int(11) DEFAULT NULL,
  `costGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants_events`
--

DROP TABLE IF EXISTS `merchants_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants_events` (
  `eventId` int(11) NOT NULL,
  `merchantId` int(11) NOT NULL,
  `giveback` float NOT NULL,
  `givebackType` enum('%','$') NOT NULL DEFAULT '%',
  PRIMARY KEY (`eventId`,`merchantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants_events`
--

LOCK TABLES `merchants_events` WRITE;
/*!40000 ALTER TABLE `merchants_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchants_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonprofit_sizes`
--

DROP TABLE IF EXISTS `nonprofit_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonprofit_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonprofit_sizes`
--

LOCK TABLES `nonprofit_sizes` WRITE;
/*!40000 ALTER TABLE `nonprofit_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonprofit_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonprofit_types`
--

DROP TABLE IF EXISTS `nonprofit_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonprofit_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT 'Other',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonprofit_types`
--

LOCK TABLES `nonprofit_types` WRITE;
/*!40000 ALTER TABLE `nonprofit_types` DISABLE KEYS */;
INSERT INTO `nonprofit_types` VALUES (1,'Other');
/*!40000 ALTER TABLE `nonprofit_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonprofits`
--

DROP TABLE IF EXISTS `nonprofits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonprofits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bigpie_id` varchar(31) DEFAULT NULL,
  `donationLink` varchar(127) DEFAULT NULL,
  `taxId` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `about` text,
  `websiteURL` varchar(63) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `bigpie_slug` varchar(63) DEFAULT NULL,
  `socialSite` varchar(63) DEFAULT NULL,
  `totalSalesYTD` float DEFAULT NULL,
  `totalSales` float DEFAULT NULL,
  `organizedEvents` int(11) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(31) DEFAULT NULL,
  `street` varchar(63) DEFAULT NULL,
  `country` varchar(31) DEFAULT NULL,
  `contactFirstName` varchar(31) DEFAULT NULL,
  `contactLastName` varchar(31) DEFAULT NULL,
  `contactEmail` varchar(63) DEFAULT NULL,
  `contactPhone` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sizeGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonprofits`
--

LOCK TABLES `nonprofits` WRITE;
/*!40000 ALTER TABLE `nonprofits` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonprofits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonprofits_events`
--

DROP TABLE IF EXISTS `nonprofits_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonprofits_events` (
  `eventId` int(11) NOT NULL,
  `nonprofitId` int(11) NOT NULL,
  `expectedAttendance` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`,`nonprofitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonprofits_events`
--

LOCK TABLES `nonprofits_events` WRITE;
/*!40000 ALTER TABLE `nonprofits_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonprofits_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsvps`
--

DROP TABLE IF EXISTS `rsvps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rsvps` (
  `bigpie_patron_id` varchar(31) DEFAULT NULL,
  `eventId` int(11) NOT NULL,
  `email` varchar(63) NOT NULL,
  `type` enum('yes','no','maybe') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`eventId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsvps`
--

LOCK TABLES `rsvps` WRITE;
/*!40000 ALTER TABLE `rsvps` DISABLE KEYS */;
/*!40000 ALTER TABLE `rsvps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors_events`
--

DROP TABLE IF EXISTS `sponsors_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors_events` (
  `eventId` int(11) NOT NULL,
  `sponsorId` int(11) NOT NULL,
  `max` float DEFAULT NULL,
  PRIMARY KEY (`eventId`,`sponsorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors_events`
--

LOCK TABLES `sponsors_events` WRITE;
/*!40000 ALTER TABLE `sponsors_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsors_events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 13:02:54
