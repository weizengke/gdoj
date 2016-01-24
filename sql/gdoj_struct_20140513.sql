-- MySQL dump 10.13  Distrib 5.1.72, for Win64 (unknown)
--
-- Host: localhost    Database: gdoj
-- ------------------------------------------------------
-- Server version	5.1.72-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attend`
--

DROP TABLE IF EXISTS `attend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `contest_id` int(11) DEFAULT '0',
  `defunct` char(1) DEFAULT NULL,
  `solved` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `penalty` int(11) DEFAULT '0',
  `A_time` int(11) DEFAULT '0',
  `A_wrongsubmits` int(11) DEFAULT '0',
  `B_time` int(11) DEFAULT '0',
  `B_wrongsubmits` int(11) DEFAULT '0',
  `C_time` int(11) DEFAULT '0',
  `C_wrongsubmits` int(11) DEFAULT '0',
  `D_time` int(11) DEFAULT '0',
  `D_wrongsubmits` int(11) DEFAULT '0',
  `E_time` int(11) DEFAULT '0',
  `E_wrongsubmits` int(11) DEFAULT '0',
  `F_time` int(11) DEFAULT '0',
  `F_wrongsubmits` int(11) DEFAULT '0',
  `G_time` int(11) DEFAULT '0',
  `G_wrongsubmits` int(11) DEFAULT '0',
  `H_time` int(11) DEFAULT '0',
  `H_wrongsubmits` int(11) DEFAULT '0',
  `I_time` int(11) DEFAULT '0',
  `I_wrongsubmits` int(11) DEFAULT '0',
  `J_time` int(11) DEFAULT '0',
  `J_wrongsubmits` int(11) DEFAULT '0',
  `K_time` int(11) DEFAULT '0',
  `K_wrongsubmits` int(11) DEFAULT '0',
  `L_time` int(11) DEFAULT '0',
  `L_wrongsubmits` int(11) DEFAULT '0',
  `M_time` int(11) DEFAULT '0',
  `M_wrongsubmits` int(11) DEFAULT '0',
  `N_time` int(11) DEFAULT '0',
  `N_wrongsubmits` int(11) DEFAULT '0',
  `O_time` int(11) DEFAULT '0',
  `O_wrongsubmits` int(11) DEFAULT '0',
  `P_time` int(11) DEFAULT '0',
  `P_wrongsubmits` int(11) DEFAULT '0',
  `Q_time` int(11) DEFAULT '0',
  `Q_wrongsubmits` int(11) DEFAULT '0',
  `R_time` int(11) DEFAULT '0',
  `R_wrongsubmits` int(11) DEFAULT '0',
  `S_time` int(11) DEFAULT '0',
  `S_wrongsubmits` int(11) DEFAULT '0',
  `T_time` int(11) DEFAULT '0',
  `T_wrongsubmits` int(11) DEFAULT '0',
  `U_time` int(11) DEFAULT '0',
  `U_wrongsubmits` int(11) DEFAULT '0',
  `V_time` int(11) DEFAULT '0',
  `V_wrongsubmits` int(11) DEFAULT '0',
  `W_time` int(11) DEFAULT '0',
  `W_wrongsubmits` int(11) DEFAULT '0',
  `X_time` int(11) DEFAULT '0',
  `X_wrongsubmits` int(11) DEFAULT '0',
  `Y_time` int(11) DEFAULT '0',
  `Y_wrongsubmits` int(11) DEFAULT '0',
  `Z_time` int(11) DEFAULT '0',
  `Z_wrongsubmits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compile_info`
--

DROP TABLE IF EXISTS `compile_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compile_info` (
  `solution_id` int(11) NOT NULL DEFAULT '0',
  `error` text CHARACTER SET gbk,
  PRIMARY KEY (`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `contest_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `description` text,
  `password` varchar(30) DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_reg` datetime DEFAULT NULL,
  `end_reg` datetime DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contest_problem`
--

DROP TABLE IF EXISTS `contest_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `num` varchar(10) NOT NULL,
  `submit` int(11) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  `solved` int(11) DEFAULT NULL,
  `submit_user` int(11) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  `point` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `from_user` varchar(30) DEFAULT NULL,
  `to_user` varchar(30) DEFAULT NULL,
  `isnew` int(2) DEFAULT NULL,
  `reply` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  PRIMARY KEY (`mail_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) DEFAULT '0',
  `contest_id` int(11) DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `root_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext,
  `orderNum` int(11) DEFAULT '0',
  `in_date` datetime DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `defunct` char(1) DEFAULT NULL,
  `votes` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `rightstr` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `input` text,
  `output` text,
  `sample_input` text,
  `sample_output` text,
  `spj` int(11) DEFAULT NULL,
  `hint` text,
  `source` varchar(255) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `memory_limit` int(11) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  `solved` int(11) DEFAULT NULL,
  `submit` int(11) DEFAULT NULL,
  `submit_user` int(11) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `difficulty` float DEFAULT '0',
  `ratio` float DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `oj_name` varchar(255) DEFAULT NULL,
  `oj_pid` int(11) DEFAULT NULL,
  `isvirtual` int(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution` (
  `solution_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `submit_date` datetime DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `code_length` int(11) DEFAULT NULL,
  `language` tinyint(4) DEFAULT NULL,
  `verdict` tinyint(4) DEFAULT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `testcase` int(11) DEFAULT NULL,
  PRIMARY KEY (`solution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solution_source`
--

DROP TABLE IF EXISTS `solution_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution_source` (
  `solution_id` int(11) NOT NULL,
  `source` text,
  PRIMARY KEY (`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `indate` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tagsview`
--

DROP TABLE IF EXISTS `tagsview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagsview` (
  `tag_id` int(11) NOT NULL,
  `problem_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `problem_id` (`problem_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `school` varchar(100) DEFAULT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `defunct` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `language` int(11) DEFAULT NULL,
  `opensource` char(1) DEFAULT NULL,
  `solved` int(11) DEFAULT '0',
  `submit` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `avatar` varchar(1) DEFAULT NULL,
  `lastaccesstime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `message_id` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `vote_date` datetime DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-13 23:36:51

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES ('1', 'Administrator', 'administrator', 'Admin', 'administrator@guet.com', 'GUET', 'Just manage Online Judge System', 'N', '1989-10-01 00:00:00', '2012-02-20 23:58:58', null, '1', 'Y', '0', '0', '0', null, null, null);
UNLOCK TABLES;

LOCK TABLES `privilege` WRITE;
INSERT INTO `privilege` VALUES ('1', 'Administrator', 'HEAD');
UNLOCK TABLES;
