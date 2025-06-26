-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: lwim
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `lwim_posts`
--

DROP TABLE IF EXISTS `lwim_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lwim_posts` (
  `postID` int NOT NULL AUTO_INCREMENT,
  `CodUser` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lwim_posts`
--

LOCK TABLES `lwim_posts` WRITE;
/*!40000 ALTER TABLE `lwim_posts` DISABLE KEYS */;
INSERT INTO `lwim_posts` VALUES (1,1,'Ok sorry','2025-06-21 23:01:31'),(2,1,'sigmand frays','2025-06-21 23:01:31'),(3,1,'this is a post\r\nthat i\'m making','2025-06-21 23:05:03'),(4,1,'This tuff icl\r\n','2025-06-22 13:37:55'),(5,1,'hi this is a tuff clean string','2025-06-22 13:47:51'),(6,1,'damn is','2025-06-22 14:33:27'),(7,1,'Is this tuff in atlantica?','2025-06-22 16:26:58'),(8,1,'bro why am i the only poster ong\r\n\r\nwe need more users.','2025-06-22 23:34:49'),(9,1,'Chat is this tuff?','2025-06-22 23:39:56'),(10,1,'sigma sigma boi','2025-06-22 23:49:36'),(11,1,'imagine not being tuff as me','2025-06-22 23:52:15'),(12,1,'like im the tuffest person in atlanta','2025-06-22 23:52:25'),(13,1,'sigma','2025-06-22 23:56:31'),(14,1,'ok bruh','2025-06-22 23:57:09'),(15,1,'can i post?','2025-06-22 23:57:45'),(16,1,'alr bruh','2025-06-22 23:59:12'),(17,1,'Im trying to debug live post appearence','2025-06-22 23:59:36'),(18,1,'Will it work bruh','2025-06-23 00:00:28'),(19,1,'Imagine not using the shithole Lwim is...\r\n\r\nAbsurd.','2025-06-23 00:03:34'),(20,1,'fr','2025-06-23 00:03:59'),(21,1,'damn-is llc will conquer the world','2025-06-23 00:04:14'),(22,1,'\"Write something\" bro don\'t tell me what to do','2025-06-23 00:05:50'),(23,1,'Everybody should switch to Lwim','2025-06-23 00:18:06'),(24,9,'Imagine not using Lwim ong','2025-06-23 00:18:46'),(25,9,'why did the user flag not update ong','2025-06-23 00:19:34'),(26,9,'There\'s some bugs help me','2025-06-23 00:19:55'),(27,9,'why tho','2025-06-23 00:20:02'),(28,9,'lemme try','2025-06-23 00:22:59'),(29,9,'isgma','2025-06-23 00:24:26'),(30,9,'maye?','2025-06-23 00:28:08'),(31,1,'this should work now','2025-06-23 00:28:28'),(32,1,'yes it did!!!','2025-06-23 00:28:35'),(33,1,'ok almost?','2025-06-23 00:29:39'),(34,1,'maybe?','2025-06-23 00:29:45'),(35,1,'HELL YEAHHHHH 🎉🎉🎉','2025-06-23 00:29:59'),(36,9,'on everybody\'s sould MINE INCLUDED ts shit is fire','2025-06-23 00:32:28'),(37,1,'btw i did all this just because i wanted a blog but i also wanted it to be easy to post.\r\n\r\nI also wanted everyone to be able to do so','2025-06-23 00:33:13'),(38,1,'imagine not having a blog duh','2025-06-23 00:33:35'),(39,1,'ok','2025-06-23 00:40:29'),(40,1,'works?','2025-06-23 00:42:00'),(41,1,'ok fire','2025-06-23 00:48:20'),(42,1,'this seems to be working','2025-06-23 00:48:55'),(43,1,'does it','2025-06-23 00:49:01'),(44,1,'Your thoughts here','2025-06-23 00:49:24'),(45,1,'nah thursday sounds good gang 😭🙏\r\n\r\n[  ] Tomorrow, Nov 27\r\n     $53,346.29 Delivery\r\n\r\n[  ] Thursday, Nov 28\r\n     Free Delivery','2025-06-23 04:07:36'),(46,1,'I hate javaasciptr','2025-06-23 04:08:43'),(47,13,'I\'m not facedev','2025-06-24 16:46:13'),(48,9,'ok','2025-06-24 16:47:23'),(49,1,'sigman','2025-06-24 16:48:38'),(50,9,'giose','2025-06-24 16:50:58'),(51,1,'igma','2025-06-24 21:58:25'),(52,1,'imagine not supporting profile pictures','2025-06-24 22:02:36'),(53,1,'nvm','2025-06-24 22:16:00'),(54,1,'ON EVERYBODYS SOUL IM GOATED 🐐','2025-06-24 22:36:01');
/*!40000 ALTER TABLE `lwim_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lwim_users`
--

DROP TABLE IF EXISTS `lwim_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lwim_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `joined` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `session_id` varchar(255) DEFAULT NULL,
  `display` varchar(64) DEFAULT NULL,
  `colorscheme` varchar(32) DEFAULT NULL,
  `pfp` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lwim_users`
--

LOCK TABLES `lwim_users` WRITE;
/*!40000 ALTER TABLE `lwim_users` DISABLE KEYS */;
INSERT INTO `lwim_users` VALUES (1,'giose','$2y$12$lFvpMLgXuV0x3nvamOxHQO5YQoiMpyZm19SYpZTGrb/YiX6Yn8nku','2025-06-20 15:28:34','$2y$12$UGjHxq8NYkVH.fyhes7LfOar4WH3HdrIQ3IsBxKEYuaMIeupZ3mEO','Mustard','#96ff96','https://pbs.twimg.com/profile_images/1934621895749480449/1vdXSI4o_400x400.jpg'),(9,'sigman','$2y$12$hNHHCQMXWqxhThiIvaSmJuTIdaSpuJauHj79ymEvu49XBbAwbWzHS','2025-06-20 15:37:27','$2y$12$r2Xtn80hgNS9cKuXCosSv.L73SBa9KjdFYQ8509Pv4xnDmwUU2NTe',NULL,'#888888',NULL),(11,'tester','$2y$12$05C795GOilHx0diCw14Dx.5SAhyffgY/XcKWCv3rHwOKI4kQ7Mb.y','2025-06-20 15:42:50',NULL,NULL,'#888888',NULL),(12,'discord','$2y$12$JhbBamyRSCs85.QG3ajaNeT0iDg5/QFnqGuwqpuSqPLhOREqfLLiu','2025-06-21 19:44:18','$2y$12$IhejwnpLwBIOHlANLeo14.HkHpqC/12P.08bYgut.d6I2wm.BvetS','Discord','#888888',NULL),(13,'face','$2y$12$11auidSRnyZ65PwWRLKJD.0wr9DzHqj692O08LF0V/yEp7kcyGX0a','2025-06-24 16:45:50','$2y$12$B.DAXX52mNBckg7HaZbqDuvm8R5kML7GjS/w3XhtKkxXJl7lyz4mG','Face','#888888',NULL);
/*!40000 ALTER TABLE `lwim_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25  3:29:35
