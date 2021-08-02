-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: rent
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cities_countries1_idx` (`country_id`),
  CONSTRAINT `fk_cities_countries1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Moscow',1),(2,'St. Petersburg',1),(3,'Sochi',1),(4,'Madrid',2),(5,'Barcelona',2),(6,'Paris',3),(7,'Marseille',3),(8,'Rome',4),(9,'Athens',5),(10,'Milan',4);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code_UNIQUE` (`code`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'ru','Russian Federation'),(2,'es','Spain'),(3,'fr','France'),(4,'it','Italy'),(5,'gr','Greece');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `code` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender_type_UNIQUE` (`code`),
  UNIQUE KEY `description_full_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'m','male'),(2,'f','female'),(3,'u','undefined');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `re_object_id` int unsigned DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_message_re_object1_idx` (`re_object_id`),
  KEY `fk_message_profile1_idx` (`from_user_id`),
  KEY `fk_message_profile2_idx` (`to_user_id`),
  KEY `fk_message_media1_idx` (`media_id`),
  CONSTRAINT `fk_message_media1` FOREIGN KEY (`media_id`) REFERENCES `user_photo` (`id`),
  CONSTRAINT `fk_message_profile1` FOREIGN KEY (`from_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_message_profile2` FOREIGN KEY (`to_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_message_re_object1` FOREIGN KEY (`re_object_id`) REFERENCES `re_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at vehicula quam. Curabitur dapibus elementum nulla ac elementum. Sed consequat arcu semper pharetra sagittis. Etiam pharetra dolor sed volutpat euismod. Proin laoreet posuere tortor id iaculis. Vestibulum aliquam sed magna et interdum. Duis nisi tortor, malesuada at laoreet quis, pretium ut massa. Integer sed elementum lorem. Mauris ullamcorper arcu vel sodales tincidunt. Suspendisse elementum nibh non neque fringilla, id semper augue iaculis. Sed commodo, purus venenatis euismod rhoncus, neque neque ultrices felis, nec mattis magna leo non felis.',10,7,7,NULL,'2021-08-01 20:34:34',NULL),(2,'Quisque consequat diam tellus, et hendrerit dui vulputate sed. Proin vel ante quis quam suscipit tincidunt et ac odio. Aenean finibus pretium lectus id sodales. Curabitur faucibus leo vel tellus tincidunt vestibulum. Etiam vel imperdiet nibh, vel malesuada nisi. Mauris congue nunc ac ex viverra venenatis. Proin finibus nisi facilisis purus aliquet maximus. Cras a egestas tellus. Cras tempor tempor ultricies. Donec condimentum ligula eu leo dapibus, a sodales lacus mollis. Ut at auctor tellus. In enim risus, aliquam ut urna in, dignissim porttitor tortor. Aenean eget magna auctor, hendrerit velit ut, efficitur lacus. Integer ut erat quis dui auctor aliquet vehicula et felis.',7,10,7,NULL,'2021-08-01 20:34:34',NULL),(3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet maximus lorem, vitae consequat ante interdum nec. Etiam vel lobortis lacus, eu finibus diam. Praesent non dapibus odio, et aliquam arcu. In hac habitasse platea dictumst. Nunc leo mauris, elementum condimentum turpis at, molestie rutrum orci. Phasellus et purus nec turpis semper tempus. Donec volutpat, diam ut ullamcorper facilisis, ligula velit imperdiet felis, eu tempus ex orci eu turpis. Duis ac convallis nunc. Nunc vel orci sed nibh mollis egestas eu a dolor. Nulla placerat efficitur turpis et placerat. Pellentesque in leo at lacus scelerisque interdum. Sed eu felis tortor. Sed rhoncus eget lorem vel tincidunt.',10,7,7,NULL,'2021-08-01 20:34:34',NULL),(4,'Quisque fermentum nunc magna, suscipit dapibus leo consectetur eget. Donec at rutrum risus. Etiam blandit enim odio, nec auctor ante interdum a. Ut dignissim pharetra lorem sed tincidunt. Nullam maximus commodo malesuada. Maecenas sed enim ultrices, mattis sapien eu, viverra nibh. Morbi semper luctus rutrum. Duis dictum aliquam lorem, at convallis nibh congue sit amet. Nulla laoreet massa elit, id varius ex pellentesque ut.',7,10,7,NULL,'2021-08-01 20:34:34',NULL),(5,'Cras auctor, nibh et ultricies sodales, leo enim imperdiet nunc, vitae ullamcorper lorem quam a leo. Vestibulum dapibus magna nunc, nec scelerisque lectus faucibus sed. Nam nunc quam, semper ut ligula non, pulvinar placerat lectus. Nulla ultricies velit vitae lorem mattis, ac finibus felis pharetra. Donec imperdiet lorem mi, quis volutpat justo viverra hendrerit. Morbi efficitur erat tellus, ut ultrices orci elementum a. Mauris consectetur aliquam odio vitae consequat. Nullam pulvinar ante vitae nulla congue, vitae malesuada dolor blandit. Aliquam vel nisl at leo euismod blandit eu accumsan ipsum. Donec lobortis quam a leo pretium, at consectetur nisl pretium. Curabitur dignissim mi porttitor magna porta hendrerit.',12,5,NULL,NULL,'2021-08-01 20:34:34',NULL),(6,'Pellentesque id arcu gravida nulla pulvinar laoreet sit amet sit amet ex. In in metus arcu. Aenean dignissim facilisis risus, non suscipit eros. Cras eget nisl leo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut euismod sem at ipsum euismod, eget convallis odio tincidunt. Donec malesuada id sem a placerat. Vivamus consequat in velit et sagittis. Nullam nisi justo, finibus id orci eget, imperdiet commodo nibh.',5,12,NULL,NULL,'2021-08-01 20:34:34',NULL),(7,'Vestibulum commodo sapien id enim euismod iaculis. Duis eleifend elit et lectus pellentesque sodales. Proin ac sem elementum, commodo tellus id, accumsan dui. Etiam cursus non quam vel interdum. Aliquam vitae sem ex. In ornare placerat tincidunt. In viverra iaculis efficitur.',12,5,NULL,NULL,'2021-08-01 20:34:34',NULL),(8,'Suspendisse nec justo vel risus facilisis bibendum a vitae magna. Fusce tristique odio sit amet tempus dignissim. Donec vel diam ut odio aliquet cursus sit amet vitae est. Sed dictum sodales tempus. In laoreet rutrum sem id gravida. Maecenas dictum erat turpis, a commodo felis posuere sed. Vivamus sodales tempor velit, id malesuada diam lobortis eget. Proin consectetur id nulla eu auctor. Maecenas ligula risus, sodales ut mi efficitur, volutpat elementum enim. Duis blandit augue ex, vitae finibus eros tempus vitae. In varius finibus massa, vitae eleifend nisl accumsan sit amet. Curabitur a metus non dolor porttitor tempus. Vivamus pretium felis arcu, nec lacinia est elementum a. Duis ac dolor sem.',5,12,NULL,NULL,'2021-08-01 20:34:34',NULL),(9,'Sed non efficitur enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur lobortis ac massa nec posuere. Nam at lorem leo. Nam a enim et ipsum sodales vulputate. Vestibulum ut justo arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean vel purus tellus. Duis vehicula odio eget orci rhoncus vehicula. Duis et bibendum erat.',12,5,NULL,NULL,'2021-08-01 20:34:34',NULL),(10,'Nunc tincidunt ex id nisi pharetra hendrerit. Vivamus ultricies massa eget nisl scelerisque, at ullamcorper odio lobortis. Nulla et mi id sapien scelerisque accumsan. Fusce erat eros, euismod in arcu sit amet, pulvinar tincidunt magna. Sed vulputate bibendum consequat. Proin at tellus condimentum, vulputate augue vel, pellentesque eros. Nullam quis diam consequat, condimentum lacus et, finibus arcu. Integer fermentum, neque non viverra eleifend, quam urna rutrum quam, eget laoreet eros dolor eget turpis.',5,12,NULL,NULL,'2021-08-01 20:34:34',NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `reservation_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_payment_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_payment_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (2,45000,12,'2021-07-31 10:41:40',NULL),(3,31500,14,'2021-07-31 10:41:40','2021-07-31 10:41:59'),(4,114000,22,'2021-08-01 20:46:09',NULL),(5,57000,23,'2021-08-01 21:08:01',NULL),(6,57000,24,'2021-08-01 21:08:01',NULL),(7,57000,25,'2021-08-01 21:08:01',NULL),(8,70000,26,'2021-08-01 21:11:58',NULL),(9,70000,27,'2021-08-01 21:11:58',NULL),(10,70000,28,'2021-08-01 21:11:58',NULL),(11,70000,29,'2021-08-01 21:11:58',NULL),(12,70000,30,'2021-08-01 21:11:58',NULL),(13,57000,31,'2021-08-02 16:41:28',NULL),(14,55000,32,'2021-08-02 16:48:54',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_reservation` AFTER INSERT ON `payment` FOR EACH ROW BEGIN
  DECLARE res_id INT;
  
  SELECT reservation_id INTO res_id FROM payment WHERE id = (SELECT max(id) FROM payment);
  
  UPDATE reservation
	SET reservation_type_id = 3
	WHERE id = res_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender_id` tinyint unsigned DEFAULT NULL,
  `user_role_id` tinyint unsigned NOT NULL,
  `photo_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_profile_users_idx` (`user_id`),
  KEY `fk_profile_gender1_idx` (`gender_id`),
  KEY `fk_profile_user_role1_idx` (`user_role_id`),
  KEY `fk_profile_media1_idx` (`photo_id`),
  KEY `fk_profile_cities1_idx` (`city_id`),
  CONSTRAINT `fk_profile_cities1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_profile_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_profile_media1` FOREIGN KEY (`photo_id`) REFERENCES `user_photo` (`id`),
  CONSTRAINT `fk_profile_user_role1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`),
  CONSTRAINT `fk_profile_users` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Eleanor','Williams',NULL,2,1,1,1,'2021-07-30 18:27:19',NULL),(2,'John','Bradley',NULL,1,1,2,2,'2021-07-30 18:27:19',NULL),(3,'John','Little',NULL,1,2,3,3,'2021-07-30 18:27:19',NULL),(4,'Jane','Smith',NULL,2,2,4,4,'2021-07-30 18:27:19',NULL),(5,'Charlene','Ortega',NULL,2,3,5,5,'2021-07-30 18:27:19',NULL),(6,'Melvin','Smith',NULL,1,3,6,6,'2021-07-30 18:27:19',NULL),(7,'Jean','Nelson',NULL,1,3,7,7,'2021-07-30 18:27:19',NULL),(8,'Grace','Stevens',NULL,2,3,8,8,'2021-07-30 18:27:19',NULL),(9,'Jeffrey','Harris',NULL,1,3,9,9,'2021-07-30 18:27:19',NULL),(10,'John','Freeman',NULL,1,4,10,1,'2021-07-30 18:27:19',NULL),(11,'Kristina','Ellis',NULL,2,4,11,2,'2021-07-30 18:27:19',NULL),(12,'Jean','Morgan',NULL,2,4,12,3,'2021-07-30 18:27:19',NULL),(13,'Janice','Rodriguez',NULL,2,4,13,4,'2021-07-30 18:27:19',NULL),(14,'Jason','Stokes',NULL,1,4,14,5,'2021-07-30 18:27:19',NULL),(15,'Michael','Hudson',NULL,1,4,15,6,'2021-07-30 18:27:19',NULL),(16,'Patrick','Ross',NULL,1,4,16,7,'2021-07-30 18:27:19',NULL),(17,'Nelson','Edwards',NULL,1,4,17,8,'2021-07-30 18:27:19',NULL),(18,'Kathleen','Dean',NULL,2,4,18,9,'2021-07-30 18:27:19',NULL),(19,'Victoria','Rivera',NULL,2,4,19,1,'2021-07-30 18:27:19',NULL),(20,'Steven','Rowe',NULL,1,4,20,2,'2021-07-30 18:27:19',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `re_hosts_avg_rate`
--

DROP TABLE IF EXISTS `re_hosts_avg_rate`;
/*!50001 DROP VIEW IF EXISTS `re_hosts_avg_rate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `re_hosts_avg_rate` AS SELECT 
 1 AS `user_id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `av_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `re_object`
--

DROP TABLE IF EXISTS `re_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_object` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int unsigned NOT NULL,
  `re_object_type_id` int unsigned NOT NULL,
  `city_id` int unsigned NOT NULL,
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_re_objects_re_object_type1_idx` (`re_object_type_id`),
  KEY `fk_re_objects_cities1_idx` (`city_id`),
  KEY `fk_re_object_profile1_idx` (`owner_id`),
  CONSTRAINT `fk_re_object_profile1` FOREIGN KEY (`owner_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_re_objects_cities1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_re_objects_re_object_type1` FOREIGN KEY (`re_object_type_id`) REFERENCES `re_object_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='real estate objects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_object`
--

LOCK TABLES `re_object` WRITE;
/*!40000 ALTER TABLE `re_object` DISABLE KEYS */;
INSERT INTO `re_object` VALUES (1,'Квартира с видом на море',5,1,3,'Ул. Сиреневая, 5, 15',5000,'2021-07-31 10:20:34','2021-07-31 10:25:12'),(2,'Отличная квартира',5,1,3,'Ул. Сиреневая, 3, 22',4500,'2021-07-31 10:20:34','2021-08-02 11:43:02'),(3,'Большой коттедж',6,2,1,'Лесная, 15',7000,'2021-07-31 10:25:12','2021-08-02 11:43:02'),(4,'Частный дом',6,2,2,'Вятская, 4',6300,'2021-07-31 10:25:12','2021-08-02 11:43:02'),(5,'Дом с прекрасным видом',6,2,2,'Московская, 2',5700,'2021-07-31 10:25:12','2021-08-02 11:43:02'),(6,'Room 1',7,3,4,'La playa, 14',7000,'2021-07-31 10:25:12',NULL),(7,'Room 2',7,3,4,'La playa, 15',5000,'2021-07-31 10:25:12',NULL),(8,'Room 3',7,3,5,'Albania, 11',9000,'2021-07-31 10:25:12',NULL),(9,'Room 4',7,3,5,'Albania, 11',9000,'2021-08-01 21:23:04',NULL),(10,'Room 5',7,3,5,'Albania, 11',9000,'2021-08-01 21:23:04',NULL);
/*!40000 ALTER TABLE `re_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `re_object_avg_rate`
--

DROP TABLE IF EXISTS `re_object_avg_rate`;
/*!50001 DROP VIEW IF EXISTS `re_object_avg_rate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `re_object_avg_rate` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `av_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `re_object_type`
--

DROP TABLE IF EXISTS `re_object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_object_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='real estate object types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_object_type`
--

LOCK TABLES `re_object_type` WRITE;
/*!40000 ALTER TABLE `re_object_type` DISABLE KEYS */;
INSERT INTO `re_object_type` VALUES (4,'apartments'),(1,'flat'),(2,'house'),(3,'room');
/*!40000 ALTER TABLE `re_object_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_photo`
--

DROP TABLE IF EXISTS `re_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `re_objects_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatetd_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`),
  KEY `fk_re_media_re_objects1_idx` (`re_objects_id`),
  CONSTRAINT `fk_re_media_re_objects1` FOREIGN KEY (`re_objects_id`) REFERENCES `re_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_photo`
--

LOCK TABLES `re_photo` WRITE;
/*!40000 ALTER TABLE `re_photo` DISABLE KEYS */;
INSERT INTO `re_photo` VALUES (1,'f3190f46-f2f2-11eb-8db7-e0d55eda462b',NULL,1,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(2,'f31914b0-f2f2-11eb-8db7-e0d55eda462b',NULL,1,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(3,'f3191630-f2f2-11eb-8db7-e0d55eda462b',NULL,2,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(4,'f3191793-f2f2-11eb-8db7-e0d55eda462b',NULL,2,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(5,'f31918cc-f2f2-11eb-8db7-e0d55eda462b',NULL,3,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(6,'f3191a3a-f2f2-11eb-8db7-e0d55eda462b',NULL,4,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(7,'f3191b87-f2f2-11eb-8db7-e0d55eda462b',NULL,5,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(8,'f3191e00-f2f2-11eb-8db7-e0d55eda462b',NULL,6,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(9,'f3191f29-f2f2-11eb-8db7-e0d55eda462b',NULL,7,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(10,'f319204a-f2f2-11eb-8db7-e0d55eda462b',NULL,8,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(11,'f319222e-f2f2-11eb-8db7-e0d55eda462b',NULL,7,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(12,'f31923ed-f2f2-11eb-8db7-e0d55eda462b',NULL,6,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(13,'f319267c-f2f2-11eb-8db7-e0d55eda462b',NULL,5,'2021-07-31 10:27:22','2021-08-01 21:04:43'),(14,'f3192858-f2f2-11eb-8db7-e0d55eda462b',NULL,4,'2021-07-31 10:27:22','2021-08-01 21:04:43');
/*!40000 ALTER TABLE `re_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `re_object_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `reservation_type_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orders_re_objects1_idx` (`re_object_id`),
  KEY `fk_reservation_reservation_type1_idx` (`reservation_type_id`),
  KEY `fk_reservation_profile1_idx` (`user_id`),
  CONSTRAINT `fk_orders_re_objects1` FOREIGN KEY (`re_object_id`) REFERENCES `re_object` (`id`),
  CONSTRAINT `fk_reservation_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_reservation_reservation_type1` FOREIGN KEY (`reservation_type_id`) REFERENCES `reservation_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (11,1,10,'2021-08-30','2021-09-05',2,'2021-07-31 10:36:17',NULL),(12,2,11,'2021-08-10','2021-08-19',3,'2021-07-31 10:36:17','2021-07-31 10:40:24'),(13,3,12,'2021-08-07','2021-08-15',2,'2021-07-31 10:36:17',NULL),(14,4,13,'2021-08-10','2021-08-14',2,'2021-07-31 10:36:17','2021-07-31 10:40:58'),(15,5,14,'2021-08-20','2021-09-01',2,'2021-07-31 10:36:17',NULL),(16,6,15,'2021-09-01','2021-10-01',2,'2021-07-31 10:36:17',NULL),(17,7,16,'2021-08-15','2021-08-17',2,'2021-07-31 10:36:17',NULL),(18,1,5,'2021-05-15','2021-05-20',1,'2021-07-31 10:36:17',NULL),(19,1,5,'2021-10-01','2021-10-10',1,'2021-07-31 10:36:17',NULL),(20,2,5,'2021-04-10','2021-04-12',1,'2021-07-31 10:36:17',NULL),(21,2,5,'2021-09-05','2021-09-05',1,'2021-07-31 10:36:17',NULL),(22,5,17,'2021-04-01','2021-04-20',3,'2021-08-01 20:44:33',NULL),(23,5,18,'2021-03-01','2021-03-10',3,'2021-08-01 21:07:16',NULL),(24,5,19,'2021-03-11','2021-03-20',3,'2021-08-01 21:07:16',NULL),(25,5,20,'2021-02-01','2021-02-10',3,'2021-08-01 21:07:16',NULL),(26,6,10,'2021-01-01','2021-01-10',3,'2021-08-01 21:10:57',NULL),(27,6,11,'2021-01-11','2021-01-20',3,'2021-08-01 21:10:57',NULL),(28,6,12,'2021-03-10','2021-03-20',3,'2021-08-01 21:10:57',NULL),(29,6,13,'2021-02-01','2021-02-10',3,'2021-08-01 21:10:57',NULL),(30,6,14,'2021-02-11','2021-02-20',3,'2021-08-01 21:10:57',NULL),(31,5,14,'2020-01-01','2020-01-10',3,'2021-08-02 12:06:56','2021-08-02 16:41:53'),(32,1,14,'2021-08-05','2021-08-15',3,'2021-08-02 12:31:30','2021-08-02 16:48:54');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_type`
--

DROP TABLE IF EXISTS `reservation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_type`
--

LOCK TABLES `reservation_type` WRITE;
/*!40000 ALTER TABLE `reservation_type` DISABLE KEYS */;
INSERT INTO `reservation_type` VALUES (1,'technical'),(2,'advance'),(3,'paid');
/*!40000 ALTER TABLE `reservation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int unsigned NOT NULL,
  `object_rate` tinyint DEFAULT NULL,
  `host_rate` tinyint DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_review_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_review_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,22,10,10,'Duis vestibulum vehicula eros a gravida. Quisque consectetur massa tortor, et cursus lorem viverra efficitur. Pellentesque placerat libero semper diam semper, non vehicula ipsum aliquet. Suspendisse in pulvinar felis. Nunc venenatis nunc velit, vitae mattis felis egestas non. Nullam ac gravida ligula, vel tempor purus. Duis massa orci, lacinia a felis lobortis, pulvinar maximus nulla. Cras vitae sem urna. Duis quis nisi orci. Quisque quis quam dapibus, mattis urna at, maximus odio. Morbi lacinia eget tortor id viverra. Praesent blandit, nulla et rutrum ornare, metus ex scelerisque nisl, ac lacinia est arcu id sapien. Curabitur non massa magna.','2021-08-01 20:48:50',NULL),(2,23,9,10,'Vivamus elit lectus, consectetur id tincidunt ut, dictum eu quam. Praesent hendrerit in ligula vel interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor ac erat eu luctus. Sed vel orci pharetra, malesuada odio id, cursus leo. Phasellus nunc enim, tristique dapibus urna et, rhoncus sodales ex. Nunc eleifend auctor tristique. Etiam a consequat risus. Donec pellentesque metus eu egestas suscipit. Etiam consectetur tincidunt pretium.','2021-08-01 21:14:59','2021-08-02 11:26:43'),(3,24,8,10,'Maecenas mattis vel elit id elementum. Vestibulum nec urna tincidunt, finibus felis eu, eleifend metus. Suspendisse a tincidunt est. Donec blandit libero lorem, malesuada interdum sem sagittis in. Donec at risus ut libero ultricies varius. Nullam rhoncus blandit lacus, nec commodo orci commodo eget. Suspendisse imperdiet auctor velit. Nullam laoreet pharetra dolor nec rhoncus. Ut in enim mollis, ullamcorper diam et, volutpat ipsum. Suspendisse sollicitudin consequat mi eu interdum. Mauris egestas vel arcu vitae mollis. Sed ultrices ultricies neque, ut dignissim risus aliquet at. Integer vestibulum arcu ipsum, a tincidunt elit pellentesque quis. Etiam vitae eros ullamcorper, rutrum est in, sollicitudin justo.','2021-08-01 21:14:59','2021-08-02 11:26:43'),(4,25,7,10,'Cras sollicitudin sem et nisl viverra, euismod iaculis mi semper. Pellentesque nec risus malesuada, accumsan nulla gravida, mollis metus. In commodo metus at commodo fermentum. Donec pulvinar ac purus vitae pellentesque. Nullam sit amet pulvinar lorem. Donec dapibus metus ac augue vulputate euismod. Nulla ac ultricies ante, id accumsan metus. Praesent non blandit magna, a pulvinar augue.','2021-08-01 21:14:59','2021-08-02 11:26:43'),(5,26,5,5,'Nunc viverra massa at neque commodo, nec viverra urna blandit. Vivamus consequat et sem sit amet dignissim. Quisque laoreet massa ac ullamcorper gravida. Nulla sem purus, pharetra quis urna ac, sollicitudin rhoncus lorem. Sed malesuada consectetur purus commodo cursus. Nulla semper metus eu augue scelerisque pretium. Nulla convallis condimentum elit, eu lobortis neque consectetur in. Donec eget vestibulum enim, vel ultrices quam. Sed non felis commodo velit porttitor tincidunt eget eget eros.','2021-08-01 21:14:59',NULL),(6,27,9,9,'Morbi a sapien vulputate, fermentum ante nec, consectetur quam. Mauris eleifend vel est sed fermentum. Nulla eu dignissim odio. Aenean dolor dolor, finibus vel venenatis vel, tristique placerat magna. Nam eu enim magna. In rhoncus, massa non tempus porttitor, purus felis dictum mi, sed vehicula dolor ipsum non nisl. Praesent malesuada euismod metus ac fermentum. Nulla molestie ullamcorper ante at auctor. Suspendisse sit amet sapien cursus, condimentum eros sit amet, tincidunt orci. Phasellus lacinia sem est, eget elementum turpis semper at. Nulla facilisi. Nunc id orci sed eros euismod posuere sit amet at ex.','2021-08-01 21:14:59',NULL),(7,28,3,6,'Donec elit eros, pretium sit amet nisl ut, dictum condimentum purus. Donec eget purus convallis, tempus urna non, fringilla orci. Aliquam consequat mauris vel erat sagittis interdum. Maecenas faucibus, ex vel consequat viverra, purus purus scelerisque enim, et euismod metus urna eget neque. Duis sit amet gravida nisi. Suspendisse nisl libero, iaculis quis dignissim non, ultricies sed justo. Donec aliquet ullamcorper metus et molestie. Pellentesque ipsum turpis, interdum vel vulputate vel, semper at leo. Vestibulum ac eros ornare, posuere neque ac, pretium dui. Donec sed venenatis metus, id egestas orci. Nunc arcu sem, tincidunt vitae imperdiet in, commodo id urna. Donec aliquet finibus condimentum. Integer egestas risus justo, in consequat libero rutrum in. Sed fringilla, ipsum ut suscipit porta, justo ipsum dapibus nunc, sed congue turpis enim sit amet magna. Integer condimentum auctor sem sed vehicula. Nam consequat nisi vel faucibus interdum.','2021-08-01 21:14:59',NULL),(8,29,4,1,'Quisque accumsan metus efficitur dolor euismod, vitae porttitor libero faucibus. Etiam facilisis pretium erat, nec molestie quam condimentum vel. Quisque eu urna turpis. Fusce ut metus vitae leo rutrum pharetra. Vivamus suscipit euismod diam, eu sollicitudin nulla. Nunc ac augue nibh. Mauris odio risus, pretium consequat consequat sed, aliquet eget nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent egestas convallis odio quis commodo.','2021-08-01 21:14:59',NULL),(9,30,2,2,'Phasellus sed interdum nisl. Nunc maximus risus nunc, vel fringilla neque viverra id. Quisque placerat, neque et porta pharetra, libero arcu tempus risus, ut imperdiet mi felis ut augue. Vestibulum eu nulla a felis semper cursus ut vitae lacus. Sed hendrerit orci interdum turpis gravida dapibus. Integer vehicula hendrerit ligula non lacinia. Nam mollis sapien ac sem laoreet volutpat. Curabitur lobortis elementum varius.','2021-08-01 21:14:59',NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL,
  `password_hash` char(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gleichner.ella@example.org',1234567890,'7a15090cf7f377407f17ac90f19e0bd38ea7a77c','2015-03-09 11:56:23','2021-07-30 18:06:20',NULL),(2,'xgutkowski@example.org',1234567891,'d2fb66860e6be45384ce7dd2a2d5381cdeb546e3','2009-10-09 13:58:14','2021-07-30 18:06:20',NULL),(3,'bode.isabell@example.com',1234567892,'7d10b57226b92501d1552923ec29f61369f9b23c','1977-09-25 14:40:04','2021-07-30 18:06:20','2016-01-07 02:24:40'),(4,'qspinka@example.com',1234567893,'877f8cf47c1875af851c542b6eb5307471abad9f','1986-04-24 05:41:56','2021-07-30 18:06:20',NULL),(5,'ccronin@example.net',1234567894,'44b08d1fbe35ba6f82a47cd403d4a42b8d610792','2013-03-11 03:53:32','2021-07-30 18:06:20',NULL),(6,'ledner.gianni@example.net',123456789,'3e74cfeb646c791942f9887c28c383652a728e41','1987-03-12 03:15:48','2021-07-30 18:06:20',NULL),(7,'marques.kuvalis@example.com',123456780,'3187a815dc7495b90cfcbaa2dc7510164e9150de','1996-05-31 23:04:03','2021-07-30 18:06:20',NULL),(8,'kade06@example.com',123456781,'752f378fcb0c2478b9e97b5a97f72313442b7710','1974-08-20 08:29:00','2021-07-30 18:06:20',NULL),(9,'brisa.hettinger@example.com',123456782,'fa9037a1117df48abbe0a3d6ff80ec5508ed08f2','1984-07-14 10:50:06','2021-07-30 18:06:20',NULL),(10,'gnolan@example.net',123456785,'7b7918e31b083b95805e7e7f955e79ae82ee2f21','1971-12-14 07:40:45','2021-07-30 18:06:20',NULL),(11,'batz.meaghan@example.org',123456784,'4d5a7bfc74285426cc148fc43f369c12adbd4d3f','1974-11-17 07:16:54','2021-07-30 18:06:20',NULL),(12,'lrutherford@example.org',123456786,'c0adf2c8f5690321a9cc4f629decb86c08b2eae1','1990-11-04 14:22:20','2021-07-30 18:06:20','2010-02-14 02:40:43'),(13,'ebalistreri@example.net',1234567812,'577112608c094a4e80fd1c4badfb4a129e8e3d6c','1980-06-22 17:31:23','2021-07-30 18:06:20',NULL),(14,'danial.heathcote@example.com',1234567885,'0582e44619d0e30ea33a7e7aad6cf7f93de50ebd','1980-01-28 11:47:41','2021-07-30 18:06:20',NULL),(15,'okuneva.alexandro@example.com',1234567886,'f74880a7214563ec9d43ba4eb2aa8fb486d57db9','1983-03-16 00:13:02','2021-07-30 18:06:20',NULL),(16,'marge.jerde@example.org',1234567881,'0971cb1e51347413c59f58ff6547a395bc7fd801','1974-09-06 09:41:07','2021-07-30 18:06:20',NULL),(17,'dustin.vandervort@example.org',1234567882,'71679c5335273ec66d575b87aa0388a767aebef0','1984-05-15 03:24:55','2021-07-30 18:06:20',NULL),(18,'pmurazik@example.org',1234567883,'f32013aebf9f69c1cb35808784b026c8dd712e06','1986-10-27 03:08:18','2021-07-30 18:06:20',NULL),(19,'rosina48@example.net',1234567887,'a916f2d8ce5dd20b1530da6c8a8bc82cd51d4613','2009-09-29 00:29:53','2021-07-30 18:06:20',NULL),(20,'mstanton@example.org',1234467888,'9a5c4483b9c9e74bd5d9dac7820cd201063397d1','2009-06-04 09:48:03','2021-07-30 18:06:20',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_photo`
--

DROP TABLE IF EXISTS `user_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photo`
--

LOCK TABLES `user_photo` WRITE;
/*!40000 ALTER TABLE `user_photo` DISABLE KEYS */;
INSERT INTO `user_photo` VALUES (1,'8f4b68a2-3dbc-4938-80a7-ceb3c0f4a0e2',NULL,'2021-08-01 21:00:38',NULL),(2,'953ad8df-37de-4b5d-9212-cd92ba62c890',NULL,'2021-08-01 21:00:38',NULL),(3,'b13fde92-6cab-48ee-b07d-7981d4c091c3',NULL,'2021-08-01 21:00:38',NULL),(4,'12ce92a1-06e7-40c0-a3be-7409c23f7b91',NULL,'2021-08-01 21:00:38',NULL),(5,'c228a302-99f6-4841-8fc7-e7e5a94210b3',NULL,'2021-08-01 21:00:38',NULL),(6,'0a93cc54-a8fc-4d6c-8f29-0699eb195745',NULL,'2021-08-01 21:00:38',NULL),(7,'d1477913-fb72-41ce-8c5b-743e00becd8d',NULL,'2021-08-01 21:00:38',NULL),(8,'a480bd83-df39-4a42-8adf-cf7844c3bb9e',NULL,'2021-08-01 21:00:38',NULL),(9,'7bd9f698-444c-49d8-a0ea-a75ea0992ea6',NULL,'2021-08-01 21:00:38',NULL),(10,'352cb655-f2dd-42a8-8133-6256ad502dd7',NULL,'2021-08-01 21:00:38',NULL),(11,'39dc2a03-87fd-4afa-bd8a-cf6f563ffefb',NULL,'2021-08-01 21:00:38',NULL),(12,'440df9cf-237e-4e89-8e03-9f969bc46918',NULL,'2021-08-01 21:00:38',NULL),(13,'3cac8d0a-fa94-445c-ad06-3cafd4a6ae4e',NULL,'2021-08-01 21:00:38',NULL),(14,'a7815d6f-9b4b-42d9-8232-46c6ff1aaef4',NULL,'2021-08-01 21:00:38',NULL),(15,'828a07d7-089d-4b36-9ce6-265489acb5e7',NULL,'2021-08-01 21:00:38',NULL),(16,'a0492964-20f3-4438-8e4a-5e9dc04300f5',NULL,'2021-08-01 21:00:38',NULL),(17,'5223e54f-adc7-462d-9c9b-ec5a621c3e68',NULL,'2021-08-01 21:00:38',NULL),(18,'4c4a625b-4e0a-470c-8e6c-f62e6b756a2e',NULL,'2021-08-01 21:00:38',NULL),(19,'73568434-bc3a-4019-9444-4b3907273dd0',NULL,'2021-08-01 21:00:38',NULL),(20,'206d5709-2661-4546-847c-bb0c6847853f',NULL,'2021-08-01 21:00:38',NULL);
/*!40000 ALTER TABLE `user_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_type_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'administrator'),(3,'landlord'),(2,'moderator'),(4,'tenant');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rent'
--
/*!50003 DROP FUNCTION IF EXISTS `reservation_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `reservation_sum`(start_date DATE, end_date DATE, price INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE days int;
    
    SET days = datediff(end_date, start_date) + 1;
    
    RETURN days*price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `re_hosts_avg_rate`
--

/*!50001 DROP VIEW IF EXISTS `re_hosts_avg_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `re_hosts_avg_rate` AS select `p`.`user_id` AS `user_id`,`p`.`firstname` AS `firstname`,`p`.`lastname` AS `lastname`,avg(`rw`.`host_rate`) AS `av_rate` from (((`profile` `p` join `re_object` `o` on((`p`.`user_id` = `o`.`owner_id`))) join `reservation` `r` on((`o`.`id` = `r`.`re_object_id`))) join `review` `rw` on((`r`.`id` = `rw`.`reservation_id`))) group by `o`.`name` order by `av_rate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `re_object_avg_rate`
--

/*!50001 DROP VIEW IF EXISTS `re_object_avg_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `re_object_avg_rate` AS select `o`.`id` AS `id`,`o`.`name` AS `name`,avg(`rw`.`object_rate`) AS `av_rate` from ((`re_object` `o` join `reservation` `r` on((`o`.`id` = `r`.`re_object_id`))) join `review` `rw` on((`r`.`id` = `rw`.`reservation_id`))) group by `o`.`name` order by `av_rate` desc */;
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

-- Dump completed on 2021-08-02 18:13:06
