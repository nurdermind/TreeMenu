-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: uptrader_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add menu',7,'add_menu'),(26,'Can change menu',7,'change_menu'),(27,'Can delete menu',7,'delete_menu'),(28,'Can view menu',7,'view_menu');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$nf9ohoFGjp9y89a1veyIg8$lvdnWKOpMvwlWaao/x9Yw6+iuwoIq5oIRmc/BCfGZ4w=','2023-03-06 08:55:13.686488',1,'admin','','','admin@django.ru',1,1,'2023-03-06 08:54:56.329568');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-06 08:56:17.534741','1','Hard skills',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu\", \"object\": \"Python\"}}, {\"added\": {\"name\": \"menu\", \"object\": \"JS\"}}]',7,1),(2,'2023-03-06 08:56:42.540186','2','Python',2,'[{\"added\": {\"name\": \"menu\", \"object\": \"Django\"}}]',7,1),(3,'2023-03-06 08:57:32.079986','4','Django',2,'[{\"added\": {\"name\": \"menu\", \"object\": \"DRF\"}}, {\"added\": {\"name\": \"menu\", \"object\": \"CELERY\"}}]',7,1),(4,'2023-03-06 08:58:04.723068','7','Soft skills',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu\", \"object\": \"Fast learning\"}}]',7,1),(5,'2023-03-06 08:58:39.316200','9','Other',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu\", \"object\": \"Rehto\"}}]',7,1),(6,'2023-03-06 08:58:57.531713','1','Hard skills',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(7,'2023-03-06 08:59:04.035943','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(8,'2023-03-06 08:59:44.898280','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(9,'2023-03-06 08:59:52.656378','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(10,'2023-03-06 09:00:16.753460','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(11,'2023-03-06 09:00:56.278827','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(12,'2023-03-06 09:02:38.199181','11','Skills',1,'[{\"added\": {}}]',7,1),(13,'2023-03-06 09:03:33.888615','1','Hard skills',2,'[{\"changed\": {\"fields\": [\"Name\", \"Parent\", \"Url\"]}}]',7,1),(14,'2023-03-06 09:04:08.623005','7','Soft skills',2,'[{\"changed\": {\"fields\": [\"Name\", \"Parent\", \"Url\"]}}]',7,1),(15,'2023-03-06 17:49:17.129322','1','Hard skills',2,'[{\"changed\": {\"name\": \"menu\", \"object\": \"Python\", \"fields\": [\"Url\"]}}]',7,1),(16,'2023-03-06 17:49:32.615629','1','Hard skills',2,'[{\"changed\": {\"name\": \"menu\", \"object\": \"JS\", \"fields\": [\"Url\"]}}]',7,1),(17,'2023-03-06 17:49:49.215191','2','Python',2,'[{\"changed\": {\"name\": \"menu\", \"object\": \"Django\", \"fields\": [\"Url\"]}}]',7,1),(18,'2023-03-06 17:50:02.750920','4','Django',2,'[{\"changed\": {\"name\": \"menu\", \"object\": \"DRF\", \"fields\": [\"Url\"]}}, {\"changed\": {\"name\": \"menu\", \"object\": \"CELERY\", \"fields\": [\"Url\"]}}]',7,1),(19,'2023-03-06 17:50:37.589810','8','Fast learning',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'tree_menu','menu');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-06 08:54:53.607861'),(2,'auth','0001_initial','2023-03-06 08:54:54.275705'),(3,'admin','0001_initial','2023-03-06 08:54:54.435225'),(4,'admin','0002_logentry_remove_auto_add','2023-03-06 08:54:54.450291'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-06 08:54:54.465337'),(6,'contenttypes','0002_remove_content_type_name','2023-03-06 08:54:54.552252'),(7,'auth','0002_alter_permission_name_max_length','2023-03-06 08:54:54.622739'),(8,'auth','0003_alter_user_email_max_length','2023-03-06 08:54:54.659859'),(9,'auth','0004_alter_user_username_opts','2023-03-06 08:54:54.675584'),(10,'auth','0005_alter_user_last_login_null','2023-03-06 08:54:54.739514'),(11,'auth','0006_require_contenttypes_0002','2023-03-06 08:54:54.746148'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-06 08:54:54.759965'),(13,'auth','0008_alter_user_username_max_length','2023-03-06 08:54:54.831801'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-06 08:54:54.901270'),(15,'auth','0010_alter_group_name_max_length','2023-03-06 08:54:54.932561'),(16,'auth','0011_update_proxy_permissions','2023-03-06 08:54:54.948393'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-06 08:54:55.023386'),(18,'sessions','0001_initial','2023-03-06 08:54:55.070477'),(19,'tree_menu','0001_initial','2023-03-06 08:54:55.152640'),(20,'tree_menu','0002_menu_delete_treelink','2023-03-06 08:54:55.253192'),(21,'tree_menu','0003_menu_title','2023-03-06 08:54:55.293653'),(22,'tree_menu','0004_remove_menu_parent_remove_menu_title_remove_menu_url_and_more','2023-03-06 08:54:55.536021'),(23,'tree_menu','0005_menu_parent_menu_title_menu_url_delete_menulink','2023-03-06 08:54:55.702814');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('rloy4a797w6syqcd6bqc83l1ca8wu0vo','.eJxVjDsOwjAQBe_iGlnYWX-Wkj5nsHadNQ6gRIqTCnF3iJQC2jcz76USbWtNW5MljYO6KKNOvxtTfsi0g-FO023WeZ7WZWS9K_qgTffzIM_r4f4dVGr1W_tAGRwCO47gKULxlk1ARjpbIWboCkl0BSlT50LGEIr1AmjEAoJ6fwDngzfr:1pZ6cj:7n-l0PbbYZxg4D7VzrkSvh4Pt3B5RE8JqJqJgglsig4','2023-03-20 08:55:13.692688');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_menu_menu`
--

DROP TABLE IF EXISTS `tree_menu_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_menu_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tree_menu_menu_parent_id_5be50dfe_fk_tree_menu_menu_id` (`parent_id`),
  CONSTRAINT `tree_menu_menu_parent_id_5be50dfe_fk_tree_menu_menu_id` FOREIGN KEY (`parent_id`) REFERENCES `tree_menu_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_menu_menu`
--

LOCK TABLES `tree_menu_menu` WRITE;
/*!40000 ALTER TABLE `tree_menu_menu` DISABLE KEYS */;
INSERT INTO `tree_menu_menu` VALUES (1,'my-skills',11,'Hard skills','/skills/hard-skills'),(2,'python',1,'Python','/skills/hard-skills/python/'),(3,'js',1,'JS','/skills/hard-skills/js/'),(4,'django',2,'Django','/skills/hard-skills/python/django/'),(5,'drf',4,'DRF','/skills/hard-skills/python/django/drf/'),(6,'celery',4,'CELERY','/skills/hard-skills/python/django/celery/'),(7,'my-skills',11,'Soft skills','/skills/soft-skills/'),(8,'fast-learning',7,'Fast learning','/skills//soft-skills/fast-learning/'),(9,'other',NULL,'Other','/other/'),(10,'rehto',9,'Rehto','/other/rehto'),(11,'skills',NULL,'Skills','skills');
/*!40000 ALTER TABLE `tree_menu_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 17:55:12
