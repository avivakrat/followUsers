-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: followUser
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Art','2019-10-08 15:18:49',NULL),(2,'Music','2019-10-08 15:18:49',NULL),(3,'PC','2019-10-08 15:18:49',NULL),(4,'Football','2019-10-08 15:18:49',NULL),(5,'Finance','2019-10-08 15:18:49',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_10_08_111648_create_groups_table',1),(3,'2019_10_08_111714_create_user1_follows_user2_table',1),(4,'2019_10_08_113159_update_users_table',1),(5,'2019_10_08_113826_update_follow_table',1),(6,'2019_10_10_105623_update_follow_unique',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user1_follows_user2`
--

DROP TABLE IF EXISTS `user1_follows_user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user1_follows_user2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id1` bigint(20) unsigned NOT NULL,
  `user_id2` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user1_follows_user2_user_id1_user_id2_unique` (`user_id1`,`user_id2`),
  KEY `user1_follows_user2_user_id2_index` (`user_id2`),
  CONSTRAINT `user1_follows_user2_user_id1_foreign` FOREIGN KEY (`user_id1`) REFERENCES `users` (`id`),
  CONSTRAINT `user1_follows_user2_user_id2_foreign` FOREIGN KEY (`user_id2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user1_follows_user2`
--

LOCK TABLES `user1_follows_user2` WRITE;
/*!40000 ALTER TABLE `user1_follows_user2` DISABLE KEYS */;
INSERT INTO `user1_follows_user2` VALUES (8,1,7,'2019-10-10 22:23:05','2019-10-10 22:23:05'),(13,1,2,'2019-10-10 22:35:30','2019-10-10 22:35:30'),(15,1,11,'2019-10-10 22:36:14','2019-10-10 22:36:14'),(18,1,5,'2019-10-10 23:13:58','2019-10-10 23:13:58'),(19,1,9,'2019-10-10 23:13:59','2019-10-10 23:13:59'),(20,1,8,'2019-10-10 23:14:00','2019-10-10 23:14:00'),(21,1,4,'2019-10-10 23:14:18','2019-10-10 23:14:18'),(22,1,3,'2019-10-10 23:14:19','2019-10-10 23:14:19'),(23,2,5,'2019-10-10 23:14:27','2019-10-10 23:14:27'),(26,2,8,'2019-10-10 23:14:30','2019-10-10 23:14:30'),(29,2,6,'2019-10-10 23:14:35','2019-10-10 23:14:35'),(32,3,5,'2019-10-10 23:15:49','2019-10-10 23:15:49'),(36,3,1,'2019-10-10 23:15:55','2019-10-10 23:15:55'),(38,3,7,'2019-10-10 23:16:12','2019-10-10 23:16:12'),(40,3,2,'2019-10-10 23:16:41','2019-10-10 23:16:41'),(51,3,4,'2019-10-10 23:22:18','2019-10-10 23:22:18'),(56,3,9,'2019-10-10 23:22:40','2019-10-10 23:22:40');
/*!40000 ALTER TABLE `user1_follows_user2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `followers_count` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_name_index` (`name`),
  KEY `users_group_id_foreign` (`group_id`),
  CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mike',4,0,'2019-10-08 15:18:49',NULL),(2,'Bob',3,0,'2019-10-08 15:18:49',NULL),(3,'Larry',5,0,'2019-10-08 15:18:49',NULL),(4,'Julia',3,0,'2019-10-08 15:18:49',NULL),(5,'Anna',5,0,'2019-10-08 15:18:49',NULL),(6,'Ruth',5,0,'2019-10-08 15:18:49',NULL),(7,'Mira',1,0,'2019-10-08 15:18:49',NULL),(8,'John',5,0,'2019-10-08 15:18:49',NULL),(9,'Christy',1,0,'2019-10-08 15:18:49',NULL),(10,'Lola',2,0,'2019-10-08 15:18:49',NULL),(11,'Pola',4,0,'2019-10-08 15:18:49',NULL);
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

-- Dump completed on 2019-10-10 23:37:00
