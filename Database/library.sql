-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aId` int NOT NULL AUTO_INCREMENT,
  `apad` varchar(12) NOT NULL,
  `aName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'123456','root');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `wId` int NOT NULL AUTO_INCREMENT,
  `wName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`wId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'鲁迅'),(2,'龙应台'),(3,'余华'),(4,'SHANSHW'),(5,'test'),(6,'古代'),(7,'周树人'),(8,'九尾'),(9,'a'),(10,'罗罗');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinfo`
--

DROP TABLE IF EXISTS `bookinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookinfo` (
  `bIsbn` varchar(13) NOT NULL,
  `pubId` int DEFAULT NULL,
  `tId` int DEFAULT NULL,
  `wId` int DEFAULT NULL,
  `bVersion` int DEFAULT NULL,
  `bName` varchar(20) DEFAULT NULL,
  `bOutDate` date DEFAULT NULL,
  `bPrice` float DEFAULT NULL,
  `bIntro` longtext,
  `bCover` longblob,
  PRIMARY KEY (`bIsbn`),
  KEY `FK_Reference_5` (`pubId`),
  KEY `FK_Reference_6` (`tId`),
  KEY `FK_Reference_7` (`wId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`pubId`) REFERENCES `publisher` (`pubId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`tId`) REFERENCES `typeinfo` (`tId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`wId`) REFERENCES `author` (`wId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinfo`
--

LOCK TABLES `bookinfo` WRITE;
/*!40000 ALTER TABLE `bookinfo` DISABLE KEYS */;
INSERT INTO `bookinfo` VALUES ('12345',12,6,1,1,'abc','2022-12-15',112,'nothing ',NULL),('12369',11,10,10,1,'teest','2022-11-11',123,' ',NULL),('12377',2,2,2,1,'test','2022-01-12',75,NULL,NULL),('14568',9,8,7,2,'随便乱起的','2020-12-05',32,'这本书是关于奇艺的 ',NULL),('14785',8,1,1,1,'一个人的朝圣','2022-12-15',144.2,' ',NULL);
/*!40000 ALTER TABLE `bookinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `bId` int NOT NULL AUTO_INCREMENT,
  `bIsbn` varchar(13) DEFAULT NULL,
  `bksId` int DEFAULT NULL,
  `bState` int DEFAULT NULL,
  `bInDate` date DEFAULT NULL,
  PRIMARY KEY (`bId`),
  KEY `FK_Reference_2` (`bIsbn`),
  KEY `FK_Reference_8` (`bksId`),
  KEY `testIndex` (`bId`,`bIsbn`,`bksId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`bIsbn`) REFERENCES `bookinfo` (`bIsbn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`bksId`) REFERENCES `bookshelf` (`bksId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'12345',23,2,'2022-10-11'),(2,'14568',15,2,'2022-12-05'),(3,'12377',21,1,'2022-12-15'),(4,'12377',16,0,'2022-12-16'),(15,'12345',19,1,'2022-12-18'),(16,'12345',4,0,'2022-12-09'),(17,'14568',5,0,'2022-12-03'),(18,'14785',13,0,'2022-12-18');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelf`
--

DROP TABLE IF EXISTS `bookshelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelf` (
  `bksId` int NOT NULL AUTO_INCREMENT,
  `bksName` varchar(20) DEFAULT NULL,
  `ifEmpty` int NOT NULL,
  PRIMARY KEY (`bksId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelf`
--

LOCK TABLES `bookshelf` WRITE;
/*!40000 ALTER TABLE `bookshelf` DISABLE KEYS */;
INSERT INTO `bookshelf` VALUES (1,'A区三排050',0),(2,'B区四排010',0),(3,'E区5排606',0),(4,'D区三排050',0),(5,'E区五排606',0),(13,'A区4排303',1),(15,'E区七排406',0),(16,'B区四排011',0),(17,'Bqutest',0),(18,'test',0),(19,'tt',0),(20,'D区',0),(21,'A区三排011',0),(22,'aa',0),(23,'A区三排150',0);
/*!40000 ALTER TABLE `bookshelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bId` int NOT NULL,
  `Rea_uID` varchar(8) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `reTimes` int DEFAULT NULL,
  `Expired` int DEFAULT NULL,
  `handleTime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bId` (`bId`),
  KEY `Rea_uID` (`Rea_uID`),
  CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`bId`) REFERENCES `books` (`bId`),
  CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`Rea_uID`) REFERENCES `reader` (`uID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES (1,16,'20331555','2022-12-19','2023-01-18',0,4,'2022-12-20'),(2,15,'20331501','2022-12-19','2023-02-17',0,2,'2022-12-20'),(3,18,'20778996','2022-12-19','2023-02-17',0,2,'2022-12-20'),(4,4,'20778996','2022-12-20','2023-02-18',0,2,'2022-12-20'),(5,17,'20331555','2022-12-20','2023-01-19',0,4,'2022-12-20'),(6,4,'20456698','2022-12-20','2023-02-18',0,4,'2022-12-20'),(7,15,'20331008','2022-12-21','2023-01-20',2,2,'2022-12-21'),(8,18,'20331008','2022-12-21','2023-01-20',0,4,'2022-12-21'),(9,1,'20202020','2022-12-21','2023-02-19',0,2,'2022-12-21'),(14,2,'20331008','2022-12-21','2023-01-20',2,0,'2022-12-21'),(15,1,'20778996','2022-12-21','2023-02-19',1,0,'2022-12-21');
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eId` int NOT NULL AUTO_INCREMENT,
  `eName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `aId` int NOT NULL,
  `eId` int NOT NULL,
  `time` datetime NOT NULL,
  `bId` int DEFAULT NULL,
  `Rea_uID` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`aId`,`eId`,`time`),
  KEY `FK_Reference_10` (`eId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`eId`) REFERENCES `event` (`eId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`aId`) REFERENCES `admin` (`aId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priority` (
  `pId` int NOT NULL,
  `pName` varchar(5) NOT NULL,
  `reMaxTimes` int DEFAULT NULL,
  `maxBooks` int DEFAULT NULL,
  `maxDays` int DEFAULT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
INSERT INTO `priority` VALUES (1,'学生',2,10,30),(2,'职工',2,15,60),(3,'教师',10,20,60);
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `pubId` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(20) DEFAULT NULL,
  `pLocate` varchar(20) DEFAULT NULL,
  `pEmailAddr` varchar(30) DEFAULT NULL,
  `pContact` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`pubId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'单原创出版社','北京','sysu@mail.com','122-445'),(2,'机械工业出版社','湖南','jxgycbs@mail.com','020-748'),(3,'清华大学出版社','北京','tsh@mail.com','030-789'),(5,'tesst','test','test55@qq.com','test'),(6,'test出版社',NULL,NULL,NULL),(8,'test原创出版社',NULL,NULL,NULL),(9,'钢铁工业出版社','ddd','dd@qq.com','dddd'),(11,'罗罗出版社',NULL,NULL,NULL),(12,'123出版社',NULL,NULL,NULL),(13,'测试出版社','珠海','zhuhai@mail.com','145');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader` (
  `uID` varchar(8) NOT NULL,
  `pId` int DEFAULT NULL,
  `uName` varchar(20) DEFAULT NULL,
  `uRegistry` date DEFAULT NULL,
  `uState` int DEFAULT NULL,
  `uViolatedTimes` int DEFAULT NULL,
  `uContact` varchar(11) DEFAULT NULL,
  `uSex` int DEFAULT NULL,
  `uValiDate` date DEFAULT NULL,
  `uCurBor` int DEFAULT NULL,
  `uHasBor` int DEFAULT NULL,
  `remark` longtext,
  `curViolate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`),
  UNIQUE KEY `temp1` (`uID`,`uName`),
  KEY `FK_Reference_1` (`pId`),
  KEY `temp2` (`uName`,`pId`),
  KEY `temp4` (`uState`,`uSex`,`uCurBor`),
  KEY `temp10` (`uHasBor`),
  KEY `temp33` (`uContact`,`uSex`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`pId`) REFERENCES `priority` (`pId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES ('20202020',2,'aaa','2022-12-21',1,0,'123456',0,'2023-12-21',0,1,NULL,0),('20331001',1,'test5','2022-10-10',1,101,'13728195420',1,'2023-12-20',9,101,NULL,72.36),('20331008',1,'shanshwwwww','2012-01-01',1,11,'123554',1,'2023-12-20',6,32,NULL,72.36000000000001),('20331501',3,'test','2022-10-10',-1,9,'13596324120',1,'2022-12-20',99,602,NULL,9.86),('20331555',1,'namee','2022-12-14',1,0,'13728195430',1,'2023-12-20',-3,2,NULL,-77.64),('20335220',1,'acd','2012-10-10',1,99,'19278195420',0,'2023-12-20',99,650,NULL,72.36),('20441065',1,'nameeeee','2022-12-16',1,-1,'13728195430',1,'2023-12-20',-1,0,NULL,72.36),('20456698',3,'add2','2022-12-16',1,0,'14789635210',0,'2023-12-20',-1,1,NULL,72.36000000000001),('20778996',2,'add','2022-12-16',1,0,'15236987456',1,'2023-12-20',0,3,NULL,62.360000000000014);
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testindex`
--

DROP TABLE IF EXISTS `testindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testindex` (
  `sname` varchar(30) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tempindex` (`sname`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testindex`
--

LOCK TABLES `testindex` WRITE;
/*!40000 ALTER TABLE `testindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `testindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeinfo`
--

DROP TABLE IF EXISTS `typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeinfo` (
  `tId` int NOT NULL AUTO_INCREMENT,
  `tName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeinfo`
--

LOCK TABLES `typeinfo` WRITE;
/*!40000 ALTER TABLE `typeinfo` DISABLE KEYS */;
INSERT INTO `typeinfo` VALUES (1,'散文'),(2,'未来'),(3,'言情'),(4,'教辅'),(5,'古代'),(6,'科幻'),(7,'纯爱'),(8,'奇艺'),(9,'玄学'),(10,'爱情');
/*!40000 ALTER TABLE `typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violateevent`
--

DROP TABLE IF EXISTS `violateevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violateevent` (
  `vid` int NOT NULL AUTO_INCREMENT,
  `vName` varchar(100) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violateevent`
--

LOCK TABLES `violateevent` WRITE;
/*!40000 ALTER TABLE `violateevent` DISABLE KEYS */;
INSERT INTO `violateevent` VALUES (1,'逾期未还'),(2,'图书丢失');
/*!40000 ALTER TABLE `violateevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violateinfo`
--

DROP TABLE IF EXISTS `violateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violateinfo` (
  `time` date NOT NULL,
  `bkid` int NOT NULL,
  `uid` varchar(8) NOT NULL,
  `violateid` int NOT NULL,
  `ifFined` int NOT NULL,
  `finedMoney` double NOT NULL,
  `index` int NOT NULL AUTO_INCREMENT,
  `borrowedid` int DEFAULT NULL,
  PRIMARY KEY (`index`),
  KEY `bkid` (`bkid`),
  KEY `uid` (`uid`),
  KEY `violateid` (`violateid`),
  KEY `borrowedid` (`borrowedid`),
  CONSTRAINT `violateinfo_ibfk_1` FOREIGN KEY (`bkid`) REFERENCES `books` (`bId`),
  CONSTRAINT `violateinfo_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `reader` (`uID`),
  CONSTRAINT `violateinfo_ibfk_3` FOREIGN KEY (`violateid`) REFERENCES `violateevent` (`vid`),
  CONSTRAINT `violateinfo_ibfk_4` FOREIGN KEY (`borrowedid`) REFERENCES `borrowed` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violateinfo`
--

LOCK TABLES `violateinfo` WRITE;
/*!40000 ALTER TABLE `violateinfo` DISABLE KEYS */;
INSERT INTO `violateinfo` VALUES ('2022-12-20',2,'20331501',1,1,62.5,1,2),('2022-12-20',16,'20331555',2,1,50,2,1),('2022-12-20',4,'20456698',2,1,375,6,6),('2022-12-20',17,'20331555',2,1,160,7,5),('2022-12-21',18,'20331008',2,1,720.9999847412109,8,8);
/*!40000 ALTER TABLE `violateinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21 17:56:54
