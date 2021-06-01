-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: sports
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add FCM device',7,'add_fcmdevice'),(26,'Can change FCM device',7,'change_fcmdevice'),(27,'Can delete FCM device',7,'delete_fcmdevice'),(28,'Can view FCM device',7,'view_fcmdevice'),(29,'Can add Категория',8,'add_category'),(30,'Can change Категория',8,'change_category'),(31,'Can delete Категория',8,'delete_category'),(32,'Can view Категория',8,'view_category'),(33,'Can add Спортивная площадка',9,'add_sportsarea'),(34,'Can change Спортивная площадка',9,'change_sportsarea'),(35,'Can delete Спортивная площадка',9,'delete_sportsarea'),(36,'Can view Спортивная площадка',9,'view_sportsarea'),(37,'Can add Фото',10,'add_gallery'),(38,'Can change Фото',10,'change_gallery'),(39,'Can delete Фото',10,'delete_gallery'),(40,'Can view Фото',10,'view_gallery'),(41,'Can add Инфраструктура',12,'add_infrastructure'),(42,'Can change Инфраструктура',12,'change_infrastructure'),(43,'Can delete Инфраструктура',12,'delete_infrastructure'),(44,'Can view Инфраструктура',12,'view_infrastructure'),(45,'Can add Тип',11,'add_type'),(46,'Can change Тип',11,'change_type'),(47,'Can delete Тип',11,'delete_type'),(48,'Can view Тип',11,'view_type');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$29UJCxhk0SIO$YQ05FzPuhPsHWVo6lGdMwQVSAhn4hzvYQhxd9r5BV7o=','2020-04-22 08:10:43.175705',1,'admin','','','admin@gmail.com',1,1,'2020-03-23 15:23:18.776104');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-23 15:24:05.176344','1','Football',1,'[{\"added\": {}}]',8,1),(2,'2020-03-23 15:36:15.756094','2','very good sport area',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0424\\u043e\\u0442\\u043e\", \"object\": \"Gallery object (2)\"}}, {\"added\": {\"name\": \"\\u0424\\u043e\\u0442\\u043e\", \"object\": \"Gallery object (3)\"}}, {\"added\": {\"name\": \"\\u0424\\u043e\\u0442\\u043e\", \"object\": \"Gallery object (4)\"}}]',9,1),(3,'2020-03-23 15:36:34.250344','2','very good sport area',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043d\\u0441\\u0442\\u0430\\u0433\\u0440\\u0430\\u043c\"]}}]',9,1),(4,'2020-03-24 13:33:38.357436','3','Test',1,'[{\"added\": {}}]',9,1),(5,'2020-03-24 13:44:42.405129','4','test2',1,'[{\"added\": {}}]',9,1),(6,'2020-03-24 13:55:26.847201','5','test3',1,'[{\"added\": {}}]',9,1),(7,'2020-03-24 13:57:56.883808','6','test4',1,'[{\"added\": {}}]',9,1),(8,'2020-03-24 13:59:30.122967','7','Paginator5',1,'[{\"added\": {}}]',9,1),(9,'2020-03-24 18:02:39.956170','7','Paginator5',2,'[{\"added\": {\"name\": \"\\u0424\\u043e\\u0442\\u043e\", \"object\": \"Gallery object (5)\"}}, {\"added\": {\"name\": \"\\u0424\\u043e\\u0442\\u043e\", \"object\": \"Gallery object (6)\"}}]',9,1),(10,'2020-03-31 16:49:56.789713','1','1',1,'[{\"added\": {}}]',11,1),(11,'2020-03-31 16:50:09.297519','1','Мини',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\"]}}]',11,1),(12,'2020-03-31 16:50:53.105472','1','Свет',1,'[{\"added\": {}}]',12,1),(13,'2020-03-31 16:51:26.854775','2','душ',1,'[{\"added\": {}}]',12,1),(14,'2020-04-01 05:48:05.828344','2','душ',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',12,1),(15,'2020-04-01 05:55:00.792229','2','Душ',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\", \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',12,1),(16,'2020-04-01 05:55:23.490558','1','Освещение',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\", \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',12,1),(17,'2020-04-01 05:55:56.575525','3','Раздевалки',1,'[{\"added\": {}}]',12,1),(18,'2020-04-01 05:56:21.712835','4','Парковка',1,'[{\"added\": {}}]',12,1),(19,'2020-04-01 05:56:39.094415','5','Трибуна',1,'[{\"added\": {}}]',12,1),(20,'2020-04-01 05:56:55.566080','6','Инвентарь',1,'[{\"added\": {}}]',12,1),(21,'2020-04-01 06:06:58.466282','1','Мини',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',11,1),(22,'2020-04-01 06:07:16.399988','2','Футзал',1,'[{\"added\": {}}]',11,1),(23,'2020-04-01 06:07:44.793651','3','Большой',1,'[{\"added\": {}}]',11,1),(24,'2020-04-01 06:08:05.445642','1','Футбол',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\"]}}]',8,1),(25,'2020-04-01 06:08:41.510264','2','very good sport area',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0430\\u043a\\u0442\\u0443\\u0440\\u0430\"]}}]',9,1),(26,'2020-04-01 06:08:57.238748','3','Test',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0430\\u043a\\u0442\\u0443\\u0440\\u0430\"]}}]',9,1),(27,'2020-04-01 06:09:28.628233','5','test3',2,'[{\"changed\": {\"fields\": [\"\\u0422\\u0438\\u043f\", \"\\u0418\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0430\\u043a\\u0442\\u0443\\u0440\\u0430\"]}}]',9,1),(28,'2020-04-01 06:09:59.263360','6','test4',2,'[{\"changed\": {\"fields\": [\"\\u0422\\u0438\\u043f\", \"\\u0418\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0430\\u043a\\u0442\\u0443\\u0440\\u0430\"]}}]',9,1),(29,'2020-04-01 06:10:17.906959','7','Paginator5',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0430\\u043a\\u0442\\u0443\\u0440\\u0430\"]}}]',9,1),(30,'2020-04-01 06:22:32.076388','5','test3',2,'[]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'fcm_django','fcmdevice'),(6,'sessions','session'),(8,'sports_area','category'),(10,'sports_area','gallery'),(12,'sports_area','infrastructure'),(9,'sports_area','sportsarea'),(11,'sports_area','type');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-23 15:22:48.766233'),(2,'auth','0001_initial','2020-03-23 15:22:49.311250'),(3,'admin','0001_initial','2020-03-23 15:22:51.079234'),(4,'admin','0002_logentry_remove_auto_add','2020-03-23 15:22:51.455371'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-23 15:22:51.498007'),(6,'contenttypes','0002_remove_content_type_name','2020-03-23 15:22:51.817451'),(7,'auth','0002_alter_permission_name_max_length','2020-03-23 15:22:52.011826'),(8,'auth','0003_alter_user_email_max_length','2020-03-23 15:22:52.206411'),(9,'auth','0004_alter_user_username_opts','2020-03-23 15:22:52.236670'),(10,'auth','0005_alter_user_last_login_null','2020-03-23 15:22:52.396366'),(11,'auth','0006_require_contenttypes_0002','2020-03-23 15:22:52.406241'),(12,'auth','0007_alter_validators_add_error_messages','2020-03-23 15:22:52.425140'),(13,'auth','0008_alter_user_username_max_length','2020-03-23 15:22:52.634353'),(14,'auth','0009_alter_user_last_name_max_length','2020-03-23 15:22:52.831720'),(15,'auth','0010_alter_group_name_max_length','2020-03-23 15:22:52.998504'),(16,'auth','0011_update_proxy_permissions','2020-03-23 15:22:53.036337'),(17,'fcm_django','0001_initial','2020-03-23 15:22:53.123802'),(18,'fcm_django','0002_auto_20160808_1645','2020-03-23 15:22:53.560272'),(19,'fcm_django','0003_auto_20170313_1314','2020-03-23 15:22:53.580932'),(20,'fcm_django','0004_auto_20181128_1642','2020-03-23 15:22:53.605737'),(21,'fcm_django','0005_auto_20170808_1145','2020-03-23 15:22:53.994486'),(22,'sessions','0001_initial','2020-03-23 15:22:54.075725'),(23,'sports_area','0001_initial','2020-03-23 15:22:54.377001'),(24,'sports_area','0002_auto_20200316_0754','2020-03-23 15:22:55.217110'),(25,'sports_area','0003_auto_20200320_1415','2020-03-23 15:22:55.390075'),(26,'sports_area','0004_auto_20200322_1551','2020-03-23 15:22:55.784843'),(27,'sports_area','0005_auto_20200323_1535','2020-03-23 15:35:25.059427'),(28,'sports_area','0005_auto_20200331_1117','2020-03-31 16:47:52.858802'),(29,'sports_area','0006_auto_20200331_1148','2020-03-31 16:53:39.616590'),(30,'sports_area','0007_merge_20200331_1647','2020-03-31 16:53:40.456903'),(31,'sports_area','0008_auto_20200331_1652','2020-03-31 16:53:41.042902');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('36q7v46flp8dfr7h1uaz1351lnts0o1t','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-13 11:10:31.739969'),('37rebocjtvd5dq354wg5g7wghei6cg6k','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-06 15:42:41.038079'),('3pug6997334nhts6eyy7j1qygn1jg9yg','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-14 14:50:38.180065'),('592qt3axpo6slabvfn2vffy3tpr2uqwi','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-07 06:35:50.681078'),('62af7pplun009airo9rw4yzzqbti5yqb','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-14 16:49:18.187751'),('672romc40brl3gyg20piycaej2v3fblw','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-18 12:12:28.564168'),('8zamt6oao8o9cygal35ye3ldt4t8186q','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-12 12:43:18.323125'),('d0blsigwqtcchmc524a5f6vy47kfevb3','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-29 21:48:41.181297'),('d71vklsivcoob31qu435d24871440ef2','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-09 13:29:01.416927'),('fiptdqzkvaw84i545c0t4jqlippn0e7q','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-05-06 08:10:43.195185'),('nfxgwatzeucnd7r0sgud3o3qd6zkbkrv','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-13 11:09:34.300804'),('teditgolexwd669azp29sbf64sqfl0b3','YWExMTlkMWQxYWI1YWFiYTFjNDc1ZmI0OGZjMWVlNmVlNDUwMDE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmMxODcwNzY3OTFmNTQ5ZTBiMGU4NjM2NDk4Njc2NTE0ZWJiOWViIn0=','2020-04-06 15:23:32.813022');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fcm_django_fcmdevice`
--

DROP TABLE IF EXISTS `fcm_django_fcmdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcm_django_fcmdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `device_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fcm_django_fcmdevice_device_id_a9406c36` (`device_id`),
  KEY `fcm_django_fcmdevice_user_id_6cdfc0a2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `fcm_django_fcmdevice_user_id_6cdfc0a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcm_django_fcmdevice`
--

LOCK TABLES `fcm_django_fcmdevice` WRITE;
/*!40000 ALTER TABLE `fcm_django_fcmdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `fcm_django_fcmdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_category`
--

DROP TABLE IF EXISTS `sports_area_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numeration` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_category`
--

LOCK TABLES `sports_area_category` WRITE;
/*!40000 ALTER TABLE `sports_area_category` DISABLE KEYS */;
INSERT INTO `sports_area_category` VALUES (1,'Футбол','categories/Football.jpg',1);
/*!40000 ALTER TABLE `sports_area_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_gallery`
--

DROP TABLE IF EXISTS `sports_area_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sports_area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sports_area_gallery_sports_area_id_89450135_fk_sports_ar` (`sports_area_id`),
  CONSTRAINT `sports_area_gallery_sports_area_id_89450135_fk_sports_ar` FOREIGN KEY (`sports_area_id`) REFERENCES `sports_area_sportsarea` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_gallery`
--

LOCK TABLES `sports_area_gallery` WRITE;
/*!40000 ALTER TABLE `sports_area_gallery` DISABLE KEYS */;
INSERT INTO `sports_area_gallery` VALUES (2,'galleries/20191115_170325_KIPqKp0.jpg',2),(3,'galleries/20191115_170443.jpg',2),(4,'galleries/20191115_165844_2.jpg',2),(5,'galleries/Screen_Shot_2020-03-12_at_00.12.08.png',7),(6,'galleries/Screen_Shot_2020-03-22_at_01.16.35.png',7);
/*!40000 ALTER TABLE `sports_area_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_infrastructure`
--

DROP TABLE IF EXISTS `sports_area_infrastructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_infrastructure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sports_area_infrastr_category_id_0ac085f7_fk_sports_ar` (`category_id`),
  CONSTRAINT `sports_area_infrastr_category_id_0ac085f7_fk_sports_ar` FOREIGN KEY (`category_id`) REFERENCES `sports_area_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_infrastructure`
--

LOCK TABLES `sports_area_infrastructure` WRITE;
/*!40000 ALTER TABLE `sports_area_infrastructure` DISABLE KEYS */;
INSERT INTO `sports_area_infrastructure` VALUES (1,'Освещение','infrastructures/освещение.png',1),(2,'Душ','infrastructures/душ.png',1),(3,'Раздевалки','infrastructures/раздевалка.png',1),(4,'Парковка','infrastructures/парковка.png',1),(5,'Трибуна','infrastructures/трибуна.png',1),(6,'Инвентарь','infrastructures/инвентарь.png',1);
/*!40000 ALTER TABLE `sports_area_infrastructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_sportsarea`
--

DROP TABLE IF EXISTS `sports_area_sportsarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_sportsarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `open_time` time(6) NOT NULL,
  `close_time` time(6) NOT NULL,
  `phone_1` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `admin_id` int NOT NULL,
  `category_id` int NOT NULL,
  `instagram` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `whats_app_phone` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sports_area_sportsarea_admin_id_2d35d567_fk_auth_user_id` (`admin_id`),
  KEY `sports_area_sportsar_category_id_14cc7705_fk_sports_ar` (`category_id`),
  KEY `sports_area_sportsarea_type_id_e0834476` (`type_id`),
  CONSTRAINT `sports_area_sportsar_category_id_14cc7705_fk_sports_ar` FOREIGN KEY (`category_id`) REFERENCES `sports_area_category` (`id`),
  CONSTRAINT `sports_area_sportsarea_admin_id_2d35d567_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sports_area_sportsarea_type_id_e0834476_fk_sports_area_type_id` FOREIGN KEY (`type_id`) REFERENCES `sports_area_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_sportsarea`
--

LOCK TABLES `sports_area_sportsarea` WRITE;
/*!40000 ALTER TABLE `sports_area_sportsarea` DISABLE KEYS */;
INSERT INTO `sports_area_sportsarea` VALUES (2,'Kg sport','very good sport area','6-micro rayon','15:24:24.000000','15:24:24.000000','0705050035','0999050035',1000,1,1,'sports_area/20191115_170031_SMjYAwn.jpg','2020-03-23 15:24:24.000000',42.707669,74.674356,1,1,'https://www.instagram.com/azamat_zyntemirov','0705050035',1),(3,'Test','Test','test','13:26:28.000000','13:26:28.000000','+996707411212',NULL,5000,1,1,'sports_area/F105728_1000x1000_open.jpg','2020-03-24 13:26:28.000000',42,72,1,1,NULL,NULL,1),(4,'test2','test2','test2','13:43:02.000000','13:43:02.000000','test2',NULL,1330,1,1,'sports_area/kz-ru_WF8590NGW-YLP_001_Front.png','2020-03-24 13:43:02.000000',43,74,1,1,NULL,NULL,1),(5,'test3','test3','test3','13:45:08.000000','13:45:08.000000','test3',NULL,2000,1,1,'sports_area/ItunesArtwork2x.png','2020-03-24 13:45:08.000000',34,65,1,1,NULL,NULL,2),(6,'test4','test4','test4','13:57:19.000000','13:57:19.000000','test4',NULL,1234,1,1,'sports_area/Screen_Shot_2020-03-12_at_00.12.08.png','2020-03-24 13:57:19.000000',12,32,1,1,NULL,NULL,3),(7,'Paginator5','Paginator5','Paginator5','13:58:45.000000','13:58:45.000000','Paginator5',NULL,9999,1,1,'sports_area/Screen_Shot_2020-03-22_at_01.16.35.png','2020-03-24 13:58:45.000000',54,32,1,1,NULL,NULL,1);
/*!40000 ALTER TABLE `sports_area_sportsarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_sportsarea_infrastructure`
--

DROP TABLE IF EXISTS `sports_area_sportsarea_infrastructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_sportsarea_infrastructure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sportsarea_id` int NOT NULL,
  `infrastructure_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sports_area_sportsarea_i_sportsarea_id_infrastruc_ab0f8983_uniq` (`sportsarea_id`,`infrastructure_id`),
  KEY `sports_area_sportsar_infrastructure_id_fdc313bf_fk_sports_ar` (`infrastructure_id`),
  CONSTRAINT `sports_area_sportsar_infrastructure_id_fdc313bf_fk_sports_ar` FOREIGN KEY (`infrastructure_id`) REFERENCES `sports_area_infrastructure` (`id`),
  CONSTRAINT `sports_area_sportsar_sportsarea_id_c2ddc208_fk_sports_ar` FOREIGN KEY (`sportsarea_id`) REFERENCES `sports_area_sportsarea` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_sportsarea_infrastructure`
--

LOCK TABLES `sports_area_sportsarea_infrastructure` WRITE;
/*!40000 ALTER TABLE `sports_area_sportsarea_infrastructure` DISABLE KEYS */;
INSERT INTO `sports_area_sportsarea_infrastructure` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,3,1),(6,3,2),(7,3,6),(8,5,1),(9,5,2),(10,5,3),(11,5,5),(12,6,3),(13,6,4),(14,6,5),(15,7,2),(16,7,3);
/*!40000 ALTER TABLE `sports_area_sportsarea_infrastructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_area_type`
--

DROP TABLE IF EXISTS `sports_area_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_area_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sports_area_type_category_id_247e1440_fk_sports_area_category_id` (`category_id`),
  CONSTRAINT `sports_area_type_category_id_247e1440_fk_sports_area_category_id` FOREIGN KEY (`category_id`) REFERENCES `sports_area_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_area_type`
--

LOCK TABLES `sports_area_type` WRITE;
/*!40000 ALTER TABLE `sports_area_type` DISABLE KEYS */;
INSERT INTO `sports_area_type` VALUES (1,'Мини','types/mini.jpg',1),(2,'Футзал','types/futsal.jpg',1),(3,'Большой','types/big.jpg',1);
/*!40000 ALTER TABLE `sports_area_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 14:21:10