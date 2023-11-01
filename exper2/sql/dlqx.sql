-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: dlqx
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
-- Current Database: `dlqx`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dlqx` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dlqx`;

--
-- Table structure for table `out_stock`
--

DROP TABLE IF EXISTS `out_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `out_stock` (
  `prj_num` char(8) DEFAULT NULL,
  `mat_num` char(8) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `get_date` datetime DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  CONSTRAINT `out_stock_chk_1` CHECK ((`amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_stock`
--

LOCK TABLES `out_stock` WRITE;
/*!40000 ALTER TABLE `out_stock` DISABLE KEYS */;
INSERT INTO `out_stock` VALUES ('20100015','m001',2,'2010-10-12 00:00:00','工程1部\r'),('20100015','m002',1,'2010-10-12 00:00:00','工程1部\r'),('20100016','m001',3,'2010-11-05 00:00:00','工程1部\r'),('20100016','m003',10,'2010-11-05 00:00:00','工程3部\r'),('20110001','m001',2,'2011-01-03 00:00:00','工程3部\r'),('20110002','m001',1,'2011-01-03 00:00:00','工程2部\r'),('20110002','m009',1,'2011-01-03 00:00:00','工程2部\r'),('20110003','m001',5,'2011-02-11 00:00:00','工程2部\r'),('20110003','m010',1,'2011-02-11 00:00:00','工程1部\r'),('20110004','m001',3,'2011-02-15 00:00:00','工程1部\r'),('20110004','m004',20,'2011-02-15 00:00:00','工程3部\r'),('20110005','m001',2,'2011-03-02 00:00:00','工程3部\r'),('20110005','m003',10,'2011-03-02 00:00:00','工程2部\r'),('20110005','m006',3,'2011-03-02 00:00:00','工程3部\r');
/*!40000 ALTER TABLE `out_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salvaging`
--

DROP TABLE IF EXISTS `salvaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salvaging` (
  `prj_num` char(8) NOT NULL,
  `prj_name` varchar(50) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `Prj_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`prj_num`),
  CONSTRAINT `salvaging_chk_1` CHECK ((`end_date` >= `start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salvaging`
--

LOCK TABLES `salvaging` WRITE;
/*!40000 ALTER TABLE `salvaging` DISABLE KEYS */;
INSERT INTO `salvaging` VALUES ('20100015','220KV清经线接地箱及接地线被盗抢修','2010-10-12 00:00:00','2010-10-13 00:00:00',_binary ''),('20100016','沙河站#公变出线电缆老化烧毁抢修','2010-11-05 00:00:00','2010-11-06 00:00:00',_binary ''),('20110001','西丽站电缆短路烧毁抢修工程','2011-01-03 00:00:00','2011-01-04 00:00:00',_binary ''),('20110002','西丽站电缆接地抢修','2011-01-03 00:00:00','2011-01-05 00:00:00',_binary ''),('20110003','观澜站光缆抢修','2011-02-10 00:00:00','2011-02-11 00:00:00',_binary ''),('20110004','小径墩低压线被盗抢修','2011-02-15 00:00:00','2011-02-17 00:00:00',_binary ''),('20110005','明珠立交电缆沟盖板破损抢修','2011-03-02 00:00:00','2011-03-05 00:00:00',_binary ''),('20110006','朝阳围公变低压线被盗抢修','2011-03-08 00:00:00','2011-03-10 00:00:00',_binary '');
/*!40000 ALTER TABLE `salvaging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `mat_num` char(8) NOT NULL,
  `mat_name` varchar(50) DEFAULT NULL,
  `speci` varchar(20) DEFAULT NULL,
  `warehouse` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `unit` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`mat_num`),
  CONSTRAINT `stock_chk_1` CHECK ((`amount` > 0)),
  CONSTRAINT `stock_chk_2` CHECK ((`unit` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('m001','护套绝缘电线','BVV-120','供电局1#仓库',220,89.80),('m002','架空绝缘电线','10KV-150','供电局1#仓库',30,17.00),('m003','护套绝缘电线','BVV-35','供电局2#仓库',80,22.80),('m004','护套绝缘电线','BVV-70','供电局2#仓库',283,32.00),('m005','护套绝缘电线','BVV-120','供电局2#仓库',130,40.00),('m006','护套绝缘电线','BVV-150','供电局3#仓库',46,85.00),('m007','架空绝缘电线','10KV-120','供电局3#仓库',85,14.08),('m008','护套绝缘电线','BVV-95','供电局3#仓库',164,88.00),('m009','交联聚乙烯绝缘电缆','YJV22-15KV','供电局4#仓库',45,719.80),('m010','户外真空断路器','ZW12-12','供电局4#仓库',1,13600.00);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01  1:13:58
