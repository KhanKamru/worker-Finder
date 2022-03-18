-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: building_management_system
-- ------------------------------------------------------
-- Server version	5.7.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `delivery_person_record`
--

DROP TABLE IF EXISTS `delivery_person_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_person_record` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `did` int(3) DEFAULT NULL,
  `room_no` int(3) DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exit_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `upstairs` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `did` (`did`),
  KEY `room_no` (`room_no`),
  CONSTRAINT `delivery_person_record_ibfk_1` FOREIGN KEY (`did`) REFERENCES `delivery_person` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `delivery_person_record_ibfk_2` FOREIGN KEY (`room_no`) REFERENCES `residents` (`room_no`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person_record`
--

LOCK TABLES `delivery_person_record` WRITE;
/*!40000 ALTER TABLE `delivery_person_record` DISABLE KEYS */;
INSERT INTO `delivery_person_record` VALUES (1,1,1,'2022-03-17 13:08:13','2022-03-17 13:09:31',_binary '\0'),(2,2,2,'2022-03-17 13:57:13','2022-03-17 14:13:43',_binary '\0'),(3,3,3,'2022-03-17 13:58:42','2022-03-17 14:13:40',_binary ''),(4,1,4,'2022-03-17 14:13:30','2022-03-17 14:13:37',_binary '\0');
/*!40000 ALTER TABLE `delivery_person_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-17 20:22:22
