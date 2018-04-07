-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.17-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema kindergarten_dev
--

CREATE DATABASE IF NOT EXISTS kindergarten_dev;
USE kindergarten_dev;

--
-- Definition of table `kg_demo`
--

DROP TABLE IF EXISTS `kg_demo`;
CREATE TABLE `kg_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `CERTIFICATE_TYPE` varchar(240) DEFAULT 'ID' COMMENT '证件类型',
  `EFFECTIVE_START_DATE` date DEFAULT NULL COMMENT '有效日期从',
  `EFFECTIVE_END_DATE` date DEFAULT NULL COMMENT '有效日期至',
  `ATTRIBUTE_CATEGORY` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_demo`
--

/*!40000 ALTER TABLE `kg_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `kg_demo` ENABLE KEYS */;


--
-- Definition of table `kg_introduction`
--

DROP TABLE IF EXISTS `kg_introduction`;
CREATE TABLE `kg_introduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `introduction` text,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `CERTIFICATE_TYPE` varchar(240) DEFAULT 'ID' COMMENT '证件类型',
  `EFFECTIVE_START_DATE` date DEFAULT NULL COMMENT '有效日期从',
  `EFFECTIVE_END_DATE` date DEFAULT NULL COMMENT '有效日期至',
  `ATTRIBUTE_CATEGORY` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_introduction`
--

/*!40000 ALTER TABLE `kg_introduction` DISABLE KEYS */;
INSERT INTO `kg_introduction` (`id`,`introduction`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'<p><img src=\"D:/allWorkplace/youeryuan/kindergarten/WebContent/ueditor/jsp/upload/image/20180407/1523063096849032844.jpg\" style=\"\"/></p><p><img src=\"D:/allWorkplace/youeryuan/kindergarten/WebContent/ueditor/jsp/upload/image/20180407/1523063096849098620.jpg\" style=\"\"/></p><p><img src=\"D:/allWorkplace/youeryuan/kindergarten/WebContent/ueditor/jsp/upload/image/20180407/1523063096979014130.jpg\" style=\"\"/></p><p><img src=\"D:/allWorkplace/youeryuan/kindergarten/WebContent/ueditor/jsp/upload/image/20180407/1523063097005000477.jpg\" style=\"\"/></p><p><br/></p>',5,-1,-1,-1,'2018-04-07 09:18:47',-1,'2018-04-07 09:26:52',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_introduction` ENABLE KEYS */;


--
-- Definition of table `kg_link`
--

DROP TABLE IF EXISTS `kg_link`;
CREATE TABLE `kg_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(45) NOT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `CERTIFICATE_TYPE` varchar(240) DEFAULT 'ID' COMMENT '证件类型',
  `EFFECTIVE_START_DATE` date DEFAULT NULL COMMENT '有效日期从',
  `EFFECTIVE_END_DATE` date DEFAULT NULL COMMENT '有效日期至',
  `ATTRIBUTE_CATEGORY` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_link`
--

/*!40000 ALTER TABLE `kg_link` DISABLE KEYS */;
INSERT INTO `kg_link` (`id`,`link_name`,`link_url`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (8,'123','123',1,-1,-1,-1,'2018-04-06 19:06:57',-1,'2018-04-06 19:06:57',-1,'ID',NULL,NULL,NULL),
 (9,'123','123',1,-1,-1,-1,'2018-04-06 19:07:00',-1,'2018-04-06 19:07:00',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_link` ENABLE KEYS */;


--
-- Definition of table `kg_news`
--

DROP TABLE IF EXISTS `kg_news`;
CREATE TABLE `kg_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeId` int(10) NOT NULL,
  `newsTitle` varchar(45) NOT NULL,
  `summary` varchar(45) NOT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `content` text,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `viewsCount` int(10) DEFAULT '0',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `CERTIFICATE_TYPE` varchar(240) DEFAULT 'ID' COMMENT '证件类型',
  `EFFECTIVE_START_DATE` date DEFAULT NULL COMMENT '有效日期从',
  `EFFECTIVE_END_DATE` date DEFAULT NULL COMMENT '有效日期至',
  `ATTRIBUTE_CATEGORY` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_news`
--

/*!40000 ALTER TABLE `kg_news` DISABLE KEYS */;
INSERT INTO `kg_news` (`id`,`typeId`,`newsTitle`,`summary`,`thumbnail`,`author`,`content`,`createDate`,`viewsCount`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (2,5,'11','11',NULL,NULL,'<p>11</p>','2018-04-07 18:27:05',0,1,-1,-1,-1,'2018-04-07 18:27:05',-1,'2018-04-07 18:27:05',-1,'ID',NULL,NULL,NULL),
 (3,5,'22','22',NULL,NULL,'<p><img src=\"/kindergarten/ueditor/jsp/upload/image/20180407/1523106219658083764.jpg\" title=\"1523106219658083764.jpg\" alt=\"timg.jpg\"/>22</p>','2018-04-07 18:27:10',0,2,-1,-1,-1,'2018-04-07 18:27:10',-1,'2018-04-07 21:03:46',-1,'ID',NULL,NULL,NULL),
 (4,5,'11','11',NULL,NULL,'<p>11</p>','2018-04-07 18:49:57',0,1,-1,-1,-1,'2018-04-07 18:49:57',-1,'2018-04-07 18:49:57',-1,'ID',NULL,NULL,NULL),
 (5,5,'44','44',NULL,NULL,'<p>44</p>','2018-04-07 18:59:54',0,1,-1,-1,-1,'2018-04-07 18:59:54',-1,'2018-04-07 18:59:54',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_news` ENABLE KEYS */;


--
-- Definition of table `kg_newstype`
--

DROP TABLE IF EXISTS `kg_newstype`;
CREATE TABLE `kg_newstype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` varchar(45) NOT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `CERTIFICATE_TYPE` varchar(240) DEFAULT 'ID' COMMENT '证件类型',
  `EFFECTIVE_START_DATE` date DEFAULT NULL COMMENT '有效日期从',
  `EFFECTIVE_END_DATE` date DEFAULT NULL COMMENT '有效日期至',
  `ATTRIBUTE_CATEGORY` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_newstype`
--

/*!40000 ALTER TABLE `kg_newstype` DISABLE KEYS */;
INSERT INTO `kg_newstype` (`id`,`typeName`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (5,'公告通知',4,-1,-1,-1,'2018-04-07 16:17:16',-1,'2018-04-07 17:25:18',-1,'ID',NULL,NULL,NULL),
 (6,'培新通知',2,-1,-1,-1,'2018-04-07 17:24:57',-1,'2018-04-07 17:25:29',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_newstype` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
