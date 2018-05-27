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
-- Definition of table `kg_assessment_activity`
--

DROP TABLE IF EXISTS `kg_assessment_activity`;
CREATE TABLE `kg_assessment_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assessment_type_id` bigint(20) unsigned NOT NULL,
  `attributeId` varchar(200) DEFAULT '-1',
  `assessment_activity_name` varchar(45) NOT NULL,
  `assessment_activity_content` text,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_assessment_activity`
--

/*!40000 ALTER TABLE `kg_assessment_activity` DISABLE KEYS */;
INSERT INTO `kg_assessment_activity` (`id`,`assessment_type_id`,`attributeId`,`assessment_activity_name`,`assessment_activity_content`,`createDate`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (3,16,'','评估任务413111111222222222223333333333333','<p>111</p>','2018-04-23 10:59:19',3,-1,-1,-1,'2018-04-23 10:59:19',-1,'2018-05-19 20:27:31',-1,'ID',NULL,NULL,NULL),
 (4,17,'','评估任务3','<p>222</p>','2018-04-23 10:59:24',2,-1,-1,-1,'2018-04-23 10:59:24',-1,'2018-05-06 13:57:32',-1,'ID',NULL,NULL,NULL),
 (5,16,'','评估任务2','<p>333</p>','2018-04-23 10:59:29',4,-1,-1,-1,'2018-04-23 10:59:29',-1,'2018-05-06 13:57:27',-1,'ID',NULL,NULL,NULL),
 (6,16,'12,14,15','评估任务1','<p>11</p>','2018-04-28 15:51:30',5,-1,-1,-1,'2018-04-28 15:51:30',-1,'2018-05-19 19:24:06',-1,'ID',NULL,NULL,NULL),
 (7,16,'12','评估任务5','<p>评估任务1</p>','2018-05-06 13:57:47',1,-1,-1,-1,'2018-05-06 13:57:47',-1,'2018-05-06 13:57:47',-1,'ID',NULL,NULL,NULL),
 (8,16,'','评估任务6','<p>评估任务1</p>','2018-05-06 13:57:54',1,-1,-1,-1,'2018-05-06 13:57:54',-1,'2018-05-06 13:57:54',-1,'ID',NULL,NULL,NULL),
 (9,16,'','评估任务7','<p>11</p>','2018-05-06 13:58:01',1,-1,-1,-1,'2018-05-06 13:58:01',-1,'2018-05-06 13:58:01',-1,'ID',NULL,NULL,NULL),
 (10,16,'','评估任务8','<p>评估任务8</p>','2018-05-06 14:09:03',1,-1,-1,-1,'2018-05-06 14:09:03',-1,'2018-05-06 14:09:03',-1,'ID',NULL,NULL,NULL),
 (11,16,'','评估任务9','<p>评估任务9</p>','2018-05-06 14:09:10',1,-1,-1,-1,'2018-05-06 14:09:10',-1,'2018-05-06 14:09:10',-1,'ID',NULL,NULL,NULL),
 (12,16,'','评估任务10','<p>评估任务10</p>','2018-05-06 14:09:19',1,-1,-1,-1,'2018-05-06 14:09:19',-1,'2018-05-06 14:09:19',-1,'ID',NULL,NULL,NULL),
 (13,16,'','评估任务11','<p>评估任务11</p>','2018-05-06 14:09:26',1,-1,-1,-1,'2018-05-06 14:09:26',-1,'2018-05-06 14:09:26',-1,'ID',NULL,NULL,NULL),
 (14,16,'12,14','评估12','<p>13</p>','2018-05-12 09:42:43',3,-1,-1,-1,'2018-05-12 09:42:43',-1,'2018-05-12 09:44:22',-1,'ID',NULL,NULL,NULL),
 (15,16,'14,15','131111112222222222233333333333333344444','<p>13<br/></p>','2018-05-12 09:44:32',8,-1,-1,-1,'2018-05-12 09:44:32',-1,'2018-05-19 20:27:06',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_assessment_activity` ENABLE KEYS */;


--
-- Definition of table `kg_assessment_activity_user_progress`
--

