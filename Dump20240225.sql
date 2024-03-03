-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: couponsphasetwo
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagesrc` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'https://bitly.ws/XVEZ','Food'),(2,'https://bitly.ws/XVFt','Entertainment'),(3,'https://bitly.ws/XVHj','Grooming'),(4,'https://bitly.ws/XVIF','Electronics');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `imagesrc` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_50ygfritln653mnfhxucoy8up` (`name`),
  UNIQUE KEY `UK_mixodugpv8ytm1alafk5hydnn` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Petah Tikva','https://bitly.ws/XVJc','KSP','03-9218811'),(2,'Petah Tikva','https://bitly.ws/Y2nb','Nespresso','03-6534974'),(3,'Tel Aviv','https://bitly.ws/Y2tK','Clinique','03-5168176'),(4,'Beer Sheva','https://bitly.ws/Y2tV','Chanel ','08-8989123'),(5,'Herzelia','https://bitly.ws/Y2uc','Sony','02-7891234'),(6,'Herzelia','https://bitly.ws/Y2uj','Microsoft ','02-9812348'),(7,'Ramat Gan','https://bitly.ws/Y2um','Ticketmaster ','03-6724315');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) NOT NULL,
  `imagesrc` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price_in_nis` float NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `units_in_stock` int NOT NULL,
  `category_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `user_created_coupon` bigint NOT NULL,
  `coupons` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f1u99ssbdsqass9ntq968codg` (`coupon_code`),
  UNIQUE KEY `UK_5h861ks1w4coatjjf52xd7w7m` (`name`),
  KEY `FKsywuemw12y5s03cupsj3mjs3b` (`category_id`),
  KEY `FKdcx0ovgcgvc3v9clxn2b9kvg9` (`company_id`),
  KEY `FKd0fg829mc2lnyor5mar2fgfa8` (`user_created_coupon`),
  KEY `FKo2qo60gkrsygyip6bo7coeq4n` (`coupons`),
  CONSTRAINT `FKd0fg829mc2lnyor5mar2fgfa8` FOREIGN KEY (`user_created_coupon`) REFERENCES `users` (`id`),
  CONSTRAINT `FKdcx0ovgcgvc3v9clxn2b9kvg9` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `FKo2qo60gkrsygyip6bo7coeq4n` FOREIGN KEY (`coupons`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsywuemw12y5s03cupsj3mjs3b` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'COFFE','The best Nespresso machine for all types of coffee','2024-12-31 00:00:00.000000','https://bitly.ws/XVLs','Nespresso Creatista Pro',350,'2023-10-19 00:00:00.000000',18,1,2,2,NULL),(2,'CREAMA','Buy the all new Nespresso Vertuo','2024-11-25 00:00:00.000000','https://bitly.ws/W7HB',' Nespresso Verturo',280,'2023-11-04 00:00:00.000000',23,1,2,2,NULL),(5,'SMELL10','Be the best smelling person ','2024-11-30 00:00:00.000000','https://bitly.ws/XWIP','BLEU DE CHANEL',150,'2023-10-21 00:00:00.000000',26,3,4,3,NULL),(6,'50','The most powerful console','2024-12-01 00:00:00.000000','https://bitly.ws/Y2EU','The Playstation 50',400,'2023-10-22 00:00:00.000000',49,4,5,5,NULL),(7,'ENJOY','An awesome console!','2024-12-31 00:00:00.000000','https://bitly.ws/IwYm','Xbox Series X',300,'2023-10-22 00:00:00.000000',39,4,6,6,NULL),(8,'ITSTIME','When was the last time you lived in a sweet sweet Fantasy? Last chance to buy tickets to see the queen of christmas in NY this December. So buy your tickets and Make It Happen','2024-12-15 00:00:00.000000','https://bitly.ws/Y2G6','Mariah Carey',300,'2023-11-04 00:00:00.000000',96,2,7,7,NULL);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `address` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_6v6x92wb400iwh6unf5rwiim4` (`phone_number`),
  CONSTRAINT `FKrh1g1a20omjmn6kurd35o3eit` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('Rosh HaAyin','Stav','Goren','054-9214411',4),('Bnei Brak','Stav','Dor','050-1234567',8),('Tel Aviv','Avi','Edri','052-3549784',9);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `date` datetime(6) NOT NULL,
  `coupon_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sqocqt2sv83kxdti1ebdc1aq` (`coupon_id`),
  KEY `FK9q5yt0n9s4ube31bxfamhir44` (`customer_id`),
  CONSTRAINT `FK4sqocqt2sv83kxdti1ebdc1aq` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  CONSTRAINT `FK9q5yt0n9s4ube31bxfamhir44` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,2,'2023-09-20 00:00:00.000000',1,4),(2,1,'2023-10-01 00:00:00.000000',2,4),(3,2,'2023-10-20 16:18:28.872000',1,4),(4,1,'2023-10-24 16:44:25.240000',5,4),(5,2,'2023-10-24 16:44:50.282000',5,4),(6,2,'2023-10-24 16:45:02.267000',2,4),(7,2,'2023-10-24 16:45:23.038000',8,4),(8,1,'2023-10-24 16:47:30.989000',7,4),(9,1,'2023-11-13 12:08:04.035000',5,4),(10,1,'2023-11-13 12:09:44.719000',6,4),(11,2,'2023-11-13 12:10:11.009000',8,4);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k8d0f2n7n88w1a16yhua64onx` (`user_name`),
  KEY `FKin8gn4o1hpiwe6qe4ey7ykwq7` (`company_id`),
  CONSTRAINT `FKin8gn4o1hpiwe6qe4ey7ykwq7` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stav9090!','stavho@hotmail.com','Admin',NULL),(2,'Tom123456','tom@ohshiit.com','Company',2),(3,'Yuv1975@!','yuvalnachman@icloud.com','Company',4),(4,'Stavgo1408%','stavgo14@gmail.com','Customer',NULL),(5,'Orel1234','orel@mizrahi.com','Company',5),(6,'Stavgo0123','stav@gmail.com','Company',6),(7,'Stav975@','stav@icloud.com','Company',7),(8,'Stav975@#','stavdor@gmail.com','Customer',NULL),(9,'Stavgo1411$','avied@gmail.com','Customer',NULL);
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

-- Dump completed on 2024-02-25 20:22:59
