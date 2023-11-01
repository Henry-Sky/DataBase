-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Current Database: `library`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `library`;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Books` (
  `BID` char(10) NOT NULL COMMENT '图书编号',
  `ISBN` char(13) NOT NULL COMMENT 'ISBN号',
  `BTID` char(4) NOT NULL COMMENT '类型',
  `Bname` char(30) NOT NULL COMMENT '书名',
  `Author` char(20) DEFAULT NULL COMMENT '作者',
  `Publisher` char(30) DEFAULT NULL COMMENT '出版社',
  `price` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`BID`),
  KEY `BTID` (`BTID`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`BTID`) REFERENCES `BooksType` (`BTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES ('J05491','9787560533503','J01','计算机操作系统（（第四版）','汤小丹','西安电子科技大学出版社',39),('J23900','9787302400707','J01','Oracle数据库教程','赵明渊','清华大学出版社',49),('N87888','9787532742929','N01','挪威的森林','村上春树','上海译文出版社',23),('N90001','978722931657','N02','中国八零后调查','段东涛','重庆出版社',25),('Z10005','9787302363279','S01','在陌生人世界的思考','刘伟','清华大学出版社',58),('Z10047','9787313153241','S01','偏爱学问','俞可平','上海交通大学出版社',38),('Z10084','9787305052798','S01','字里行间','余斌','南京大学出版社',20);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BooksType`
--

DROP TABLE IF EXISTS `BooksType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BooksType` (
  `BTID` char(4) NOT NULL COMMENT '类型编号',
  `BTname` char(20) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`BTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BooksType`
--

LOCK TABLES `BooksType` WRITE;
/*!40000 ALTER TABLE `BooksType` DISABLE KEYS */;
INSERT INTO `BooksType` VALUES ('J01','计算机丛书'),('N01','小说'),('N02','纪实'),('S01','社会科学类'),('W05','外文期刊');
/*!40000 ALTER TABLE `BooksType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrow`
--

DROP TABLE IF EXISTS `Borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrow` (
  `RID` char(10) NOT NULL COMMENT '读者编号',
  `BID` char(10) NOT NULL COMMENT '图书编号',
  `Borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `Due_date` datetime NOT NULL COMMENT '到期日期',
  `Return_date` datetime DEFAULT NULL COMMENT '实际归还日期',
  PRIMARY KEY (`RID`,`BID`,`Borrow_date`),
  KEY `BID` (`BID`),
  CONSTRAINT `Borrow_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `Readers` (`RID`),
  CONSTRAINT `Borrow_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `Books` (`BID`),
  CONSTRAINT `Borrow_chk_1` CHECK (((`Due_date` > `Borrow_date`) and (`Return_date` > `Borrow_date`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrow`
--

LOCK TABLES `Borrow` WRITE;
/*!40000 ALTER TABLE `Borrow` DISABLE KEYS */;
INSERT INTO `Borrow` VALUES ('S1905	','Z10047	','2019-07-29 00:00:00','2019-09-29 00:00:00',NULL),('S1905	','Z10084	','2019-07-29 00:00:00','2019-09-29 00:00:00',NULL),('S2213	','J05491	','2019-01-07 00:00:00','2019-03-07 00:00:00','2019-03-01 00:00:00'),('S4077	','Z10005	','2019-12-30 00:00:00','2020-01-30 00:00:00',NULL),('S4077	','Z10005	','2020-02-01 00:00:00','2020-04-01 00:00:00','2020-04-01 00:00:00'),('T0099	','J05491	','2022-09-20 00:00:00','2022-12-20 00:00:00',NULL),('T0099','J05491','2020-01-05 00:00:00','2020-03-05 00:00:00','2020-02-22 00:00:00'),('T0252	','Z10047	','2018-04-04 00:00:00','2018-06-04 00:00:00','2018-04-30 00:00:00'),('T0252	','Z10047	','2019-12-12 00:00:00','2020-02-12 00:00:00','2020-03-02 00:00:00'),('T0252	','Z10084	','2019-12-12 00:00:00','2020-02-12 00:00:00','2020-01-02 00:00:00');
/*!40000 ALTER TABLE `Borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Readers`
--

DROP TABLE IF EXISTS `Readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Readers` (
  `RID` char(10) NOT NULL COMMENT '读者编号',
  `Rname` char(10) NOT NULL COMMENT '读者姓名',
  `Rtype` char(8) NOT NULL DEFAULT '学生' COMMENT '读者类型',
  `Gender` char(2) NOT NULL COMMENT '性别',
  `Dept` char(20) DEFAULT NULL COMMENT '所属院系',
  PRIMARY KEY (`RID`),
  CONSTRAINT `Readers_chk_1` CHECK ((`Gender` in (_utf8mb4'男',_utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Readers`
--

LOCK TABLES `Readers` WRITE;
/*!40000 ALTER TABLE `Readers` DISABLE KEYS */;
INSERT INTO `Readers` VALUES ('S1039','赵轶','学生','男','外语学院'),('S1905','李正名','学生','男','计算机学院'),('S2213','王可心','学生','女','计算机学院'),('S4077','蒋萧萧','学生','男','经管学院'),('T0099','陆敏','教师','男','计算机学院'),('T0252','张琳琳','教师','女','经管学院');
/*!40000 ALTER TABLE `Readers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01  1:13:29