DROP TABLE IF EXISTS `kg_assessment_activity_user_progress`;
CREATE TABLE `kg_assessment_activity_user_progress` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assessment_activity_id` bigint(20) unsigned NOT NULL,
  `upload_user_id` bigint(20) unsigned NOT NULL,
  `admin_suggestion` text,
  `expert_user_id` bigint(20) unsigned DEFAULT NULL,
  `expert_suggestion` text,
  `state` varchar(20) NOT NULL DEFAULT 'UPLOAD',
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Index_2` (`assessment_activity_id`,`upload_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_assessment_activity_user_progress`
--

/*!40000 ALTER TABLE `kg_assessment_activity_user_progress` DISABLE KEYS */;
INSERT INTO `kg_assessment_activity_user_progress` (`id`,`assessment_activity_id`,`upload_user_id`,`admin_suggestion`,`expert_user_id`,`expert_suggestion`,`state`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (12,3,10013,'管理员通过',10013,'1111','50',NULL,-1,-1,NULL,NULL,NULL,'2018-05-21 14:06:36',NULL,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_assessment_activity_user_progress` ENABLE KEYS */;


--
-- Definition of table `kg_assessment_activity_user_upload`
--

DROP TABLE IF EXISTS `kg_assessment_activity_user_upload`;
CREATE TABLE `kg_assessment_activity_user_upload` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `upload_user_id` bigint(20) unsigned NOT NULL,
  `progress_id` bigint(20) unsigned NOT NULL,
  `file_name` varchar(240) DEFAULT NULL,
  `file_path` varchar(240) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_assessment_activity_user_upload`
--

/*!40000 ALTER TABLE `kg_assessment_activity_user_upload` DISABLE KEYS */;
INSERT INTO `kg_assessment_activity_user_upload` (`id`,`upload_user_id`,`progress_id`,`file_name`,`file_path`,`createDate`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (15,10013,12,'44.jpg','/resources/upload/assessment/44.jpg',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (16,10013,12,'none2.jpg','/resources/upload/assessment/none2.jpg',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (17,10013,12,'44.jpg','/resources/upload/assessment/44.jpg',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (18,10013,12,'44 (2).jpg','/resources/upload/assessment/44 (2).jpg',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_assessment_activity_user_upload` ENABLE KEYS */;


--
-- Definition of table `kg_assessment_type`
--

DROP TABLE IF EXISTS `kg_assessment_type`;
CREATE TABLE `kg_assessment_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assessment_type_name` varchar(45) NOT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_assessment_type`
--

/*!40000 ALTER TABLE `kg_assessment_type` DISABLE KEYS */;
INSERT INTO `kg_assessment_type` (`id`,`assessment_type_name`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (16,'学校评估',1,-1,-1,-1,'2018-04-20 11:30:02',-1,'2018-04-20 11:30:02',-1,'ID',NULL,NULL,NULL),
 (17,'优秀教师评估',3,-1,-1,-1,'2018-04-20 11:30:10',-1,'2018-04-20 11:30:34',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_assessment_type` ENABLE KEYS */;


--
-- Definition of table `kg_carousel`
--

DROP TABLE IF EXISTS `kg_carousel`;
CREATE TABLE `kg_carousel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(200) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT '0',
  `urltype` bigint(20) unsigned DEFAULT '0' COMMENT '0:weburl , 1:activity ,2 :news',
  `web_url` varchar(200) DEFAULT NULL,
  `activity_id` bigint(20) DEFAULT '-1',
  `news_id` bigint(20) DEFAULT '-1',
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_carousel`
--

/*!40000 ALTER TABLE `kg_carousel` DISABLE KEYS */;
INSERT INTO `kg_carousel` (`id`,`file_path`,`sequence`,`urltype`,`web_url`,`activity_id`,`news_id`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (7,'/resources/upload/33.jpg',0,2,'',4,-1,7,-1,-1,-1,'2018-04-29 21:15:32',-1,'2018-05-12 20:48:57',-1,'ID',NULL,NULL,NULL),
 (9,'/resources/upload/44.jpg',3,0,'http://www.baidu.com',-1,-1,3,-1,-1,-1,'2018-04-29 21:28:27',-1,'2018-04-29 21:54:16',-1,'ID',NULL,NULL,NULL),
 (10,'/resources/upload/44.jpg',1,1,'',-1,24,4,-1,-1,-1,'2018-04-29 21:38:59',-1,'2018-04-29 21:54:48',-1,'ID',NULL,NULL,NULL),
 (14,'/resources/upload/carousel/121222.jpg',0,1,'',-1,23,1,-1,-1,-1,'2018-05-03 16:03:04',-1,'2018-05-03 16:03:04',-1,'ID',NULL,NULL,NULL),
 (15,'/resources/upload/carousel/20180428040039675.jpg',0,2,'',3,-1,1,-1,-1,-1,'2018-05-03 16:03:39',-1,'2018-05-03 16:03:39',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_carousel` ENABLE KEYS */;


--
-- Definition of table `kg_config`
--

DROP TABLE IF EXISTS `kg_config`;
CREATE TABLE `kg_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sysName` varchar(40) NOT NULL,
  `sysKey` varchar(40) DEFAULT NULL,
  `sysValue` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_config`
--

/*!40000 ALTER TABLE `kg_config` DISABLE KEYS */;
INSERT INTO `kg_config` (`id`,`sysName`,`sysKey`,`sysValue`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'网站名称','webname','欢欢',8,-1,-1,-1,'2018-04-09 14:03:06',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (2,'图片上传默认路径','uploadpath','/resources/upload/',8,-1,-1,-1,'2018-04-09 14:03:06',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (3,'网站版权信息','copyright','copyright &copy huanTed ',9,-1,-1,-1,'2018-04-09 14:03:06',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (4,'站点默认关键字','keyword','幼儿园12',7,-1,-1,-1,'2018-04-09 14:03:07',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (5,'站点描述','webdesc','这是一个幼儿园的站点',6,-1,-1,-1,'2018-04-09 14:03:07',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (6,'网站备案号','ICPlicense','沪ICP备01234567891',8,-1,-1,-1,'2018-04-09 14:03:08',-1,'2018-05-12 13:38:59',-1,'ID',NULL,NULL,NULL),
 (7,'网站logo','webLogo','/resources/upload/logo/logo.png',1,-1,-1,-1,'2018-05-05 13:30:10',-1,'2018-05-05 13:30:10',-1,'ID',NULL,NULL,NULL),
 (8,'网站ico','webIco','/favicon.ico',1,-1,-1,-1,'2018-05-05 13:44:02',-1,'2018-05-05 13:44:02',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_config` ENABLE KEYS */;


--
-- Definition of table `kg_contact`
--

DROP TABLE IF EXISTS `kg_contact`;
CREATE TABLE `kg_contact` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sysName` varchar(40) NOT NULL,
  `sysKey` varchar(40) DEFAULT NULL,
  `sysValue` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_contact`
--

/*!40000 ALTER TABLE `kg_contact` DISABLE KEYS */;
INSERT INTO `kg_contact` (`id`,`sysName`,`sysKey`,`sysValue`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'联系电话','tel','021-62671784',3,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:21:04',-1,'ID',NULL,NULL,NULL),
 (2,'图文传真','fax','021-321006601',2,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:20:59',-1,'ID',NULL,NULL,NULL),
 (3,'办公地址','address','石门二路 199弄 1号 404 ',1,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:01:55',-1,'ID',NULL,NULL,NULL),
 (4,'邮件编码','zipcode','200041',1,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:01:55',-1,'ID',NULL,NULL,NULL),
 (5,'业务合作','business','aaa@163.com',1,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:01:55',-1,'ID',NULL,NULL,NULL),
 (7,'人事邮箱','hremail','aaa@163.com',1,-1,-1,-1,'2018-05-05 12:01:55',-1,'2018-05-05 12:01:55',-1,'ID',NULL,NULL,NULL),
 (8,'地图标题','mapTitle','石门二路&nbsp;199弄&nbsp;1号&nbsp;404',1,-1,-1,-1,'2018-05-05 12:22:41',-1,'2018-05-05 12:22:41',-1,'ID',NULL,NULL,NULL),
 (9,'地图内容','mapContent','上海市托幼协会，&nbsp;石门二路&nbsp;199弄&nbsp;1号&nbsp;404&nbsp;，欢迎您！',1,-1,-1,-1,'2018-05-05 12:22:41',-1,'2018-05-05 12:22:41',-1,'ID',NULL,NULL,NULL),
 (10,'地图坐标','mapPoint','121.467142|31.239651',1,-1,-1,-1,'2018-05-05 12:22:41',-1,'2018-05-05 12:22:41',-1,'ID',NULL,NULL,NULL),
 (11,'联系标题','title','上海市托幼协会',1,-1,-1,-1,'2018-05-05 12:43:00',-1,'2018-05-05 12:43:00',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_contact` ENABLE KEYS */;


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
-- Definition of table `kg_download`
--

DROP TABLE IF EXISTS `kg_download`;
CREATE TABLE `kg_download` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_title` varchar(200) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_download`
--

/*!40000 ALTER TABLE `kg_download` DISABLE KEYS */;
INSERT INTO `kg_download` (`id`,`file_title`,`file_path`,`summary`,`password`,`createDate`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'aaa.txt','/resources/upload/download/aaa.txt','11','','2018-05-03 15:15:57',4,-1,-1,-1,'2018-05-03 15:15:57',-1,'2018-05-12 11:52:58',-1,'ID',NULL,NULL,NULL),
 (2,'112.xml','/resources/upload/download/112.xml','','','2018-05-03 15:17:35',3,-1,-1,-1,'2018-05-03 15:17:35',-1,'2018-05-12 11:53:03',-1,'ID',NULL,NULL,NULL),
 (3,'123.txt','/resources/upload/download/123.txt','bb','','2018-05-04 10:07:29',2,-1,-1,-1,'2018-05-04 10:07:29',-1,'2018-05-12 09:35:03',-1,'ID',NULL,NULL,NULL),
 (4,'新建 Microsoft Word 文档.docx','/resources/upload/download/新建 Microsoft Word 文档.docx','','','2018-05-16 20:44:39',1,-1,-1,-1,'2018-05-16 20:44:39',-1,'2018-05-16 20:44:39',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_download` ENABLE KEYS */;


--
-- Definition of table `kg_introduction`
--

DROP TABLE IF EXISTS `kg_introduction`;
CREATE TABLE `kg_introduction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
 (1,'<p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上海市托幼协会是经上海市教育委员会同意，上海市社会团体管理局核准登记，取得法人资格的行业性、自律性的非营利性社会组织。</p><p>　　上海市托幼协会是为适应政府职能转变，适应上海学前教育事业发展的需要，更好地为本市各级各类学前教育机构服务，进一步推动本市托幼事业的发展而建立的。它的宗旨是：坚持四项基本原则, 遵守宪法、法律、法规, 贯彻党和政府的方针、政策, 团结全市各级各类学前教育机构和广大学前教育工作者，开展有关学前教育的理论、政策和实际问题等方面的研究, 协助政府加强学前教育管理，保护会员的合法权益，提高学前教育队伍的整体素质，推进托幼事业的发展。协会是会员的服务机构，协会是会员的自律组织，协会是会员的代表，协会也是行业的协调组织。</p><p>　　上海市托幼协会自2002年成立以来，得到了市各有关部门及领导的关心与支持。原市人大教科文委主任夏秀蓉、市教委副主任张民生任名誉会长，原市人大常委会副主任胡正昌、华师大潘洁教授、市教委基教处何幼华副处长任顾问，市卫生局、市妇联委派相关领导担任协会副会长参与协会的领导工作，现市人大常委、市政府参事瞿钧任会长。</p><p>　　协会的业务范围是：信息咨询，内外协调，业务培训，交流研讨、资质审核等。</p><p>　　协会的具体工作职责如下：</p><p>　　（一）积极宣传、贯策党和国家有关学前教育的方针、政策，宣传学前教育的地位、作用，团结、依靠社会各方面的力量，关心、支持学前教育工作。</p><p>　　（二）开展学前教育业务培训、保教业务咨询、保教人才交流等服务工作。</p><p>　　（三）开展国内外学前教育的合作与交流，推广研究成果和经验。</p><p>　　（四）就学前教育事业发展过程中存在的问题开展调研，参与有关学前教育发展、改革以及与托、幼园所利益相关的政府决策论证，提出事业发展中有关政策和立法的建议，并为政府提供决策依据。</p><p>　　（五）推进依法办园办所，创导良好的行风。对参与不正当竞争，有损事业整体形象的会员，协会采取警告、批评、开除会员资格等惩戒措施，也可建议有关行政机构依法对非会员单位的违法活动进行处理。</p><p>　　（六）依据学前教育有关法规，制定本市托幼保教质量规范，服务标准。</p><p>　　（七）接受政府有关职能部门委托，依法开展与学前教育发展相关的工作，如统计、调查、发布信息、公信证明、收费价格协调、资质审核等。</p><p>　　（八）协调会员与会员，会员与非会员，会员与幼儿家长、保教人员，会员与其它单位及社会组织的关系并维护其合法权益。</p><p>　　协会建立后将首先接受上海市教育委员会的委托开展对一级幼儿园、托儿所的认定、发证工作，上海市教委与上海市卫生局还在研究有关其他工作的委托。同时协会将充分发挥本市教育资源及人才资源的优势，开展学前教育培训、保教业务咨询、保教人才交流等服务工作。协会还将创造条件开展国内外学前教育的合作与交流，还将就多元化办园体制等问题开展调查、研究，总结经验，建立必要的行业规范，并为政府提供决策依据。</p><p>　　协会由单位会员和个人会员组成，凡经本市教育行政部门批准从事学前教育的机构和研究单位及在学前教育研究上有显著成绩或对学前教育事业发展有较大贡献的个人，承认本团体的章程，有加入本团体的愿望，填写入会申请，经理事会讨论通过均能成为本协会的单位会员和个人会员，会员享有参加本团体的活动，优先获得本团体服务的权利，并享有选举权、被选举权和表决权，同时还有对本团体工作的批评建议权和监督权。会员也应履行执行本团体决议，完成团体交代的工作及按时交纳会费的义务。</p><p>　　协会愿与所有会员单位共同努力，为上海托幼事业的发展作出贡献。</p><p>　　</p><p>　　</p><p>　　</p><p>　　 上海市托幼协会</p><p>　　</p><p>　　</p><p>　　</p><p>　　 上海市托幼协会地址：石门二路199弄1号404室</p><p>　　&nbsp;</p><p>　　邮编：200041 电话：62671784</p><p><br/></p>',23,-1,-1,-1,'2018-04-07 09:18:47',-1,'2018-04-28 15:08:11',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_introduction` ENABLE KEYS */;


--
-- Definition of table `kg_link`
--

DROP TABLE IF EXISTS `kg_link`;
CREATE TABLE `kg_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_link`
--

/*!40000 ALTER TABLE `kg_link` DISABLE KEYS */;
INSERT INTO `kg_link` (`id`,`link_name`,`link_url`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (8,'百度','http://www.baidu.com',2,-1,-1,-1,'2018-04-06 19:06:57',-1,'2018-05-12 14:02:18',-1,'ID',NULL,NULL,NULL),
 (9,'新浪','https://www.sina.com.cn/',2,-1,-1,-1,'2018-04-06 19:07:00',-1,'2018-05-12 14:04:10',-1,'ID',NULL,NULL,NULL),
 (10,'新浪体育','http://sports.sina.com.cn/',2,-1,-1,-1,'2018-04-14 10:43:51',-1,'2018-05-12 14:04:30',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_link` ENABLE KEYS */;


--
-- Definition of table `kg_news`
--

DROP TABLE IF EXISTS `kg_news`;
CREATE TABLE `kg_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `typeId` bigint(20) unsigned NOT NULL,
  `sourceId` bigint(20) unsigned NOT NULL DEFAULT '1',
  `attributeId` varchar(200) DEFAULT '-1',
  `newsTitle` varchar(45) NOT NULL,
  `summary` varchar(45) NOT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `content` text,
  `sequence` bigint(20) unsigned DEFAULT '0',
  `indexshow` varchar(1) NOT NULL DEFAULT 'N' COMMENT '//是否首页显示缩略图',
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_news`
--

/*!40000 ALTER TABLE `kg_news` DISABLE KEYS */;
INSERT INTO `kg_news` (`id`,`typeId`,`sourceId`,`attributeId`,`newsTitle`,`summary`,`thumbnail`,`author`,`content`,`sequence`,`indexshow`,`createDate`,`viewsCount`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (23,8,1,'12,15','中华人民共和国教育法','中华人民共和国教育法','',NULL,'<h1 style=\"margin: 0px; padding: 0px; border: 0px; overflow: hidden; list-style: none; font-size: 20px; text-align: center; color: rgb(75, 75, 75); font-family: 微软雅黑; white-space: normal;\">中华人民共和国教育法</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（1995年3月18日第八届全国人民代表大会第三次会议通过　根据2009年8月27日第十一届全国人民代表大会常务委员会第十次会议《关于修改部分法律的决定》第一次修正　根据2015年12月27日第十二届全国人民代表大会常务委员会第十八次会议《关于修改〈中华人民共和国教育法〉的决定》第二次修正）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　目录</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第一章 总则</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二章 教育基本制度</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三章 学校及其他教育机构</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四章 教师和其他教育工作者</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五章 受教育者</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六章 教育与社会</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七章 教育投入与条件保障</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八章 教育对外交流与合作</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第九章 法律责任</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十章 附则</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第一章 总则</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第一条 为了发展教育事业，提高全民族的素质，促进社会主义物质文明和精神文明建设，根据宪法，制定本法。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二条 在中华人民共和国境内的各级各类教育，适用本法。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三条 国家坚持以马克思列宁主义、毛泽东思想和建设有中国特色社会主义理论为指导，遵循宪法确定的基本原则，发展社会主义的教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四条 教育是社会主义现代化建设的基础，国家保障教育事业优先发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　全社会应当关心和支持教育事业的发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　全社会应当尊重教师。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五条 教育必须为社会主义现代化建设服务、为人民服务，必须与生产劳动和社会实践相结合，培养德、智、体、美等方面全面发展的社会主义建设者和接班人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六条 教育应当坚持立德树人，对受教育者加强社会主义核心价值观教育，增强受教育者的社会责任感、创新精神和实践能力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家在受教育者中进行爱国主义、集体主义、中国特色社会主义的教育，进行理想、道德、纪律、法治、国防和民族团结的教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七条 教育应当继承和弘扬中华民族优秀的历史文化传统，吸收人类文明发展的一切优秀成果。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八条 教育活动必须符合国家和社会公共利益。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家实行教育与宗教相分离。任何组织和个人不得利用宗教进行妨碍国家教育制度的活动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第九条 中华人民共和国公民有受教育的权利和义务。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　公民不分民族、种族、性别、职业、财产状况、宗教信仰等，依法享有平等的受教育机会。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十条 国家根据各少数民族的特点和需要，帮助各少数民族地区发展教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家扶持边远贫困地区发展教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家扶持和发展残疾人教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十一条 国家适应社会主义市场经济发展和社会进步的需要，推进教育改革，推动各级各类教育协调发展、衔接融通，完善现代国民教育体系，健全终身教育体系，提高教育现代化水平。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家采取措施促进教育公平，推动教育均衡发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家支持、鼓励和组织教育科学研究，推广教育科学研究成果，促进教育质量提高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十二条 国家通用语言文字为学校及其他教育机构的基本教育教学语言文字，学校及其他教育机构应当使用国家通用语言文字进行教育教学。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　民族自治地方以少数民族学生为主的学校及其他教育机构，从实际出发，使用国家通用语言文字和本民族或者当地民族通用的语言文字实施双语教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家采取措施，为少数民族学生为主的学校及其他教育机构实施双语教育提供条件和支持。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十三条 国家对发展教育事业做出突出贡献的组织和个人，给予奖励。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十四条 国务院和地方各级人民政府根据分级管理、分工负责的原则，领导和管理教育工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　中等及中等以下教育在国务院领导下，由地方人民政府管理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　高等教育由国务院和省、自治区、直辖市人民政府管理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十五条 国务院教育行政部门主管全国教育工作，统筹规划、协调管理全国的教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　县级以上地方各级人民政府教育行政部门主管本行政区域内的教育工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　县级以上各级人民政府其他有关部门在各自的职责范围内，负责有关的教育工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十六条 国务院和县级以上地方各级人民政府应当向本级人民代表大会或者其常务委员会报告教育工作和教育经费预算、决算情况，接受监督。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第二章 教育基本制度</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十七条 国家实行学前教育、初等教育、中等教育、高等教育的学校教育制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家建立科学的学制系统。学制系统内的学校和其他教育机构的设置、教育形式、修业年限、招生对象、培养目标等，由国务院或者由国务院授权教育行政部门规定。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十八条 国家制定学前教育标准，加快普及学前教育，构建覆盖城乡，特别是农村的学前教育公共服务体系。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　各级人民政府应当采取措施，为适龄儿童接受学前教育提供条件和支持。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第十九条 国家实行九年制义务教育制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　各级人民政府采取各种措施保障适龄儿童、少年就学。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　适龄儿童、少年的父母或者其他监护人以及有关社会组织和个人有义务使适龄儿童、少年接受并完成规定年限的义务教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十条 国家实行职业教育制度和继续教育制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　各级人民政府、有关行政部门和行业组织以及企业事业组织应当采取措施，发展并保障公民接受职业学校教育或者各种形式的职业培训。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家鼓励发展多种形式的继续教育，使公民接受适当形式的政治、经济、文化、科学、技术、业务等方面的教育，促进不同类型学习成果的互认和衔接，推动全民终身学习。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十一条 国家实行国家教育考试制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家教育考试由国务院教育行政部门确定种类，并由国家批准的实施教育考试的机构承办。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十二条 国家实行学业证书制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　经国家批准设立或者认可的学校及其他教育机构按照国家有关规定，颁发学历证书或者其他学业证书。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十三条 国家实行学位制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学位授予单位依法对达到一定学术水平或者专业技术水平的人员授予相应的学位，颁发学位证书。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十四条 各级人民政府、基层群众性自治组织和企业事业组织应当采取各种措施，开展扫除文盲的教育工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　按照国家规定具有接受扫除文盲教育能力的公民，应当接受扫除文盲的教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十五条 国家实行教育督导制度和学校及其他教育机构教育评估制度。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第三章 学校及其他教育机构</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十六条 国家制定教育发展规划，并举办学校及其他教育机构。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家鼓励企业事业组织、社会团体、其他社会组织及公民个人依法举办学校及其他教育机构。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家举办学校及其他教育机构，应当坚持勤俭节约的原则。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　以财政性经费、捐赠资产举办或者参与举办的学校及其他教育机构不得设立为营利性组织。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十七条 设立学校及其他教育机构，必须具备下列基本条件：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）有组织机构和章程；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）有合格的教师；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）有符合规定标准的教学场所及设施、设备等；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）有必备的办学资金和稳定的经费来源。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十八条 学校及其他教育机构的设立、变更和终止，应当按照国家有关规定办理审核、批准、注册或者备案手续。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第二十九条 学校及其他教育机构行使下列权利：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）按照章程自主管理；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）组织实施教育教学活动；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）招收学生或者其他受教育者；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）对受教育者进行学籍管理，实施奖励或者处分；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（五）对受教育者颁发相应的学业证书；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（六）聘任教师及其他职工，实施奖励或者处分；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（七）管理、使用本单位的设施和经费；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（八）拒绝任何组织和个人对教育教学活动的非法干涉；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（九）法律、法规规定的其他权利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家保护学校及其他教育机构的合法权益不受侵犯。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十条 学校及其他教育机构应当履行下列义务：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）遵守法律、法规；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）贯彻国家的教育方针，执行国家教育教学标准，保证教育教学质量；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）维护受教育者、教师及其他职工的合法权益；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）以适当方式为受教育者及其监护人了解受教育者的学业成绩及其他有关情况提供便利；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（五）遵照国家有关规定收取费用并公开收费项目；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（六）依法接受监督。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十一条 学校及其他教育机构的举办者按照国家有关规定，确定其所举办的学校或者其他教育机构的管理体制。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构的校长或者主要行政负责人必须由具有中华人民共和国国籍、在中国境内定居、并具备国家规定任职条件的公民担任，其任免按照国家有关规定办理。学校的教学及其他行政管理，由校长负责。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构应当按照国家有关规定，通过以教师为主体的教职工代表大会等组织形式，保障教职工参与民主管理和监督。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十二条 学校及其他教育机构具备法人条件的，自批准设立或者登记注册之日起取得法人资格。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构在民事活动中依法享有民事权利，承担民事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构中的国有资产属于国家所有。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构兴办的校办产业独立承担民事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四章 教师和其他教育工作者</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十三条 教师享有法律规定的权利，履行法律规定的义务，忠诚于人民的教育事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十四条 国家保护教师的合法权益，改善教师的工作条件和生活条件，提高教师的社会地位。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　教师的工资报酬、福利待遇，依照法律、法规的规定办理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十五条 国家实行教师资格、职务、聘任制度，通过考核、奖励、培养和培训，提高教师素质，加强教师队伍建设。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十六条 学校及其他教育机构中的管理人员，实行教育职员制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构中的教学辅助人员和其他专业技术人员，实行专业技术职务聘任制度。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第五章 受教育者</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十七条 受教育者在入学、升学、就业等方面依法享有平等权利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校和有关行政部门应当按照国家有关规定，保障女子在入学、升学、就业、授予学位、派出留学等方面享有同男子平等的权利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十八条 国家、社会对符合入学条件、家庭经济困难的儿童、少年、青年，提供各种形式的资助。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第三十九条 国家、社会、学校及其他教育机构应当根据残疾人身心特性和需要实施教育，并为其提供帮助和便利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十条 国家、社会、家庭、学校及其他教育机构应当为有违法犯罪行为的未成年人接受教育创造条件。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十一条 从业人员有依法接受职业培训和继续教育的权利和义务。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家机关、企业事业组织和其他社会组织，应当为本单位职工的学习和培训提供条件和便利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十二条 国家鼓励学校及其他教育机构、社会组织采取措施，为公民接受终身教育创造条件。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十三条 受教育者享有下列权利：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）参加教育教学计划安排的各种活动，使用教育教学设施、设备、图书资料；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）按照国家有关规定获得奖学金、贷学金、助学金；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）在学业成绩和品行上获得公正评价，完成规定的学业后获得相应的学业证书、学位证书；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）对学校给予的处分不服向有关部门提出申诉，对学校、教师侵犯其人身权、财产权等合法权益，提出申诉或者依法提起诉讼；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（五）法律、法规规定的其他权利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十四条 受教育者应当履行下列义务：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）遵守法律、法规；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）遵守学生行为规范，尊敬师长，养成良好的思想品德和行为习惯；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）努力学习，完成规定的学习任务；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）遵守所在学校或者其他教育机构的管理制度。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十五条 教育、体育、卫生行政部门和学校及其他教育机构应当完善体育、卫生保健设施，保护学生的身心健康。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第六章 教育与社会</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十六条 国家机关、军队、企业事业组织、社会团体及其他社会组织和个人，应当依法为儿童、少年、青年学生的身心健康成长创造良好的社会环境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十七条 国家鼓励企业事业组织、社会团体及其他社会组织同高等学校、中等职业学校在教学、科研、技术开发和推广等方面进行多种形式的合作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　企业事业组织、社会团体及其他社会组织和个人，可以通过适当形式，支持学校的建设，参与学校管理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十八条 国家机关、军队、企业事业组织及其他社会组织应当为学校组织的学生实习、社会实践活动提供帮助和便利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第四十九条 学校及其他教育机构在不影响正常教育教学活动的前提下，应当积极参加当地的社会公益活动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十条 未成年人的父母或者其他监护人应当为其未成年子女或者其他被监护人受教育提供必要条件。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　未成年人的父母或者其他监护人应当配合学校及其他教育机构，对其未成年子女或者其他被监护人进行教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校、教师可以对学生家长提供家庭教育指导。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十一条 图书馆、博物馆、科技馆、文化馆、美术馆、体育馆（场）等社会公共文化体育设施，以及历史文化古迹和革命纪念馆（地），应当对教师、学生实行优待，为受教育者接受教育提供便利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　广播、电视台（站）应当开设教育节目，促进受教育者思想品德、文化和科学技术素质的提高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十二条 国家、社会建立和发展对未成年人进行校外教育的设施。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　学校及其他教育机构应当同基层群众性自治组织、企业事业组织、社会团体相互配合，加强对未成年人的校外教育工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十三条 国家鼓励社会团体、社会文化机构及其他社会组织和个人开展有益于受教育者身心健康的社会文化教育活动。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第七章 教育投入与条件保障</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十四条 国家建立以财政拨款为主、其他多种渠道筹措教育经费为辅的体制，逐步增加对教育的投入，保证国家举办的学校教育经费的稳定来源。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　企业事业组织、社会团体及其他社会组织和个人依法举办的学校及其他教育机构，办学经费由举办者负责筹措，各级人民政府可以给予适当支持。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十五条 国家财政性教育经费支出占国民生产总值的比例应当随着国民经济的发展和财政收入的增长逐步提高。具体比例和实施步骤由国务院规定。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　全国各级财政支出总额中教育经费所占比例应当随着国民经济的发展逐步提高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十六条 各级人民政府的教育经费支出，按照事权和财权相统一的原则，在财政预算中单独列项。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　各级人民政府教育财政拨款的增长应当高于财政经常性收入的增长，并使按在校学生人数平均的教育费用逐步增长，保证教师工资和学生人均公用经费逐步增长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十七条 国务院及县级以上地方各级人民政府应当设立教育专项资金，重点扶持边远贫困地区、少数民族地区实施义务教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十八条 税务机关依法足额征收教育费附加，由教育行政部门统筹管理，主要用于实施义务教育。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　省、自治区、直辖市人民政府根据国务院的有关规定，可以决定开征用于教育的地方附加费，专款专用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第五十九条 国家采取优惠措施，鼓励和扶持学校在不影响正常教育教学的前提下开展勤工俭学和社会服务，兴办校办产业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十条 国家鼓励境内、境外社会组织和个人捐资助学。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十一条 国家财政性教育经费、社会组织和个人对教育的捐赠，必须用于教育，不得挪用、克扣。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十二条 国家鼓励运用金融、信贷手段，支持教育事业的发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十三条 各级人民政府及其教育行政部门应当加强对学校及其他教育机构教育经费的监督管理，提高教育投资效益。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十四条 地方各级人民政府及其有关行政部门必须把学校的基本建设纳入城乡建设规划，统筹安排学校的基本建设用地及所需物资，按照国家有关规定实行优先、优惠政策。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十五条 各级人民政府对教科书及教学用图书资料的出版发行，对教学仪器、设备的生产和供应，对用于学校教育教学和科学研究的图书资料、教学仪器、设备的进口，按照国家有关规定实行优先、优惠政策。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十六条 国家推进教育信息化，加快教育信息基础设施建设，利用信息技术促进优质教育资源普及共享，提高教育教学水平和教育管理水平。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　县级以上人民政府及其有关部门应当发展教育信息技术和其他现代化教学方式，有关行政部门应当优先安排，给予扶持。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　国家鼓励学校及其他教育机构推广运用现代化教学方式。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第八章 教育对外交流与合作</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十七条 国家鼓励开展教育对外交流与合作，支持学校及其他教育机构引进优质教育资源，依法开展中外合作办学，发展国际教育服务，培养国际化人才。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　教育对外交流与合作坚持独立自主、平等互利、相互尊重的原则，不得违反中国法律，不得损害国家主权、安全和社会公共利益。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十八条 中国境内公民出国留学、研究、进行学术交流或者任教，依照国家有关规定办理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第六十九条 中国境外个人符合国家规定的条件并办理有关手续后，可以进入中国境内学校及其他教育机构学习、研究、进行学术交流或者任教，其合法权益受国家保护。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十条 中国对境外教育机构颁发的学位证书、学历证书及其他学业证书的承认，依照中华人民共和国缔结或者加入的国际条约办理，或者按照国家有关规定办理。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第九章 法律责任</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十一条 违反国家有关规定，不按照预算核拨教育经费的，由同级人民政府限期核拨；情节严重的，对直接负责的主管人员和其他直接责任人员，依法给予处分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　违反国家财政制度、财务制度，挪用、克扣教育经费的，由上级机关责令限期归还被挪用、克扣的经费，并对直接负责的主管人员和其他直接责任人员，依法给予处分；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十二条 结伙斗殴、寻衅滋事，扰乱学校及其他教育机构教育教学秩序或者破坏校舍、场地及其他财产的，由公安机关给予治安管理处罚；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　侵占学校及其他教育机构的校舍、场地及其他财产的，依法承担民事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十三条 明知校舍或者教育教学设施有危险，而不采取措施，造成人员伤亡或者重大财产损失的，对直接负责的主管人员和其他直接责任人员，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十四条 违反国家有关规定，向学校或者其他教育机构收取费用的，由政府责令退还所收费用；对直接负责的主管人员和其他直接责任人员，依法给予处分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十五条 违反国家有关规定，举办学校或者其他教育机构的，由教育行政部门或者其他有关行政部门予以撤销；有违法所得的，没收违法所得；对直接负责的主管人员和其他直接责任人员，依法给予处分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十六条 学校或者其他教育机构违反国家有关规定招收学生的，由教育行政部门或者其他有关行政部门责令退回招收的学生，退还所收费用；对学校、其他教育机构给予警告，可以处违法所得五倍以下罚款；情节严重的，责令停止相关招生资格一年以上三年以下，直至撤销招生资格、吊销办学许可证；对直接负责的主管人员和其他直接责任人员，依法给予处分；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十七条 在招收学生工作中徇私舞弊的，由教育行政部门或者其他有关行政部门责令退回招收的人员；对直接负责的主管人员和其他直接责任人员，依法给予处分；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十八条 学校及其他教育机构违反国家有关规定向受教育者收取费用的，由教育行政部门或者其他有关行政部门责令退还所收费用；对直接负责的主管人员和其他直接责任人员，依法给予处分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第七十九条 考生在国家教育考试中有下列行为之一的，由组织考试的教育考试机构工作人员在考试现场采取必要措施予以制止并终止其继续参加考试；组织考试的教育考试机构可以取消其相关考试资格或者考试成绩；情节严重的，由教育行政部门责令停止参加相关国家教育考试一年以上三年以下；构成违反治安管理行为的，由公安机关依法给予治安管理处罚；构成犯罪的，依法追究刑事责任：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）非法获取考试试题或者答案的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）携带或者使用考试作弊器材、资料的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）抄袭他人答案的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）让他人代替自己参加考试的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（五）其他以不正当手段获得考试成绩的作弊行为。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十条 任何组织或者个人在国家教育考试中有下列行为之一，有违法所得的，由公安机关没收违法所得，并处违法所得一倍以上五倍以下罚款；情节严重的，处五日以上十五日以下拘留；构成犯罪的，依法追究刑事责任；属于国家机关工作人员的，还应当依法给予处分：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（一）组织作弊的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（二）通过提供考试作弊器材等方式为作弊提供帮助或者便利的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（三）代替他人参加考试的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（四）在考试结束前泄露、传播考试试题或者答案的；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　（五）其他扰乱考试秩序的行为。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十一条 举办国家教育考试，教育行政部门、教育考试机构疏于管理，造成考场秩序混乱、作弊情况严重的，对直接负责的主管人员和其他直接责任人员，依法给予处分；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十二条 学校或者其他教育机构违反本法规定，颁发学位证书、学历证书或者其他学业证书的，由教育行政部门或者其他有关行政部门宣布证书无效，责令收回或者予以没收；有违法所得的，没收违法所得；情节严重的，责令停止相关招生资格一年以上三年以下，直至撤销招生资格、颁发证书资格；对直接负责的主管人员和其他直接责任人员，依法给予处分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　前款规定以外的任何组织或者个人制造、销售、颁发假冒学位证书、学历证书或者其他学业证书，构成违反治安管理行为的，由公安机关依法给予治安管理处罚；构成犯罪的，依法追究刑事责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　以作弊、剽窃、抄袭等欺诈行为或者其他不正当手段获得学位证书、学历证书或者其他学业证书的，由颁发机构撤销相关证书。购买、使用假冒学位证书、学历证书或者其他学业证书，构成违反治安管理行为的，由公安机关依法给予治安管理处罚。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十三条 违反本法规定，侵犯教师、受教育者、学校或者其他教育机构的合法权益，造成损失、损害的，应当依法承担民事责任。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\"><strong style=\"margin: 0px; padding: 0px; border: 0px;\">第十章 附则</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十四条 军事学校教育由中央军事委员会根据本法的原则规定。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　宗教学校教育由国务院另行规定。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十五条 境外的组织和个人在中国境内办学和合作办学的办法，由国务院规定。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 16px 0px; border: 0px; overflow: hidden; list-style: none;\">　　第八十六条 本法自1995年9月1日起施行。</p><p><br/></p>',0,'N','2018-04-14 13:28:43',0,2,-1,-1,-1,'2018-04-14 13:28:43',-1,'2018-04-19 13:59:20',-1,'ID',NULL,NULL,NULL),
 (24,8,1,'12,14,15','市人保局解读来沪随迁子女就读本市学校政策','市人保局解读来沪随迁子女就读本市学校政策','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">上海市人力资源和社会保障局12月23日就推进《关于来沪人员随迁子女就读本市各级各类学校的实施意见》作了专题解读，表示将加大这一政策的宣传力度，使来沪从业人员的权利得到更好的保障。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">据了解，根据市委、市政府加强本市人口综合管理的要求，结合本市来沪从业人员管理实际需要，从今年3月1日起，按照“以业管人”和“属地化管理”原则，本市对医院外来护工、外来家政服务人员、无雇工的来沪个体工商户、农民专业合作社外来从业人员试行灵活就业登记。半年多来，全市已累计办理灵活就业登记6723人。其中，医院护工934人，家政服务人员1199人，个体工商户3462人，农业合作社从业人员1128人。同时，根据本市实际情况，不断完善政策，最近将“社区居家养老服务来沪从业人员”作为家政服务人员中的一种纳入试点范围，目前来沪从业人员灵活就业登记的范围已涵盖了“四个大类、五种人员”。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">市人力资源社会保障局强调，办理就业登记的外来灵活就业人员，应当已在本市稳定就业，并持有本市临时居住证，符合合法稳定就业、合法稳定居住的基本要求。其登记办理程序是：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）符合灵活就业登记条件和登记范围的来沪人员，按照各行业主管部门的规定，到指定地点办理行业“灵活就业证明”。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）办妥行业“灵活就业证明”的，凭个人身份证、本市临时居住证、行业“灵活就业证明”和个人证件照等材料，到就业所在地的街镇社区事务受理服务中心就业服务窗口办理灵活就业登记手续。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（三）街镇社区事务受理服务中心向符合条件的来沪灵活就业人员免费发放《就业失业登记证》，并注明本次灵活就业登记起始日期。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（四）来沪从业人员每次灵活就业登记的有效期为1年，有效期满的，须重新办理。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">据了解，为了规范出具行业“灵活就业证明”的办理程序，各行业主管部门都制订了相应的配套操作办法：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）医院外来护工，由其工作所在医疗机构的区县卫生行政部门委托的17家区县卫生监督所出具灵活就业证明。中介服务机构或医疗机构可以持护工身份证、机构证照等材料，到护工工作所在医疗机构执业地点的区县卫生监督所为护工集体办理灵活就业证明。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）来沪家政服务人员，由市商务委认可、与上海家政服务网络中心对接备案的示范性家政服务站和部分家政龙头企业出具灵活就业证明。目前，各相关部门已设立了42个受理点，新的办事窗口还将不断推出。来沪家政服务人员本人可持身份证、相关从业资格证明等材料到各受理点办理手续。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">符合条件的社区居家养老服务来沪从业人员，由其所在社区助老服务社所在地的区县民政局出具灵活就业证明。社区助老服务社可汇总本单位相关人员的申请材料，经区县社区居家养老服务指导中心审核后，集中送区县民政局审定确认。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（三）无雇工的来沪个体工商户，由经营场所所在地工商所（全市共173家）出具行业“灵活就业证明”。经本市工商部门合法登记满1年、最近年度验照通过且经营者为来沪人员的个体工商户，经营者本人可持身份证、个体工商户营业执照等材料到属地工商所办理相关手续。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（四）来沪农业从业人员，由其工作的农民专业合作社所在地的区县农委出具灵活就业证明。来沪农业从业人员办理该证明需符合两项条件：一是与所在农民专业合作社签订届满1年的灵活就业协议并取得相应报酬；二是居住场所合法稳定，且无违法搭建。本市农业部门设立了107个受理点。符合上述条件的人员向所在农民专业合作社提出申请并提交灵活就业协议、合法稳定居住证明等材料，由农民专业合作社前往各受理点办理相关手续。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">外来从业人员在办理“灵活就业证明”时，可以拨打以下５个主管部门咨询电话：①市卫生计生委１２３２０；②市商务委９６２５１２；③市民政局９６２２００；④市工商局１２３１５；⑤市农委１２３１６。</p><p><br/></p>',0,'N','2018-04-14 13:29:43',0,2,-1,-1,-1,'2018-04-14 13:29:43',-1,'2018-04-19 13:59:29',-1,'ID',NULL,NULL,NULL),
 (25,8,1,'12,14','市人大代表提案立法规范少儿培训市场','市人大代表提案立法规范少儿培训市场','',NULL,'<p>一个双休日要参加三四场学科竞赛，四五年级的小学生手握二三十张证书……如今，双休日参加竞赛，已成小学生乃至幼儿园小朋友的生活常态，如何才能遏制低龄儿童的竞赛考级热？日前，市教委基础教育处处长倪闽景等13位市人大代表提出了《制订法规，规范社会力量办学，遏制低龄儿童各种比赛考级》的议案。</p><p><br/></p><p>考级机构10万元即可注册</p><p><br/></p><p>市人大教科文卫委员会调研认为，尽管市教委曾发布过有关禁止义务教育阶段学校把各种学科竞赛成绩和证书作为招生依据的规定，但招生与学科竞赛成绩、证书挂钩现象依旧。</p><p><br/></p><p>目前，由上海市教委审批的面向中小学生的竞赛项目仅有26项，且都是艺术、体育类的。但社会上相关的竞赛和考证涉及语、数、外科目的超过50种。组织这些竞赛和考级的机构，只需花费10万元即可在工商部门注册成立。</p><p><br/></p><p>市场乱象丛生费用奇高</p><p><br/></p><p>市人大代表、上海国际集团的刘樱也对竞赛培训市场调查发现，培训行业“大市场、小作坊，乱象丛生、误人子弟”。培训业已拥有数十万家培训机构，少儿教育、英语、IT已成为培训产业三大支柱。而针对中小学生的课外竞赛培训费都非常高，一对一的每小时300元，一对三的每小时150元，人均年培训支出高达两三万。很多培训机构还采取“先付款，后培训”和“一次性付款”等培训模式。</p><p><br/></p><p>当前，各种竞赛考级越来越走向低龄化，人大代表们疾呼:这是一种十分危险的倾向，这样的低龄化会让家庭教育负担更加沉重，使教育秩序更加畸形。</p><p><br/></p><p>立法规范少儿培训市场</p><p><br/></p><p>据介绍，课外竞赛培训是一个世界性问题，许多国家在各自的发展阶段也都存在过。但现今的大多数发达国家，对低龄儿童(小学阶段和学龄前)的学科类补习都有严格限制。</p><p><br/></p><p>倪闽景等代表认为，当前要遏制面对低龄化儿童的各种竞赛考级，市人大常委会应专门立法或者修改青少年保护条例，规范社会力量办学；应明确规定:面向中小学生和幼儿园孩子的各类培训，统一归口到各级教育行政部门审批；一律不准开展针对低龄儿童的学科类竞赛和考级；义务教育阶段学校在招生过程中严格禁止把竞赛成绩和考级证书作为录取依据</p><p><br/></p>',0,'N','2018-04-14 13:30:43',0,2,-1,-1,-1,'2018-04-14 13:30:43',-1,'2018-04-19 13:59:13',-1,'ID',NULL,NULL,NULL),
 (26,8,1,'','上海市人民政府办公厅关于转发市教委等十一部门制订的','上海市人民政府办公厅关于转发市教委等十一部门制订的','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">沪府办发〔2011〕19号</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">各区、县人民政府，市政府各委、办、局：</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">市教委、市发展改革委、市卫生局、市人口计生委、市财政局、市编办、市人力资源社会保障局、市建设交通委、市农委、市规划国土资源局、市住房保障房屋管理局制订的《上海市学前教育三年行动计划（2011—2013年）》已经市政府同意，现转发给你们，请认真按照执行。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: right;\">上海市人民政府办公厅</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: right;\">二○一一年五月十八日</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">上海市学前教育三年行动计划（2011—2013年）</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">当前，随着新一轮人口出生高峰的到来和学前教育需求的增强，本市学前教育事业发展面临新的挑战与机遇。为更好地应对学前教育入园高峰，实现学前教育事业的科学发展，进一步满足市民对学前教育的多样化需求，特制订本计划。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">一、发展现状</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">“十一五”期间，在市委、市政府的领导下，在区县和各有关部门的努力、社会各界的支持下，本市学前教育以科学发展观为指导，认真实施《上海市学前教育三年行动计划（2006—2008年）》，加强基础设施建设，改善办园条件，努力提高保教质量，基本满足了市民的需求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（一）基本情况</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">1．总体规模</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2010年，全市共有独立设置幼儿园1252所，实际办园点1709个（其中民办396所，占31.6％），在园幼儿40.03万人（其中非本市户籍幼儿占31%），常住人口适龄儿童的入园率达98％以上。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2．师资队伍建设</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">通过委托高等师范院校培养学前教育专业学生，培训应届非学前教育专业高校毕业生充实学前教育师资队伍，鼓励和吸引高校毕业生到郊区农村幼儿园任教，开展幼儿园新任教师上岗培训，完善幼儿园保教人员职后培训和育婴师培训机制等，拓宽了幼儿教师的来源渠道，提高了在职保教人员的学历和专业水平，保健教师、保育员、营养员逐步做到持证上岗，上海学前教育师资队伍的数量与质量都得到了提升。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2010年，全市共有幼儿园教职工4.09万人，其中专任教师267万人。专任教师中，大学专科及以上学历者占93.6%，其中大学本科及以上学历者占45.95%。同时，通过实施幼儿园“名园长、名教师培养工程”，采取园本研修、课题研究、多形式带教等方式，培养了一批骨干园长、教师。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">3．办园条件</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">“十一五”期间，各级政府加大对学前教育的经费投入力度，加强幼儿园园舍设施建设和教育教学设备配置，幼儿园的办园条件明显改善。通过新建、改扩建、迁建、公建配套和教育资源调整使用等，全市新增幼儿园近400所。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2010年，本市幼儿园的总占地面积由2005年的398.67万平方米增加到652.6万平方米。其中，园舍面积由2005年的25305万平方米增加到429.73万平方米。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">4．幼儿园内涵建设</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">树立以儿童发展为本的理念，加强保教研究，积极推进幼儿园课程改革。各级各类幼儿园通过内涵建设，保教质量与办园水平进一步提高。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">通过中心城区优质幼儿园与郊区幼儿园结对，加强园长教师带教、对口科研课题指导、教研活动交流等，推动城区优质学前教育资源向郊区辐射，提高了郊区幼儿园管理和教育水平。通过公办与民办幼儿园结对，加强对民办幼儿园内涵建设的支持，帮助民办幼儿园提高质量，目前全市有10所民办幼儿园达到一级幼儿园水平。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">目前，全市一级以上的园所已达383所，占幼儿园总数的3059％。0-3岁婴幼儿科学育儿工作得到普及，全市95%以上户籍0-3岁婴幼儿的家长和看护人员每年得到4次以上有质量的科学育儿指导。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（二）学前教育面临的新挑战</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">1．全市面临新一轮人口出生高峰</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">受20世纪80年代至90年代本市第三次人口出生高峰的影响，近年来，本市户籍育龄妇女数量不断增加，形成新的人口出生高峰。同时，近几年非本市户籍人口大量导入，形成非本市户籍出生幼儿人数的高峰。两个高峰叠加，造成较大的入园压力。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">据市人口计生委统计，2005年本市常住人口出生数为12.39万人。其中，本市户籍出生人口数为8.25万人，占66.59%。据测算，2013年上海常住人口出生数将达到16.5万。其中，本市户籍约9.2万人，占55.76%。本轮人口出生数上升呈现两个特点：一是增幅明显，2013年将较2005年增长33.17%；二是非本市户籍人口出生数比例不断提高，将从2005年的33.41%上升到2013年的44.24%。根据上述预测，2013年本市在园幼儿数将达到50万人左右，各区县将普遍面临较大的入园压力。由于区域出生人口分布与幼儿园数量不平衡，部分区县面临的压力更大。2005-2010年上海市出生人口情况</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（单位：万人）2005年2006年2007年2008年2009年2010年常住人口12.3913.4216.6616.6616.4617.51其中：本市户籍人口8.258.1210.089.679.2310.02占常住人口比例(%)66.5960.5160.558.0456.157.26其中：外来常住人口4.175.326.586.997.237.49占常住人口比例(%)33.4139.4939.541.9643.942.742．师资队伍数量有缺口，优秀专业教师需求矛盾突出</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">根据幼儿园15∶1的生师比要求预测，未来三年上海约需新增专任教师8000人，新增保育员3000人。达到本科学历、接受过学前专业培训的幼儿教师供需矛盾突出。根据各区县的规划需求统计，新增幼儿教师60%以上要达到本科学历，61%为师范类专业毕业（其中，79%为幼儿教育专业毕业）。因此，需要尽快扩大本市学前教育专业学生的培养规模。同时，由于近年来学前教育教师大扩容，新任教师在职培训提高任务也非常艰巨。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">此外，由于受财政投入体制机制的制约，0-3岁散居婴幼儿家庭接受科学育儿指导服务难以保证。现有幼儿园的保教人员（保健教师、保育员和营养员）受用人机制、待遇等问题的制约，队伍难稳定，人员素质难以保证。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">3．园舍建设任务重</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">为应对未来三年的入园高峰，需要新增园舍面积90万平方米。其中，通过新建幼儿园而增加的园舍面积达50万平方米，约100所幼儿园。根据人口流向分析，这些幼儿园将主要集中在城乡结合部和郊区。由于目前动迁难度加大等原因，新建幼儿园园舍面临时间紧、任务重、资金有缺口等困难。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">4．内涵建设要求更高</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">一方面，人民群众对学前教育的多样化需求日益强烈；另一方面，上海现代化国际大都市的建设进程也要求学前教育质量和水平不断提高。因此，上海的学前教育正面临着增加数量、提高质量的双重挑战。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">二、发展目标与任务</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（一）指导思想</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">深入学习实践科学发展观，以儿童发展为本，健全完善学前教育公共服务体系，继续深化体制机制改革与创新，促进学前教育规模与内涵同步发展，妥善解决入园高峰的困难，进一步满足人民群众对学前教育的多样化需求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（二）总体目标</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">1.进一步强化政府职能，构建和完善学前教育公共服务体系。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2.进一步推进学前教育事业发展，实现对适龄儿童学前教育和看护服务的全覆盖。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">3.进一步加强学前教育管理，保障幼儿园安全，确保在园（看护点）幼儿身心健康、快乐成长。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">4.进一步加大幼儿园建设力度，促进学前教育内涵发展，提升学前教育保教质量。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（三）发展指标</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">1．构建和完善与上海经济社会发展相适应的学前教育公共服务体系。优化学前教育资源配置，积极稳妥应对入园高峰，逐步实现本市常住人口中3-6周岁儿童接受学前教育及看护服务全覆盖，进一步扩大3周岁以下儿童家长每年接受4次以上有质量、免费的指导服务。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">2．全市新建和改扩建100所幼儿园。保持各级各类幼儿园园舍建设和设施设备的达标水平。80%以上幼儿园达到1988年教育部颁布的《城市幼儿园建筑面积定额标准（试行）》，新建幼儿园所达到2005年上海市制定的《普通幼儿园建设标准》。幼儿园的设施设备按照《上海市学前教育机构装备规范（试行）》配备达标。幼儿园的安全技防设施按照标准配备。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">3．规范建设民办三级幼儿园。三年新增民办三级园205所，规范320个学前看护点，逐步满足进城务工人员随迁子女入园和看护的需求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">4．加强师资队伍建设，促进保教人员专业发展。建立开放、灵活、多样的师资培训机制，构建职前教育与在职教育相衔接的保教人员培训体系。加强对农村幼儿园园长和教师、职初教师、保育人员的专业培训，受培训率达到100％。专任教师基本达到大专及以上学历，其中60%达到本科及以上学历。保教人员（含早教指导人员）持证上岗，专业能力得到发展，保健教师、保育员和营养员按照规定配置。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">5．推进学前教育规模与内涵同步发展。深化学前教育改革，加强幼儿发展规律的研究，促进学前教育科学发展。加大城区、郊区幼儿园结对力度，缩小城郊、园际差异；提升每一园所的保教质量和办园水平；深化学前教育办园体制与机制的研究，满足社会和家长对学前教育的多样化需求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（四）主要措施</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">1．强化政府职能，完善公共服务体系</p><p style=\"margin-top: 0px; margin-bottom: 15px; white-space: normal; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify;\">（1）坚持“地</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><br/></p>',0,'N','2018-04-14 13:31:46',0,1,-1,-1,-1,'2018-04-14 13:31:46',-1,'2018-04-14 13:31:46',-1,'ID',NULL,NULL,NULL),
 (27,8,1,'','2017“万人计划”遴选200名教学名师','2017“万人计划”遴选200名教学名师','',NULL,'<p>记者昨天从教育部获悉，2017年国家“万人计划”教学名师遴选展开在即，将支持国家“万人计划”教学名师200名。其中，高等学校(含普通本科院校、高等职业学校等)教师占60%左右，中等以下学校(含普通中小学、中等职业学校、幼儿园、特殊教育学校等)教师占40%左右。</p><p><br/></p><p>国家“万人计划”是经党中央国务院批准，面向国内高层次人才的重点支持计划，于2012年启动实施。这一计划准备用10年左右时间，重点遴选支持一批自然科学、工程技术和哲学社会科学领域的杰出人才、领军人才和青年拔尖人才，形成与“千人计划”相互衔接的高层次创新创业人才队伍建设体系。</p><p><br/></p><p>教学名师作为“万人计划”项目之一，是唯一侧重考察教师教书育人实绩的国家级人才项目，并于2015年由面向高等教育扩展到面向各级各类学校在职专任教师进行遴选。这充分体现了国家对一线教师从事教书育人工作的重视和认可，也是激发广大教师坚守岗位职责，潜心教书、精心育人、为国育才的强大激励措施。</p><p><br/></p><p>根据教育部办公厅、中组部办公厅日前联合印发的《关于组织开展2017年国家“万人计划”教学名师遴选工作的通知》，“万人计划”教学名师须具备一定的遴选条件。比如，申报教学名师的普通本科院校人选应具有高级专业技术职务，近6学年主讲课程的平均课堂教学工作量不少于96学时/学年，其中每学年必须为本科生主讲一门课程。申报教学名师的高等职业学校人选应具有相关企事业单位一线实践工作经历，具有高级专业技术职务，近3学年承担本校教学任务不少于180学时/学年。申报教学名师的普通中小学校人选原则上应具有高级专业技术职务，近6学年主讲课程的平均课堂教学工作量不少于180学时/学年。值得关注的是，现任校级领导均不在申报范围内。</p><p><br/></p><p>据悉，国家将给予“万人计划”教学名师入选者每人50万元支持经费，用于自主选题研究、人才培养和团队建设等，并鼓励地方和用人单位配套给予适当经费支持。教育部门和学校还将组织开展学习宣传推广活动，充分发挥国家“万人计划”教学名师的示范引领和辐射带动作用，提升广大教师教育教学水平和学校办学质量。</p><p><br/></p>',0,'N','2018-04-14 13:32:37',0,1,-1,-1,-1,'2018-04-14 13:32:37',-1,'2018-04-14 13:32:37',-1,'ID',NULL,NULL,NULL);
INSERT INTO `kg_news` (`id`,`typeId`,`sourceId`,`attributeId`,`newsTitle`,`summary`,`thumbnail`,`author`,`content`,`sequence`,`indexshow`,`createDate`,`viewsCount`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (28,7,1,'','上海市教育委员会关于开展第四届上海市幼儿园优秀自制玩教具评选活动的通知','上海市教育委员会关于开展第四届上海市幼儿园优秀自制玩教具评选活动的通知','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\">沪教委基〔2018〕11号</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\">上海市教育委员会关于开展第四届上海市幼儿园优秀自制玩教具评选活动的通知</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">各区教育局：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">根据教育部教育装备研究与发展中心《关于举办2018年“张謇杯”全国幼儿园优秀自制玩教具展评活动的通知》（装备中心〔2017〕85号）要求，主题为“以自制玩教具活动促进幼儿教师专业技能发展”的全国幼儿园优秀自制玩教具展评活动定于2018年举行，届时，本市将组团参加本届评选活动。经研究，我委决定会同市中小学幼儿教师奖励基金会，开展第四届上海市幼儿园优秀自制玩教具评选活动，在此基础上遴选优秀作品参加本届全国幼儿园优秀自制玩教具展评活动。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">本次评选活动的具体组织工作由市教委教育技术装备中心负责。现将《第四届上海市幼儿园优秀自制玩教具评选活动方案》及有关材料（附件1）印发给你们，请各区教育行政部门在广泛发动和逐级评选的基础上，推荐优秀自制玩教具参加全市评选，并于2018年3月12日（星期一）之前，将本区负责该项工作的组织单位及联系方式（附件2）报市教委教育技术装备中心，于2018年4月27日（星期五）前通过市教委教育技术装备中心官网（http://www.shjyzb.edu.sh.cn）提交参评资料。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">联系地址：和田路151号</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">联系人：孙爱青、陈庆</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">联系电话：56988006*8056，传真：56631113</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">E-mail：yeywjj@126.com</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">附件：第四届上海市幼儿园优秀自制玩教具评选活动方案</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">上海市教育委员会</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">2018年2月13日</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">附件</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\">第四届上海市幼儿园优秀自制玩教具评选活动方案</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">为组织实施好第四届上海市幼儿园优秀自制玩教具评选活动，特制定本活动方案。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">一、活动目的</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">进一步贯彻党的十九大关于“办好学前教育”目标要求，落实《国家中长期教育改革和发展规划纲要（2010－2020年）》《国务院关于当前发展学前教育的若干意见》（国发〔2010〕41号）等文件精神，促进幼儿园办园水平提升、教育质量提高，推动幼儿教师专业技能发展。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">二、活动主题</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">以自制玩教具活动促进幼儿教师专业技能发展。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">三、组织领导</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">由市教委基教处、市中小学幼儿教师奖励基金会秘书处、市教委教育技术装备中心组成上海市幼儿园优秀自制玩教具评选活动工作小组，下设专家评选委员会。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">四、评选范围与分类</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）评选范围</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.申报作品须为幼儿园教育教学活动中正在使用，由幼儿园教师自己设计并简单制作，或对工业化产品进行改造的玩教具，还包括运用无须制作能体现教育与游戏功能的自然材料和日常材料。工业化生产的玩教具不在本次评选范围之内。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.属于以下任一条的作品将不被接受参加本届活动：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（1）与国家现行法律、法规、道德规范有抵触的作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（2）涉及食品、药品试剂和饮食安全类的作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（3）造成污染的作品，破坏环境的作品，有害于动植物保护、文物保护的作品，危及人身健康和生命财产安全的作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（4）与GB6675《玩具安全》及相关玩具安全标准（规范、要求）相违背的作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（5）曾获得往届本市幼儿园优秀自制玩教具展评活动一、二、三等奖的作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）申报作品类别</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.科学类（KX）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.益智类（YZ）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">3.建构类（JG）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">4.运动类（YD）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">5.艺术类（YS，包含美工、音乐）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">6.综合类（ZH，包含语言阅读、角色表演、社会等）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">五、申报要求</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）遴选推荐数量</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.以各区为参评单位。每个参评单位可遴选推荐30件作品，每个作品类别限报6件，每件作品只能申报一个作品类别。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.每位作者限报2项作品（含合作的作品）参评。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）参评作品提交材料内容与要求</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.第四届上海市幼儿园优秀自制玩教具展评活动参评作品申报表（附表1）。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.利用参评作品开展游戏活动的案例视频。视频要求采用mp4/mov/avi/rm格式，分辨率不低于720P，包含声音，时间不超过10分钟。视频应注意保护幼儿肖像权。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">3.参评作品照片及电子文件。要求能反映作品全貌及重要细节，照片或图片建议采用6寸大小；照片、图片电子文件采用jpg/png/bmp格式，分辨率不小于300dpi，文件大小不小于1MB。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">4.其他可证明作品水平的资料，如已获奖励、专利等复印件。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（三）参评单位提交材料内容与要求</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.第四届上海幼儿园优秀自制玩教具展评活动参评作品汇总表（附表2）。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.参评单位开展幼儿园自制玩教具活动情况介绍。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（四）申报时间与方式</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.本届展评活动采用网络申报方式。各参评单位可于2018年4月15日--28日登录市教委教育技术装备中心官网提交参评材料。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">网址：http://www.shjyzb.edu.sh.cn</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.网络申报完成后，参评作品作者需将申报材料下载打印（所有纸制材料一式2份，参评作品申报表、案例视频、照片、图片、作品证明资料等电子文档光盘或U盘刻录1套），按要求经所有作者本人签字，所属单位及相关主管部门加盖公章，由各参评单位汇总，于2018年4月27日前快递至市教委教育技术装备中心（请注明：第四届上海市幼儿园优秀自制玩教具评选活动申报材料）。市教委教育技术装备中心不接收幼儿园或个人单独递送的材料。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">六、奖项设立及评选条件</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">本届展评活动设立优秀自制玩教具作品奖、参评单位团体奖、参评单位组织奖等三项评选，评选条件分别如下：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）优秀自制玩教具作品奖</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">从教育性、科学性、创新性、实用性、趣味性、简易性、安全性、特色性、环保性等几个方面进行评价，突出教师根据教学需要创新设计开发玩教具，并利用其开展特色活动，取得良好效果，促进教学质量提升。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">对符合获奖条件的参评作品分别评出一、二和三等奖。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）参评单位团体奖</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">获奖作品按照一等奖5分、二等奖3分、三等奖2分，分别计入各参评单位团体总分。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">团体总分前6名的参评单位获得团体奖。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（三）参评单位组织奖</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">参评单位积极参与本届展评活动，发动面广泛深入，组织程序严谨，遴选推荐公正、公开、规范，上报了本区组织幼儿园开展相关活动情况的书面报告。积极参与终评与展示活动，组织工作认真有序。在本届展评活动中取得较好成绩。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">参评单位优秀组织奖不设等级、不分等级、不限名额。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">七、评选程序</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（一）网络初评</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.专家评选委员会根据本届活动评选范围、评选条件和申报要求，组织专家对申报作品材料进行网络初评。初评按类别遴选出不超过50%作品入围复评，并于复评现场评审出一、二等奖作品。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.初评结果将在市教委教育技术装备中心网站进行公示，公示期为7天。在公示期内，任何单位或个人如对公示的结果持有异议，可以书面形式（电子邮件、邮寄或传真）向工作小组实名提出（如实提供姓名、工作单位、联系电话）。经查实确有弄虚作假者、或不符合参评条件者，将取消其作品参评资格。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">（二）复评与现场演示</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.初评遴选入围的作品需由作者本人携作品参加复评和现场演示。专家评选委员会组织专家根据作品现场演示情况，结合初评结果，确定作品等级。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.入围但因故不能参加复评与现场演示，且未向工作小组说明原因的，视为自动放弃参评资格。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">3.复评与现场演示结束后，专家评选委员会综合专家评选意见，提出获得一、二、三等奖名单，经工作小组批审核通过后公布。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">八、总结表彰</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.向获得优秀自制玩教具作品一、二、三等奖作者颁发荣誉证书。上海市中小学幼儿教师奖励基金会予以奖励。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.向获得参评单位团体奖的单位颁发奖杯。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">3.向获得参评单位组织奖的单位颁发奖牌。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">4.向各区教育局通报展评结果。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">九、知识产权</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第四届上海市幼儿园优秀自制玩教具展评活动工作小组不负责办理专利申请和技术转让事宜。参与此次活动视为作者同意公开所申报资料（包括专利资料），并同意主办单位在期刊、图书、网络等媒体公开、出版、展示。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">十、其他</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1.请各参评单位做好组织发动与遴选推荐工作，并按活动通知要求于2018年3月12日前报送本区活动负责人与联系人。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2.复评及现场演示活动有关事宜另行通知。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">3.组委会将视情况在活动官网展示部分优秀作品并汇编成册出版。</p><p><br/></p>',0,'N','2018-04-14 13:33:09',0,1,-1,-1,-1,'2018-04-14 13:33:09',-1,'2018-04-14 13:33:09',-1,'ID',NULL,NULL,NULL),
 (29,8,1,'12,14','港澳幼教政策法规比较','港澳幼教政策法规比较','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 楷体_GB2312;\">[摘要]香港和澳门虽然都没有独立的学前教育法，但自回归以来，两地特区政府都加强了对学前教育的重视和投入，对学前教育目标、性质、师资等作出了明确的法律或政策规定，为两地学前教育事业发展创设了良好的环境，这对大陆学前教育立法工作不无启示。</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">　香港和澳门是中国的重要组成部分，由于历史的原因，港澳两地曾被割离祖国。港澳回归之后，两地的幼儿教育均有了较好的发展，这与两地幼教政策法规的逐步完善密切相关。本文所谓政策主要指港澳特别行政区政府在一定历史时期为实现其发展当地经济、文化任务而规定的行动依据和准则；所谓法规主要指港澳特别行政区立法机关和行政机关制定的各种规范性文件的总称。比较分析这两地幼教政策法规的内容与特点，可以为我国正在紧张进行中的学前教育立法提供有益的借鉴经验。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\">一、香港的幼教政策与法规</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">在香港，提供学前教育服务的机构有幼儿中心与幼稚园。幼儿中心又分为育婴园和幼儿园两种，其中育婴园为0-2岁的婴儿提供照顾，幼儿园为2—3岁的幼儿提供教育和服务。它们都要到香港卫生福利局辖下的社会福利署注册。幼稚园主要为3—6岁儿童提供学前教育服务。须向教育署注册并接受其管辖。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(一)关于幼教的法规与政策</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">香港没有独立的《幼儿教育法》或《学前教育法》，有关幼儿教育的基本法律条款主要在《教育规例》中。香港法律第279章《教育规例》对学校的建筑设施都规定了健康和安全方面的标准。如通风、照明、防火，对课室的层高、窗高、走道的栏栅、天台操场都有具体的尺码规定或结构要求。第40条规定幼稚园的课室“须使每名学生有不少于0.9平方米的楼面空间”；第46条规定幼稚园“所有膳食及茶点均须按常任秘书长批准的膳食表妥为预备”：第88条规定“任何提供幼稚园教育的学校。一名教员在同一时间内教导学生的人数不得超过30名”。这些法律条款充分考虑了对幼儿健康与安全的保护。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">香港政府在1995年设立了一个工作小组，成员包括教育署及社会福利署的人员，并汇集了幼稚园、幼儿园及学前教育培训机构各资深工作者的意见，把《幼稚园课程指引》及《日间幼儿园活动指引》合并成一册适用于两类学前教育机构的《学前教育课程指引》。这份文件明确指出，广义上的学前教育课程指儿童在园内进行的一切活动，包括全班及分组学习活动、音乐、故事、美劳、游戏、在户外内进行的各种活动、排洗、进食、休息和健康检查等。2000年9月香港政府颁布《香港教育制度改革建议》，香港幼教界也据此进行了相应的改革。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">自2005年新学年起，香港政府进一步规定社会福利署按《幼儿服务条例》管理幼儿中心，教育署按《教育规例》管理幼稚园，从而统一了学前教育管理体制。2006年8月，教育署又颁布了《学前机构办学手册》，以取代现行的《幼儿中心守则》和《幼稚园办学手册》。这份文件从楼宇设计、家具和设备、安全措施、健康、卫生、营养和膳食、课程与活动、教职员、费用及收费、家庭与学前机构、注册与规管等11个方面对学前教育机构的举办做出了更为详细的规定，并注明该手册适用于幼儿中心、幼稚园及所有学前教育机构。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(二)政策法规中关于幼儿教育目标的规定</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2005年6月，教育署颁布了新的《学前教育课程指引(咨询稿)》，对原有的课程指引做了修订，并对香港学前教育的宗旨、学习范畴、目标等作了新的规定。如学前教育的宗旨被确定为：培育幼儿在德、智、体、群、美各方面的全面发展和养成良好生活习惯，为生活做好准备；激发幼儿学习兴趣和培养积极的学习态度，为未来学习奠定基础。学前教育的学习范畴被确定为6个：体能与健康，语文，早期数学，科学与科技，个人与群体，艺术。学前教育的目标由此是实现幼儿身体的发展、幼儿认知和语言的发展、幼儿情意和群性的发展、幼儿美感的发展。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(三)政策法规中关于幼儿教师的规定</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">1995年以前。香港幼儿园教师入职的最低学历为中三(即初中肄业)，幼稚园教师的最低学历为完成中五课程(相当于高中二年级，香港学生在完成中五课程之后就可参加中学会考)，并在香港中学会考中获得不低于两科的E级或E级以上成绩，其中一科必须为中国语文或文学科，可见，对幼儿教师的学历要求十分低，也没有专业训练的要求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">香港回归以后，学前教育得到政府的重视，幼儿教师的入职条件逐渐有所提高。2000年12月，教育署颁布第54/2000号通告，规定从2001年9月起，幼稚园教师必须曾在不多于两次的香港中学会考中获得至少五科不低于E级的成绩，其中两科必须为中国语文或文学科、英国语文或文学科。才算具备最基本的学历要求。此外，教育署还鼓励幼稚园教师修读曲指定高等教育机构开设的专业培训课程以获得“合格幼稚园教师”资格，只有具备这一资格的教师才能申请幼稚园校长的职位。2002年6月，教育署颁布第27/2002号通告，进一步提高了幼稚园校长与教师的入职资格。这份文件规定，从当年9月起，所有新入职的幼稚园校长的最低学历由“合格幼稚园教师”资格提升至“幼稚园教育证书”水平。并且所有在职校长必须在2006年7月以前获得“幼稚园教育证书”或同等学历。在教师资格方面，这份通告规定，从2003年9月起，所有新人职的幼稚园教师均须在入职以前具备“合格幼稚园教师”资格，并且从2004年9月起，各幼稚园必须在规定的教学人员编制内(以1:15的师生比计算)全部聘用合格幼稚园教师。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">与此同时，为了满足香港众多在职幼儿教师提升学历的需要，政府为教师提供了很多学习机会。教师只要在政府指定的高等教育机构修读一些专业培训课程，就可获得“合格幼稚园教师”资格(幼儿中心则为“合格幼儿工作员”资格)。在此基础上，2006年初，一些商等教育机构又开设了三年制在职“幼稚园教育证书”课程教育，让“合格幼稚园教师”可以通过此种培训进一步提升自身的专业资格。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\">二、澳门的幼教政策与法规</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">根据澳门政府1991年颁布的《澳门教育制度》，学前教育包括幼儿教育和小学教育预备班两部分。幼儿教育的对象是3—4岁儿童，年满5岁的儿童可进入小学教育预备班，两种教学都在幼稚园进行，由幼稚园教师负责。澳门的幼稚园可分公立和私立两类，教学语言有葡语、华语及英语等，所有幼稚园都由教育署辖下的学前暨小学教育处负责指导并协调运作。长期以来，澳门的学前教育属于自愿性质，但政府给予办学机构一定的资助，并对清贫学生提供援助。以保证所有幼儿都能受到教育。2006年后，幼儿教育成为免费教育。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(一)关于幼教的法规与政策</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">与香港一样，澳门也没有独立的《幼儿教育法》或《学前教育法》，有关幼儿教育的法律条文均分布 在其他法令中。1991年8月16日颁布实施的澳门第11/91，M号法律即《澳门教育制度》是澳门教育的基本法律。更是澳门教育制度的总纲。它规定了幼儿教育和小学预备班的教育目标、教育对象和幼儿教师的入职条件，明确了教师职前培训、在职培训、延缓培训的宗旨和基本要求，明文强调“幼儿教育对晋升方面，无须进行知识的评核。”另外，对学前教育机构的性质界定作了明确说明，并对私立教育机构的基本条件作了详细规定。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">为了统一各幼稚园的教学内容。澳门政府于1994年7月颁布了澳门第38/94/M号法令《幼儿教育、小学教育预备班及小学教育课程组织之指导性框架》，规定了小学教育预备班课程计划系幼儿教育之延续，为升读小学教育作准备，并建议从小学教育预备班开始，以游戏方式教授第二语言，但以不影响发展其所用教学语言之交流能力为限，还专门设立了专家组，制定各级及各学习范畴的教学大纲和活动内容。课程计划制定后，1995年至1996年间在公立幼稚园试行。经评核后于1997年、1998年度在全澳门推行。同时在1999年7月将教学大纲推介至私立幼稚园。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">2006年，澳门政府颁布了《非高等教育制度纲要法》。该法规定，免费教育由原来10年正规教育拓展为15年，即包括幼儿教育、小学教育、初中教育和高中教育。由此，澳门的免费教育制度延伸至幼儿教育，而且免费范围由“学费”拓展到“补充服务费以及与报名、就读、证书等有关的其它费用”，由“倾向性免费教育”向全面免费教育过渡。为此。澳门政府行政会讨论通过了《教育发展基金制度》，并修改了《免费教育津贴制度》。根据新规定，居住在澳门的特区居民，加入免费教育系统的学生，均为免费教育津贴受益人。自2007至2008学年起，幼儿教育阶段津贴由每班37.02万元调升至40万元。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(二)政策法规中关于幼儿教育目标的规定</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">《澳门教育制度》第五条规定，澳门幼儿教育的目标为：协助家庭教育子女：促进儿童体能与智力的发展，以及情绪情感的平衡；致力发展母语的运用能力，特别在理解及口语表达方面；致力于儿童的伦理观念、兴趣与创造力的发展；使儿童养成个人和集体的卫生与保健习惯：给予儿童接触社会日常不同生活经验的条件；留意幼儿是否有不适应或弱智、弱能的情况，并给予儿童适合的指导。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">《澳门教育制度》第七条规定，小学教育预备班的目标如下：继续幼儿教育的目标；提供文字及数字方面的基本知识；发展就读所使用的教学语言的能力。以使儿童能顺利地接受正规的小学教育。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">(三)政策法规中关于幼儿教师的规定</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">20世纪50年代初期，澳门初中毕业生通过两年的职前幼师课程，就能做幼稚园教师。</p><p><br/></p>',0,'N','2018-04-14 13:38:25',0,2,-1,-1,-1,'2018-04-14 13:38:25',-1,'2018-04-19 13:59:08',-1,'ID',NULL,NULL,NULL),
 (30,8,1,'12,14','国办印发《全面加强和改进学校美育工作的意见》','国办印发《全面加强和改进学校美育工作的意见》','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">近日，国务院办公厅印发《关于全面加强和改进学校美育工作的意见》，从课程体系构建、教育教学改革、社会美育资源的统筹等方面，对美育工作提出了明确要求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">《意见》为未来5年美育工作的发展画出了路线图：到2018年，取得突破性进展，美育资源配置逐步优化，管理机制进一步完善，各级各类学校开齐开足美育课程；到2020年，初步形成大中小幼美育相互衔接、课堂教学和课外活动相互结合、普及教育与专业教育相互促进、学校美育和社会家庭美育相互联系的具有中国特色的现代化美育体系。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">在课程体系方面，《意见》对各个阶段的美育工作作出明确规定。其中，义务教育阶段学校在开设音乐、美术课程的基础上，有条件的要增设舞蹈、戏剧、戏曲等地方课程；普通高中在开设音乐、美术课程的基础上，要创造条件开设舞蹈、戏剧、戏曲、影视等教学模块。同时，《意见》要求将美育实践活动纳入教学计划，实施课程化管理。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">在教育教学改革方面，《意见》要求建立美育网络资源共享平台。要以国家实施“宽带中国”战略为契机，加强美育网络资源建设，加快推进边远贫困地区小学教学点数字教育资源全覆盖；支持和辅导教师用好多媒体远程教学设备，将优质美育资源输送到偏远农村学校。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">师资是做好美育工作的关键。为此，《意见》要求整合各方面力量充实教育力量。各地要制定时间表、采取有效措施破解中小学美育教师紧缺问题，建立农村中小学美育教师补充机制，重点补充农村、边远、贫困和民族地区乡（镇）中小学的美育教师。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">在美育工作的评价制度方面，《意见》要求，实施中小学美育工作自评制度，学校每学年要进行一次美育工作自评，自评工作实行校长负责制，纳入校长考核内容。同时，中小学美育课程开课率列入教育现代化进程监测评价指标体系，各地要将其作为对学校评价、考核的重要指标。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">　<strong style=\"margin: 0px; padding: 0px;\">　详见附录：</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><br style=\"margin: 0px; padding: 0px;\"/><span style=\"margin: 0px; padding: 0px; font-family: 楷体_GB2312;\"><strong style=\"margin: 0px; padding: 0px;\">国务院办公厅关于全面加强和改进学校美育工作的意见</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\"><span style=\"margin: 0px; padding: 0px; font-family: 楷体_GB2312;\">国办发〔2015〕71号</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal;\"><br style=\"margin: 0px; padding: 0px;\"/><span style=\"margin: 0px; padding: 0px; font-family: 楷体_GB2312;\">各省、自治区、直辖市人民政府，国务院各部委、各直属机构：<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>美育是审美教育，也是情操教育和心灵教育，不仅能提升人的审美素养，还能潜移默化地影响人的情感、趣味、气质、胸襟，激励人的精神，温润人的心灵。美育与德育、智育、体育相辅相成、相互促进。党的十八届三中全会对全面改进美育教学作出重要部署，国务院对加强学校美育提出明确要求。近年来，经过各地、各有关部门的共同努力，学校美育取得了较大进展，对提高学生审美与人文素养、促进学生全面发展发挥了重要作用。但总体上看，美育仍是整个教育事业中的薄弱环节，主要表现在一些地方和学校对美育育人功能认识不到位，重应试轻素养、重少数轻全体、重比赛轻普及，应付、挤占、停上美育课的现象仍然存在；资源配置不达标，师资队伍仍然缺额较大，缺乏统筹整合的协同推进机制。为进一步强化美育育人功能，推进学校美育改革发展，经国务院同意，现提出以下意见。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/><strong style=\"margin: 0px; padding: 0px;\">一、总体要求<br style=\"margin: 0px; padding: 0px;\"/></strong><br style=\"margin: 0px; padding: 0px;\"/>（一）指导思想。全面贯彻党的教育方针，以立德树人为根本任务，落实文艺工作座谈会精神，按照国家中长期教育改革和发展规划纲要（2010－2020年）要求，把培育和践行社会主义核心价值观融入学校美育全过程，根植中华优秀传统文化深厚土壤，汲取人类文明优秀成果，引领学生树立正确的审美观念、陶冶高尚的道德情操、培育深厚的民族情感、激发想象力和创新意识、拥有开阔的眼光和宽广的胸怀，培养造就德智体美全面发展的社会主义建设者和接班人。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>（二）基本原则。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>坚持育人为本，面向全体。遵循美育特点和学生成长规律，以美育人、以文化人，在整体推进各级各类学校美育发展的基础上，重点解决基础教育阶段美育存在的突出问题，缩小城乡差距和校际差距，让每个学生都享有接受美育的机会。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>坚持因地制宜，分类指导。以问题为导向，充分考虑地区差异，重点关注农村、边远、贫困和民族地区美育教学条件的改善，加强分类指导，因地因校制宜，鼓励特色发展，坚持整体推进与典型引领相结合，形成“一校一品”、“一校多品”局面。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>坚持改革创新，协同推进。加强美育综合改革，统筹学校美育发展，促进德智体美有机融合。整合各类美育资源，促进学校与社会互动互联，齐抓共管、开放合作，形成全社会关心支持美育发展和学生全面成长的氛围。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>（三）总体目标。2015年起全面加强和改进学校美育工作。到2018年，取得突破性进展，美育资源配置逐步优化，管理机制进一步完善，各级各类学校开齐开足美育课程。到2020年，初步形成大中小幼美育相互衔接、课堂教学和课外活动相互结合、普及教育与专业教育相互促进、学校美育和社会家庭美育相互联系的具有中国特色的现代化美育体系。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/><strong style=\"margin: 0px; padding: 0px;\">二、构建科学的美育课程体系<br style=\"margin: 0px; padding: 0px;\"/></strong><br style=\"margin: 0px; padding: 0px;\"/>（四）科学定位美育课程目标。学校美育课程建设要以艺术课程为主体，各学科相互渗透融合，重视美育基础知识学习，增强课程综合性，加强实践活动环节。要以审美和人文素养培养为核心，以创新能力培育为重点，科学定位各级各类学校美育课程目标。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>幼儿园美育要遵循幼儿身心发展规律，通过开展丰富多样的活动，培养幼儿拥有美好、善良的心灵，懂得珍惜美好事物，能用自己的方式去表现美、创造美，使幼儿快乐生活、健康成长。义务教育阶段学校美育课程要注重激发学生艺术兴趣，传授必备的基础知识与技能，发展艺术想象力和创新意识，帮助学生形成一两项艺术特长和爱好，培养学生健康向上的审美趣味、审美格调、审美理想。普通高中美育课程要满足学生不同艺术爱好和特长发展的需要，体现课程的多样性和可选择性，丰富学生的审美体验，开阔学生的人文视野。特殊教育学校美育课程要根据学生身心发展水平和特点，培养学生的兴趣和特长，注重潜能发展，将艺术技能与职业技能培养有机结合，为学生融入社会、创业就业和健康快乐生活奠定基础。职业院校美育课程要强化艺术实践，注重与专业课程的有机结合，培养具有审美修养的高素质技术技能人才。普通高校美育课程要依托本校相关学科优势和当地教育资源优势，拓展教育教学内容和形式，引导学生完善人格修养，强化学生的文化主体意识和文化创新意识，增强学生传承弘扬中华优秀文化艺术的责任感和使命感。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>（五）开设丰富优质的美育课程。学校美育课程主要包括音乐、美术、舞蹈、戏剧、戏曲、影视等。各级各类学校要按照课程设置方案和课程标准、教学指导纲要，逐步开齐开足上好美育课程。义务教育阶段学校在开设音乐、美术课程的基础上，有条件的要增设舞蹈、戏剧、戏曲等地方课程。普通高中在开设音乐、美术课程的基础上，要创造条件开设舞蹈、戏剧、戏曲、影视等教学模块。职业院校要在开好与基础教育相衔接的美育课程的同时，积极探索开好体现职业教育专业和学生特点的拓展课程。普通高校要在开设以艺术鉴赏为主的限定性选修课程基础上，开设艺术实践类、艺术史论类、艺术批评类等方面的任意性选修课程。各级各类学校要重视和加强艺术经典教育，根据自身优势和特点，开发具有民族、地域特色的地方和校本美育课程。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>（六）实施美育实践活动的课程化管理。美育实践活动是学校美育课程的重要组成部分，要纳入教学计划，实施课程化管理。建立学生课外活动记录制度，学生参与社区乡村文化艺术活动、学习优秀民族民间艺术、欣赏高雅文艺演出、参观美术展览等情况与表现要作为中小学生艺术素质测评内容。各级各类学校要贴近校园生活，根据学生认知水平和心理特点，积极探索创造具有时代特征、校园特色和学生特点的美育活动形式。要以戏曲、书法、篆刻、剪纸等中华优秀传统文化艺术为重点，形成本地本校的特色和传统。中小学校应以班级为基础，开展合唱、校园集体舞、儿童歌舞剧等群体性活动。任何学校和教师不得组织学生参加以营利为目的的艺术竞赛活动，严禁任何部门和中小学校组织学生参与商业性艺术活动或商业性庆典活动。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/><strong style=\"margin: 0px; padding: 0px;\">三、大力改进美育教育教学<br style=\"margin: 0px; padding: 0px;\"/></strong><br style=\"margin: 0px; padding: 0px;\"/>（七）深化学校美育教学改革。建立以提高学校美育教育教学质量为导向的管理制度和工作机制。按照国家规定的不同学段美育课程设置方案、课程标准以及内容要求，切实强化美育育人目标，根据社会文化发展新变化及时更新教学内容。开发利用当地的民族民间美育资源，搭建开放的美育平台，拓展教育空间。开展多种形式的国际交流与合作，各级各类学校应根据自身条件和特点积极参与中外人文交流。依托现有资源，加强学校美育实践基地建设，取得一批美育综合改革的重要成果，发挥辐射带动作用，推动学校美育的整体发展。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>（八）加强美育的渗透与融合。将美育贯穿在学校教育的全过程各方面，渗透在各个学科之中。加强美育与德育、智育、体育相融合，与各学科教学和社会实践活动相结合。挖掘不同学科所蕴涵的丰富美育资源，充分发挥语文、历史等人文学科的美育功能，深入挖掘数学、物理等自然学科中的美育价值。大</span></p><p><br/></p>',0,'N','2018-04-14 13:38:56',0,2,-1,-1,-1,'2018-04-14 13:38:56',-1,'2018-04-19 13:58:39',-1,'ID',NULL,NULL,NULL),
 (31,8,1,'','幼儿园工作规程','幼儿园工作规程','',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">中华人民共和国教育部令第39号</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">《幼儿园工作规程》已经2015年12月14日第48次部长办公会议审议通过，现予公布，自2016年3月1日起施行。　　　　　　　　　　</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">教育部部长</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">2016年1月5日</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\">幼儿园工作规程</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\">第一章　总则</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第一条　为了加强幼儿园的科学管理，规范办园行为，提高保育和教育质量，促进幼儿身心健康，依据《中华人民共和国教育法》等法律法规，制定本规程。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第二条　幼儿园是对3周岁以上学龄前幼儿实施保育和教育的机构。幼儿园教育是基础教育的重要组成部分，是学校教育制度的基础阶段。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第三条　幼儿园的任务是：贯彻国家的教育方针，按照保育与教育相结合的原则，遵循幼儿身心发展特点和规律，实施德、智、体、美等方面全面发展的教育，促进幼儿身心和谐发展。</p><p><br/></p>',0,'N','2018-04-14 13:39:37',0,1,-1,-1,-1,'2018-04-14 13:39:37',-1,'2018-04-14 13:39:37',-1,'ID',NULL,NULL,NULL),
 (32,8,1,'16','幼儿园工作1','幼儿园工作1','/resources/upload/news/20180504225835_390_285.jpg',NULL,'<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">中华人民共和国教育部令第39号</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">《幼儿园工作规程》已经2015年12月14日第48次部长办公会议审议通过，现予公布，自2016年3月1日起施行。　　　　　　　　　　</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">教育部部长</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: right;\">2016年1月5日</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; white-space: normal; text-align: center;\"><strong style=\"margin: 0px; padding: 0px;\">幼儿园工作规程</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\">第一章　总则</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第一条　为了加强幼儿园的科学管理，规范办园行为，提高保育和教育质量，促进幼儿身心健康，依据《中华人民共和国教育法》等法律法规，制定本规程。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第二条　幼儿园是对3周岁以上学龄前幼儿实施保育和教育的机构。幼儿园教育是基础教育的重要组成部分，是学校教育制度的基础阶段。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; text-indent: 2em; word-wrap: break-word; line-height: 2em; color: rgb(49, 49, 49); font-family: 宋体, simsun, Tahoma, Verdana, Arial; text-align: justify; white-space: normal;\">第三条　幼儿园的任务是：贯彻国家的教育方针，按照保育与教育相结合的原则，遵循幼儿身心发展特点和规律，实施德、智、体、美等方面全面发展的教育，促进幼儿身心和谐发展。</p><p><br/></p>',0,'Y','2018-04-14 13:39:53',0,5,-1,-1,-1,'2018-04-14 13:39:53',-1,'2018-05-22 20:16:49',-1,'ID',NULL,NULL,NULL);
INSERT INTO `kg_news` (`id`,`typeId`,`sourceId`,`attributeId`,`newsTitle`,`summary`,`thumbnail`,`author`,`content`,`sequence`,`indexshow`,`createDate`,`viewsCount`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (33,8,1,'','幼儿园工作2','幼儿园工作2','/resources/upload/news/20180504225533_390_285.jpg',NULL,'<p>幼儿园工作2</p>',0,'Y','2018-04-14 13:40:31',0,5,-1,-1,-1,'2018-04-14 13:40:31',-1,'2018-05-04 22:58:28',-1,'ID',NULL,NULL,NULL),
 (34,7,1,'12,14,15','幼儿园工作3','幼儿园工作3','/resources/upload/news/20180504225524_390_285.jpg',NULL,'<p>幼儿园工作2</p>',2,'Y','2018-04-14 13:40:46',0,13,-1,-1,-1,'2018-04-14 13:40:46',-1,'2018-05-12 13:56:52',-1,'ID',NULL,NULL,NULL),
 (35,7,1,'','123','123','',NULL,'<p>123</p>',0,'N','2018-05-22 20:45:49',0,1,-1,-1,-1,'2018-05-22 20:45:49',-1,'2018-05-22 20:45:49',-1,'ID',NULL,NULL,NULL),
 (36,7,1,'','123','123','',NULL,'<p>123</p>',0,'N','2018-05-22 20:49:14',0,1,-1,-1,-1,'2018-05-22 20:49:14',-1,'2018-05-22 20:49:14',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_news` ENABLE KEYS */;


--
-- Definition of table `kg_newsattribute`
--

DROP TABLE IF EXISTS `kg_newsattribute`;
CREATE TABLE `kg_newsattribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attributeName` varchar(45) NOT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_newsattribute`
--

/*!40000 ALTER TABLE `kg_newsattribute` DISABLE KEYS */;
INSERT INTO `kg_newsattribute` (`id`,`attributeName`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (12,'头条',1,-1,-1,-1,'2018-04-10 14:24:28',-1,'2018-04-10 14:24:28',-1,'ID',NULL,NULL,NULL),
 (14,'推荐',1,-1,-1,-1,'2018-04-10 14:24:58',-1,'2018-04-10 14:24:58',-1,'ID',NULL,NULL,NULL),
 (15,'热点',1,-1,-1,-1,'2018-04-15 22:19:59',-1,'2018-04-15 22:19:59',-1,'ID',NULL,NULL,NULL),
 (16,'咨讯中心重点',2,-1,-1,-1,'2018-05-22 15:56:23',-1,'2018-05-22 20:11:09',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_newsattribute` ENABLE KEYS */;


--
-- Definition of table `kg_newssource`
--

DROP TABLE IF EXISTS `kg_newssource`;
CREATE TABLE `kg_newssource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_newssource`
--

/*!40000 ALTER TABLE `kg_newssource` DISABLE KEYS */;
INSERT INTO `kg_newssource` (`id`,`sourceName`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'无',1,-1,-1,-1,'2018-04-10 14:09:01',-1,'2018-04-10 14:09:01',-1,'ID',NULL,NULL,NULL),
 (13,'网络',3,-1,-1,-1,'2018-04-10 14:09:06',-1,'2018-04-10 14:11:21',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_newssource` ENABLE KEYS */;


--
-- Definition of table `kg_newstype`
--

DROP TABLE IF EXISTS `kg_newstype`;
CREATE TABLE `kg_newstype` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_newstype`
--

/*!40000 ALTER TABLE `kg_newstype` DISABLE KEYS */;
INSERT INTO `kg_newstype` (`id`,`typeName`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (7,'公告通知',1,-1,-1,-1,'2018-04-10 10:10:56',-1,'2018-04-10 10:10:56',-1,'ID',NULL,NULL,NULL),
 (8,'政策法规',1,-1,-1,-1,'2018-04-10 10:11:05',-1,'2018-04-10 10:11:05',-1,'ID',NULL,NULL,NULL),
 (9,'培训通知',1,-1,-1,-1,'2018-04-10 10:11:12',-1,'2018-04-10 10:11:12',-1,'ID',NULL,NULL,NULL),
 (10,'协会动态',1,-1,-1,-1,'2018-04-10 10:11:54',-1,'2018-04-10 10:11:54',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_newstype` ENABLE KEYS */;


--
-- Definition of table `kg_question_answer`
--

DROP TABLE IF EXISTS `kg_question_answer`;
CREATE TABLE `kg_question_answer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qid` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `checkCurr` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_question_answer`
--

/*!40000 ALTER TABLE `kg_question_answer` DISABLE KEYS */;
INSERT INTO `kg_question_answer` (`id`,`qid`,`name`,`value`,`checkCurr`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (68,41,'q1_1','选项1',0,1,-1,-1,-1,'2018-05-24 16:22:44',-1,'2018-05-24 16:22:44',-1,'ID',NULL,NULL,NULL),
 (69,41,'q1_1','选项2',0,1,-1,-1,-1,'2018-05-24 16:22:44',-1,'2018-05-24 16:22:44',-1,'ID',NULL,NULL,NULL),
 (70,42,'q1_1','选项1',0,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (71,42,'q1_1','选项2',0,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (72,43,'q2_2','选项1',0,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (73,43,'q2_2','选项2',0,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (74,44,NULL,NULL,NULL,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (75,45,NULL,NULL,NULL,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL),
 (76,46,NULL,NULL,NULL,1,-1,-1,-1,'2018-05-24 16:31:36',-1,'2018-05-24 16:31:36',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_question_answer` ENABLE KEYS */;


--
-- Definition of table `kg_questionmainitem`
--

DROP TABLE IF EXISTS `kg_questionmainitem`;
CREATE TABLE `kg_questionmainitem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `Q_ITEMS_TITLE` varchar(200) NOT NULL,
  `analysis` varchar(200) DEFAULT NULL,
  `ITEM_TYPE` varchar(200) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_questionmainitem`
--

/*!40000 ALTER TABLE `kg_questionmainitem` DISABLE KEYS */;
INSERT INTO `kg_questionmainitem` (`id`,`sid`,`Q_ITEMS_TITLE`,`analysis`,`ITEM_TYPE`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (41,14,'<span style=\"font-size:16px;\">单选题目标题</span>','','1',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (42,15,'<span style=\"font-size:16px;\">单选题目标题</span>','','1',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (43,15,'<span style=\"font-size:16px;\">多选题目标题</span>','','2',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (44,15,'<span style=\"font-size:16px;\">填空题目标题</span>','','5',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (45,15,'<span style=\"font-size:16px;\">填空题目标题</span>','','5',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (46,15,'<span style=\"font-size:16px;\">填空题目标题</span>','','5',NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_questionmainitem` ENABLE KEYS */;


--
-- Definition of table `kg_questionsurvey`
--

DROP TABLE IF EXISTS `kg_questionsurvey`;
CREATE TABLE `kg_questionsurvey` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(200) NOT NULL,
  `survey_desc` varchar(200) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_questionsurvey`
--

/*!40000 ALTER TABLE `kg_questionsurvey` DISABLE KEYS */;
INSERT INTO `kg_questionsurvey` (`id`,`survey_name`,`survey_desc`,`flag`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (14,'<span style=\"font-size:18px;\">请编辑问卷调查题目</span>','<span style=\"font-size:16px;\">请编辑问卷调查简介</span>',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL),
 (15,'<span style=\"font-size:18px;\">请编辑问卷调查题目</span>','<span style=\"font-size:16px;\">请编辑问卷调查简介</span>',NULL,NULL,-1,-1,NULL,NULL,NULL,NULL,NULL,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_questionsurvey` ENABLE KEYS */;


--
-- Definition of table `kg_user_q_answer`
--

DROP TABLE IF EXISTS `kg_user_q_answer`;
CREATE TABLE `kg_user_q_answer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `aid` bigint(20) NOT NULL,
  `checkCurr` tinyint(1) DEFAULT NULL,
  `content` text,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kg_user_q_answer`
--

/*!40000 ALTER TABLE `kg_user_q_answer` DISABLE KEYS */;
INSERT INTO `kg_user_q_answer` (`id`,`sid`,`ip`,`aid`,`checkCurr`,`content`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (30,14,'0:0:0:0:0:0:0:1',69,1,NULL,1,-1,-1,-1,'2018-05-24 16:22:54',-1,'2018-05-24 16:22:54',-1,'ID',NULL,NULL,NULL),
 (31,15,'0:0:0:0:0:0:0:1',70,1,NULL,1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL),
 (32,15,'0:0:0:0:0:0:0:1',72,1,NULL,1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL),
 (33,15,'0:0:0:0:0:0:0:1',73,1,NULL,1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL),
 (34,15,'0:0:0:0:0:0:0:1',74,NULL,'123',1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL),
 (35,15,'0:0:0:0:0:0:0:1',75,NULL,'123',1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL),
 (36,15,'0:0:0:0:0:0:0:1',76,NULL,'123',1,-1,-1,-1,'2018-05-25 09:32:06',-1,'2018-05-25 09:32:06',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kg_user_q_answer` ENABLE KEYS */;


--
-- Definition of table `kt_demo`
--

DROP TABLE IF EXISTS `kt_demo`;
CREATE TABLE `kt_demo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
-- Dumping data for table `kt_demo`
--

/*!40000 ALTER TABLE `kt_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `kt_demo` ENABLE KEYS */;


--
-- Definition of table `kt_link`
--

DROP TABLE IF EXISTS `kt_link`;
CREATE TABLE `kt_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(45) NOT NULL,
  `link_url` varchar(200) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kt_link`
--

/*!40000 ALTER TABLE `kt_link` DISABLE KEYS */;
INSERT INTO `kt_link` (`id`,`link_name`,`link_url`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'1','2',1,-1,-1,-1,'2018-03-21 14:49:50',-1,'2018-03-21 14:49:51',-1,'ID',NULL,NULL,NULL),
 (2,'111','222',1,-1,-1,-1,'2018-03-21 14:49:50',-1,'2018-03-21 14:49:51',-1,'ID',NULL,NULL,NULL),
 (3,'111','222',1,-1,-1,-1,'2018-03-21 14:49:50',-1,'2018-03-21 14:49:51',-1,'ID',NULL,NULL,NULL),
 (4,'111','222',1,-1,-1,-1,'2018-03-21 14:49:50',-1,'2018-03-21 14:49:51',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `kt_link` ENABLE KEYS */;


--
-- Definition of table `sys_func`
--

DROP TABLE IF EXISTS `sys_func`;
CREATE TABLE `sys_func` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `func_name` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_func`
--

/*!40000 ALTER TABLE `sys_func` DISABLE KEYS */;
INSERT INTO `sys_func` (`id`,`func_name`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (1,'协会简介',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (2,'任务类别',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (3,'评估任务',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (4,'评估任务进度',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (5,'文档下载',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (6,'资讯中心',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (7,'咨询类别',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (8,'来源配置',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (9,'相关链接',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (10,'系统配置',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (11,'属性配置',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (12,'用户',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (13,'角色',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (14,'轮播图',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (15,'联系我们',1,-1,-1,-1,'2018-05-12 18:36:13',-1,'2018-05-12 18:36:13',-1,'ID',NULL,NULL,NULL),
 (16,'调查问卷',1,-1,-1,-1,'2018-05-22 15:00:23',-1,'2018-05-22 15:00:23',-1,'ID',NULL,NULL,NULL),
 (17,'专家审核',1,-1,-1,-1,'2018-05-22 15:00:23',-1,'2018-05-22 15:00:23',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_func` ENABLE KEYS */;


--
-- Definition of table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(150) NOT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
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
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SYS_ROLE_B_U1` (`ROLE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`ROLE_ID`,`ROLE_CODE`,`ROLE_NAME`,`ROLE_DESCRIPTION`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (10003,'admin','后台管理员1','后台管理员1',9,-1,-1,-1,'2018-04-11 11:19:09',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10004,'wd','园长','园长',2,-1,-1,-1,'2018-04-12 10:45:44',-1,'2018-04-15 22:17:55',-1,'ID',NULL,NULL,NULL),
 (10006,'zj','专家','专家',2,-1,-1,-1,'2018-04-15 22:18:05',-1,'2018-05-22 15:09:08',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


--
-- Definition of table `sys_role_func`
--

DROP TABLE IF EXISTS `sys_role_func`;
CREATE TABLE `sys_role_func` (
  `RF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FUNC_ID` bigint(20) DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
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
  PRIMARY KEY (`RF_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`ROLE_ID`,`FUNC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10099 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_role_func`
--

/*!40000 ALTER TABLE `sys_role_func` DISABLE KEYS */;
INSERT INTO `sys_role_func` (`RF_ID`,`FUNC_ID`,`ROLE_ID`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (10081,1,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10082,2,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10083,3,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10084,4,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10085,5,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10086,6,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10087,7,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10088,8,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10089,9,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10090,10,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10091,11,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10092,12,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10093,13,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10094,14,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10095,15,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10096,16,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10097,17,10003,1,-1,-1,-1,'2018-05-22 15:04:57',-1,'2018-05-22 15:04:57',-1,'ID',NULL,NULL,NULL),
 (10098,17,10006,1,-1,-1,-1,'2018-05-22 15:09:08',-1,'2018-05-22 15:09:08',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role_func` ENABLE KEYS */;


--
-- Definition of table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(30) DEFAULT NULL COMMENT '用户类型',
  `USER_NAME` varchar(40) NOT NULL COMMENT '用户名',
  `REAL_NAME` varchar(40) NOT NULL,
  `PASSWORD_ENCRYPTED` varchar(80) DEFAULT NULL COMMENT '加密过的密码',
  `EMAIL` varchar(150) DEFAULT NULL COMMENT '邮箱地址',
  `PHONE` varchar(40) DEFAULT NULL COMMENT '电话号码',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期从',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期至',
  `STATUS` varchar(30) DEFAULT NULL COMMENT '状态',
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
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_U1` (`USER_NAME`),
  KEY `SYS_USER_N1` (`STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=10034 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`USER_ID`,`USER_TYPE`,`USER_NAME`,`REAL_NAME`,`PASSWORD_ENCRYPTED`,`EMAIL`,`PHONE`,`START_ACTIVE_DATE`,`END_ACTIVE_DATE`,`STATUS`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (10013,NULL,'admin','123','202cb962ac59075b964b07152d234b70','123','123',NULL,NULL,NULL,6,-1,-1,-1,'2018-04-11 14:16:39',-1,'2018-05-19 19:25:38',-1,'ID',NULL,NULL,NULL),
 (10014,NULL,'teacher','123','202cb962ac59075b964b07152d234b70','','',NULL,NULL,NULL,21,-1,-1,-1,'2018-04-12 13:38:12',-1,'2018-05-12 20:08:50',-1,'ID',NULL,NULL,NULL),
 (10032,NULL,'expert','','202cb962ac59075b964b07152d234b70','','',NULL,NULL,NULL,1,-1,-1,-1,'2018-04-13 14:32:16',-1,'2018-04-13 14:32:16',-1,'ID',NULL,NULL,NULL),
 (10033,NULL,'teacher2','laoshier','202cb962ac59075b964b07152d234b70','','',NULL,NULL,NULL,3,-1,-1,-1,'2018-05-12 14:50:07',-1,'2018-05-12 14:52:16',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


--
-- Definition of table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
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
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10024 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`SUR_ID`,`USER_ID`,`ROLE_ID`,`OBJECT_VERSION_NUMBER`,`REQUEST_ID`,`PROGRAM_ID`,`CREATED_BY`,`CREATION_DATE`,`LAST_UPDATED_BY`,`LAST_UPDATE_DATE`,`LAST_UPDATE_LOGIN`,`CERTIFICATE_TYPE`,`EFFECTIVE_START_DATE`,`EFFECTIVE_END_DATE`,`ATTRIBUTE_CATEGORY`) VALUES 
 (10001,10013,10003,1,-1,-1,-1,'2018-05-11 21:36:00',-1,'2018-05-11 21:36:00',-1,'ID',NULL,NULL,NULL),
 (10017,10033,10004,1,-1,-1,-1,'2018-05-12 14:52:16',-1,'2018-05-12 14:52:16',-1,'ID',NULL,NULL,NULL),
 (10023,10014,10004,1,-1,-1,-1,'2018-05-12 20:08:50',-1,'2018-05-12 20:08:50',-1,'ID',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
