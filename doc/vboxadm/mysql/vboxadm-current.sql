-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: vboxadm
-- ------------------------------------------------------
-- Server version	5.5.24-6

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
-- Table structure for table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aliases` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `domain_id` int(16) NOT NULL,
  `local_part` varchar(255) CHARACTER SET latin1 NOT NULL,
  `goto` varchar(2040) CHARACTER SET latin1 NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`local_part`),
  KEY `active` (`is_active`),
  CONSTRAINT `aliases_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `aliases_split`
--

DROP TABLE IF EXISTS `aliases_split`;
/*!50001 DROP VIEW IF EXISTS `aliases_split`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `aliases_split` (
  `id` int(16),
  `domain_id` int(16),
  `local_part` varchar(255),
  `goto` varchar(255),
  `is_active` tinyint(1),
  `userpart` varchar(255),
  `domainpart` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `archiv_2011_01`
--

DROP TABLE IF EXISTS `archiv_2011_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archiv_2011_01` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awl`
--

DROP TABLE IF EXISTS `awl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awl` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `last_seen` datetime NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dmarc_records`
--

DROP TABLE IF EXISTS `dmarc_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmarc_records` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `report_id` int(16) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `count` int(16) NOT NULL,
  `disposition` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `dkimdomain` varchar(255) NOT NULL,
  `dkimresult` varchar(255) NOT NULL,
  `spfdomain` varchar(255) NOT NULL,
  `spfresult` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dmarc_reports`
--

DROP TABLE IF EXISTS `dmarc_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmarc_reports` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `tsfrom` int(16) NOT NULL,
  `tsto` int(16) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `reportid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_aliases`
--

DROP TABLE IF EXISTS `domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_aliases` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain_id` int(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active` (`is_active`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `domain_aliases_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_relay_domain` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active` (`is_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `ts` datetime NOT NULL,
  `msg` text NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailboxes`
--

DROP TABLE IF EXISTS `mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxes` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `domain_id` int(16) NOT NULL,
  `local_part` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `max_msg_size` int(16) unsigned NOT NULL DEFAULT '26214400',
  `is_on_vacation` tinyint(1) NOT NULL DEFAULT '0',
  `vacation_subj` varchar(255) NOT NULL,
  `vacation_msg` text NOT NULL,
  `vacation_start` date NOT NULL,
  `vacation_end` date NOT NULL,
  `quota` bigint(16) unsigned NOT NULL DEFAULT '26214400',
  `is_domainadmin` tinyint(1) NOT NULL DEFAULT '0',
  `is_siteadmin` tinyint(1) NOT NULL DEFAULT '0',
  `sa_active` tinyint(1) NOT NULL DEFAULT '0',
  `sa_kill_score` decimal(5,2) NOT NULL DEFAULT '6.31',
  `pw_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pw_lock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`local_part`),
  KEY `vacation_duration` (`vacation_start`,`vacation_end`),
  CONSTRAINT `mailboxes_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfc_notify`
--

DROP TABLE IF EXISTS `rfc_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfc_notify` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_accounts`
--

DROP TABLE IF EXISTS `role_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_accounts` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `local_part` varchar(64) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vacation_blacklist`
--

DROP TABLE IF EXISTS `vacation_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation_blacklist` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_lp` (`domain`,`local_part`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vacation_notify`
--

DROP TABLE IF EXISTS `vacation_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation_notify` (
  `on_vacation` varchar(255) NOT NULL,
  `notified` varchar(255) NOT NULL,
  `notified_at` datetime NOT NULL,
  PRIMARY KEY (`on_vacation`,`notified`),
  KEY `notified_at` (`notified_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `aliases_split`
--

/*!50001 DROP TABLE IF EXISTS `aliases_split`*/;
/*!50001 DROP VIEW IF EXISTS `aliases_split`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aliases_split` AS select `aliases`.`id` AS `id`,`aliases`.`domain_id` AS `domain_id`,`aliases`.`local_part` AS `local_part`,`aliases`.`goto` AS `goto`,`aliases`.`is_active` AS `is_active`,substring_index(`aliases`.`goto`,'@',1) AS `userpart`,substring_index(`aliases`.`goto`,'@',-(1)) AS `domainpart` from `aliases` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-18 22:06:19
