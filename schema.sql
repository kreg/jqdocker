-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: tripnscan_stg
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `4d_log`
--

DROP TABLE IF EXISTS `4d_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `4d_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `4d_id` int(11) DEFAULT NULL,
  `table_name` varchar(20) DEFAULT NULL,
  `tns_id` int(11) DEFAULT NULL,
  `field_name` varchar(20) DEFAULT NULL,
  `kind` varchar(1) DEFAULT NULL,
  `contents` text,
  `4d_date` datetime DEFAULT NULL,
  `delete_flag` tinyint(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `4d_id` (`4d_id`,`tns_id`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_sessions`
--

DROP TABLE IF EXISTS `account_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `session_token` varchar(40) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `account_sessions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` text NOT NULL,
  `email` text NOT NULL,
  `time_zone` text NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9031 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_reset_tokens`
--

DROP TABLE IF EXISTS `accounts_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_reset_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `reset_token` varchar(50) DEFAULT NULL,
  `invalid` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `accounts_reset_tokens_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_signup_tokens`
--

DROP TABLE IF EXISTS `accounts_signup_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_signup_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `signup_token` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `type` text NOT NULL,
  `invalid` tinyint(4) NOT NULL DEFAULT '0',
  `invited_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_categories`
--

DROP TABLE IF EXISTS `dcr_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(20) DEFAULT NULL,
  `name` text NOT NULL,
  `code` varchar(50) NOT NULL,
  `level` int(2) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `min_geom_lat` int(11) NOT NULL,
  `min_geom_lng` float NOT NULL,
  `center_geom_lat` float NOT NULL,
  `center_geom_lng` float NOT NULL,
  `max_geom_lat` float NOT NULL,
  `max_geom_lng` float NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_categories` (`kind`,`code`,`level`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_place_branches`
--

DROP TABLE IF EXISTS `dcr_place_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_place_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v_place_cd` varchar(50) NOT NULL,
  `project_cd` varchar(50) DEFAULT NULL,
  `facility_types` varchar(20) DEFAULT NULL,
  `dcr_parent_vplace_cd` varchar(50) DEFAULT NULL,
  `geom_lat` double NOT NULL,
  `geom_lng` double NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_place_branches` (`v_place_cd`,`facility_types`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_place_categories`
--

DROP TABLE IF EXISTS `dcr_place_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_place_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_branch_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_place_categories` (`place_branch_id`,`category_id`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_place_tags`
--

DROP TABLE IF EXISTS `dcr_place_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_place_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_branch_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_place_tags` (`place_branch_id`,`tag_id`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_tags`
--

DROP TABLE IF EXISTS `dcr_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `category` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_tags` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcr_v_places`
--

DROP TABLE IF EXISTS `dcr_v_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcr_v_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v_place_cd` varchar(50) NOT NULL,
  `place_cd` varchar(50) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dcr_v_places` (`v_place_cd`,`place_cd`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generals`
--

DROP TABLE IF EXISTS `generals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `general_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT 'text',
  `body` text NOT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `main_tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_generals_on_lang_cd_and_general_cd` (`lang_cd`,`general_cd`),
  KEY `index_generals_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1909 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generals_addinfo`
--

DROP TABLE IF EXISTS `generals_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generals_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'text',
  `enabled` tinyint(1) DEFAULT '1',
  `display_body` tinyint(1) DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_generals_on_lang_cd_and_general_cd` (`lang_cd`,`origin_cd`),
  KEY `index_generals_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotel_categories`
--

DROP TABLE IF EXISTS `hotel_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `hotel_category_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `parent_hotel_category_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_hotel_categories_on_lang_cd_and_hotel_category_cd` (`lang_cd`,`hotel_category_cd`),
  KEY `index_hotel_categories_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotel_simple_guides`
--

DROP TABLE IF EXISTS `hotel_simple_guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_simple_guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `hotel_simple_guide_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `hotel_category_id` int(11) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `display_order` int(11) NOT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `main_tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_hotel_simple_guides_on_lang_cd_and_hotel_simple_guide_cd` (`lang_cd`,`hotel_simple_guide_cd`),
  KEY `index_hotel_simple_guides_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1964 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotel_simple_guides_addinfo`
--

DROP TABLE IF EXISTS `hotel_simple_guides_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_simple_guides_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `display_description` tinyint(1) DEFAULT '1',
  `display_contact` tinyint(1) DEFAULT '1',
  `display_location` tinyint(1) DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hotel_simple_guides_addinfo_on_lang_cd_and_general_cd` (`lang_cd`,`origin_cd`),
  KEY `index_hotel_simple_guides_addinfo_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=6621 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `pri_image_url` varchar(300) DEFAULT NULL,
  `image_migration_flag` tinyint(1) DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_images_on_general_id` (`general_id`),
  KEY `index_images_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_categories`
--

DROP TABLE IF EXISTS `menu_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `menu_category_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `parent_menu_category_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_menu_categories_on_lang_cd_and_menu_category_cd` (`lang_cd`,`menu_category_cd`),
  KEY `index_menu_categories_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=7794 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `menu_item_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `menu_category_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(20) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `main_tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_menu_items_on_lang_cd_and_menu_item_cd` (`lang_cd`,`menu_item_cd`),
  KEY `index_menu_items_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8424 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_items_addinfo`
--

DROP TABLE IF EXISTS `menu_items_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `display_description` tinyint(1) DEFAULT '1',
  `display_price` tinyint(1) DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menu_items_addinfo_on_lang_cd_and_general_cd` (`lang_cd`,`origin_cd`),
  KEY `index_menu_items_addinfo_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=7861 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opt_infos`
--

DROP TABLE IF EXISTS `opt_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opt_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `place_cd` varchar(50) NOT NULL,
  `type_image_url` int(11) DEFAULT NULL,
  `value` text,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_opt_info` (`lang_cd`,`place_cd`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_account_projects`
--

DROP TABLE IF EXISTS `permission_account_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_account_projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `project_cd` varchar(50) NOT NULL,
  `lang_cd` varchar(10) NOT NULL,
  `level` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `permission_account_projects_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5714 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `place_cd` varchar(50) NOT NULL,
  `place_type` varchar(30) NOT NULL,
  `google_place_id` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `name_ruby` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `geom_lat` float NOT NULL,
  `geom_lng` float NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `address_3` varchar(200) NOT NULL,
  `address_4` varchar(200) DEFAULT NULL,
  `address_1_ruby` varchar(200) DEFAULT NULL,
  `address_2_ruby` varchar(200) DEFAULT NULL,
  `address_3_ruby` varchar(200) DEFAULT NULL,
  `address_4_ruby` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `tax_included` tinyint(1) DEFAULT NULL,
  `additional_charge` varchar(200) DEFAULT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `single_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `free_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `imagetag_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `discover_status` int(2) NOT NULL DEFAULT '0',
  `testdata_flag` tinyint(1) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_places_on_lang_cd_and_place_cd` (`lang_cd`,`place_cd`),
  KEY `index_places_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=11521 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `places_addinfo`
--

DROP TABLE IF EXISTS `places_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `place_cd` varchar(50) NOT NULL,
  `name_ruby` varchar(200) DEFAULT NULL,
  `address_1_ruby` varchar(200) DEFAULT NULL,
  `address_2_ruby` varchar(200) DEFAULT NULL,
  `address_3_ruby` varchar(200) DEFAULT NULL,
  `address_4_ruby` varchar(200) DEFAULT NULL,
  `single_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `free_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `imagetag_display_style` varchar(20) NOT NULL DEFAULT 'list',
  `display_email` tinyint(1) DEFAULT '1',
  `display_phone` tinyint(1) DEFAULT '1',
  `display_country` tinyint(1) DEFAULT '1',
  `display_zip_code` tinyint(1) DEFAULT '1',
  `display_address` tinyint(1) DEFAULT '1',
  `display_description` tinyint(1) DEFAULT '1',
  `display_tax_included` tinyint(1) DEFAULT '1',
  `display_additional_charges` tinyint(1) DEFAULT '1',
  `icon_url_email` varchar(250) DEFAULT NULL,
  `icon_url_phone` varchar(250) DEFAULT NULL,
  `icon_url_country` varchar(250) DEFAULT NULL,
  `icon_url_zip_code` varchar(250) DEFAULT NULL,
  `icon_url_address` varchar(250) DEFAULT NULL,
  `icon_url_description` varchar(250) DEFAULT NULL,
  `icon_url_tax_included` varchar(250) DEFAULT NULL,
  `icon_url_additional_charge` varchar(250) DEFAULT NULL,
  `discover_status` tinyint(1) NOT NULL DEFAULT '0',
  `testdata_flag` tinyint(1) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_places_on_lang_cd_and_place_cd` (`lang_cd`,`place_cd`),
  KEY `index_places_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_block_elms`
--

DROP TABLE IF EXISTS `project_block_elms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_block_elms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_block_id` varchar(10) DEFAULT NULL,
  `project_cd` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_blocks`
--

DROP TABLE IF EXISTS `project_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_type` varchar(30) DEFAULT NULL,
  `all_lang_name` varchar(200) DEFAULT NULL,
  `place_cd` varchar(50) DEFAULT NULL,
  `display_style` varchar(20) DEFAULT NULL,
  `display_price` varchar(20) DEFAULT NULL,
  `block_order` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `delete_flag` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `project_cd` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `project_type` varchar(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `display_style` varchar(20) DEFAULT NULL,
  `display_price` varchar(20) NOT NULL,
  `display_order` varchar(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `segment_status` int(2) NOT NULL DEFAULT '0',
  `discover_status` int(2) NOT NULL DEFAULT '0',
  `display_addphoto` tinyint(1) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  `csv_status` int(5) DEFAULT '0',
  `csv_path` varchar(200) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lang_cd_and_project_cd` (`lang_cd`,`project_cd`),
  KEY `index_projects_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9620 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_addinfo`
--

DROP TABLE IF EXISTS `projects_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `project_cd` varchar(50) NOT NULL,
  `display_style` varchar(20) NOT NULL DEFAULT 'list',
  `display_price` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` tinyint(1) NOT NULL DEFAULT '1',
  `discover_status` tinyint(1) NOT NULL DEFAULT '0',
  `display_addphoto` tinyint(1) NOT NULL DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lang_cd_and_project_cd` (`lang_cd`,`project_cd`),
  KEY `index_projects_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_segments`
--

DROP TABLE IF EXISTS `projects_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_segments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_cd` varchar(50) NOT NULL,
  `lang_cd` varchar(10) NOT NULL,
  `stage` text NOT NULL,
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `4d_id` int(11) unsigned NOT NULL,
  `segment_key` varchar(145) NOT NULL DEFAULT '',
  `project_cd` varchar(50) DEFAULT '',
  `lang_cd` varchar(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  `type_cd` varchar(50) NOT NULL,
  `field` varchar(50) NOT NULL,
  `kz_edited_flag` tinyint(4) NOT NULL DEFAULT '0',
  `source` text,
  `guideline` text,
  `target` text,
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0',
  `warning_kind` varchar(1) DEFAULT NULL,
  `warning_message` text,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `segment_key` (`segment_key`),
  KEY `index_segments_on_project_cd` (`project_cd`),
  KEY `index_segments_on_segment_key` (`segment_key`),
  KEY `index_segments_on_lang_cd` (`lang_cd`),
  KEY `index_segments_on_type_cd` (`type_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=19222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_items`
--

DROP TABLE IF EXISTS `shop_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `shop_item_cd` varchar(50) NOT NULL,
  `previous_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `prcdate` varchar(50) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `price` varchar(20) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `sub_category_name` varchar(200) DEFAULT NULL,
  `master_flag` tinyint(1) NOT NULL,
  `translation_to` varchar(100) DEFAULT NULL,
  `translation_from` varchar(10) DEFAULT NULL,
  `main_tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `tns_image_url_public_id` varchar(300) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` float(5,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`id`),
  KEY `index_shop_items_on_lang_cd_and_shop_item_cd` (`lang_cd`,`shop_item_cd`),
  KEY `index_shop_items_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2372 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_items_addinfo`
--

DROP TABLE IF EXISTS `shop_items_addinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_items_addinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_cd` varchar(10) NOT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `display_description` tinyint(1) DEFAULT '1',
  `display_price` tinyint(1) DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shop_items_addinfo_on_lang_cd_and_general_cd` (`lang_cd`,`origin_cd`),
  KEY `index_shop_items_addinfo_delete_flag` (`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=6476 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tns_edit_accounts`
--

DROP TABLE IF EXISTS `tns_edit_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tns_edit_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_login_token` varchar(50) NOT NULL,
  `preferred_language_code` varchar(10) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_name` text NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `place_cds` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tns_edit_accounts_on_auto_login_token_and_place_cds` (`auto_login_token`,`place_cds`(255))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tns_image_urls`
--

DROP TABLE IF EXISTS `tns_image_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tns_image_urls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_cd` varchar(50) DEFAULT NULL,
  `origin_cd` varchar(50) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `pri_image_url` varchar(250) DEFAULT NULL,
  `public_id` varchar(100) DEFAULT NULL,
  `user_id` varchar(300) DEFAULT NULL,
  `user_type` varchar(300) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `bytes` varchar(50) DEFAULT NULL,
  `main_flag` tinyint(1) DEFAULT '0',
  `shop_flag` tinyint(1) DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tns_image_url` (`project_cd`,`delete_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tns_view_accounts`
--

DROP TABLE IF EXISTS `tns_view_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tns_view_accounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  `access_token` varchar(40) DEFAULT NULL,
  `name` text NOT NULL,
  `lang_cd` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `auth_payload` text,
  `user_payload` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tns_view_account` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `place_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `update` varchar(300) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `project_id` (`project_id`),
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_images`
--

DROP TABLE IF EXISTS `user_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_cd` varchar(50) NOT NULL,
  `project_cd` varchar(50) NOT NULL,
  `project_type` varchar(30) NOT NULL,
  `table_name` varchar(50) NOT NULL DEFAULT '',
  `image_url` varchar(300) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_user_images_on_project_cd_and_table_cd` (`project_cd`,`table_cd`),
  KEY `index_user_images_delete_flag` (`delete_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-28 13:16:15
