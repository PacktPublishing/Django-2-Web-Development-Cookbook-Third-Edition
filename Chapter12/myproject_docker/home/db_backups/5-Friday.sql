-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: myproject_db
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletin_board_bulletin`
--

DROP TABLE IF EXISTS `bulletin_board_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_board_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `bulletin_type` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletin_board_bulle_category_id_135a33c7_fk_bulletin_` (`category_id`),
  CONSTRAINT `bulletin_board_bulle_category_id_135a33c7_fk_bulletin_` FOREIGN KEY (`category_id`) REFERENCES `bulletin_board_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletin_board_category`
--

DROP TABLE IF EXISTS `bulletin_board_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_board_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_aliaspluginmodel`
--

DROP TABLE IF EXISTS `cms_aliaspluginmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_aliaspluginmodel` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `alias_placeholder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` (`plugin_id`),
  KEY `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` (`alias_placeholder_id`),
  CONSTRAINT `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` FOREIGN KEY (`alias_placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` FOREIGN KEY (`plugin_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_cmsplugin`
--

DROP TABLE IF EXISTS `cms_cmsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(5) unsigned NOT NULL,
  `language` varchar(15) NOT NULL,
  `plugin_type` varchar(50) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `placeholder_id` int(11) DEFAULT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_cmsplugin_path_4917bb44_uniq` (`path`),
  KEY `cms_cmsplugin_language_bbea8a48` (`language`),
  KEY `cms_cmsplugin_plugin_type_94e96ebf` (`plugin_type`),
  KEY `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` (`parent_id`),
  KEY `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` (`placeholder_id`),
  CONSTRAINT `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_extensions_cssextension`
--

DROP TABLE IF EXISTS `cms_extensions_cssextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_extensions_cssextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_item_css_class` varchar(200) NOT NULL,
  `body_css_class` varchar(200) NOT NULL,
  `extended_object_id` int(11) NOT NULL,
  `public_extension_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extended_object_id` (`extended_object_id`),
  UNIQUE KEY `public_extension_id` (`public_extension_id`),
  CONSTRAINT `cms_extensions_cssex_extended_object_id_c0a8a17a_fk_cms_page_` FOREIGN KEY (`extended_object_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_extensions_cssex_public_extension_id_d0d07794_fk_cms_exten` FOREIGN KEY (`public_extension_id`) REFERENCES `cms_extensions_cssextension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_globalpagepermission`
--

DROP TABLE IF EXISTS `cms_globalpagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` (`group_id`),
  KEY `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_globalpagepermission_sites`
--

DROP TABLE IF EXISTS `cms_globalpagepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_globalpagepermission_globalpagepermission_id__db684f41_uniq` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermis_site_id_00460b53_fk_django_si` (`site_id`),
  CONSTRAINT `cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa` FOREIGN KEY (`globalpagepermission_id`) REFERENCES `cms_globalpagepermission` (`id`),
  CONSTRAINT `cms_globalpagepermis_site_id_00460b53_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `changed_by` varchar(255) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `publication_end_date` datetime(6) DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) DEFAULT NULL,
  `navigation_extenders` varchar(80) DEFAULT NULL,
  `template` varchar(100) NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `limit_visibility_in_menu` smallint(6) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL,
  `application_urls` varchar(200) DEFAULT NULL,
  `application_namespace` varchar(200) DEFAULT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `xframe_options` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `is_page_type` tinyint(1) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_node_id_publisher_is_draft_c1293d6a_uniq` (`node_id`,`publisher_is_draft`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_publication_date_684fabf7` (`publication_date`),
  KEY `cms_page_publication_end_date_12a0c46a` (`publication_end_date`),
  KEY `cms_page_in_navigation_01c24279` (`in_navigation`),
  KEY `cms_page_soft_root_51efccbe` (`soft_root`),
  KEY `cms_page_reverse_id_ffc9ede2` (`reverse_id`),
  KEY `cms_page_navigation_extenders_c24af8dd` (`navigation_extenders`),
  KEY `cms_page_limit_visibility_in_menu_30db6aa6` (`limit_visibility_in_menu`),
  KEY `cms_page_is_home_edadca07` (`is_home`),
  KEY `cms_page_application_urls_9ef47497` (`application_urls`),
  KEY `cms_page_publisher_is_draft_141cba60` (`publisher_is_draft`),
  CONSTRAINT `cms_page_node_id_c87b85a9_fk_cms_treenode_id` FOREIGN KEY (`node_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_page_publisher_public_id_d619fca0_fk_cms_page_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page_placeholders`
--

DROP TABLE IF EXISTS `cms_page_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` (`placeholder_id`),
  CONSTRAINT `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_pagepermission`
--

DROP TABLE IF EXISTS `cms_pagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_group_id_af5af193_fk_auth_group_id` (`group_id`),
  KEY `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` (`page_id`),
  KEY `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_pagepermission_group_id_af5af193_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_pageuser`
--

DROP TABLE IF EXISTS `cms_pageuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_pageusergroup`
--

DROP TABLE IF EXISTS `cms_pageusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_placeholder`
--

DROP TABLE IF EXISTS `cms_placeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_slot_0bc04d21` (`slot`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_placeholderreference`
--

DROP TABLE IF EXISTS `cms_placeholderreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholderreference` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `placeholder_ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_placeholderreference_placeholder_ref_id_244759b1` (`placeholder_ref_id`),
  CONSTRAINT `cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place` FOREIGN KEY (`placeholder_ref_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_staticplaceholder`
--

DROP TABLE IF EXISTS `cms_staticplaceholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_staticplaceholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `dirty` tinyint(1) NOT NULL,
  `creation_method` varchar(20) NOT NULL,
  `draft_id` int(11) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_staticplaceholder_code_site_id_21ba079c_uniq` (`code`,`site_id`),
  KEY `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` (`site_id`),
  KEY `cms_staticplaceholder_draft_id_5aee407b` (`draft_id`),
  KEY `cms_staticplaceholder_public_id_876aaa66` (`public_id`),
  CONSTRAINT `cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id` FOREIGN KEY (`draft_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id` FOREIGN KEY (`public_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_title`
--

DROP TABLE IF EXISTS `cms_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  `slug` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `redirect` varchar(2048) DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_title_language_page_id_61aaf084_uniq` (`language`,`page_id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_title_page_id_5fade2a3_fk_cms_page_id` (`page_id`),
  KEY `cms_title_language_50a0dfa1` (`language`),
  KEY `cms_title_slug_4947d146` (`slug`),
  KEY `cms_title_path_c484314c` (`path`),
  KEY `cms_title_has_url_overwrite_ecf27bb9` (`has_url_overwrite`),
  KEY `cms_title_publisher_is_draft_95874c88` (`publisher_is_draft`),
  KEY `cms_title_publisher_state_9a952b0f` (`publisher_state`),
  CONSTRAINT `cms_title_page_id_5fade2a3_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_title_publisher_public_id_003a2702_fk_cms_title_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_treenode`
--

DROP TABLE IF EXISTS `cms_treenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_treenode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` (`parent_id`),
  KEY `cms_treenode_site_id_d3f46985_fk_django_site_id` (`site_id`),
  CONSTRAINT `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_treenode_site_id_d3f46985_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_urlconfrevision`
--

DROP TABLE IF EXISTS `cms_urlconfrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_urlconfrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_usersettings`
--

DROP TABLE IF EXISTS `cms_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(10) NOT NULL,
  `clipboard_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` (`clipboard_id`),
  CONSTRAINT `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` FOREIGN KEY (`clipboard_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_usersettings_user_id_09633b2d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cv_curriculumvitae`
--

DROP TABLE IF EXISTS `cv_curriculumvitae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_curriculumvitae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cv_experience`
--

DROP TABLE IF EXISTS `cv_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `till_date` date DEFAULT NULL,
  `company` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `skills` longtext NOT NULL,
  `cv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cv_experience_cv_id_6f6720ee_fk_cv_curriculumvitae_id` (`cv_id`),
  CONSTRAINT `cv_experience_cv_id_6f6720ee_fk_cv_curriculumvitae_id` FOREIGN KEY (`cv_id`) REFERENCES `cv_curriculumvitae` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_app_category`
--

DROP TABLE IF EXISTS `demo_app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_app_idea`
--

DROP TABLE IF EXISTS `demo_app_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_author` varchar(255) NOT NULL,
  `meta_copyright` varchar(255) NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `title_en_us` varchar(200) NOT NULL,
  `title_en_gb` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  `description_en_us` longtext NOT NULL,
  `description_en_gb` longtext NOT NULL,
  `description_de` longtext NOT NULL,
  `description_fr` longtext NOT NULL,
  `description_lt` longtext NOT NULL,
  `content_en_us` longtext NOT NULL,
  `content_en_gb` longtext NOT NULL,
  `content_de` longtext NOT NULL,
  `content_fr` longtext NOT NULL,
  `content_lt` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_app_idea_categories`
--

DROP TABLE IF EXISTS `demo_app_idea_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_idea_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idea_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `demo_app_idea_categories_idea_id_category_id_5d885978_uniq` (`idea_id`,`category_id`),
  KEY `demo_app_idea_catego_category_id_70fd8f34_fk_demo_app_` (`category_id`),
  CONSTRAINT `demo_app_idea_catego_category_id_70fd8f34_fk_demo_app_` FOREIGN KEY (`category_id`) REFERENCES `demo_app_category` (`id`),
  CONSTRAINT `demo_app_idea_categories_idea_id_e80350fa_fk_demo_app_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `demo_app_idea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_app_like`
--

DROP TABLE IF EXISTS `demo_app_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `owner_object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demo_app_like_content_type_id_aa8a64e1_fk_django_content_type_id` (`content_type_id`),
  KEY `demo_app_like_owner_content_type_i_1e6abb3b_fk_django_co` (`owner_content_type_id`),
  CONSTRAINT `demo_app_like_content_type_id_aa8a64e1_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `demo_app_like_owner_content_type_i_1e6abb3b_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `editorial_editorialcontent`
--

DROP TABLE IF EXISTS `editorial_editorialcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorial_editorialcontent` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `website` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_caption` longtext NOT NULL,
  `css_class` varchar(255) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `editorial_editorialc_cmsplugin_ptr_id_cffa6a3c_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ideas_category`
--

DROP TABLE IF EXISTS `ideas_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ideas_idea`
--

DROP TABLE IF EXISTS `ideas_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_original` tinyint(1) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  `subtitle_en` varchar(200) NOT NULL,
  `subtitle_de` varchar(200) NOT NULL,
  `subtitle_fr` varchar(200) NOT NULL,
  `subtitle_lt` varchar(200) NOT NULL,
  `description_en` longtext NOT NULL,
  `description_de` longtext NOT NULL,
  `description_fr` longtext NOT NULL,
  `description_lt` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ideas_idea_categories`
--

DROP TABLE IF EXISTS `ideas_idea_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_idea_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idea_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ideas_idea_categories_idea_id_category_id_17cddda9_uniq` (`idea_id`,`category_id`),
  KEY `ideas_idea_categories_category_id_cc92c958_fk_ideas_category_id` (`category_id`),
  CONSTRAINT `ideas_idea_categories_category_id_cc92c958_fk_ideas_category_id` FOREIGN KEY (`category_id`) REFERENCES `ideas_category` (`id`),
  CONSTRAINT `ideas_idea_categories_idea_id_567765c1_fk_ideas_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `ideas_idea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `likes_like`
--

DROP TABLE IF EXISTS `likes_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` (`content_type_id`),
  KEY `likes_like_user_id_aae4c421_fk_auth_user_id` (`user_id`),
  CONSTRAINT `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_like_user_id_aae4c421_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations_location`
--

DROP TABLE IF EXISTS `locations_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `street` varchar(255) NOT NULL,
  `street2` varchar(255) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `locations_location_slug_0338bba7` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `magazine_newsarticle`
--

DROP TABLE IF EXISTS `magazine_newsarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magazine_newsarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menus_cachekey`
--

DROP TABLE IF EXISTS `menus_cachekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_cachekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `site` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_actor`
--

DROP TABLE IF EXISTS `movies_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_category`
--

DROP TABLE IF EXISTS `movies_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_category_lft_2225bfcc` (`lft`),
  KEY `movies_category_rght_37a7984f` (`rght`),
  KEY `movies_category_tree_id_e3b88b37` (`tree_id`),
  KEY `movies_category_level_06308565` (`level`),
  KEY `movies_category_parent_id_08f81fa5` (`parent_id`),
  CONSTRAINT `movies_category_parent_id_08f81fa5_fk_movies_category_id` FOREIGN KEY (`parent_id`) REFERENCES `movies_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_director`
--

DROP TABLE IF EXISTS `movies_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_genre`
--

DROP TABLE IF EXISTS `movies_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_movie`
--

DROP TABLE IF EXISTS `movies_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `rank` int(10) unsigned NOT NULL,
  `release_year` smallint(5) unsigned NOT NULL,
  `commercial` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `independent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_movie_actors`
--

DROP TABLE IF EXISTS `movies_movie_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_actors_movie_id_actor_id_73463e17_uniq` (`movie_id`,`actor_id`),
  KEY `movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id` (`actor_id`),
  CONSTRAINT `movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `movies_actor` (`id`),
  CONSTRAINT `movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_movie_categories`
--

DROP TABLE IF EXISTS `movies_movie_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_categories_movie_id_category_id_c0beab68_uniq` (`movie_id`,`category_id`),
  KEY `movies_movie_categor_category_id_b69736a9_fk_movies_ca` (`category_id`),
  CONSTRAINT `movies_movie_categor_category_id_b69736a9_fk_movies_ca` FOREIGN KEY (`category_id`) REFERENCES `movies_category` (`id`),
  CONSTRAINT `movies_movie_categories_movie_id_24fd2991_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_movie_directors`
--

DROP TABLE IF EXISTS `movies_movie_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_directors_movie_id_director_id_eb887327_uniq` (`movie_id`,`director_id`),
  KEY `movies_movie_directo_director_id_9cddcb44_fk_movies_di` (`director_id`),
  CONSTRAINT `movies_movie_directo_director_id_9cddcb44_fk_movies_di` FOREIGN KEY (`director_id`) REFERENCES `movies_director` (`id`),
  CONSTRAINT `movies_movie_directors_movie_id_7f54bd58_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies_movie_genres`
--

DROP TABLE IF EXISTS `movies_movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_genres_movie_id_genre_id_5ff3c723_uniq` (`movie_id`,`genre_id`),
  KEY `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` (`genre_id`),
  CONSTRAINT `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `movies_genre` (`id`),
  CONSTRAINT `movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `music_track`
--

DROP TABLE IF EXISTS `music_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `artist` varchar(250) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_slug_70d3148d` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products_productphoto`
--

DROP TABLE IF EXISTS `products_productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_productphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productphoto_product_id_93bcbc5e_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_productphoto_product_id_93bcbc5e_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotes_inspirationalquote`
--

DROP TABLE IF EXISTS `quotes_inspirationalquote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_inspirationalquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `quote` longtext NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_key_17b411bb` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_8c8fa920_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viral_videos_viralvideo`
--

DROP TABLE IF EXISTS `viral_videos_viralvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viral_videos_viralvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `embed_code` longtext NOT NULL,
  `anonymous_views` int(10) unsigned NOT NULL,
  `authenticated_views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watermarker_watermark`
--

DROP TABLE IF EXISTS `watermarker_watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watermarker_watermark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19 14:22:02
-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: myproject_db
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Editors');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Article',7,'add_newsarticle'),(26,'Can change Article',7,'change_newsarticle'),(27,'Can delete Article',7,'delete_newsarticle'),(28,'Can view Article',7,'view_newsarticle'),(29,'Can add Idea',8,'add_idea'),(30,'Can change Idea',8,'change_idea'),(31,'Can delete Idea',8,'delete_idea'),(32,'Can view Idea',8,'view_idea'),(33,'Can add Like',9,'add_like'),(34,'Can change Like',9,'change_like'),(35,'Can delete Like',9,'delete_like'),(36,'Can view Like',9,'view_like'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add Inspirational Quote',11,'add_inspirationalquote'),(42,'Can change Inspirational Quote',11,'change_inspirationalquote'),(43,'Can delete Inspirational Quote',11,'delete_inspirationalquote'),(44,'Can view Inspirational Quote',11,'view_inspirationalquote'),(45,'Can add Bulletin',12,'add_bulletin'),(46,'Can change Bulletin',12,'change_bulletin'),(47,'Can delete Bulletin',12,'delete_bulletin'),(48,'Can view Bulletin',12,'view_bulletin'),(49,'Can add director',13,'add_director'),(50,'Can change director',13,'change_director'),(51,'Can delete director',13,'delete_director'),(52,'Can view director',13,'view_director'),(53,'Can add actor',14,'add_actor'),(54,'Can change actor',14,'change_actor'),(55,'Can delete actor',14,'delete_actor'),(56,'Can view actor',14,'view_actor'),(57,'Can add genre',15,'add_genre'),(58,'Can change genre',15,'change_genre'),(59,'Can delete genre',15,'delete_genre'),(60,'Can view genre',15,'view_genre'),(61,'Can add Movie',16,'add_movie'),(62,'Can change Movie',16,'change_movie'),(63,'Can delete Movie',16,'delete_movie'),(64,'Can view Movie',16,'view_movie'),(65,'Can add Experience',17,'add_experience'),(66,'Can change Experience',17,'change_experience'),(67,'Can delete Experience',17,'delete_experience'),(68,'Can view Experience',17,'view_experience'),(69,'Can add Curriculum Vitae',18,'add_curriculumvitae'),(70,'Can change Curriculum Vitae',18,'change_curriculumvitae'),(71,'Can delete Curriculum Vitae',18,'delete_curriculumvitae'),(72,'Can view Curriculum Vitae',18,'view_curriculumvitae'),(73,'Can add Idea Category',19,'add_category'),(74,'Can change Idea Category',19,'change_category'),(75,'Can delete Idea Category',19,'delete_category'),(76,'Can view Idea Category',19,'view_category'),(77,'Can add Idea',20,'add_idea'),(78,'Can change Idea',20,'change_idea'),(79,'Can delete Idea',20,'delete_idea'),(80,'Can view Idea',20,'view_idea'),(81,'Can add Location',21,'add_location'),(82,'Can change Location',21,'change_location'),(83,'Can delete Location',21,'delete_location'),(84,'Can view Location',21,'view_location'),(85,'Can add kv store',22,'add_kvstore'),(86,'Can change kv store',22,'change_kvstore'),(87,'Can delete kv store',22,'delete_kvstore'),(88,'Can view kv store',22,'view_kvstore'),(89,'Can add like',23,'add_like'),(90,'Can change like',23,'change_like'),(91,'Can delete like',23,'delete_like'),(92,'Can view like',23,'view_like'),(93,'Can add artist',24,'add_artist'),(94,'Can change artist',24,'change_artist'),(95,'Can delete artist',24,'delete_artist'),(96,'Can view artist',24,'view_artist'),(97,'Can add Photo',25,'add_productphoto'),(98,'Can change Photo',25,'change_productphoto'),(99,'Can delete Photo',25,'delete_productphoto'),(100,'Can view Photo',25,'view_productphoto'),(101,'Can add Product',26,'add_product'),(102,'Can change Product',26,'change_product'),(103,'Can delete Product',26,'delete_product'),(104,'Can view Product',26,'view_product'),(105,'Can add watermark',27,'add_watermark'),(106,'Can change watermark',27,'change_watermark'),(107,'Can delete watermark',27,'delete_watermark'),(108,'Can view watermark',27,'view_watermark'),(109,'Can add association',28,'add_association'),(110,'Can change association',28,'change_association'),(111,'Can delete association',28,'delete_association'),(112,'Can view association',28,'view_association'),(113,'Can add code',29,'add_code'),(114,'Can change code',29,'change_code'),(115,'Can delete code',29,'delete_code'),(116,'Can view code',29,'view_code'),(117,'Can add nonce',30,'add_nonce'),(118,'Can change nonce',30,'change_nonce'),(119,'Can delete nonce',30,'delete_nonce'),(120,'Can view nonce',30,'view_nonce'),(121,'Can add user social auth',31,'add_usersocialauth'),(122,'Can change user social auth',31,'change_usersocialauth'),(123,'Can delete user social auth',31,'delete_usersocialauth'),(124,'Can view user social auth',31,'view_usersocialauth'),(125,'Can add partial',32,'add_partial'),(126,'Can change partial',32,'change_partial'),(127,'Can delete partial',32,'delete_partial'),(128,'Can view partial',32,'view_partial'),(129,'Can use Structure mode',33,'use_structure'),(130,'Can change page',34,'change_page'),(131,'Can add site',35,'add_site'),(132,'Can change site',35,'change_site'),(133,'Can delete site',35,'delete_site'),(134,'Can view site',35,'view_site'),(135,'Can add cms plugin',36,'add_cmsplugin'),(136,'Can change cms plugin',36,'change_cmsplugin'),(137,'Can delete cms plugin',36,'delete_cmsplugin'),(138,'Can view cms plugin',36,'view_cmsplugin'),(139,'Can add alias plugin model',37,'add_aliaspluginmodel'),(140,'Can change alias plugin model',37,'change_aliaspluginmodel'),(141,'Can delete alias plugin model',37,'delete_aliaspluginmodel'),(142,'Can view alias plugin model',37,'view_aliaspluginmodel'),(143,'Can add Page global permission',38,'add_globalpagepermission'),(144,'Can change Page global permission',38,'change_globalpagepermission'),(145,'Can delete Page global permission',38,'delete_globalpagepermission'),(146,'Can view Page global permission',38,'view_globalpagepermission'),(147,'Can add page',34,'add_page'),(148,'Can delete page',34,'delete_page'),(149,'Can view page',34,'view_page'),(150,'Can publish page',34,'publish_page'),(151,'Can edit static placeholders',34,'edit_static_placeholder'),(152,'Can add Page permission',39,'add_pagepermission'),(153,'Can change Page permission',39,'change_pagepermission'),(154,'Can delete Page permission',39,'delete_pagepermission'),(155,'Can view Page permission',39,'view_pagepermission'),(156,'Can add User (page)',40,'add_pageuser'),(157,'Can change User (page)',40,'change_pageuser'),(158,'Can delete User (page)',40,'delete_pageuser'),(159,'Can view User (page)',40,'view_pageuser'),(160,'Can add User group (page)',41,'add_pageusergroup'),(161,'Can change User group (page)',41,'change_pageusergroup'),(162,'Can delete User group (page)',41,'delete_pageusergroup'),(163,'Can view User group (page)',41,'view_pageusergroup'),(164,'Can add placeholder',33,'add_placeholder'),(165,'Can change placeholder',33,'change_placeholder'),(166,'Can delete placeholder',33,'delete_placeholder'),(167,'Can view placeholder',33,'view_placeholder'),(168,'Can add placeholder reference',42,'add_placeholderreference'),(169,'Can change placeholder reference',42,'change_placeholderreference'),(170,'Can delete placeholder reference',42,'delete_placeholderreference'),(171,'Can view placeholder reference',42,'view_placeholderreference'),(172,'Can add static placeholder',43,'add_staticplaceholder'),(173,'Can change static placeholder',43,'change_staticplaceholder'),(174,'Can delete static placeholder',43,'delete_staticplaceholder'),(175,'Can view static placeholder',43,'view_staticplaceholder'),(176,'Can add title',44,'add_title'),(177,'Can change title',44,'change_title'),(178,'Can delete title',44,'delete_title'),(179,'Can view title',44,'view_title'),(180,'Can add user setting',45,'add_usersettings'),(181,'Can change user setting',45,'change_usersettings'),(182,'Can delete user setting',45,'delete_usersettings'),(183,'Can view user setting',45,'view_usersettings'),(184,'Can add urlconf revision',46,'add_urlconfrevision'),(185,'Can change urlconf revision',46,'change_urlconfrevision'),(186,'Can delete urlconf revision',46,'delete_urlconfrevision'),(187,'Can view urlconf revision',46,'view_urlconfrevision'),(188,'Can add cache key',49,'add_cachekey'),(189,'Can change cache key',49,'change_cachekey'),(190,'Can delete cache key',49,'delete_cachekey'),(191,'Can view cache key',49,'view_cachekey'),(192,'Can add Editorial content',50,'add_editorialcontent'),(193,'Can change Editorial content',50,'change_editorialcontent'),(194,'Can delete Editorial content',50,'delete_editorialcontent'),(195,'Can view Editorial content',50,'view_editorialcontent'),(196,'Can add css extension',51,'add_cssextension'),(197,'Can change css extension',51,'change_cssextension'),(198,'Can delete css extension',51,'delete_cssextension'),(199,'Can view css extension',51,'view_cssextension'),(200,'Can add Category',52,'add_category'),(201,'Can change Category',52,'change_category'),(202,'Can delete Category',52,'delete_category'),(203,'Can view Category',52,'view_category'),(204,'Can add Track',53,'add_track'),(205,'Can change Track',53,'change_track'),(206,'Can delete Track',53,'delete_track'),(207,'Can view Track',53,'view_track'),(208,'Can add Category',54,'add_category'),(209,'Can change Category',54,'change_category'),(210,'Can delete Category',54,'delete_category'),(211,'Can view Category',54,'view_category'),(212,'Can add api access',55,'add_apiaccess'),(213,'Can change api access',55,'change_apiaccess'),(214,'Can delete api access',55,'delete_apiaccess'),(215,'Can view api access',55,'view_apiaccess'),(216,'Can add api key',56,'add_apikey'),(217,'Can change api key',56,'change_apikey'),(218,'Can delete api key',56,'delete_apikey'),(219,'Can view api key',56,'view_apikey'),(220,'Can add Viral video',57,'add_viralvideo'),(221,'Can change Viral video',57,'change_viralvideo'),(222,'Can delete Viral video',57,'delete_viralvideo'),(223,'Can view Viral video',57,'view_viralvideo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$n6RT01WskBNa$CNYnA2RIj/lyOyqNJ05Kwu/CwzO9dK4dwK+x2CqplF4=','2018-10-06 05:47:49.831169',1,'admin','Jake','Kronika','',1,1,'2018-09-06 16:19:39.000000'),(2,'uosneer1',NULL,0,'userone','User','One','',0,1,'2018-09-12 21:05:15.915397'),(3,'pbkdf2_sha256$120000$wEPa23uIRlum$W4LEkSHVGEzLiVYcT2L6E70hgOK3bpzRb7jpcByzTcY=',NULL,0,'aidas','Aidas','Bendoraitis','',1,1,'2018-09-24 02:51:35.000000'),(4,'pbkdf2_sha256$120000$Z40oFfpMIGDD$0gOnx9dfHK5P3h9qlhKXXaQmpfWsEPbNQFChSo36xBM=',NULL,0,'erika_musterman','Erika','Musterman','erika.musterman@example.com',1,1,'2018-09-24 02:52:05.000000'),(5,'pbkdf2_sha256$120000$lt4ahF2dxsXp$SgWo+ru7lLDZyxNCrDRu7ssiJCE9IDPmOBsz6mYG4v8=',NULL,0,'jean_dupont','Jean','DuPont','jean.dupont@example.com',1,1,'2018-09-24 02:52:31.000000'),(6,'pbkdf2_sha256$120000$qNzpcsvHY1LA$nk94Xr9yGjg4oQ2RCmv2Tcr+1s4F8Ce7c5ZMAspXOUk=',NULL,0,'john_doe','John','Doe','john.doe@example.com',1,1,'2018-09-24 02:52:55.000000'),(7,'pbkdf2_sha256$120000$ThpH1cidnXxv$kNOo4NUYTPmnZxBwaxf6jrH58GATnEDZFgruaqhyqv0=',NULL,0,'vardenis_pavardenis','Vardenis','Pavardenis','',0,1,'2018-09-24 02:53:20.000000'),(8,'!K1RRu7S1W0FC0Tv66625Hi5WanlfP8WWRv5rJ6eV','2018-09-25 08:39:29.704154',0,'jkronika','jkronika@gridlined.com','','',0,1,'2018-09-25 08:39:29.691802');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,4,1),(2,5,1),(3,6,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_board_bulletin`
--

DROP TABLE IF EXISTS `bulletin_board_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_board_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `bulletin_type` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletin_board_bulle_category_id_135a33c7_fk_bulletin_` (`category_id`),
  CONSTRAINT `bulletin_board_bulle_category_id_135a33c7_fk_bulletin_` FOREIGN KEY (`category_id`) REFERENCES `bulletin_board_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_board_bulletin`
--

LOCK TABLES `bulletin_board_bulletin` WRITE;
/*!40000 ALTER TABLE `bulletin_board_bulletin` DISABLE KEYS */;
INSERT INTO `bulletin_board_bulletin` VALUES (1,'2018-10-04 16:26:14.181407','2018-10-04 16:26:14.181514','searching','Foo','Bar','Baz Luhrman','','','',NULL),(2,'2018-10-04 16:28:13.877041','2018-10-04 16:28:51.891451','offering','Oof','Arb','Baz Luhrman','','','',1);
/*!40000 ALTER TABLE `bulletin_board_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_board_category`
--

DROP TABLE IF EXISTS `bulletin_board_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_board_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_board_category`
--

LOCK TABLES `bulletin_board_category` WRITE;
/*!40000 ALTER TABLE `bulletin_board_category` DISABLE KEYS */;
INSERT INTO `bulletin_board_category` VALUES (1,'Awesome'),(2,'Fair'),(3,'Annoying');
/*!40000 ALTER TABLE `bulletin_board_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_aliaspluginmodel`
--

DROP TABLE IF EXISTS `cms_aliaspluginmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_aliaspluginmodel` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `alias_placeholder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` (`plugin_id`),
  KEY `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` (`alias_placeholder_id`),
  CONSTRAINT `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` FOREIGN KEY (`alias_placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` FOREIGN KEY (`plugin_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_aliaspluginmodel`
--

LOCK TABLES `cms_aliaspluginmodel` WRITE;
/*!40000 ALTER TABLE `cms_aliaspluginmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_aliaspluginmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cmsplugin`
--

DROP TABLE IF EXISTS `cms_cmsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(5) unsigned NOT NULL,
  `language` varchar(15) NOT NULL,
  `plugin_type` varchar(50) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `placeholder_id` int(11) DEFAULT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_cmsplugin_path_4917bb44_uniq` (`path`),
  KEY `cms_cmsplugin_language_bbea8a48` (`language`),
  KEY `cms_cmsplugin_plugin_type_94e96ebf` (`plugin_type`),
  KEY `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` (`parent_id`),
  KEY `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` (`placeholder_id`),
  CONSTRAINT `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (3,0,'en','EditorialContentPlugin','2018-09-30 16:46:23.727252','2018-09-30 16:46:23.770101',NULL,6,1,0,'0001'),(4,0,'en','EditorialContentPlugin','2018-09-30 16:47:26.147968','2018-09-30 17:14:18.461630',NULL,7,1,0,'0002'),(5,1,'en','EditorialContentPlugin','2018-09-30 16:47:56.585947','2018-09-30 17:14:38.586678',NULL,7,1,0,'0003'),(6,0,'en','EditorialContentPlugin','2018-09-30 16:46:23.727252','2018-09-30 17:31:10.531969',NULL,40,1,0,'0004'),(7,0,'en','EditorialContentPlugin','2018-09-30 16:47:26.147968','2018-09-30 17:31:10.545217',NULL,41,1,0,'0005'),(8,1,'en','EditorialContentPlugin','2018-09-30 16:47:56.585947','2018-09-30 17:31:10.551633',NULL,41,1,0,'0006'),(9,0,'en','EditorialContentPlugin','2018-10-01 00:06:21.275565','2018-10-01 00:08:26.902621',NULL,10,1,0,'0007');
/*!40000 ALTER TABLE `cms_cmsplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_extensions_cssextension`
--

DROP TABLE IF EXISTS `cms_extensions_cssextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_extensions_cssextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_item_css_class` varchar(200) NOT NULL,
  `body_css_class` varchar(200) NOT NULL,
  `extended_object_id` int(11) NOT NULL,
  `public_extension_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extended_object_id` (`extended_object_id`),
  UNIQUE KEY `public_extension_id` (`public_extension_id`),
  CONSTRAINT `cms_extensions_cssex_extended_object_id_c0a8a17a_fk_cms_page_` FOREIGN KEY (`extended_object_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_extensions_cssex_public_extension_id_d0d07794_fk_cms_exten` FOREIGN KEY (`public_extension_id`) REFERENCES `cms_extensions_cssextension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_extensions_cssextension`
--

LOCK TABLES `cms_extensions_cssextension` WRITE;
/*!40000 ALTER TABLE `cms_extensions_cssextension` DISABLE KEYS */;
INSERT INTO `cms_extensions_cssextension` VALUES (1,'featured','playful',5,NULL);
/*!40000 ALTER TABLE `cms_extensions_cssextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission`
--

DROP TABLE IF EXISTS `cms_globalpagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` (`group_id`),
  KEY `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission`
--

LOCK TABLES `cms_globalpagepermission` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission_sites`
--

DROP TABLE IF EXISTS `cms_globalpagepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_globalpagepermission_globalpagepermission_id__db684f41_uniq` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermis_site_id_00460b53_fk_django_si` (`site_id`),
  CONSTRAINT `cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa` FOREIGN KEY (`globalpagepermission_id`) REFERENCES `cms_globalpagepermission` (`id`),
  CONSTRAINT `cms_globalpagepermis_site_id_00460b53_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission_sites`
--

LOCK TABLES `cms_globalpagepermission_sites` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `changed_by` varchar(255) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `publication_end_date` datetime(6) DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) DEFAULT NULL,
  `navigation_extenders` varchar(80) DEFAULT NULL,
  `template` varchar(100) NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `limit_visibility_in_menu` smallint(6) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL,
  `application_urls` varchar(200) DEFAULT NULL,
  `application_namespace` varchar(200) DEFAULT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `xframe_options` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `is_page_type` tinyint(1) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_node_id_publisher_is_draft_c1293d6a_uniq` (`node_id`,`publisher_is_draft`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_publication_date_684fabf7` (`publication_date`),
  KEY `cms_page_publication_end_date_12a0c46a` (`publication_end_date`),
  KEY `cms_page_in_navigation_01c24279` (`in_navigation`),
  KEY `cms_page_soft_root_51efccbe` (`soft_root`),
  KEY `cms_page_reverse_id_ffc9ede2` (`reverse_id`),
  KEY `cms_page_navigation_extenders_c24af8dd` (`navigation_extenders`),
  KEY `cms_page_limit_visibility_in_menu_30db6aa6` (`limit_visibility_in_menu`),
  KEY `cms_page_is_home_edadca07` (`is_home`),
  KEY `cms_page_application_urls_9ef47497` (`application_urls`),
  KEY `cms_page_publisher_is_draft_141cba60` (`publisher_is_draft`),
  CONSTRAINT `cms_page_node_id_c87b85a9_fk_cms_treenode_id` FOREIGN KEY (`node_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_page_publisher_public_id_d619fca0_fk_cms_page_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'admin','admin','2018-09-29 03:14:56.699277','2018-09-29 06:28:40.363765','2018-09-29 03:14:56.735378',NULL,1,0,'start-page',NULL,'cms/default.html',0,NULL,1,'',NULL,1,'en',0,2,0,1),(2,'admin','admin','2018-09-29 03:14:56.735690','2018-09-29 08:30:49.524221','2018-09-29 03:14:56.735378',NULL,1,0,'start-page',NULL,'cms/default.html',0,NULL,1,'',NULL,0,'en',0,1,0,1),(3,'admin','admin','2018-09-29 03:15:31.982623','2018-09-30 16:43:43.170494','2018-09-30 17:31:10.499593',NULL,1,0,NULL,NULL,'cms/magazine.html',0,NULL,0,'',NULL,1,'en',0,20,0,2),(4,'admin','admin','2018-09-29 03:15:40.034356','2018-10-02 16:55:06.949018','2018-09-29 08:01:17.053520',NULL,1,0,'movies-menu','MoviesMenu','cms/default.html',0,NULL,0,'',NULL,1,'en',0,18,0,3),(5,'admin','admin','2018-09-29 03:15:48.709032','2018-09-29 03:15:48.751163',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,4),(6,'admin','admin','2018-09-29 03:15:54.665271','2018-09-29 03:15:54.706285',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,5),(7,'admin','admin','2018-09-29 03:16:27.059686','2018-09-29 03:16:27.106067',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,6),(8,'admin','admin','2018-09-29 03:16:44.774666','2018-09-29 03:16:44.812583',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,7),(9,'admin','admin','2018-09-29 03:17:01.054256','2018-09-29 03:17:01.089874',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,8),(10,'admin','admin','2018-09-29 03:17:13.552774','2018-09-29 03:17:13.585391',NULL,NULL,1,0,NULL,NULL,'cms/default.html',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,9),(11,'admin','admin','2018-09-29 03:17:54.298558','2018-09-29 03:17:54.338200',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,10),(12,'admin','admin','2018-09-29 03:18:06.526681','2018-09-29 03:18:06.562812',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,11),(13,'admin','admin','2018-09-29 03:19:31.853048','2018-09-29 03:19:31.890039',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,12),(14,'admin','admin','2018-09-29 03:20:53.780161','2018-09-30 05:45:20.231948','2018-09-30 05:45:34.630387',NULL,1,0,'footer-navigation',NULL,'cms/default.html',0,NULL,0,'',NULL,1,'en',0,19,0,13),(15,'admin','admin','2018-09-29 03:21:02.213308','2018-09-29 03:21:02.253780',NULL,NULL,1,0,NULL,NULL,'cms/default.html',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,14),(16,'admin','admin','2018-09-29 03:21:08.468857','2018-09-29 03:21:08.507810',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,15),(17,'admin','admin','2018-09-29 03:21:15.368893','2018-09-29 03:21:15.405727',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'en',0,NULL,0,16),(18,'admin','admin','2018-09-29 08:01:17.053772','2018-09-29 09:44:12.361949','2018-09-29 08:01:17.053520',NULL,1,0,'movies-menu','MoviesMenu','cms/default.html',0,NULL,0,'',NULL,0,'en',0,4,0,3),(19,'admin','admin','2018-09-30 05:45:34.630712','2018-09-30 05:45:34.630773','2018-09-30 05:45:34.630387',NULL,1,0,'footer-navigation',NULL,'cms/default.html',0,NULL,0,'',NULL,0,'en',0,14,0,13),(20,'admin','admin','2018-09-30 17:31:10.499860','2018-09-30 17:31:10.499895','2018-09-30 17:31:10.499593',NULL,1,0,NULL,NULL,'cms/magazine.html',0,NULL,0,'',NULL,0,'en',0,3,0,2);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_placeholders`
--

DROP TABLE IF EXISTS `cms_page_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` (`placeholder_id`),
  CONSTRAINT `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,1,2),(2,1,3),(3,2,4),(4,2,5),(5,3,6),(6,3,7),(7,4,8),(8,4,9),(9,5,10),(10,5,11),(11,6,12),(12,6,13),(13,7,14),(14,7,15),(15,8,16),(16,8,17),(17,9,18),(18,9,19),(19,10,20),(20,10,21),(21,11,22),(22,11,23),(23,12,24),(24,12,25),(25,13,26),(26,13,27),(27,14,28),(28,14,29),(29,15,30),(30,15,31),(31,16,32),(32,16,33),(33,17,34),(34,17,35),(35,18,36),(36,18,37),(37,19,38),(38,19,39),(39,20,40),(40,20,41);
/*!40000 ALTER TABLE `cms_page_placeholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagepermission`
--

DROP TABLE IF EXISTS `cms_pagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_group_id_af5af193_fk_auth_group_id` (`group_id`),
  KEY `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` (`page_id`),
  KEY `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_pagepermission_group_id_af5af193_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagepermission`
--

LOCK TABLES `cms_pagepermission` WRITE;
/*!40000 ALTER TABLE `cms_pagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageuser`
--

DROP TABLE IF EXISTS `cms_pageuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageuser`
--

LOCK TABLES `cms_pageuser` WRITE;
/*!40000 ALTER TABLE `cms_pageuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageusergroup`
--

DROP TABLE IF EXISTS `cms_pageusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageusergroup`
--

LOCK TABLES `cms_pageusergroup` WRITE;
/*!40000 ALTER TABLE `cms_pageusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholder`
--

DROP TABLE IF EXISTS `cms_placeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_slot_0bc04d21` (`slot`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'clipboard',NULL),(2,'main_content',NULL),(3,'sidebar',NULL),(4,'main_content',NULL),(5,'sidebar',NULL),(6,'main_content',NULL),(7,'sidebar',NULL),(8,'main_content',NULL),(9,'sidebar',NULL),(10,'main_content',NULL),(11,'sidebar',NULL),(12,'main_content',NULL),(13,'sidebar',NULL),(14,'main_content',NULL),(15,'sidebar',NULL),(16,'main_content',NULL),(17,'sidebar',NULL),(18,'main_content',NULL),(19,'sidebar',NULL),(20,'main_content',NULL),(21,'sidebar',NULL),(22,'main_content',NULL),(23,'sidebar',NULL),(24,'main_content',NULL),(25,'sidebar',NULL),(26,'main_content',NULL),(27,'sidebar',NULL),(28,'main_content',NULL),(29,'sidebar',NULL),(30,'main_content',NULL),(31,'sidebar',NULL),(32,'main_content',NULL),(33,'sidebar',NULL),(34,'main_content',NULL),(35,'sidebar',NULL),(36,'main_content',NULL),(37,'sidebar',NULL),(38,'main_content',NULL),(39,'sidebar',NULL),(40,'main_content',NULL),(41,'sidebar',NULL);
/*!40000 ALTER TABLE `cms_placeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholderreference`
--

DROP TABLE IF EXISTS `cms_placeholderreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholderreference` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `placeholder_ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_placeholderreference_placeholder_ref_id_244759b1` (`placeholder_ref_id`),
  CONSTRAINT `cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place` FOREIGN KEY (`placeholder_ref_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholderreference`
--

LOCK TABLES `cms_placeholderreference` WRITE;
/*!40000 ALTER TABLE `cms_placeholderreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_placeholderreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_staticplaceholder`
--

DROP TABLE IF EXISTS `cms_staticplaceholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_staticplaceholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `dirty` tinyint(1) NOT NULL,
  `creation_method` varchar(20) NOT NULL,
  `draft_id` int(11) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_staticplaceholder_code_site_id_21ba079c_uniq` (`code`,`site_id`),
  KEY `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` (`site_id`),
  KEY `cms_staticplaceholder_draft_id_5aee407b` (`draft_id`),
  KEY `cms_staticplaceholder_public_id_876aaa66` (`public_id`),
  CONSTRAINT `cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id` FOREIGN KEY (`draft_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id` FOREIGN KEY (`public_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_staticplaceholder`
--

LOCK TABLES `cms_staticplaceholder` WRITE;
/*!40000 ALTER TABLE `cms_staticplaceholder` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_staticplaceholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_title`
--

DROP TABLE IF EXISTS `cms_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  `slug` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `redirect` varchar(2048) DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_title_language_page_id_61aaf084_uniq` (`language`,`page_id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_title_page_id_5fade2a3_fk_cms_page_id` (`page_id`),
  KEY `cms_title_language_50a0dfa1` (`language`),
  KEY `cms_title_slug_4947d146` (`slug`),
  KEY `cms_title_path_c484314c` (`path`),
  KEY `cms_title_has_url_overwrite_ecf27bb9` (`has_url_overwrite`),
  KEY `cms_title_publisher_is_draft_95874c88` (`publisher_is_draft`),
  KEY `cms_title_publisher_state_9a952b0f` (`publisher_state`),
  CONSTRAINT `cms_title_page_id_5fade2a3_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_title_publisher_public_id_003a2702_fk_cms_title_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (1,'en','Home','','','','home','',0,NULL,'2018-09-29 03:14:56.703170',1,1,1,1,2),(2,'en','Home','','','','home','',0,NULL,'2018-09-29 03:14:56.703170',1,0,0,2,1),(3,'en','News','','','','news','news',0,NULL,'2018-09-29 03:15:31.985463',1,1,0,3,20),(4,'en','Movies','','','','movies','movies',0,NULL,'2018-09-29 03:15:40.037181',1,1,1,4,18),(5,'en','Music','','','','music','music',0,NULL,'2018-09-29 03:15:48.712542',0,1,1,5,NULL),(6,'en','Games','','','','games','games',0,NULL,'2018-09-29 03:15:54.669442',0,1,1,6,NULL),(7,'en','FAQ','','','','faq','faq',0,NULL,'2018-09-29 03:16:27.062971',0,1,1,7,NULL),(8,'en','Contact','','','','contact','contact',0,NULL,'2018-09-29 03:16:44.778781',0,1,1,8,NULL),(9,'en','Search','','','','search','search',0,NULL,'2018-09-29 03:17:01.057368',0,1,1,9,NULL),(10,'en','Meta','','','','meta','meta',0,NULL,'2018-09-29 03:17:13.555096',0,1,1,10,NULL),(11,'en','Imprint','','','','imprint','meta/imprint',0,NULL,'2018-09-29 03:17:54.304161',0,1,1,11,NULL),(12,'en','Privacy Policy','','','','privacy-policy','meta/privacy-policy',0,NULL,'2018-09-29 03:18:06.529288',0,1,1,12,NULL),(13,'en','Terms of Use','','','','terms-use','meta/terms-use',0,NULL,'2018-09-29 03:19:31.855563',0,1,1,13,NULL),(14,'en','Footer Navigation','','','','footer-navigation','footer-navigation',0,NULL,'2018-09-29 03:20:53.784427',1,1,0,14,19),(15,'en','News','','','','news','footer-navigation/news',0,NULL,'2018-09-29 03:21:02.216350',0,1,1,15,NULL),(16,'en','Developers','','','','developers','footer-navigation/developers',0,NULL,'2018-09-29 03:21:08.471780',0,1,1,16,NULL),(17,'en','About Us','','','','about-us','footer-navigation/about-us',0,NULL,'2018-09-29 03:21:15.373853',0,1,1,17,NULL),(18,'en','Movies','','','','movies','movies',0,NULL,'2018-09-29 03:15:40.037181',1,0,0,18,4),(19,'en','Footer Navigation','','','','footer-navigation','footer-navigation',0,NULL,'2018-09-29 03:20:53.784427',1,0,0,19,14),(20,'en','News','','','','news','news',0,NULL,'2018-09-29 03:15:31.985463',1,0,0,20,3);
/*!40000 ALTER TABLE `cms_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_treenode`
--

DROP TABLE IF EXISTS `cms_treenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_treenode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` (`parent_id`),
  KEY `cms_treenode_site_id_d3f46985_fk_django_site_id` (`site_id`),
  CONSTRAINT `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_treenode_site_id_d3f46985_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_treenode`
--

LOCK TABLES `cms_treenode` WRITE;
/*!40000 ALTER TABLE `cms_treenode` DISABLE KEYS */;
INSERT INTO `cms_treenode` VALUES (1,'0003',1,7,NULL,1),(2,'00030001',2,0,1,1),(3,'00030002',2,0,1,1),(4,'00030003',2,0,1,1),(5,'00030004',2,0,1,1),(6,'00030005',2,0,1,1),(7,'00030006',2,0,1,1),(8,'00030007',2,0,1,1),(9,'0004',1,3,NULL,1),(10,'00040001',2,0,9,1),(11,'00040002',2,0,9,1),(12,'00040003',2,0,9,1),(13,'0006',1,3,NULL,1),(14,'00060001',2,0,13,1),(15,'00060002',2,0,13,1),(16,'00060003',2,0,13,1);
/*!40000 ALTER TABLE `cms_treenode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_urlconfrevision`
--

DROP TABLE IF EXISTS `cms_urlconfrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_urlconfrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_urlconfrevision`
--

LOCK TABLES `cms_urlconfrevision` WRITE;
/*!40000 ALTER TABLE `cms_urlconfrevision` DISABLE KEYS */;
INSERT INTO `cms_urlconfrevision` VALUES (1,'a08f2da9-67de-4f8b-8f1f-bafdc4b80a34');
/*!40000 ALTER TABLE `cms_urlconfrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_usersettings`
--

DROP TABLE IF EXISTS `cms_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(10) NOT NULL,
  `clipboard_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` (`clipboard_id`),
  CONSTRAINT `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` FOREIGN KEY (`clipboard_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_usersettings_user_id_09633b2d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_usersettings`
--

LOCK TABLES `cms_usersettings` WRITE;
/*!40000 ALTER TABLE `cms_usersettings` DISABLE KEYS */;
INSERT INTO `cms_usersettings` VALUES (1,'en',1,1);
/*!40000 ALTER TABLE `cms_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_curriculumvitae`
--

DROP TABLE IF EXISTS `cv_curriculumvitae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_curriculumvitae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_curriculumvitae`
--

LOCK TABLES `cv_curriculumvitae` WRITE;
/*!40000 ALTER TABLE `cv_curriculumvitae` DISABLE KEYS */;
INSERT INTO `cv_curriculumvitae` VALUES (1,'John','Doe','john.doe@example.com');
/*!40000 ALTER TABLE `cv_curriculumvitae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_experience`
--

DROP TABLE IF EXISTS `cv_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `till_date` date DEFAULT NULL,
  `company` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `skills` longtext NOT NULL,
  `cv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cv_experience_cv_id_6f6720ee_fk_cv_curriculumvitae_id` (`cv_id`),
  CONSTRAINT `cv_experience_cv_id_6f6720ee_fk_cv_curriculumvitae_id` FOREIGN KEY (`cv_id`) REFERENCES `cv_curriculumvitae` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_experience`
--

LOCK TABLES `cv_experience` WRITE;
/*!40000 ALTER TABLE `cv_experience` DISABLE KEYS */;
INSERT INTO `cv_experience` VALUES (1,'2012-12-01',NULL,'Jack in the Box Not So Fine Dining','Worker','Contrary to popular belief, this place is not where they make Jack in the Box toys. Now I know why they asked me if I knew how to cook a hamburger in the interview!',1);
/*!40000 ALTER TABLE `cv_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_app_category`
--

DROP TABLE IF EXISTS `demo_app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_app_category`
--

LOCK TABLES `demo_app_category` WRITE;
/*!40000 ALTER TABLE `demo_app_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_app_idea`
--

DROP TABLE IF EXISTS `demo_app_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_author` varchar(255) NOT NULL,
  `meta_copyright` varchar(255) NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `title_en_us` varchar(200) NOT NULL,
  `title_en_gb` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  `description_en_us` longtext NOT NULL,
  `description_en_gb` longtext NOT NULL,
  `description_de` longtext NOT NULL,
  `description_fr` longtext NOT NULL,
  `description_lt` longtext NOT NULL,
  `content_en_us` longtext NOT NULL,
  `content_en_gb` longtext NOT NULL,
  `content_de` longtext NOT NULL,
  `content_fr` longtext NOT NULL,
  `content_lt` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_app_idea`
--

LOCK TABLES `demo_app_idea` WRITE;
/*!40000 ALTER TABLE `demo_app_idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_app_idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_app_idea_categories`
--

DROP TABLE IF EXISTS `demo_app_idea_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_idea_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idea_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `demo_app_idea_categories_idea_id_category_id_5d885978_uniq` (`idea_id`,`category_id`),
  KEY `demo_app_idea_catego_category_id_70fd8f34_fk_demo_app_` (`category_id`),
  CONSTRAINT `demo_app_idea_catego_category_id_70fd8f34_fk_demo_app_` FOREIGN KEY (`category_id`) REFERENCES `demo_app_category` (`id`),
  CONSTRAINT `demo_app_idea_categories_idea_id_e80350fa_fk_demo_app_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `demo_app_idea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_app_idea_categories`
--

LOCK TABLES `demo_app_idea_categories` WRITE;
/*!40000 ALTER TABLE `demo_app_idea_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_app_idea_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_app_like`
--

DROP TABLE IF EXISTS `demo_app_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_app_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `owner_object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demo_app_like_content_type_id_aa8a64e1_fk_django_content_type_id` (`content_type_id`),
  KEY `demo_app_like_owner_content_type_i_1e6abb3b_fk_django_co` (`owner_content_type_id`),
  CONSTRAINT `demo_app_like_content_type_id_aa8a64e1_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `demo_app_like_owner_content_type_i_1e6abb3b_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_app_like`
--

LOCK TABLES `demo_app_like` WRITE;
/*!40000 ALTER TABLE `demo_app_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_app_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-18 00:32:42.380072','1','Somewhere',1,'[{\"added\": {}}]',21,1),(2,'2018-09-18 04:14:49.030169','1','Somewhere',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',21,1),(3,'2018-09-22 00:06:29.029213','2','Eiffel Tower',1,'[{\"added\": {}}]',21,1),(4,'2018-09-24 00:59:12.963552','5','jQuery UI 1.8: The User Interface Library for jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/jquery-ui-1-8-user-interface-library/20180924005912.jpg\"}}]',26,1),(5,'2018-09-24 00:59:38.791678','4','Developing Responsive Web Applications with AJAX and jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/developing-responsive-web-apps-ajax-jquery/20180924005938.jpg\"}}]',26,1),(6,'2018-09-24 01:00:50.960052','3','Django JavaScript Integration: AJAX and jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/django-javascript-integration-ajax-jquery/20180924010050.jpg\"}}]',26,1),(7,'2018-09-24 01:01:14.151628','2','Django: Web Development with Python',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/django-web-development-with-python/20180924010114.png\"}}]',26,1),(8,'2018-09-24 01:01:34.928361','6','Web Development with Django Cookbook, Second Edition',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/web-development-django-cookbook-second-edition/20180924010134.jpg\"}}]',26,1),(9,'2018-09-24 01:12:25.454950','11','Django: Web Development with Python',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/django-web-development-with-python/20180924011225.png\"}}]',26,1),(10,'2018-09-24 01:12:35.079938','10','Django JavaScript Integration: AJAX and jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/django-javascript-integration-ajax-jquery/20180924011235.jpg\"}}]',26,1),(11,'2018-09-24 01:12:43.855199','9','Developing Responsive Web Applications with AJAX and jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/developing-responsive-web-apps-ajax-jquery/20180924011243.jpg\"}}]',26,1),(12,'2018-09-24 01:13:00.734323','8','jQuery UI 1.8: The User Interface Library for jQuery',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/jquery-ui-1-8-user-interface-library/20180924011300.jpg\"}}]',26,1),(13,'2018-09-24 01:13:11.806094','7','Web Development with Django Cookbook, Second Edition',2,'[{\"added\": {\"name\": \"Photo\", \"object\": \"products/web-development-django-cookbook-second-edition/20180924011311.jpg\"}}]',26,1),(14,'2018-09-24 02:49:05.646822','1','admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',4,1),(15,'2018-09-24 02:49:32.772083','1','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),(16,'2018-09-24 02:51:36.038054','3','aidas',1,'[{\"added\": {}}]',4,1),(17,'2018-09-24 02:51:50.080189','3','aidas',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),(18,'2018-09-24 02:52:05.600820','4','erika_musterman',1,'[{\"added\": {}}]',4,1),(19,'2018-09-24 02:52:24.033559','4','erika_musterman',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,1),(20,'2018-09-24 02:52:31.574806','5','jean_dupont',1,'[{\"added\": {}}]',4,1),(21,'2018-09-24 02:52:44.994691','5','jean_dupont',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,1),(22,'2018-09-24 02:52:55.704322','6','john_doe',1,'[{\"added\": {}}]',4,1),(23,'2018-09-24 02:53:07.402884','6','john_doe',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,1),(24,'2018-09-24 02:53:21.025498','7','vardenis_pavardenis',1,'[{\"added\": {}}]',4,1),(25,'2018-09-24 02:53:40.483376','7','vardenis_pavardenis',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),(26,'2018-09-24 02:53:55.114209','3','aidas',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(27,'2018-09-24 02:54:04.777256','5','jean_dupont',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(28,'2018-09-24 02:54:12.159800','4','erika_musterman',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(29,'2018-09-24 02:54:20.990285','6','john_doe',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(30,'2018-09-24 02:55:33.346001','1','Editors',1,'[{\"added\": {}}]',3,1),(31,'2018-09-24 02:55:38.825845','4','erika_musterman',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(32,'2018-09-24 02:55:47.117277','5','jean_dupont',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(33,'2018-09-24 02:55:54.018375','6','john_doe',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(34,'2018-09-24 03:58:19.971232','2','Eiffel Tower',2,'[{\"changed\": {\"fields\": [\"street\", \"street2\", \"postal_code\", \"city\", \"country\", \"latitude\", \"longitude\"]}}]',21,1),(35,'2018-09-24 04:19:08.409968','2','Eiffel Tower',2,'[]',21,1),(36,'2018-09-25 07:01:16.283101','1','Basic Two-Tone',1,'[{\"added\": {}}]',27,1),(37,'2018-09-27 05:37:11.066210','1','Home',1,'[{\"added\": {}}]',34,1),(38,'2018-09-27 05:37:25.846154','1','Home',2,'[{\"changed\": {\"fields\": [\"template\", \"xframe_options\"]}}]',34,1),(39,'2018-09-27 05:38:02.820229','1','Home',2,'[{\"changed\": {\"fields\": [\"overwrite_url\", \"xframe_options\"]}}]',34,1),(40,'2018-09-27 14:35:31.762173','1','Home',3,'',34,1),(41,'2018-09-29 03:14:56.780211','1','Home',1,'[{\"added\": {}}]',34,1),(42,'2018-09-29 03:15:32.022822','3','News',1,'[{\"added\": {}}]',34,1),(43,'2018-09-29 03:15:40.082609','4','Movies',1,'[{\"added\": {}}]',34,1),(44,'2018-09-29 03:15:48.755033','5','Music',1,'[{\"added\": {}}]',34,1),(45,'2018-09-29 03:15:54.710532','6','Games',1,'[{\"added\": {}}]',34,1),(46,'2018-09-29 03:16:27.110514','7','FAQ',1,'[{\"added\": {}}]',34,1),(47,'2018-09-29 03:16:33.137575','3','News',2,'[]',34,1),(48,'2018-09-29 03:16:44.815837','8','Contact',1,'[{\"added\": {}}]',34,1),(49,'2018-09-29 03:17:01.093956','9','Search',1,'[{\"added\": {}}]',34,1),(50,'2018-09-29 03:17:13.588546','10','Meta',1,'[{\"added\": {}}]',34,1),(51,'2018-09-29 03:17:54.342070','11','Imprint',1,'[{\"added\": {}}]',34,1),(52,'2018-09-29 03:18:06.566306','12','Privacy Policy',1,'[{\"added\": {}}]',34,1),(53,'2018-09-29 03:19:31.894241','13','Terms of Use',1,'[{\"added\": {}}]',34,1),(54,'2018-09-29 03:20:53.819633','14','Footer Navigation',1,'[{\"added\": {}}]',34,1),(55,'2018-09-29 03:21:02.257830','15','News',1,'[{\"added\": {}}]',34,1),(56,'2018-09-29 03:21:08.512384','16','Developers',1,'[{\"added\": {}}]',34,1),(57,'2018-09-29 03:21:15.410111','17','About Us',1,'[{\"added\": {}}]',34,1),(58,'2018-09-29 03:22:45.080426','18','Blah',1,'[{\"added\": {}}]',34,1),(59,'2018-09-29 03:23:03.432993','14','Footer Navigation',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',34,1),(60,'2018-09-29 03:23:37.844196','18','Blah',3,'',34,1),(61,'2018-09-29 06:25:45.093099','4','Movies',2,'[{\"changed\": {\"fields\": [\"application_urls\", \"application_namespace\", \"xframe_options\"]}}]',34,1),(62,'2018-09-29 06:27:10.475740','4','Movies',2,'[{\"changed\": {\"fields\": [\"navigation_extenders\", \"xframe_options\"]}}]',34,1),(63,'2018-09-29 06:28:40.366069','1','Home',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',34,1),(64,'2018-09-29 07:33:25.890227','4','Movies',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',34,1),(65,'2018-09-29 08:01:17.096832','4','Movies',2,'',34,1),(66,'2018-09-29 08:29:15.308553','4','Movies',2,'[{\"changed\": {\"fields\": [\"navigation_extenders\", \"application_urls\", \"application_namespace\", \"xframe_options\"]}}]',34,1),(67,'2018-09-29 08:30:43.607768','4','Movies',2,'',34,1),(68,'2018-09-29 08:30:49.571184','1','Home',2,'',34,1),(69,'2018-09-29 08:31:26.728647','4','Movies',2,'[{\"changed\": {\"fields\": [\"navigation_extenders\", \"xframe_options\"]}}]',34,1),(70,'2018-09-29 08:31:31.074929','4','Movies',2,'',34,1),(71,'2018-09-29 08:31:50.912491','4','Movies',2,'[{\"changed\": {\"fields\": [\"application_urls\", \"application_namespace\", \"xframe_options\"]}}]',34,1),(72,'2018-09-29 08:32:41.698450','4','Movies',2,'',34,1),(73,'2018-09-29 08:33:26.196554','4','Movies',2,'[{\"changed\": {\"fields\": [\"template\", \"reverse_id\", \"xframe_options\"]}}]',34,1),(74,'2018-09-29 09:44:08.340740','4','Movies',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',34,1),(75,'2018-09-29 09:44:12.395665','4','Movies',2,'',34,1),(76,'2018-09-30 05:45:20.233532','14','Footer Navigation',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',34,1),(77,'2018-09-30 05:45:34.676828','14','Footer Navigation',2,'',34,1),(78,'2018-09-30 16:37:13.055329','2','Test Title',3,'',50,1),(79,'2018-09-30 16:43:43.173206','3','News',2,'[{\"changed\": {\"fields\": [\"template\", \"xframe_options\"]}}]',34,1),(80,'2018-09-30 17:31:10.564267','3','News',2,'',34,1),(81,'2018-10-01 14:58:41.948796','1','CSSExtension object (1)',1,'[{\"added\": {}}]',51,1),(82,'2018-10-02 06:43:20.558676','1','Category object (1)',1,'[{\"added\": {}}]',52,1),(83,'2018-10-02 06:43:28.082500','2','Category object (2)',1,'[{\"added\": {}}]',52,1),(84,'2018-10-02 15:56:43.577491','1','Root',1,'[{\"added\": {}}]',19,1),(85,'2018-10-02 15:57:01.598185','2','First',1,'[{\"added\": {}}]',19,1),(86,'2018-10-02 15:57:15.822533','3','Next',1,'[{\"added\": {}}]',19,1),(87,'2018-10-02 15:57:27.043342','4','Third',1,'[{\"added\": {}}]',19,1),(88,'2018-10-02 16:01:29.439013','1','Root',2,'[]',19,1),(89,'2018-10-02 16:05:33.434491','2','First',3,'',19,1),(90,'2018-10-02 16:05:44.073990','3','Next',3,'',19,1),(92,'2018-10-02 16:06:06.541144','1','Root',3,'',19,1),(94,'2018-10-02 16:11:35.202078','4','Third',2,'[{\"changed\": {\"fields\": [\"path\", \"depth\"]}}]',19,1),(95,'2018-10-02 16:18:12.747319','5','Root',1,'[{\"added\": {}}]',19,1),(96,'2018-10-02 16:24:32.159771','5','Root',2,'[{\"changed\": {\"fields\": [\"depth\"]}}]',19,1),(97,'2018-10-02 16:24:50.246216','6','First',1,'[{\"added\": {}}]',19,1),(98,'2018-10-02 16:25:01.693147','7','Other',1,'[{\"added\": {}}]',19,1),(99,'2018-10-02 16:25:17.622593','8','Next',1,'[{\"added\": {}}]',19,1),(100,'2018-10-02 16:55:06.950635','4','Movies',2,'[{\"changed\": {\"fields\": [\"application_urls\", \"application_namespace\", \"xframe_options\"]}}]',34,1),(101,'2018-10-05 16:37:55.962994','1','8f7a978ba5d4cc5644149443e95250efef5cc5d6 for jkronika',1,'[{\"added\": {}}]',56,1),(102,'2018-10-07 05:52:51.397484','1','Michael Jackson - Thriller (Official Video)',1,'[{\"added\": {}}]',57,1),(103,'2018-10-07 06:54:53.146430','1','Michael Jackson - Thriller (Official Video)',2,'[{\"changed\": {\"fields\": [\"anonymous_views\", \"authenticated_views\"]}}]',57,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(24,'artists','artist'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'bulletin_board','bulletin'),(54,'bulletin_board','category'),(37,'cms','aliaspluginmodel'),(36,'cms','cmsplugin'),(38,'cms','globalpagepermission'),(34,'cms','page'),(39,'cms','pagepermission'),(48,'cms','pagetype'),(40,'cms','pageuser'),(41,'cms','pageusergroup'),(33,'cms','placeholder'),(42,'cms','placeholderreference'),(43,'cms','staticplaceholder'),(44,'cms','title'),(47,'cms','treenode'),(46,'cms','urlconfrevision'),(45,'cms','usersettings'),(51,'cms_extensions','cssextension'),(5,'contenttypes','contenttype'),(18,'cv','curriculumvitae'),(17,'cv','experience'),(10,'demo_app','category'),(8,'demo_app','idea'),(9,'demo_app','like'),(50,'editorial','editorialcontent'),(19,'ideas','category'),(20,'ideas','idea'),(23,'likes','like'),(21,'locations','location'),(7,'magazine','newsarticle'),(49,'menus','cachekey'),(14,'movies','actor'),(52,'movies','category'),(13,'movies','director'),(15,'movies','genre'),(16,'movies','movie'),(53,'music','track'),(26,'products','product'),(25,'products','productphoto'),(11,'quotes','inspirationalquote'),(6,'sessions','session'),(35,'sites','site'),(28,'social_django','association'),(29,'social_django','code'),(30,'social_django','nonce'),(32,'social_django','partial'),(31,'social_django','usersocialauth'),(55,'tastypie','apiaccess'),(56,'tastypie','apikey'),(22,'thumbnail','kvstore'),(57,'viral_videos','viralvideo'),(27,'watermarker','watermark');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-06 16:18:12.532408'),(2,'auth','0001_initial','2018-09-06 16:18:13.328115'),(3,'admin','0001_initial','2018-09-06 16:18:13.557201'),(4,'admin','0002_logentry_remove_auto_add','2018-09-06 16:18:13.583672'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-06 16:18:13.613421'),(6,'contenttypes','0002_remove_content_type_name','2018-09-06 16:18:13.740030'),(7,'auth','0002_alter_permission_name_max_length','2018-09-06 16:18:13.774041'),(8,'auth','0003_alter_user_email_max_length','2018-09-06 16:18:13.817646'),(9,'auth','0004_alter_user_username_opts','2018-09-06 16:18:13.843554'),(10,'auth','0005_alter_user_last_login_null','2018-09-06 16:18:13.911656'),(11,'auth','0006_require_contenttypes_0002','2018-09-06 16:18:13.926425'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-06 16:18:13.957453'),(13,'auth','0008_alter_user_username_max_length','2018-09-06 16:18:14.010016'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-06 16:18:14.053214'),(15,'sessions','0001_initial','2018-09-06 16:18:14.165037'),(16,'magazine','0001_initial','2018-09-06 16:22:28.076803'),(17,'demo_app','0001_initial','2018-09-11 16:43:09.670695'),(18,'demo_app','0002_add_category','2018-09-11 17:17:12.920471'),(19,'demo_app','0003_categories_added','2018-09-11 17:18:48.418254'),(20,'demo_app','0004_copy_categories','2018-09-11 17:21:12.506808'),(21,'demo_app','0005_delete_category','2018-09-11 17:24:41.852868'),(22,'quotes','0001_initial','2018-09-13 14:18:44.630295'),(23,'bulletin_board','0001_initial','2018-09-14 04:42:35.607728'),(24,'movies','0001_initial','2018-09-16 08:39:12.951834'),(25,'cv','0001_initial','2018-09-16 19:35:52.857061'),(26,'locations','0001_initial','2018-09-17 23:47:28.092053'),(27,'locations','0002_auto_20180918_0412','2018-09-18 04:12:30.749563'),(28,'thumbnail','0001_initial','2018-09-18 15:24:57.199659'),(30,'movies','0002_auto_20180920_0458','2018-09-20 04:58:59.600513'),(31,'movies','0003_add_top_250_movies_from_imdb','2018-09-20 05:06:29.190129'),(32,'likes','0001_initial','2018-09-21 22:17:20.449599'),(33,'products','0001_initial','2018-09-24 00:01:24.347824'),(34,'movies','0004_auto_20180924_0000','2018-09-24 00:02:15.607075'),(35,'quotes','0002_inspirationalquote_language','2018-09-24 00:02:37.992438'),(36,'magazine','0002_newsarticle_status','2018-09-24 00:05:22.092938'),(38,'products','0002_add-product-data','2018-09-24 01:10:52.155323'),(39,'watermarker','0001_initial','2018-09-25 07:00:08.369082'),(40,'watermarker','0002_auto_20180925_0659','2018-09-25 07:00:08.435236'),(41,'default','0001_initial','2018-09-25 07:55:39.978194'),(42,'social_auth','0001_initial','2018-09-25 07:55:40.058526'),(43,'default','0002_add_related_name','2018-09-25 07:55:40.222031'),(44,'social_auth','0002_add_related_name','2018-09-25 07:55:40.282178'),(45,'default','0003_alter_email_max_length','2018-09-25 07:55:40.371617'),(46,'social_auth','0003_alter_email_max_length','2018-09-25 07:55:40.435130'),(47,'default','0004_auto_20160423_0400','2018-09-25 07:55:40.518518'),(48,'social_auth','0004_auto_20160423_0400','2018-09-25 07:55:40.584188'),(49,'social_auth','0005_auto_20160727_2333','2018-09-25 07:55:40.693110'),(50,'social_django','0006_partial','2018-09-25 07:55:40.922649'),(51,'social_django','0007_code_timestamp','2018-09-25 07:55:41.129864'),(52,'social_django','0008_partial_timestamp','2018-09-25 07:55:41.346132'),(53,'social_django','0001_initial','2018-09-25 07:55:41.463747'),(54,'social_django','0003_alter_email_max_length','2018-09-25 07:55:41.525775'),(55,'social_django','0002_add_related_name','2018-09-25 07:55:41.584959'),(56,'social_django','0005_auto_20160727_2333','2018-09-25 07:55:41.647164'),(57,'social_django','0004_auto_20160423_0400','2018-09-25 07:55:41.713861'),(58,'sites','0001_initial','2018-09-27 04:26:42.788184'),(59,'cms','0001_initial','2018-09-27 04:26:45.875216'),(60,'cms','0002_auto_20140816_1918','2018-09-27 04:26:48.715752'),(61,'cms','0003_auto_20140926_2347','2018-09-27 04:26:48.827115'),(62,'cms','0004_auto_20140924_1038','2018-09-27 04:26:49.742617'),(63,'cms','0005_auto_20140924_1039','2018-09-27 04:26:49.867205'),(64,'cms','0006_auto_20140924_1110','2018-09-27 04:26:50.687199'),(65,'cms','0007_auto_20141028_1559','2018-09-27 04:26:50.829332'),(66,'cms','0008_auto_20150208_2149','2018-09-27 04:26:51.007252'),(67,'cms','0008_auto_20150121_0059','2018-09-27 04:26:51.186703'),(68,'cms','0009_merge','2018-09-27 04:26:51.267317'),(69,'cms','0010_migrate_use_structure','2018-09-27 04:26:51.533511'),(70,'cms','0011_auto_20150419_1006','2018-09-27 04:26:51.737685'),(71,'cms','0012_auto_20150607_2207','2018-09-27 04:26:52.060932'),(72,'cms','0013_urlconfrevision','2018-09-27 04:26:52.189143'),(73,'cms','0014_auto_20160404_1908','2018-09-27 04:26:52.330527'),(74,'cms','0015_auto_20160421_0000','2018-09-27 04:26:52.514432'),(75,'cms','0016_auto_20160608_1535','2018-09-27 04:26:52.793417'),(76,'cms','0017_pagetype','2018-09-27 04:26:53.045447'),(77,'cms','0018_pagenode','2018-09-27 04:26:53.931799'),(78,'cms','0019_set_pagenode','2018-09-27 04:26:54.118814'),(79,'cms','0020_old_tree_cleanup','2018-09-27 04:26:55.109317'),(80,'cms','0021_auto_20180507_1432','2018-09-27 04:26:55.195176'),(81,'cms','0022_auto_20180620_1551','2018-09-27 04:26:55.287327'),(82,'menus','0001_initial','2018-09-27 04:26:55.448910'),(83,'sites','0002_alter_domain_unique','2018-09-27 04:26:55.557002'),(84,'cms','0018_create_pagenode','2018-09-27 04:26:55.706087'),(85,'movies','0005_auto_20180929_0621','2018-09-29 06:21:33.661842'),(86,'editorial','0001_initial','2018-09-30 05:54:43.114409'),(87,'cms_extensions','0001_initial','2018-09-30 22:59:16.167490'),(88,'movies','0006_auto_20181002_0344','2018-10-02 03:45:43.597018'),(89,'ideas','0001_initial','2018-10-02 04:52:57.728954'),(90,'movies','0007_auto_20181003_0027','2018-10-03 00:27:30.503025'),(91,'music','0001_initial','2018-10-04 06:09:30.031863'),(92,'bulletin_board','0002_auto_20181004_1622','2018-10-04 16:22:25.790841'),(93,'tastypie','0001_initial','2018-10-05 04:05:58.605808'),(94,'tastypie','0002_api_access_url_length','2018-10-05 04:05:58.763342'),(95,'viral_videos','0001_initial','2018-10-07 05:32:43.141371'),(96,'products','0003_auto_20181009_0636','2018-10-09 06:36:15.551121'),(97,'watermarker','0002_auto_20181009_0636','2018-10-09 06:36:15.644018');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial_editorialcontent`
--

DROP TABLE IF EXISTS `editorial_editorialcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorial_editorialcontent` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `website` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_caption` longtext NOT NULL,
  `css_class` varchar(255) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `editorial_editorialc_cmsplugin_ptr_id_cffa6a3c_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial_editorialcontent`
--

LOCK TABLES `editorial_editorialcontent` WRITE;
/*!40000 ALTER TABLE `editorial_editorialcontent` DISABLE KEYS */;
INSERT INTO `editorial_editorialcontent` VALUES (3,'Test title','Test subtitle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate sodales lectus, at tincidunt sapien fringilla id. Maecenas pharetra dui sed fringilla condimentum. Cras varius lacus eu consequat hendrerit. Pellentesque vitae sem id justo aliquet ornare. Vestibulum sit amet ex luctus mi tincidunt iaculis ac nec ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque consectetur at turpis eu gravida. Fusce eu sem ipsum. Suspendisse sed ligula at elit eleifend congue. Praesent odio risus, ultricies facilisis dignissim vel, semper ut eros. Cras vel dolor mi. Maecenas vel auctor erat. Nunc pharetra pharetra velit in bibendum. Integer vestibulum ante magna, sed finibus nisl fermentum fringilla.','','editorial/2018/09/20180930164623.jpg','<em>Solar Panels</em>',''),(4,'Maecenas sodales sit amet lectus congue mattis','','Proin pharetra erat dolor, at lacinia nisl cursus a. Aliquam vel imperdiet lectus. Vivamus commodo orci in ornare eleifend. Maecenas vulputate erat quis justo commodo viverra. Cras auctor nisi enim, et convallis ante consectetur sed. Fusce fringilla feugiat ullamcorper.','','','',''),(5,'Phasellus leo sapien','','Cursus vel mauris quis, venenatis suscipit lectus. Duis eget tellus nec velit vehicula vulputate a id nibh. Nulla sed rhoncus velit. Aliquam non mollis nulla. Vestibulum ex turpis, auctor sed auctor vel, dapibus commodo orci. Donec venenatis auctor ornare.','','','',''),(6,'Test title','Test subtitle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate sodales lectus, at tincidunt sapien fringilla id. Maecenas pharetra dui sed fringilla condimentum. Cras varius lacus eu consequat hendrerit. Pellentesque vitae sem id justo aliquet ornare. Vestibulum sit amet ex luctus mi tincidunt iaculis ac nec ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque consectetur at turpis eu gravida. Fusce eu sem ipsum. Suspendisse sed ligula at elit eleifend congue. Praesent odio risus, ultricies facilisis dignissim vel, semper ut eros. Cras vel dolor mi. Maecenas vel auctor erat. Nunc pharetra pharetra velit in bibendum. Integer vestibulum ante magna, sed finibus nisl fermentum fringilla.','','editorial/2018/09/20180930164623.jpg','<em>Solar Panels</em>',''),(7,'Maecenas sodales sit amet lectus congue mattis','','Proin pharetra erat dolor, at lacinia nisl cursus a. Aliquam vel imperdiet lectus. Vivamus commodo orci in ornare eleifend. Maecenas vulputate erat quis justo commodo viverra. Cras auctor nisi enim, et convallis ante consectetur sed. Fusce fringilla feugiat ullamcorper.','','','',''),(8,'Phasellus leo sapien','','Cursus vel mauris quis, venenatis suscipit lectus. Duis eget tellus nec velit vehicula vulputate a id nibh. Nulla sed rhoncus velit. Aliquam non mollis nulla. Vestibulum ex turpis, auctor sed auctor vel, dapibus commodo orci. Donec venenatis auctor ornare.','','','',''),(9,'Johann Sebastian Bach','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate sodales lectus, at tincidunt sapien fringilla id. Maecenas pharetra dui sed fringilla condimentum. Cras varius lacus eu consequat hendrerit. Pellentesque vitae sem id justo aliquet ornare. Vestibulum sit amet ex luctus mi tincidunt iaculis ac nec ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque consectetur at turpis eu gravida. Fusce eu sem ipsum. Suspendisse sed ligula at elit eleifend congue. Praesent odio risus, ultricies facilisis dignissim vel, semper ut eros. Cras vel dolor mi. Maecenas vel auctor erat. Nunc pharetra pharetra velit in bibendum. Integer vestibulum ante magna, sed finibus nisl fermentum fringilla.</p>\r\n<p>Donec at tortor et elit accumsan hendrerit eget at risus. Sed vulputate scelerisque malesuada. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean commodo lacus ligula, vel laoreet diam tristique non. Vivamus ac feugiat nisi, molestie convallis ligula. Phasellus est sem, egestas eget nibh id, faucibus sollicitudin risus. Integer ut nunc mauris. Nunc a sagittis diam, non maximus eros. Sed nec velit sed quam vehicula pretium. Nam eget odio felis. Ut ac risus posuere, condimentum odio vel, egestas augue. Fusce dolor justo, sollicitudin in libero non, rhoncus egestas ipsum. Integer placerat pretium est nec pharetra. Aenean laoreet arcu nec velit commodo porttitor.</p>','','','','');
/*!40000 ALTER TABLE `editorial_editorialcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas_category`
--

DROP TABLE IF EXISTS `ideas_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas_category`
--

LOCK TABLES `ideas_category` WRITE;
/*!40000 ALTER TABLE `ideas_category` DISABLE KEYS */;
INSERT INTO `ideas_category` VALUES (5,'root',1,0,'2018-10-02 16:18:12.745718','2018-10-02 16:24:32.158554','Root','','',''),(6,'rootfrst',2,0,'2018-10-02 16:24:50.244683','2018-10-02 16:24:50.244720','First','','',''),(7,'othr',1,0,'2018-10-02 16:25:01.691601','2018-10-02 16:25:01.691640','Other','','',''),(8,'othrnext',2,0,'2018-10-02 16:25:17.621404','2018-10-02 16:25:17.621449','Next','','','');
/*!40000 ALTER TABLE `ideas_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas_idea`
--

DROP TABLE IF EXISTS `ideas_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_original` tinyint(1) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `title_de` varchar(200) NOT NULL,
  `title_fr` varchar(200) NOT NULL,
  `title_lt` varchar(200) NOT NULL,
  `subtitle_en` varchar(200) NOT NULL,
  `subtitle_de` varchar(200) NOT NULL,
  `subtitle_fr` varchar(200) NOT NULL,
  `subtitle_lt` varchar(200) NOT NULL,
  `description_en` longtext NOT NULL,
  `description_de` longtext NOT NULL,
  `description_fr` longtext NOT NULL,
  `description_lt` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas_idea`
--

LOCK TABLES `ideas_idea` WRITE;
/*!40000 ALTER TABLE `ideas_idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideas_idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas_idea_categories`
--

DROP TABLE IF EXISTS `ideas_idea_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas_idea_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idea_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ideas_idea_categories_idea_id_category_id_17cddda9_uniq` (`idea_id`,`category_id`),
  KEY `ideas_idea_categories_category_id_cc92c958_fk_ideas_category_id` (`category_id`),
  CONSTRAINT `ideas_idea_categories_category_id_cc92c958_fk_ideas_category_id` FOREIGN KEY (`category_id`) REFERENCES `ideas_category` (`id`),
  CONSTRAINT `ideas_idea_categories_idea_id_567765c1_fk_ideas_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `ideas_idea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas_idea_categories`
--

LOCK TABLES `ideas_idea_categories` WRITE;
/*!40000 ALTER TABLE `ideas_idea_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideas_idea_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_like`
--

DROP TABLE IF EXISTS `likes_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` (`content_type_id`),
  KEY `likes_like_user_id_aae4c421_fk_auth_user_id` (`user_id`),
  CONSTRAINT `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_like_user_id_aae4c421_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_like`
--

LOCK TABLES `likes_like` WRITE;
/*!40000 ALTER TABLE `likes_like` DISABLE KEYS */;
INSERT INTO `likes_like` VALUES (9,'2018-09-22 00:07:35.604608','2018-09-22 00:07:35.604647','2',21,1),(10,'2018-10-09 07:44:25.365420','2018-10-09 07:44:25.365458','1',21,1);
/*!40000 ALTER TABLE `likes_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_location`
--

DROP TABLE IF EXISTS `locations_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `street` varchar(255) NOT NULL,
  `street2` varchar(255) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `locations_location_slug_0338bba7` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_location`
--

LOCK TABLES `locations_location` WRITE;
/*!40000 ALTER TABLE `locations_location` DISABLE KEYS */;
INSERT INTO `locations_location` VALUES (1,'Somewhere','Out there','123 Tester St','','55555','Testing','US',12.345,67.89,'somewhere-out-there','locations/somewhere-out-there.jpg'),(2,'Eiffel Tower','The Eiffel Tower is a wrought iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. – Source: wikipedia. Photo source: https://www.pexels.com/photo/picture-of-eiffel-tower-338515/','Champ de Mars','5 Avenue Anatole','75007','Paris','FR',48.8584,2.2945,'eiffel-tower','locations/eiffel-tower.jpg');
/*!40000 ALTER TABLE `locations_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine_newsarticle`
--

DROP TABLE IF EXISTS `magazine_newsarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magazine_newsarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazine_newsarticle`
--

LOCK TABLES `magazine_newsarticle` WRITE;
/*!40000 ALTER TABLE `magazine_newsarticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `magazine_newsarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_cachekey`
--

DROP TABLE IF EXISTS `menus_cachekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_cachekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `site` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (15,'en',1,'cms_3.5.2_menu_nodes_en_1_1_user:draft'),(16,'en',1,'cms_3.5.2_menu_nodes_en_1:public');
/*!40000 ALTER TABLE `menus_cachekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_actor`
--

DROP TABLE IF EXISTS `movies_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_actor`
--

LOCK TABLES `movies_actor` WRITE;
/*!40000 ALTER TABLE `movies_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_category`
--

DROP TABLE IF EXISTS `movies_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_category_lft_2225bfcc` (`lft`),
  KEY `movies_category_rght_37a7984f` (`rght`),
  KEY `movies_category_tree_id_e3b88b37` (`tree_id`),
  KEY `movies_category_level_06308565` (`level`),
  KEY `movies_category_parent_id_08f81fa5` (`parent_id`),
  CONSTRAINT `movies_category_parent_id_08f81fa5_fk_movies_category_id` FOREIGN KEY (`parent_id`) REFERENCES `movies_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_category`
--

LOCK TABLES `movies_category` WRITE;
/*!40000 ALTER TABLE `movies_category` DISABLE KEYS */;
INSERT INTO `movies_category` VALUES (1,'2018-10-02 06:43:20.557926','2018-10-02 06:43:20.557975','Root',1,4,1,0,NULL),(2,'2018-10-02 06:43:28.081076','2018-10-02 06:43:28.081142','Next',2,3,1,1,1);
/*!40000 ALTER TABLE `movies_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_director`
--

DROP TABLE IF EXISTS `movies_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_director`
--

LOCK TABLES `movies_director` WRITE;
/*!40000 ALTER TABLE `movies_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genre`
--

DROP TABLE IF EXISTS `movies_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genre`
--

LOCK TABLES `movies_genre` WRITE;
/*!40000 ALTER TABLE `movies_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie`
--

DROP TABLE IF EXISTS `movies_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `rank` int(10) unsigned NOT NULL,
  `release_year` smallint(5) unsigned NOT NULL,
  `commercial` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `independent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie`
--

LOCK TABLES `movies_movie` WRITE;
/*!40000 ALTER TABLE `movies_movie` DISABLE KEYS */;
INSERT INTO `movies_movie` VALUES (501,'The Shawshank Redemption',9.2,1,1994,0,0,0),(502,'The Godfather',9.2,2,1972,0,0,0),(503,'The Godfather: Part II',9.0,3,1974,0,0,0),(504,'The Dark Knight',9.0,4,2008,0,0,0),(505,'12 Angry Men',8.9,5,1957,0,0,0),(506,'Schindler\'s List',8.9,6,1993,0,0,0),(507,'The Lord of the Rings: The Return of the King',8.9,7,2003,0,0,0),(508,'Pulp Fiction',8.9,8,1994,0,0,0),(509,'The Good, the Bad and the Ugly',8.8,9,1966,0,0,0),(510,'Fight Club',8.8,10,1999,0,0,0),(511,'The Lord of the Rings: The Fellowship of the Ring',8.8,11,2001,0,0,0),(512,'Forrest Gump',8.7,12,1994,0,0,0),(513,'Star Wars: Episode V - The Empire Strikes Back',8.7,13,1980,0,0,0),(514,'Inception',8.7,14,2010,0,0,0),(515,'The Lord of the Rings: The Two Towers',8.7,15,2002,0,0,0),(516,'One Flew Over the Cuckoo\'s Nest',8.7,16,1975,0,0,0),(517,'Goodfellas',8.7,17,1990,0,0,0),(518,'The Matrix',8.6,18,1999,0,0,0),(519,'Seven Samurai',8.6,19,1954,0,0,0),(520,'City of God',8.6,20,2002,0,0,0),(521,'Se7en',8.6,21,1995,0,0,0),(522,'Star Wars: Episode IV - A New Hope',8.6,22,1977,0,0,0),(523,'The Silence of the Lambs',8.6,23,1991,0,0,0),(524,'It\'s a Wonderful Life',8.6,24,1946,0,0,0),(525,'Life Is Beautiful',8.6,25,1997,0,0,0),(526,'The Usual Suspects',8.5,26,1995,0,0,0),(527,'Spirited Away',8.5,27,2001,0,0,0),(528,'Saving Private Ryan',8.5,28,1998,0,0,0),(529,'Léon: The Professional',8.5,29,1994,0,0,0),(530,'The Green Mile',8.5,30,1999,0,0,0),(531,'Interstellar',8.5,31,2014,0,0,0),(532,'American History X',8.5,32,1998,0,0,0),(533,'Psycho',8.5,33,1960,0,0,0),(534,'City Lights',8.5,34,1931,0,0,0),(535,'Once Upon a Time in the West',8.5,35,1968,0,0,0),(536,'Casablanca',8.5,36,1942,0,0,0),(537,'Modern Times',8.5,37,1936,0,0,0),(538,'The Intouchables',8.5,38,2011,0,0,0),(539,'The Pianist',8.5,39,2002,0,0,0),(540,'The Departed',8.5,40,2006,0,0,0),(541,'Terminator 2',8.5,41,1991,0,0,0),(542,'Back to the Future',8.5,42,1985,0,0,0),(543,'Rear Window',8.5,43,1954,0,0,0),(544,'Whiplash',8.5,44,2014,0,0,0),(545,'Raiders of the Lost Ark',8.5,45,1981,0,0,0),(546,'Gladiator',8.5,46,2000,0,0,0),(547,'The Lion King',8.5,47,1994,0,0,0),(548,'Avengers: Infinity War',8.5,48,2018,0,0,0),(549,'The Prestige',8.5,49,2006,0,0,0),(550,'Memento',8.4,50,2000,0,0,0),(551,'Apocalypse Now',8.4,51,1979,0,0,0),(552,'Alien',8.4,52,1979,0,0,0),(553,'The Great Dictator',8.4,53,1940,0,0,0),(554,'Cinema Paradiso',8.4,54,1988,0,0,0),(555,'Grave of the Fireflies',8.4,55,1988,0,0,0),(556,'Sunset Boulevard',8.4,56,1950,0,0,0),(557,'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb',8.4,57,1964,0,0,0),(558,'The Lives of Others',8.4,58,2006,0,0,0),(559,'Paths of Glory',8.4,59,1957,0,0,0),(560,'The Shining',8.4,60,1980,0,0,0),(561,'Django Unchained',8.4,61,2012,0,0,0),(562,'WALL·E',8.4,62,2008,0,0,0),(563,'Princess Mononoke',8.4,63,1997,0,0,0),(564,'Witness for the Prosecution',8.4,64,1957,0,0,0),(565,'Coco',8.4,65,2017,0,0,0),(566,'American Beauty',8.4,66,1999,0,0,0),(567,'The Dark Knight Rises',8.4,67,2012,0,0,0),(568,'Oldboy',8.4,68,2003,0,0,0),(569,'Aliens',8.3,69,1986,0,0,0),(570,'Once Upon a Time in America',8.3,70,1984,0,0,0),(571,'Das Boot',8.3,71,1981,0,0,0),(572,'Citizen Kane',8.3,72,1941,0,0,0),(573,'Braveheart',8.3,73,1995,0,0,0),(574,'Vertigo',8.3,74,1958,0,0,0),(575,'North by Northwest',8.3,75,1959,0,0,0),(576,'Reservoir Dogs',8.3,76,1992,0,0,0),(577,'Your Name.',8.3,77,2016,0,0,0),(578,'Star Wars: Episode VI - Return of the Jedi',8.3,78,1983,0,0,0),(579,'M',8.3,79,1931,0,0,0),(580,'Dangal',8.3,80,2016,0,0,0),(581,'Requiem for a Dream',8.3,81,2000,0,0,0),(582,'Amadeus',8.3,82,1984,0,0,0),(583,'Like Stars on Earth',8.3,83,2007,0,0,0),(584,'Lawrence of Arabia',8.3,84,1962,0,0,0),(585,'Eternal Sunshine of the Spotless Mind',8.3,85,2004,0,0,0),(586,'A Clockwork Orange',8.3,86,1971,0,0,0),(587,'Amélie',8.3,87,2001,0,0,0),(588,'Double Indemnity',8.3,88,1944,0,0,0),(589,'3 Idiots',8.3,89,2009,0,0,0),(590,'2001: A Space Odyssey',8.3,90,1968,0,0,0),(591,'Toy Story',8.3,91,1995,0,0,0),(592,'Taxi Driver',8.3,92,1976,0,0,0),(593,'Singin\' in the Rain',8.3,93,1952,0,0,0),(594,'Full Metal Jacket',8.3,94,1987,0,0,0),(595,'Inglourious Basterds',8.3,95,2009,0,0,0),(596,'To Kill a Mockingbird',8.3,96,1962,0,0,0),(597,'Bicycle Thieves',8.3,97,1948,0,0,0),(598,'The Kid',8.3,98,1921,0,0,0),(599,'The Sting',8.3,99,1973,0,0,0),(600,'Toy Story 3',8.3,100,2010,0,0,0),(601,'Good Will Hunting',8.3,101,1997,0,0,0),(602,'The Hunt',8.3,102,2012,0,0,0),(603,'Snatch',8.3,103,2000,0,0,0),(604,'Monty Python and the Holy Grail',8.2,104,1975,0,0,0),(605,'Scarface',8.2,105,1983,0,0,0),(606,'For a Few Dollars More',8.2,106,1965,0,0,0),(607,'L.A. Confidential',8.2,107,1997,0,0,0),(608,'The Apartment',8.2,108,1960,0,0,0),(609,'Metropolis',8.2,109,1927,0,0,0),(610,'A Separation',8.2,110,2011,0,0,0),(611,'Indiana Jones and the Last Crusade',8.2,111,1989,0,0,0),(612,'Rashomon',8.2,112,1950,0,0,0),(613,'Up',8.2,113,2009,0,0,0),(614,'All About Eve',8.2,114,1950,0,0,0),(615,'Yojimbo',8.2,115,1961,0,0,0),(616,'Batman Begins',8.2,116,2005,0,0,0),(617,'Some Like It Hot',8.2,117,1959,0,0,0),(618,'Unforgiven',8.2,118,1992,0,0,0),(619,'Downfall',8.2,119,2004,0,0,0),(620,'The Treasure of the Sierra Madre',8.2,120,1948,0,0,0),(621,'Die Hard',8.2,121,1988,0,0,0),(622,'Heat',8.2,122,1995,0,0,0),(623,'Ikiru',8.2,123,1952,0,0,0),(624,'Raging Bull',8.2,124,1980,0,0,0),(625,'The Great Escape',8.2,125,1963,0,0,0),(626,'Incendies',8.2,126,2010,0,0,0),(627,'My Father and My Son',8.2,127,2005,0,0,0),(628,'Children of Heaven',8.2,128,1997,0,0,0),(629,'Pan\'s Labyrinth',8.2,129,2006,0,0,0),(630,'The Third Man',8.2,130,1949,0,0,0),(631,'Chinatown',8.2,131,1974,0,0,0),(632,'My Neighbor Totoro',8.2,132,1988,0,0,0),(633,'Ran',8.2,133,1985,0,0,0),(634,'Howl\'s Moving Castle',8.2,134,2004,0,0,0),(635,'Judgment at Nuremberg',8.2,135,1961,0,0,0),(636,'The Secret in Their Eyes',8.2,136,2009,0,0,0),(637,'The Gold Rush',8.2,137,1925,0,0,0),(638,'The Bridge on the River Kwai',8.2,138,1957,0,0,0),(639,'Three Billboards Outside Ebbing, Missouri',8.2,139,2017,0,0,0),(640,'On the Waterfront',8.2,140,1954,0,0,0),(641,'A Beautiful Mind',8.2,141,2001,0,0,0),(642,'Lock, Stock and Two Smoking Barrels',8.2,142,1998,0,0,0),(643,'Casino',8.2,143,1995,0,0,0),(644,'The Seventh Seal',8.2,144,1957,0,0,0),(645,'Inside Out',8.2,145,2015,0,0,0),(646,'Room',8.1,146,2015,0,0,0),(647,'The Elephant Man',8.1,147,1980,0,0,0),(648,'Mr. Smith Goes to Washington',8.1,148,1939,0,0,0),(649,'The Wolf of Wall Street',8.1,149,2013,0,0,0),(650,'V for Vendetta',8.1,150,2005,0,0,0),(651,'Warrior',8.1,151,2011,0,0,0),(652,'Blade Runner',8.1,152,1982,0,0,0),(653,'The General',8.1,153,1926,0,0,0),(654,'Wild Strawberries',8.1,154,1957,0,0,0),(655,'Dial M for Murder',8.1,155,1954,0,0,0),(656,'Trainspotting',8.1,156,1996,0,0,0),(657,'No Country for Old Men',8.1,157,2007,0,0,0),(658,'There Will Be Blood',8.1,158,2007,0,0,0),(659,'Gone with the Wind',8.1,159,1939,0,0,0),(660,'The Sixth Sense',8.1,160,1999,0,0,0),(661,'Fargo',8.1,161,1996,0,0,0),(662,'The Thing',8.1,162,1982,0,0,0),(663,'Gran Torino',8.1,163,2008,0,0,0),(664,'The Deer Hunter',8.1,164,1978,0,0,0),(665,'Finding Nemo',8.1,165,2003,0,0,0),(666,'Sherlock Jr.',8.1,166,1924,0,0,0),(667,'Come and See',8.1,167,1985,0,0,0),(668,'The Big Lebowski',8.1,168,1998,0,0,0),(669,'Kill Bill: Vol. 1',8.1,169,2003,0,0,0),(670,'Shutter Island',8.1,170,2010,0,0,0),(671,'Cool Hand Luke',8.1,171,1967,0,0,0),(672,'Rebecca',8.1,172,1940,0,0,0),(673,'Tokyo Story',8.1,173,1953,0,0,0),(674,'Sunrise',8.1,174,1927,0,0,0),(675,'Hacksaw Ridge',8.1,175,2016,0,0,0),(676,'Mary and Max',8.1,176,2009,0,0,0),(677,'How to Train Your Dragon',8.1,177,2010,0,0,0),(678,'Gone Girl',8.1,178,2014,0,0,0),(679,'Wild Tales',8.1,179,2014,0,0,0),(680,'Jurassic Park',8.1,180,1993,0,0,0),(681,'Into the Wild',8.1,181,2007,0,0,0),(682,'Life of Brian',8.1,182,1979,0,0,0),(683,'The Bandit',8.1,183,1996,0,0,0),(684,'It Happened One Night',8.1,184,1934,0,0,0),(685,'In the Name of the Father',8.1,185,1993,0,0,0),(686,'Platoon',8.1,186,1986,0,0,0),(687,'Stand by Me',8.1,187,1986,0,0,0),(688,'The Grand Budapest Hotel',8.1,188,2014,0,0,0),(689,'Network',8.1,189,1976,0,0,0),(690,'The Truman Show',8.1,190,1998,0,0,0),(691,'Stalker',8.1,191,1979,0,0,0),(692,'Andrei Rublev',8.1,192,1966,0,0,0),(693,'Hotel Rwanda',8.1,193,2004,0,0,0),(694,'Ben-Hur',8.1,194,1959,0,0,0),(695,'Persona',8.1,195,1966,0,0,0),(696,'Memories of Murder',8.1,196,2003,0,0,0),(697,'Rang De Basanti',8.1,197,2006,0,0,0),(698,'The Wages of Fear',8.1,198,1953,0,0,0),(699,'12 Years a Slave',8.1,199,2013,0,0,0),(700,'The Passion of Joan of Arc',8.1,200,1928,0,0,0),(701,'Million Dollar Baby',8.1,201,2004,0,0,0),(702,'Rush',8.1,202,2013,0,0,0),(703,'Mad Max: Fury Road',8.1,203,2015,0,0,0),(704,'Before Sunrise',8.1,204,1995,0,0,0),(705,'The 400 Blows',8.1,205,1959,0,0,0),(706,'Spotlight',8.1,206,2015,0,0,0),(707,'Logan',8.1,207,2017,0,0,0),(708,'Amores Perros',8.1,208,2000,0,0,0),(709,'Hachi: A Dog\'s Tale',8.1,209,2009,0,0,0),(710,'Prisoners',8.1,210,2013,0,0,0),(711,'The Princess Bride',8.1,211,1987,0,0,0),(712,'Nausicaä of the Valley of the Wind',8.0,212,1984,0,0,0),(713,'Butch Cassidy and the Sundance Kid',8.0,213,1969,0,0,0),(714,'Catch Me If You Can',8.0,214,2002,0,0,0),(715,'Harry Potter and the Deathly Hallows: Part 2',8.0,215,2011,0,0,0),(716,'Rocky',8.0,216,1976,0,0,0),(717,'Barry Lyndon',8.0,217,1975,0,0,0),(718,'Monsters, Inc.',8.0,218,2001,0,0,0),(719,'The Maltese Falcon',8.0,219,1941,0,0,0),(720,'The Grapes of Wrath',8.0,220,1940,0,0,0),(721,'Diabolique',8.0,221,1955,0,0,0),(722,'Donnie Darko',8.0,222,2001,0,0,0),(723,'Blade Runner 2049',8.0,223,2017,0,0,0),(724,'The Terminator',8.0,224,1984,0,0,0),(725,'Gandhi',8.0,225,1982,0,0,0),(726,'Dead Poets Society',8.0,226,1989,0,0,0),(727,'La La Land',8.0,227,2016,0,0,0),(728,'The Nights of Cabiria',8.0,228,1957,0,0,0),(729,'La Haine',8.0,229,1995,0,0,0),(730,'Groundhog Day',8.0,230,1993,0,0,0),(731,'The Wizard of Oz',8.0,231,1939,0,0,0),(732,'Paper Moon',8.0,232,1973,0,0,0),(733,'Jaws',8.0,233,1975,0,0,0),(734,'The Help',8.0,234,2011,0,0,0),(735,'Gangs of Wasseypur',8.0,235,2012,0,0,0),(736,'In the Mood for Love',8.0,236,2000,0,0,0),(737,'A Wednesday',8.0,237,2008,0,0,0),(738,'Before Sunset',8.0,238,2004,0,0,0),(739,'The Bourne Ultimatum',8.0,239,2007,0,0,0),(740,'Paris, Texas',8.0,240,1984,0,0,0),(741,'Tangerines',8.0,241,2013,0,0,0),(742,'Guardians of the Galaxy',8.0,242,2014,0,0,0),(743,'The Best Years of Our Lives',8.0,243,1946,0,0,0),(744,'Castle in the Sky',8.0,244,1986,0,0,0),(745,'Pirates of the Caribbean: The Curse of the Black Pearl',8.0,245,2003,0,0,0),(746,'The Handmaiden',8.0,246,2016,0,0,0),(747,'Dog Day Afternoon',8.0,247,1975,0,0,0),(748,'Beauty and the Beast',8.0,248,1991,0,0,0),(749,'Fanny and Alexander',8.0,249,1982,0,0,0),(750,'Song of the Sea',8.0,250,2014,0,0,0),(751,'Material Girls',4.2,251,2006,0,0,0),(752,'The Oogieloves in the Big Balloon Adventure',4.2,252,2012,0,0,0),(753,'Extreme Movie',4.1,253,2008,0,0,0),(754,'One Missed Call',4.1,254,2008,0,0,0),(755,'Super Mario Bros.',4.1,255,1993,0,0,0),(756,'Plan 9 from Outer Space',4.1,256,1959,0,0,0),(757,'Book of Shadows: Blair Witch 2',4.1,257,2000,0,0,0),(758,'RoboCop 3',4.1,258,1993,0,0,0),(759,'Furry Vengeance',4.1,259,2010,0,0,0),(760,'Fifty Shades of Grey',4.1,260,2015,0,0,0),(761,'Prom Night',4.1,261,2008,0,0,0),(762,'Norbit',4.1,262,2007,0,0,0),(763,'S. Darko',4.0,263,2009,0,0,0),(764,'Caddyshack II',4.0,264,1988,0,0,0),(765,'Beverly Hills Chihuahua',4.0,265,2008,0,0,0),(766,'The Human Centipede II (Full Sequence)',4.0,266,2011,0,0,0),(767,'Exorcist II: The Heretic',4.0,267,1977,0,0,0),(768,'Stan Helsing',4.0,268,2009,0,0,0),(769,'Enes Batur Hayal mi Ger√ßek mi?',4.0,269,2018,0,0,0),(770,'The Adventures of Pluto Nash',4.0,270,2002,0,0,0),(771,'Swept Away',4.0,271,2002,0,0,0),(772,'The Cat in the Hat',3.9,272,2003,0,0,0),(773,'Dance Flick',3.9,273,2009,0,0,0),(774,'Street Fighter: The Legend of Chun-Li',3.9,274,2009,0,0,0),(775,'Ballistic: Ecks vs. Sever',3.9,275,2002,0,0,0),(776,'Street Fighter',3.9,276,1994,0,0,0),(777,'In the Name of the King: A Dungeon Siege Tale',3.9,277,2007,0,0,0),(778,'The Love Guru',3.9,278,2008,0,0,0),(779,'2001: A Space Travesty',3.9,279,2000,0,0,0),(780,'Piranha 3DD',3.9,280,2012,0,0,0),(781,'The Flintstones in Viva Rock Vegas',3.9,281,2000,0,0,0),(782,'Speed 2: Cruise Control',3.8,282,1997,0,0,0),(783,'You Got Served',3.8,283,2004,0,0,0),(784,'The Avengers',3.8,284,1998,0,0,0),(785,'I Know Who Killed Me',3.8,285,2007,0,0,0),(786,'Dungeons & Dragons',3.8,286,2000,0,0,0),(787,'Fifty Shades of Black',3.8,287,2016,0,0,0),(788,'Dragon Wars: D-War',3.8,288,2007,0,0,0),(789,'The Fog',3.8,289,2005,0,0,0),(790,'Mortal Kombat: Annihilation',3.8,290,1997,0,0,0),(791,'Superman IV: The Quest for Peace',3.8,291,1987,0,0,0),(792,'Spy Kids 4: All the Time in the World',3.8,292,2011,0,0,0),(793,'The Wicker Man',3.8,293,2006,0,0,0),(794,'The Open House',3.7,294,2018,0,0,0),(795,'Jaws 3-D',3.7,295,1983,0,0,0),(796,'Bucky Larson: Born to Be a Star',3.7,296,2011,0,0,0),(797,'Batman & Robin',3.7,297,1997,0,0,0),(798,'The Adventures of Sharkboy and Lavagirl 3-D',3.7,298,2005,0,0,0),(799,'The Room',3.7,299,2003,0,0,0),(800,'Feardotcom',3.6,300,2002,0,0,0),(801,'Scary Movie 5',3.6,301,2013,0,0,0),(802,'Dumb and Dumberer: When Harry Met Lloyd',3.6,302,2003,0,0,0),(803,'The Master of Disguise',3.6,303,2002,0,0,0),(804,'Far Cry',3.6,304,2008,0,0,0),(805,'Police Academy: Mission to Moscow',3.6,305,1994,0,0,0),(806,'Crossroads',3.6,306,2002,0,0,0),(807,'The Starving Games',3.6,307,2013,0,0,0),(808,'Vampires Suck',3.5,308,2010,0,0,0),(809,'Hercules in New York',3.5,309,1970,0,0,0),(810,'Spice World',3.5,310,1997,0,0,0),(811,'Texas Chainsaw Massacre: The Next Generation',3.5,311,1994,0,0,0),(812,'Barb Wire',3.5,312,1996,0,0,0),(813,'Race 3',3.4,313,2018,0,0,0),(814,'Jack and Jill',3.4,314,2011,0,0,0),(815,'Daddy Day Camp',3.4,315,2007,0,0,0),(816,'Gunday',3.4,316,2014,0,0,0),(817,'Catwoman',3.4,317,2004,0,0,0),(818,'The Emoji Movie',3.4,318,2017,0,0,0),(819,'Bratz',3.4,319,2007,0,0,0),(820,'Left Behind',3.3,320,2014,0,0,0),(821,'The Human Centipede III (Final Sequence)',3.3,321,2015,0,0,0),(822,'Rollerball',3.3,322,2002,0,0,0),(823,'Kazaam',3.1,323,1996,0,0,0),(824,'BloodRayne',3.1,324,2005,0,0,0),(825,'Jaws: The Revenge',3.1,325,1987,0,0,0),(826,'Troll 2',3.1,326,1990,0,0,0),(827,'Date Movie',2.9,327,2006,0,0,0),(828,'Baby Geniuses',2.9,328,1999,0,0,0),(829,'Meet the Spartans',2.8,329,2008,0,0,0),(830,'Who\'s Your Caddy?',2.8,330,2007,0,0,0),(831,'Dragonball: Evolution',2.7,331,2009,0,0,0),(832,'Gigli',2.6,332,2003,0,0,0),(833,'Glitter',2.6,333,2001,0,0,0),(834,'Going Overboard',2.6,334,1989,0,0,0),(835,'Daniel the Wizard',2.6,335,2004,0,0,0),(836,'Battlefield Earth',2.6,336,2000,0,0,0),(837,'Alone in the Dark',2.5,337,2005,0,0,0),(838,'Turks in Space',2.5,338,2006,0,0,0),(839,'Epic Movie',2.4,339,2007,0,0,0),(840,'From Justin to Kelly',2.4,340,2003,0,0,0),(841,'Son of the Mask',2.4,341,2005,0,0,0),(842,'Saving Christmas',2.3,342,2014,0,0,0),(843,'Pledge This!',2.3,343,2006,0,0,0),(844,'Code Name: K.O.Z.',2.3,344,2015,0,0,0),(845,'House of the Dead',2.3,345,2003,0,0,0),(846,'Birdemic: Shock and Terror',2.2,346,2010,0,0,0),(847,'The Hottie & the Nottie',2.2,347,2008,0,0,0),(848,'Manos: The Hands of Fate',2.1,348,1966,0,0,0),(849,'Superbabies: Baby Geniuses 2',2.0,349,2004,0,0,0),(850,'Disaster Movie',2.0,350,2008,0,0,0);
/*!40000 ALTER TABLE `movies_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_actors`
--

DROP TABLE IF EXISTS `movies_movie_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_actors_movie_id_actor_id_73463e17_uniq` (`movie_id`,`actor_id`),
  KEY `movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id` (`actor_id`),
  CONSTRAINT `movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `movies_actor` (`id`),
  CONSTRAINT `movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_actors`
--

LOCK TABLES `movies_movie_actors` WRITE;
/*!40000 ALTER TABLE `movies_movie_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_movie_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_categories`
--

DROP TABLE IF EXISTS `movies_movie_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_categories_movie_id_category_id_c0beab68_uniq` (`movie_id`,`category_id`),
  KEY `movies_movie_categor_category_id_b69736a9_fk_movies_ca` (`category_id`),
  CONSTRAINT `movies_movie_categor_category_id_b69736a9_fk_movies_ca` FOREIGN KEY (`category_id`) REFERENCES `movies_category` (`id`),
  CONSTRAINT `movies_movie_categories_movie_id_24fd2991_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_categories`
--

LOCK TABLES `movies_movie_categories` WRITE;
/*!40000 ALTER TABLE `movies_movie_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_movie_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_directors`
--

DROP TABLE IF EXISTS `movies_movie_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_directors_movie_id_director_id_eb887327_uniq` (`movie_id`,`director_id`),
  KEY `movies_movie_directo_director_id_9cddcb44_fk_movies_di` (`director_id`),
  CONSTRAINT `movies_movie_directo_director_id_9cddcb44_fk_movies_di` FOREIGN KEY (`director_id`) REFERENCES `movies_director` (`id`),
  CONSTRAINT `movies_movie_directors_movie_id_7f54bd58_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_directors`
--

LOCK TABLES `movies_movie_directors` WRITE;
/*!40000 ALTER TABLE `movies_movie_directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_movie_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_genres`
--

DROP TABLE IF EXISTS `movies_movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_movie_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_genres_movie_id_genre_id_5ff3c723_uniq` (`movie_id`,`genre_id`),
  KEY `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` (`genre_id`),
  CONSTRAINT `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `movies_genre` (`id`),
  CONSTRAINT `movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_genres`
--

LOCK TABLES `movies_movie_genres` WRITE;
/*!40000 ALTER TABLE `movies_movie_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_track`
--

DROP TABLE IF EXISTS `music_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `artist` varchar(250) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_track`
--

LOCK TABLES `music_track` WRITE;
/*!40000 ALTER TABLE `music_track` DISABLE KEYS */;
INSERT INTO `music_track` VALUES (1,'Billie Jean','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Billie+Jean',''),(2,'D.A.N.C.E.','Justice','https://www.last.fm/music/Justice/_/D.A.N.C.E.',''),(3,'I Want You Back','The Jackson 5','https://www.last.fm/music/The+Jackson+5/_/I+Want+You+Back','tracks/the-jackson-5--i-want-you-back.png'),(4,'Get Lucky (feat. Pharrell Williams)','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Get+Lucky+(feat.+Pharrell+Williams)','tracks/daft-punk--get-lucky-feat-pharrell-williams.png'),(5,'Dancing Queen','ABBA','https://www.last.fm/music/ABBA/_/Dancing+Queen','tracks/abba--dancing-queen.png'),(6,'Heart of Glass','Blondie','https://www.last.fm/music/Blondie/_/Heart+of+Glass','tracks/blondie--heart-of-glass.png'),(7,'September','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/September','tracks/earth-wind-fire--september.png'),(8,'Houdini','Foster the People','https://www.last.fm/music/Foster+the+People/_/Houdini','tracks/foster-the-people--houdini.png'),(9,'Hung Up','Madonna','https://www.last.fm/music/Madonna/_/Hung+Up','tracks/madonna--hung-up.png'),(10,'Get Lucky (Radio Edit) [feat. Pharrell Williams]','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Get+Lucky+(Radio+Edit)+%5Bfeat.+Pharrell+Williams%5D','tracks/daft-punk--get-lucky-radio-edit-feat-pharrell-williams.png'),(11,'ABC','The Jackson 5','https://www.last.fm/music/The+Jackson+5/_/ABC','tracks/the-jackson-5--abc.png'),(12,'Instant Crush (feat. Julian Casablancas)','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Instant+Crush+(feat.+Julian+Casablancas)','tracks/daft-punk--instant-crush-feat-julian-casablancas.png'),(13,'Lose Yourself to Dance (feat. Pharrell Williams)','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Lose+Yourself+to+Dance+(feat.+Pharrell+Williams)','tracks/daft-punk--lose-yourself-to-dance-feat-pharrell-williams.png'),(14,'What Is Love','Haddaway','https://www.last.fm/music/Haddaway/_/What+Is+Love','tracks/haddaway--what-is-love.png'),(15,'Give Life Back to Music','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Give+Life+Back+to+Music','tracks/daft-punk--give-life-back-to-music.png'),(16,'Eh, Eh (Nothing Else I Can Say)','Lady Gaga','https://www.last.fm/music/Lady+Gaga/_/Eh,+Eh+(Nothing+Else+I+Can+Say)','tracks/lady-gaga--eh-eh-nothing-else-i-can-say.png'),(17,'I Was Made for Lovin\' You','Kiss','https://www.last.fm/music/Kiss/_/I+Was+Made+for+Lovin%27+You','tracks/kiss--i-was-made-for-lovin-you.png'),(18,'Stayin\' Alive','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Stayin%27+Alive','tracks/bee-gees--stayin-alive.png'),(19,'Mamma Mia','ABBA','https://www.last.fm/music/ABBA/_/Mamma+Mia','tracks/abba--mamma-mia.png'),(20,'She Wolf','Shakira','https://www.last.fm/music/Shakira/_/She+Wolf','tracks/shakira--she-wolf.png'),(21,'Giorgio by Moroder','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Giorgio+by+Moroder','tracks/daft-punk--giorgio-by-moroder.png'),(22,'Rock with You','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Rock+with+You','tracks/michael-jackson--rock-with-you.png'),(23,'Can\'t Feel My Face','The Weeknd','https://www.last.fm/music/The+Weeknd/_/Can%27t+Feel+My+Face','tracks/the-weeknd--cant-feel-my-face.png'),(24,'Miss You','The Rolling Stones','https://www.last.fm/music/The+Rolling+Stones/_/Miss+You','tracks/the-rolling-stones--miss-you.png'),(25,'Treasure','Bruno Mars','https://www.last.fm/music/Bruno+Mars/_/Treasure','tracks/bruno-mars--treasure.png'),(26,'Take a Chance on Me','ABBA','https://www.last.fm/music/ABBA/_/Take+a+Chance+on+Me','tracks/abba--take-a-chance-on-me.png'),(27,'I Will Survive','Gloria Gaynor','https://www.last.fm/music/Gloria+Gaynor/_/I+Will+Survive','tracks/gloria-gaynor--i-will-survive.png'),(28,'Beyond','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Beyond','tracks/daft-punk--beyond.png'),(29,'Reflektor','Arcade Fire','https://www.last.fm/music/Arcade+Fire/_/Reflektor','tracks/arcade-fire--reflektor.png'),(30,'Summerboy','Lady Gaga','https://www.last.fm/music/Lady+Gaga/_/Summerboy','tracks/lady-gaga--summerboy.png'),(31,'Jungle Boogie','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Jungle+Boogie','tracks/kool-the-gang--jungle-boogie.png'),(32,'Cosmic Girl','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Cosmic+Girl','tracks/jamiroquai--cosmic-girl.png'),(33,'Too Long','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Too+Long','tracks/daft-punk--too-long.png'),(34,'Don\'t Stop \'Til You Get Enough','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Don%27t+Stop+%27Til+You+Get+Enough','tracks/michael-jackson--dont-stop-til-you-get-enough.png'),(35,'Sugar','Maroon 5','https://www.last.fm/music/Maroon+5/_/Sugar','tracks/maroon-5--sugar.png'),(36,'Sorry','Madonna','https://www.last.fm/music/Madonna/_/Sorry','tracks/madonna--sorry.png'),(37,'The Winner Takes It All','ABBA','https://www.last.fm/music/ABBA/_/The+Winner+Takes+It+All','tracks/abba--the-winner-takes-it-all.png'),(38,'Touch (feat. Paul Williams)','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Touch+(feat.+Paul+Williams)','tracks/daft-punk--touch-feat-paul-williams.png'),(39,'The Less I Know the Better','Tame Impala','https://www.last.fm/music/Tame+Impala/_/The+Less+I+Know+the+Better','tracks/tame-impala--the-less-i-know-the-better.png'),(40,'I Need Your Love','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/I+Need+Your+Love','tracks/calvin-harris--i-need-your-love.png'),(41,'How Deep Is Your Love','Bee Gees','https://www.last.fm/music/Bee+Gees/_/How+Deep+Is+Your+Love','tracks/bee-gees--how-deep-is-your-love.png'),(42,'Fragments of Time (feat. Todd Edwards)','Daft Punk','https://www.last.fm/music/Daft+Punk/_/Fragments+of+Time+(feat.+Todd+Edwards)','tracks/daft-punk--fragments-of-time-feat-todd-edwards.png'),(43,'Waterloo','ABBA','https://www.last.fm/music/ABBA/_/Waterloo','tracks/abba--waterloo.png'),(44,'Atomic','Blondie','https://www.last.fm/music/Blondie/_/Atomic','tracks/blondie--atomic.png'),(45,'Canned Heat','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Canned+Heat','tracks/jamiroquai--canned-heat.png'),(46,'You Sexy Thing','Hot Chocolate','https://www.last.fm/music/Hot+Chocolate/_/You+Sexy+Thing','tracks/hot-chocolate--you-sexy-thing.png'),(47,'You Spin Me Round (Like a Record)','Dead or Alive','https://www.last.fm/music/Dead+or+Alive/_/You+Spin+Me+Round+(Like+a+Record)','tracks/dead-or-alive--you-spin-me-round-like-a-record.png'),(48,'Groove Is in the Heart','Deee-Lite','https://www.last.fm/music/Deee-Lite/_/Groove+Is+in+the+Heart','tracks/deee-lite--groove-is-in-the-heart.png'),(49,'Let It Happen','Tame Impala','https://www.last.fm/music/Tame+Impala/_/Let+It+Happen','tracks/tame-impala--let-it-happen.png'),(50,'Holiday','Madonna','https://www.last.fm/music/Madonna/_/Holiday','tracks/madonna--holiday.png'),(51,'Super Freak','Rick James','https://www.last.fm/music/Rick+James/_/Super+Freak','tracks/rick-james--super-freak.png'),(52,'Let\'s Groove','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Let%27s+Groove','tracks/earth-wind-fire--lets-groove.png'),(53,'Hot Stuff','Donna Summer','https://www.last.fm/music/Donna+Summer/_/Hot+Stuff','tracks/donna-summer--hot-stuff.png'),(54,'Knowing Me, Knowing You','ABBA','https://www.last.fm/music/ABBA/_/Knowing+Me,+Knowing+You','tracks/abba--knowing-me-knowing-you.png'),(55,'Murder on the Dancefloor','Sophie Ellis-Bextor','https://www.last.fm/music/Sophie+Ellis-Bextor/_/Murder+on+the+Dancefloor','tracks/sophie-ellis-bextor--murder-on-the-dancefloor.png'),(56,'Super Trouper','ABBA','https://www.last.fm/music/ABBA/_/Super+Trouper','tracks/abba--super-trouper.png'),(57,'Fernando','ABBA','https://www.last.fm/music/ABBA/_/Fernando','tracks/abba--fernando.png'),(58,'Play That Funky Music','Wild Cherry','https://www.last.fm/music/Wild+Cherry/_/Play+That+Funky+Music','tracks/wild-cherry--play-that-funky-music.png'),(59,'Upside Down','Diana Ross','https://www.last.fm/music/Diana+Ross/_/Upside+Down','tracks/diana-ross--upside-down.png'),(60,'Love at First Sight','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Love+at+First+Sight','tracks/kylie-minogue--love-at-first-sight.png'),(61,'I\'m So Excited','The Pointer Sisters','https://www.last.fm/music/The+Pointer+Sisters/_/I%27m+So+Excited','tracks/the-pointer-sisters--im-so-excited.png'),(62,'Jump','Madonna','https://www.last.fm/music/Madonna/_/Jump','tracks/madonna--jump.png'),(63,'Adventure Of A Lifetime','Coldplay','https://www.last.fm/music/Coldplay/_/Adventure+Of+A+Lifetime','tracks/coldplay--adventure-of-a-lifetime.png'),(64,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA','https://www.last.fm/music/ABBA/_/Gimme%21+Gimme%21+Gimme%21+(A+Man+After+Midnight)','tracks/abba--gimme-gimme-gimme-a-man-after-midnight.png'),(65,'Afterlife','Arcade Fire','https://www.last.fm/music/Arcade+Fire/_/Afterlife','tracks/arcade-fire--afterlife.png'),(66,'Daddy Cool','Boney M.','https://www.last.fm/music/Boney+M./_/Daddy+Cool','tracks/boney-m--daddy-cool.png'),(67,'Money, Money, Money','ABBA','https://www.last.fm/music/ABBA/_/Money,+Money,+Money','tracks/abba--money-money-money.png'),(68,'Lay All Your Love on Me','ABBA','https://www.last.fm/music/ABBA/_/Lay+All+Your+Love+on+Me','tracks/abba--lay-all-your-love-on-me.png'),(69,'Feel It Still','Portugal. The Man','https://www.last.fm/music/Portugal.+The+Man/_/Feel+It+Still','tracks/portugal-the-man--feel-it-still.png'),(70,'Seven Days in Sunny June','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Seven+Days+in+Sunny+June','tracks/jamiroquai--seven-days-in-sunny-june.png'),(71,'Take Your Mama','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Take+Your+Mama','tracks/scissor-sisters--take-your-mama.png'),(72,'Jimmy','M.I.A.','https://www.last.fm/music/M.I.A./_/Jimmy','tracks/mia--jimmy.png'),(73,'Self Control','Laura Branigan','https://www.last.fm/music/Laura+Branigan/_/Self+Control','tracks/laura-branigan--self-control.png'),(74,'Boogie Wonderland','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Boogie+Wonderland','tracks/earth-wind-fire--boogie-wonderland.png'),(75,'Chiquitita','ABBA','https://www.last.fm/music/ABBA/_/Chiquitita','tracks/abba--chiquitita.png'),(76,'Venus','Bananarama','https://www.last.fm/music/Bananarama/_/Venus','tracks/bananarama--venus.png'),(77,'I\'m Coming Out','Diana Ross','https://www.last.fm/music/Diana+Ross/_/I%27m+Coming+Out','tracks/diana-ross--im-coming-out.png'),(78,'Cake By The Ocean','DNCE','https://www.last.fm/music/DNCE/_/Cake+By+The+Ocean','tracks/dnce--cake-by-the-ocean.png'),(79,'In My Arms','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/In+My+Arms','tracks/kylie-minogue--in-my-arms.png'),(80,'Laura','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Laura','tracks/scissor-sisters--laura.png'),(81,'Get Together','Madonna','https://www.last.fm/music/Madonna/_/Get+Together','tracks/madonna--get-together.png'),(82,'Gay Bar','Electric Six','https://www.last.fm/music/Electric+Six/_/Gay+Bar','tracks/electric-six--gay-bar.png'),(83,'Rapper\'s Delight','The Sugarhill Gang','https://www.last.fm/music/The+Sugarhill+Gang/_/Rapper%27s+Delight','tracks/the-sugarhill-gang--rappers-delight.png'),(84,'Little L','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Little+L','tracks/jamiroquai--little-l.png'),(85,'Baby Be Mine','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Baby+Be+Mine','tracks/michael-jackson--baby-be-mine.png'),(86,'Love Train','The O\'Jays','https://www.last.fm/music/The+O%27Jays/_/Love+Train','tracks/the-ojays--love-train.png'),(87,'Celebration','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Celebration','tracks/kool-the-gang--celebration.png'),(88,'In Your Eyes','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/In+Your+Eyes','tracks/kylie-minogue--in-your-eyes.png'),(89,'Blame It on the Boogie','The Jacksons','https://www.last.fm/music/The+Jacksons/_/Blame+It+on+the+Boogie','tracks/the-jacksons--blame-it-on-the-boogie.png'),(90,'I Feel Love','Donna Summer','https://www.last.fm/music/Donna+Summer/_/I+Feel+Love','tracks/donna-summer--i-feel-love.png'),(91,'Kung Fu Fighting','Carl Douglas','https://www.last.fm/music/Carl+Douglas/_/Kung+Fu+Fighting','tracks/carl-douglas--kung-fu-fighting.png'),(92,'Live Alone','Franz Ferdinand','https://www.last.fm/music/Franz+Ferdinand/_/Live+Alone','tracks/franz-ferdinand--live-alone.png'),(93,'S.O.S.','ABBA','https://www.last.fm/music/ABBA/_/S.O.S.','tracks/abba--sos.png'),(94,'Love Never Felt So Good','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Love+Never+Felt+So+Good','tracks/michael-jackson--love-never-felt-so-good.png'),(95,'Stuck on Repeat','Little Boots','https://www.last.fm/music/Little+Boots/_/Stuck+on+Repeat','tracks/little-boots--stuck-on-repeat.png'),(96,'Under Your Spell','Desire','https://www.last.fm/music/Desire/_/Under+Your+Spell','tracks/desire--under-your-spell.png'),(97,'Le Freak','Chic','https://www.last.fm/music/Chic/_/Le+Freak','tracks/chic--le-freak.png'),(98,'How Will I Know','Whitney Houston','https://www.last.fm/music/Whitney+Houston/_/How+Will+I+Know','tracks/whitney-houston--how-will-i-know.png'),(99,'Can\'t Stop The Feeling! (Original Song From Dreamworks Animation\'s \"Trolls\")','Justin Timberlake','https://www.last.fm/music/Justin+Timberlake/_/Can%27t+Stop+The+Feeling%21+(Original+Song+From+Dreamworks+Animation%27s+%22Trolls%22)','tracks/justin-timberlake--cant-stop-the-feeling-original-song-from-dreamworks-animations-trolls.png'),(100,'I Don\'t Feel Like Dancin\'','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/I+Don%27t+Feel+Like+Dancin%27','tracks/scissor-sisters--i-dont-feel-like-dancin.png'),(101,'I Have a Dream','ABBA','https://www.last.fm/music/ABBA/_/I+Have+a+Dream','tracks/abba--i-have-a-dream.png'),(102,'Rapture','Blondie','https://www.last.fm/music/Blondie/_/Rapture','tracks/blondie--rapture.png'),(103,'You\'re the First, the Last, My Everything','Barry White','https://www.last.fm/music/Barry+White/_/You%27re+the+First,+the+Last,+My+Everything','tracks/barry-white--youre-the-first-the-last-my-everything.png'),(104,'Does Your Mother Know','ABBA','https://www.last.fm/music/ABBA/_/Does+Your+Mother+Know','tracks/abba--does-your-mother-know.png'),(105,'Get Down On It','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Get+Down+On+It','tracks/kool-the-gang--get-down-on-it.png'),(106,'Brick House','Commodores','https://www.last.fm/music/Commodores/_/Brick+House','tracks/commodores--brick-house.png'),(107,'Good Times','Chic','https://www.last.fm/music/Chic/_/Good+Times','tracks/chic--good-times.png'),(108,'It\'s Raining Men','The Weather Girls','https://www.last.fm/music/The+Weather+Girls/_/It%27s+Raining+Men','tracks/the-weather-girls--its-raining-men.png'),(109,'Alright','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Alright','tracks/jamiroquai--alright.png'),(110,'Off the Wall','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Off+the+Wall','tracks/michael-jackson--off-the-wall.png'),(111,'24K Magic','Bruno Mars','https://www.last.fm/music/Bruno+Mars/_/24K+Magic','tracks/bruno-mars--24k-magic.png'),(112,'Love Foolosophy','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Love+Foolosophy','tracks/jamiroquai--love-foolosophy.png'),(113,'You Give Me Something','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/You+Give+Me+Something','tracks/jamiroquai--you-give-me-something.png'),(114,'Acceptable in the 80\'s','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Acceptable+in+the+80%27s','tracks/calvin-harris--acceptable-in-the-80s.png'),(115,'I Feel It Coming','The Weeknd','https://www.last.fm/music/The+Weeknd/_/I+Feel+It+Coming','tracks/the-weeknd--i-feel-it-coming.png'),(116,'Theme from Shaft','Isaac Hayes','https://www.last.fm/music/Isaac+Hayes/_/Theme+from+Shaft','tracks/isaac-hayes--theme-from-shaft.png'),(117,'Disco Heaven','Lady Gaga','https://www.last.fm/music/Lady+Gaga/_/Disco+Heaven','tracks/lady-gaga--disco-heaven.png'),(118,'Comfortably Numb','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Comfortably+Numb','tracks/scissor-sisters--comfortably-numb.png'),(119,'Birthday','Katy Perry','https://www.last.fm/music/Katy+Perry/_/Birthday','tracks/katy-perry--birthday.png'),(120,'\'Cause I\'m A Man','Tame Impala','https://www.last.fm/music/Tame+Impala/_/%27Cause+I%27m+A+Man','tracks/tame-impala--cause-im-a-man.png'),(121,'Don\'t Go Breaking My Heart','Elton John','https://www.last.fm/music/Elton+John/_/Don%27t+Go+Breaking+My+Heart','tracks/elton-john--dont-go-breaking-my-heart.png'),(122,'Don\'t Let Me Be Misunderstood','Santa Esmeralda','https://www.last.fm/music/Santa+Esmeralda/_/Don%27t+Let+Me+Be+Misunderstood','tracks/santa-esmeralda--dont-let-me-be-misunderstood.png'),(123,'Love Is Gone','David Guetta','https://www.last.fm/music/David+Guetta/_/Love+Is+Gone','tracks/david-guetta--love-is-gone.png'),(124,'Nobody Lost, Nobody Found','Cut Copy','https://www.last.fm/music/Cut+Copy/_/Nobody+Lost,+Nobody+Found','tracks/cut-copy--nobody-lost-nobody-found.png'),(125,'Rasputin','Boney M.','https://www.last.fm/music/Boney+M./_/Rasputin','tracks/boney-m--rasputin.png'),(126,'Thank You for the Music','ABBA','https://www.last.fm/music/ABBA/_/Thank+You+for+the+Music','tracks/abba--thank-you-for-the-music.png'),(127,'Shining Star','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Shining+Star','tracks/earth-wind-fire--shining-star.png'),(128,'The Girls','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/The+Girls','tracks/calvin-harris--the-girls.png'),(129,'Danger! High Voltage','Electric Six','https://www.last.fm/music/Electric+Six/_/Danger%21+High+Voltage','tracks/electric-six--danger-high-voltage.png'),(130,'Wow','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Wow','tracks/kylie-minogue--wow.png'),(131,'Night Fever','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Night+Fever','tracks/bee-gees--night-fever.png'),(132,'The Name of the Game','ABBA','https://www.last.fm/music/ABBA/_/The+Name+of+the+Game','tracks/abba--the-name-of-the-game.png'),(133,'Fantasy','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Fantasy','tracks/earth-wind-fire--fantasy.png'),(134,'Funkytown','Lipps, Inc.','https://www.last.fm/music/Lipps,+Inc./_/Funkytown','tracks/lipps-inc--funkytown.png'),(135,'Lady (Hear Me Tonight)','Modjo','https://www.last.fm/music/Modjo/_/Lady+(Hear+Me+Tonight)','tracks/modjo--lady-hear-me-tonight.png'),(136,'One of Us','ABBA','https://www.last.fm/music/ABBA/_/One+of+Us','tracks/abba--one-of-us.png'),(137,'Holding on for Life','Broken Bells','https://www.last.fm/music/Broken+Bells/_/Holding+on+for+Life','tracks/broken-bells--holding-on-for-life.png'),(138,'Ain\'t Nobody','Chaka Khan','https://www.last.fm/music/Chaka+Khan/_/Ain%27t+Nobody','tracks/chaka-khan--aint-nobody.png'),(139,'Left & Right in the Dark','Julian Casablancas','https://www.last.fm/music/Julian+Casablancas/_/Left+&+Right+in+the+Dark','tracks/julian-casablancas--left-right-in-the-dark.png'),(140,'Take Me Over','Cut Copy','https://www.last.fm/music/Cut+Copy/_/Take+Me+Over','tracks/cut-copy--take-me-over.png'),(141,'My Type','Saint Motel','https://www.last.fm/music/Saint+Motel/_/My+Type','tracks/saint-motel--my-type.png'),(142,'You Know Me Better','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/You+Know+Me+Better','tracks/roisin-murphy--you-know-me-better.png'),(143,'We Are Family','Sister Sledge','https://www.last.fm/music/Sister+Sledge/_/We+Are+Family','tracks/sister-sledge--we-are-family.png'),(144,'She\'s Out of My Life','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/She%27s+Out+of+My+Life','tracks/michael-jackson--shes-out-of-my-life.png'),(145,'Barbra Streisand','Duck Sauce','https://www.last.fm/music/Duck+Sauce/_/Barbra+Streisand','tracks/duck-sauce--barbra-streisand.png'),(146,'Slide','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Slide','tracks/calvin-harris--slide.png'),(147,'More Than a Woman','Bee Gees','https://www.last.fm/music/Bee+Gees/_/More+Than+a+Woman','tracks/bee-gees--more-than-a-woman.png'),(148,'Come Into My World','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Come+Into+My+World','tracks/kylie-minogue--come-into-my-world.png'),(149,'You Should Be Dancing','Bee Gees','https://www.last.fm/music/Bee+Gees/_/You+Should+Be+Dancing','tracks/bee-gees--you-should-be-dancing.png'),(150,'Can\'t Get Enough Of Your Love, Babe','Barry White','https://www.last.fm/music/Barry+White/_/Can%27t+Get+Enough+Of+Your+Love,+Babe','tracks/barry-white--cant-get-enough-of-your-love-babe.png'),(151,'Best of My Love','The Emotions','https://www.last.fm/music/The+Emotions/_/Best+of+My+Love','tracks/the-emotions--best-of-my-love.png'),(152,'I Have Friends in Holy Spaces','Panic! at the Disco','https://www.last.fm/music/Panic%21+at+the+Disco/_/I+Have+Friends+in+Holy+Spaces','tracks/panic-at-the-disco--i-have-friends-in-holy-spaces.png'),(153,'I Feel For You','Chaka Khan','https://www.last.fm/music/Chaka+Khan/_/I+Feel+For+You','tracks/chaka-khan--i-feel-for-you.png'),(154,'Love Rollercoaster','Ohio Players','https://www.last.fm/music/Ohio+Players/_/Love+Rollercoaster','tracks/ohio-players--love-rollercoaster.png'),(155,'Paris (Aeroplane Remix)','Friendly Fires','https://www.last.fm/music/Friendly+Fires/_/Paris+(Aeroplane+Remix)','tracks/friendly-fires--paris-aeroplane-remix.png'),(156,'Get Outta My Way','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Get+Outta+My+Way','tracks/kylie-minogue--get-outta-my-way.png'),(157,'Sunny','Boney M.','https://www.last.fm/music/Boney+M./_/Sunny','tracks/boney-m--sunny.png'),(158,'You Used to Hold Me','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/You+Used+to+Hold+Me','tracks/calvin-harris--you-used-to-hold-me.png'),(159,'True Love','Coldplay','https://www.last.fm/music/Coldplay/_/True+Love','tracks/coldplay--true-love.png'),(160,'Strawberry Letter 23','Brothers Johnson','https://www.last.fm/music/Brothers+Johnson/_/Strawberry+Letter+23','tracks/brothers-johnson--strawberry-letter-23.png'),(161,'Water Under The Bridge','Adele','https://www.last.fm/music/Adele/_/Water+Under+The+Bridge','tracks/adele--water-under-the-bridge.png'),(162,'I\'m Every Woman','Chaka Khan','https://www.last.fm/music/Chaka+Khan/_/I%27m+Every+Woman','tracks/chaka-khan--im-every-woman.png'),(163,'Inspector Norse','Todd Terje','https://www.last.fm/music/Todd+Terje/_/Inspector+Norse','tracks/todd-terje--inspector-norse.png'),(164,'Tragedy','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Tragedy','tracks/bee-gees--tragedy.png'),(165,'Jump (For My Love)','The Pointer Sisters','https://www.last.fm/music/The+Pointer+Sisters/_/Jump+(For+My+Love)','tracks/the-pointer-sisters--jump-for-my-love.png'),(166,'Filthy/Gorgeous','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Filthy%2FGorgeous','tracks/scissor-sisters--filthygorgeous.png'),(167,'Let Me Know','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Let+Me+Know','tracks/roisin-murphy--let-me-know.png'),(168,'Mary','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Mary','tracks/scissor-sisters--mary.png'),(169,'Happy New Year','ABBA','https://www.last.fm/music/ABBA/_/Happy+New+Year','tracks/abba--happy-new-year.png'),(170,'Voulez-Vous','ABBA','https://www.last.fm/music/ABBA/_/Voulez-Vous','tracks/abba--voulez-vous.png'),(171,'Living On My Own','Freddie Mercury','https://www.last.fm/music/Freddie+Mercury/_/Living+On+My+Own','tracks/freddie-mercury--living-on-my-own.png'),(172,'Rocket','Goldfrapp','https://www.last.fm/music/Goldfrapp/_/Rocket','tracks/goldfrapp--rocket.png'),(173,'Saturdays','Cut Copy','https://www.last.fm/music/Cut+Copy/_/Saturdays','tracks/cut-copy--saturdays.png'),(174,'Future Lovers','Madonna','https://www.last.fm/music/Madonna/_/Future+Lovers','tracks/madonna--future-lovers.png'),(175,'Out Of Control','She Wants Revenge','https://www.last.fm/music/She+Wants+Revenge/_/Out+Of+Control','tracks/she-wants-revenge--out-of-control.png'),(176,'Who Do You Think You Are','Spice Girls','https://www.last.fm/music/Spice+Girls/_/Who+Do+You+Think+You+Are','tracks/spice-girls--who-do-you-think-you-are.png'),(177,'chAiNEd tO the RhyTHM','Katy Perry','https://www.last.fm/music/Katy+Perry/_/chAiNEd+tO+the+RhyTHM','tracks/katy-perry--chained-to-the-rhythm.png'),(178,'Lady','Chromatics','https://www.last.fm/music/Chromatics/_/Lady','tracks/chromatics--lady.png'),(179,'Blood on the Dance Floor','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Blood+on+the+Dance+Floor','tracks/michael-jackson--blood-on-the-dance-floor.png'),(180,'Dancing on the Ceiling','Lionel Richie','https://www.last.fm/music/Lionel+Richie/_/Dancing+on+the+Ceiling','tracks/lionel-richie--dancing-on-the-ceiling.png'),(181,'Disco Lies','Moby','https://www.last.fm/music/Moby/_/Disco+Lies','tracks/moby--disco-lies.png'),(182,'Spinning Around','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Spinning+Around','tracks/kylie-minogue--spinning-around.png'),(183,'(Don\'t) Give Hate a Chance','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/(Don%27t)+Give+Hate+a+Chance','tracks/jamiroquai--dont-give-hate-a-chance.png'),(184,'Don\'t Stop \'Til You Get Enough - Single Version','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Don%27t+Stop+%27Til+You+Get+Enough+-+Single+Version','tracks/michael-jackson--dont-stop-til-you-get-enough-single-version.png'),(185,'Colours','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Colours','tracks/calvin-harris--colours.png'),(186,'Get Down Tonight','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/Get+Down+Tonight','tracks/kc-and-the-sunshine-band--get-down-tonight.png'),(187,'Hercules Theme','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Hercules+Theme','tracks/hercules-and-love-affair--hercules-theme.png'),(188,'Isaac','Madonna','https://www.last.fm/music/Madonna/_/Isaac','tracks/madonna--isaac.png'),(189,'A Different Feeling','The Avalanches','https://www.last.fm/music/The+Avalanches/_/A+Different+Feeling','tracks/the-avalanches--a-different-feeling.png'),(190,'After the Love Has Gone','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/After+the+Love+Has+Gone','tracks/earth-wind-fire--after-the-love-has-gone.png'),(191,'Everyday','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Everyday','tracks/jamiroquai--everyday.png'),(192,'Breakin\' Up','Rilo Kiley','https://www.last.fm/music/Rilo+Kiley/_/Breakin%27+Up','tracks/rilo-kiley--breakin-up.png'),(193,'Everything Now','Arcade Fire','https://www.last.fm/music/Arcade+Fire/_/Everything+Now','tracks/arcade-fire--everything-now.png'),(194,'Another One Bites The Dust - Remastered 2011','Queen','https://www.last.fm/music/Queen/_/Another+One+Bites+The+Dust+-+Remastered+2011','tracks/queen--another-one-bites-the-dust-remastered-2011.png'),(195,'Paper Trails','Darkside','https://www.last.fm/music/Darkside/_/Paper+Trails','tracks/darkside--paper-trails.png'),(196,'Shadows','Midnight Juggernauts','https://www.last.fm/music/Midnight+Juggernauts/_/Shadows','tracks/midnight-juggernauts--shadows.png'),(197,'Got To Be Real','Cheryl Lynn','https://www.last.fm/music/Cheryl+Lynn/_/Got+To+Be+Real','tracks/cheryl-lynn--got-to-be-real.png'),(198,'I Can\'t Decide','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/I+Can%27t+Decide','tracks/scissor-sisters--i-cant-decide.png'),(199,'Jealous (I Ain\'t With It)','Chromeo','https://www.last.fm/music/Chromeo/_/Jealous+(I+Ain%27t+With+It)','tracks/chromeo--jealous-i-aint-with-it.png'),(200,'Tits on the Radio','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Tits+on+the+Radio','tracks/scissor-sisters--tits-on-the-radio.png'),(201,'Merrymaking at My Place','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Merrymaking+at+My+Place','tracks/calvin-harris--merrymaking-at-my-place.png'),(202,'Strong Enough','Cher','https://www.last.fm/music/Cher/_/Strong+Enough','tracks/cher--strong-enough.png'),(203,'Give Me the Night','George Benson','https://www.last.fm/music/George+Benson/_/Give+Me+the+Night','tracks/george-benson--give-me-the-night.png'),(204,'Car Wash','Rose Royce','https://www.last.fm/music/Rose+Royce/_/Car+Wash','tracks/rose-royce--car-wash.png'),(205,'Disco Inferno','The Trammps','https://www.last.fm/music/The+Trammps/_/Disco+Inferno','tracks/the-trammps--disco-inferno.png'),(206,'Night By Night','Chromeo','https://www.last.fm/music/Chromeo/_/Night+By+Night','tracks/chromeo--night-by-night.png'),(207,'Take Back the Night','Justin Timberlake','https://www.last.fm/music/Justin+Timberlake/_/Take+Back+the+Night','tracks/justin-timberlake--take-back-the-night.png'),(208,'Can You Feel It','The Jacksons','https://www.last.fm/music/The+Jacksons/_/Can+You+Feel+It','tracks/the-jacksons--can-you-feel-it.png'),(209,'Let\'s Hear It for the Boy','Deniece Williams','https://www.last.fm/music/Deniece+Williams/_/Let%27s+Hear+It+for+the+Boy','tracks/deniece-williams--lets-hear-it-for-the-boy.png'),(210,'It\'s Raining Men','Geri Halliwell','https://www.last.fm/music/Geri+Halliwell/_/It%27s+Raining+Men','tracks/geri-halliwell--its-raining-men.png'),(211,'Funky Town','Lipps, Inc.','https://www.last.fm/music/Lipps,+Inc./_/Funky+Town','tracks/lipps-inc--funky-town.png'),(212,'Brother Louie','Modern Talking','https://www.last.fm/music/Modern+Talking/_/Brother+Louie','tracks/modern-talking--brother-louie.png'),(213,'I\'ve Seen That Face Before (Libertango)','Grace Jones','https://www.last.fm/music/Grace+Jones/_/I%27ve+Seen+That+Face+Before+(Libertango)','tracks/grace-jones--ive-seen-that-face-before-libertango.png'),(214,'Let the Music Play','Barry White','https://www.last.fm/music/Barry+White/_/Let+the+Music+Play','tracks/barry-white--let-the-music-play.png'),(215,'Listen Up!','Gossip','https://www.last.fm/music/Gossip/_/Listen+Up%21','tracks/gossip--listen-up.png'),(216,'YMCA','Village People','https://www.last.fm/music/Village+People/_/YMCA','tracks/village-people--ymca.png'),(217,'After the Disco','Broken Bells','https://www.last.fm/music/Broken+Bells/_/After+the+Disco','tracks/broken-bells--after-the-disco.png'),(218,'Walking on Air','Katy Perry','https://www.last.fm/music/Katy+Perry/_/Walking+on+Air','tracks/katy-perry--walking-on-air.png'),(219,'Dear Miami','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Dear+Miami','tracks/roisin-murphy--dear-miami.png'),(220,'Like It or Not','Madonna','https://www.last.fm/music/Madonna/_/Like+It+or+Not','tracks/madonna--like-it-or-not.png'),(221,'Ring My Bell','Anita Ward','https://www.last.fm/music/Anita+Ward/_/Ring+My+Bell','tracks/anita-ward--ring-my-bell.png'),(222,'You\'re My Heart, You\'re My Soul','Modern Talking','https://www.last.fm/music/Modern+Talking/_/You%27re+My+Heart,+You%27re+My+Soul','tracks/modern-talking--youre-my-heart-youre-my-soul.png'),(223,'Give It To Me Baby','Rick James','https://www.last.fm/music/Rick+James/_/Give+It+To+Me+Baby','tracks/rick-james--give-it-to-me-baby.png'),(224,'Time Will','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Time+Will','tracks/hercules-and-love-affair--time-will.png'),(225,'Give It Up','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/Give+It+Up','tracks/kc-and-the-sunshine-band--give-it-up.png'),(226,'Music Is the Victim','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Music+Is+the+Victim','tracks/scissor-sisters--music-is-the-victim.png'),(227,'To Love Somebody','Bee Gees','https://www.last.fm/music/Bee+Gees/_/To+Love+Somebody','tracks/bee-gees--to-love-somebody.png'),(228,'And the Beat Goes On','The Whispers','https://www.last.fm/music/The+Whispers/_/And+the+Beat+Goes+On','tracks/the-whispers--and-the-beat-goes-on.png'),(229,'Last Train to London','Electric Light Orchestra','https://www.last.fm/music/Electric+Light+Orchestra/_/Last+Train+to+London','tracks/electric-light-orchestra--last-train-to-london.png'),(230,'Rivers of Babylon','Boney M.','https://www.last.fm/music/Boney+M./_/Rivers+of+Babylon','tracks/boney-m--rivers-of-babylon.png'),(231,'I\'ll Be Around','The Spinners','https://www.last.fm/music/The+Spinners/_/I%27ll+Be+Around','tracks/the-spinners--ill-be-around.png'),(232,'I\'ve Been Thinking About You','Londonbeat','https://www.last.fm/music/Londonbeat/_/I%27ve+Been+Thinking+About+You','tracks/londonbeat--ive-been-thinking-about-you.png'),(233,'Massachusetts','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Massachusetts','tracks/bee-gees--massachusetts.png'),(234,'She\'s My Man','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/She%27s+My+Man','tracks/scissor-sisters--shes-my-man.png'),(235,'Jive Talkin\'','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Jive+Talkin%27','tracks/bee-gees--jive-talkin.png'),(236,'Lovers in the Backseat','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Lovers+in+the+Backseat','tracks/scissor-sisters--lovers-in-the-backseat.png'),(237,'Rock With You - Single Version','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Rock+With+You+-+Single+Version','tracks/michael-jackson--rock-with-you-single-version.png'),(238,'Ma Baker','Boney M.','https://www.last.fm/music/Boney+M./_/Ma+Baker','tracks/boney-m--ma-baker.png'),(239,'Blow','Beyoncé','https://www.last.fm/music/Beyonc%C3%A9/_/Blow','tracks/beyonce--blow.png'),(240,'Get on the Floor','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Get+on+the+Floor','tracks/michael-jackson--get-on-the-floor.png'),(241,'Ladies Night','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Ladies+Night','tracks/kool-the-gang--ladies-night.png'),(242,'You Dropped A Bomb On Me','The Gap Band','https://www.last.fm/music/The+Gap+Band/_/You+Dropped+A+Bomb+On+Me','tracks/the-gap-band--you-dropped-a-bomb-on-me.png'),(243,'Baby I\'m Yours','Breakbot','https://www.last.fm/music/Breakbot/_/Baby+I%27m+Yours','tracks/breakbot--baby-im-yours.png'),(244,'Dynamite','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Dynamite','tracks/jamiroquai--dynamite.png'),(245,'Cheri Cheri Lady','Modern Talking','https://www.last.fm/music/Modern+Talking/_/Cheri+Cheri+Lady','tracks/modern-talking--cheri-cheri-lady.png'),(246,'Loba','Shakira','https://www.last.fm/music/Shakira/_/Loba','tracks/shakira--loba.png'),(247,'The Rain','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/The+Rain','tracks/calvin-harris--the-rain.png'),(248,'Raise Me Up','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Raise+Me+Up','tracks/hercules-and-love-affair--raise-me-up.png'),(249,'Got To Give It Up (Part 1)','Marvin Gaye','https://www.last.fm/music/Marvin+Gaye/_/Got+To+Give+It+Up+(Part+1)','tracks/marvin-gaye--got-to-give-it-up-part-1.png'),(250,'Blind','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Blind','tracks/hercules-and-love-affair--blind.png'),(251,'Athene','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Athene','tracks/hercules-and-love-affair--athene.png'),(252,'Dance Commander','Electric Six','https://www.last.fm/music/Electric+Six/_/Dance+Commander','tracks/electric-six--dance-commander.png'),(253,'Physical','Olivia Newton-John','https://www.last.fm/music/Olivia+Newton-John/_/Physical','tracks/olivia-newton-john--physical.png'),(254,'Yes Sir, I Can Boogie','Baccara','https://www.last.fm/music/Baccara/_/Yes+Sir,+I+Can+Boogie','tracks/baccara--yes-sir-i-can-boogie.png'),(255,'Bad Girls','Donna Summer','https://www.last.fm/music/Donna+Summer/_/Bad+Girls','tracks/donna-summer--bad-girls.png'),(256,'Tarzan Boy','Baltimora','https://www.last.fm/music/Baltimora/_/Tarzan+Boy','tracks/baltimora--tarzan-boy.png'),(257,'Fire','Ohio Players','https://www.last.fm/music/Ohio+Players/_/Fire','tracks/ohio-players--fire.png'),(258,'I Should Be So Lucky','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/I+Should+Be+So+Lucky','tracks/kylie-minogue--i-should-be-so-lucky.png'),(259,'Live at Dominoes','The Avalanches','https://www.last.fm/music/The+Avalanches/_/Live+at+Dominoes','tracks/the-avalanches--live-at-dominoes.png'),(260,'Bad Girls','Jeffree Star','https://www.last.fm/music/Jeffree+Star/_/Bad+Girls','tracks/jeffree-star--bad-girls.png'),(261,'Stars Come Out','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Stars+Come+Out','tracks/calvin-harris--stars-come-out.png'),(262,'You Belong','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/You+Belong','tracks/hercules-and-love-affair--you-belong.png'),(263,'Love to Hate You','Erasure','https://www.last.fm/music/Erasure/_/Love+to+Hate+You','tracks/erasure--love-to-hate-you.png'),(264,'Ohio','Justice','https://www.last.fm/music/Justice/_/Ohio','tracks/justice--ohio.png'),(265,'Maria Magdalena','Sandra','https://www.last.fm/music/Sandra/_/Maria+Magdalena','tracks/sandra--maria-magdalena.png'),(266,'I Can\'t Help It','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/I+Can%27t+Help+It','tracks/michael-jackson--i-cant-help-it.png'),(267,'Workin\' Day and Night','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Workin%27+Day+and+Night','tracks/michael-jackson--workin-day-and-night.png'),(268,'That Was Just a Dream','Cut Copy','https://www.last.fm/music/Cut+Copy/_/That+Was+Just+a+Dream','tracks/cut-copy--that-was-just-a-dream.png'),(269,'I\'m Your Boogie Man','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/I%27m+Your+Boogie+Man','tracks/kc-and-the-sunshine-band--im-your-boogie-man.png'),(270,'Ride On Time','Black Box','https://www.last.fm/music/Black+Box/_/Ride+On+Time','tracks/black-box--ride-on-time.png'),(271,'Movie Star','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Movie+Star','tracks/roisin-murphy--movie-star.png'),(272,'Froot','Marina & the Diamonds','https://www.last.fm/music/Marina+&+the+Diamonds/_/Froot','tracks/marina-the-diamonds--froot.png'),(273,'The Breaks','Kurtis Blow','https://www.last.fm/music/Kurtis+Blow/_/The+Breaks','tracks/kurtis-blow--the-breaks.png'),(274,'3 Days','Rhye','https://www.last.fm/music/Rhye/_/3+Days','tracks/rhye--3-days.png'),(275,'Fame','Irene Cara','https://www.last.fm/music/Irene+Cara/_/Fame','tracks/irene-cara--fame.png'),(276,'You Win Again','Bee Gees','https://www.last.fm/music/Bee+Gees/_/You+Win+Again','tracks/bee-gees--you-win-again.png'),(277,'Pull Up To The Bumper','Grace Jones','https://www.last.fm/music/Grace+Jones/_/Pull+Up+To+The+Bumper','tracks/grace-jones--pull-up-to-the-bumper.png'),(278,'Love Hangover','Diana Ross','https://www.last.fm/music/Diana+Ross/_/Love+Hangover','tracks/diana-ross--love-hangover.png'),(279,'On a Night Like This','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/On+a+Night+Like+This','tracks/kylie-minogue--on-a-night-like-this.png'),(280,'Hold On','Holy Ghost!','https://www.last.fm/music/Holy+Ghost%21/_/Hold+On','tracks/holy-ghost--hold-on.png'),(281,'Too Much Heaven','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Too+Much+Heaven','tracks/bee-gees--too-much-heaven.png'),(282,'We Have Love','Hot Chip','https://www.last.fm/music/Hot+Chip/_/We+Have+Love','tracks/hot-chip--we-have-love.png'),(283,'The Fix','Minus the Bear','https://www.last.fm/music/Minus+the+Bear/_/The+Fix','tracks/minus-the-bear--the-fix.png'),(284,'Flashdance...What a Feeling','Irene Cara','https://www.last.fm/music/Irene+Cara/_/Flashdance...What+a+Feeling','tracks/irene-cara--flashdancewhat-a-feeling.png'),(285,'White Knuckle Ride','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/White+Knuckle+Ride','tracks/jamiroquai--white-knuckle-ride.png'),(286,'That\'s the Way I Like It','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/That%27s+the+Way+I+Like+It','tracks/kc-and-the-sunshine-band--thats-the-way-i-like-it.png'),(287,'Just Let Go','Fischerspooner','https://www.last.fm/music/Fischerspooner/_/Just+Let+Go','tracks/fischerspooner--just-let-go.png'),(288,'Girlfriend','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Girlfriend','tracks/michael-jackson--girlfriend.png'),(289,'Forget Me Nots','Patrice Rushen','https://www.last.fm/music/Patrice+Rushen/_/Forget+Me+Nots','tracks/patrice-rushen--forget-me-nots.png'),(290,'Got To Give It Up','Marvin Gaye','https://www.last.fm/music/Marvin+Gaye/_/Got+To+Give+It+Up','tracks/marvin-gaye--got-to-give-it-up.png'),(291,'He\'s the Greatest Dancer','Sister Sledge','https://www.last.fm/music/Sister+Sledge/_/He%27s+the+Greatest+Dancer','tracks/sister-sledge--hes-the-greatest-dancer.png'),(292,'That\'s The Way (I Like It)','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/That%27s+The+Way+(I+Like+It)','tracks/kc-and-the-sunshine-band--thats-the-way-i-like-it_meeuhWM.png'),(293,'Starchild','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Starchild','tracks/jamiroquai--starchild.png'),(294,'Bodywork','MSTRKRFT','https://www.last.fm/music/MSTRKRFT/_/Bodywork','tracks/mstrkrft--bodywork.png'),(295,'Shine a Little Love','Electric Light Orchestra','https://www.last.fm/music/Electric+Light+Orchestra/_/Shine+a+Little+Love','tracks/electric-light-orchestra--shine-a-little-love.png'),(296,'Iris','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Iris','tracks/hercules-and-love-affair--iris.png'),(297,'Rock Your Baby','George McCrae','https://www.last.fm/music/George+McCrae/_/Rock+Your+Baby','tracks/george-mccrae--rock-your-baby.png'),(298,'Words','F.R. David','https://www.last.fm/music/F.R.+David/_/Words','tracks/fr-david--words.png'),(299,'Get Outta My Dreams, Get into My Car','Billy Ocean','https://www.last.fm/music/Billy+Ocean/_/Get+Outta+My+Dreams,+Get+into+My+Car','tracks/billy-ocean--get-outta-my-dreams-get-into-my-car.png'),(300,'First Time','Kygo','https://www.last.fm/music/Kygo/_/First+Time','tracks/kygo--first-time.png'),(301,'Be Alright','Ariana Grande','https://www.last.fm/music/Ariana+Grande/_/Be+Alright','tracks/ariana-grande--be-alright.png'),(302,'Mary\'s Boy Child / Oh My Lord','Boney M.','https://www.last.fm/music/Boney+M./_/Mary%27s+Boy+Child+%2F+Oh+My+Lord','tracks/boney-m--marys-boy-child-oh-my-lord.png'),(303,'Million Dollar Bill','Whitney Houston','https://www.last.fm/music/Whitney+Houston/_/Million+Dollar+Bill','tracks/whitney-houston--million-dollar-bill.png'),(304,'Reasons','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Reasons','tracks/earth-wind-fire--reasons.png'),(305,'Y.M.C.A.','Village People','https://www.last.fm/music/Village+People/_/Y.M.C.A.','tracks/village-people--ymca_dvFiQ1P.png'),(306,'You Can Do It','No Doubt','https://www.last.fm/music/No+Doubt/_/You+Can+Do+It','tracks/no-doubt--you-can-do-it.png'),(307,'The Man','The Killers','https://www.last.fm/music/The+Killers/_/The+Man','tracks/the-killers--the-man.png'),(308,'Da Ya Think I\'m Sexy?','Rod Stewart','https://www.last.fm/music/Rod+Stewart/_/Da+Ya+Think+I%27m+Sexy%3F','tracks/rod-stewart--da-ya-think-im-sexy.png'),(309,'Get Over You','Sophie Ellis-Bextor','https://www.last.fm/music/Sophie+Ellis-Bextor/_/Get+Over+You','tracks/sophie-ellis-bextor--get-over-you.png'),(310,'Fresh','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Fresh','tracks/kool-the-gang--fresh.png'),(311,'Burn This Disco Out','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Burn+This+Disco+Out','tracks/michael-jackson--burn-this-disco-out.png'),(312,'Don\'t Leave Me This Way','Thelma Houston','https://www.last.fm/music/Thelma+Houston/_/Don%27t+Leave+Me+This+Way','tracks/thelma-houston--dont-leave-me-this-way.png'),(313,'1984','David Bowie','https://www.last.fm/music/David+Bowie/_/1984','tracks/david-bowie--1984.png'),(314,'Rhythm Of The Night','DeBarge','https://www.last.fm/music/DeBarge/_/Rhythm+Of+The+Night','tracks/debarge--rhythm-of-the-night.png'),(315,'Lay Me Down','Avicii','https://www.last.fm/music/Avicii/_/Lay+Me+Down','tracks/avicii--lay-me-down.png'),(316,'Electric Mistress','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Electric+Mistress','tracks/jamiroquai--electric-mistress.png'),(317,'Spend a Lifetime','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Spend+a+Lifetime','tracks/jamiroquai--spend-a-lifetime.png'),(318,'Supersonic','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Supersonic','tracks/jamiroquai--supersonic.png'),(319,'Black Crow','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Black+Crow','tracks/jamiroquai--black-crow.png'),(320,'Neon Rocks','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Neon+Rocks','tracks/calvin-harris--neon-rocks.png'),(321,'She Works Hard for the Money','Donna Summer','https://www.last.fm/music/Donna+Summer/_/She+Works+Hard+for+the+Money','tracks/donna-summer--she-works-hard-for-the-money.png'),(322,'Me and My Imagination','Sophie Ellis-Bextor','https://www.last.fm/music/Sophie+Ellis-Bextor/_/Me+and+My+Imagination','tracks/sophie-ellis-bextor--me-and-my-imagination.png'),(323,'You Are My Love','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/You+Are+My+Love','tracks/jamiroquai--you-are-my-love.png'),(324,'Kiss You Off','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Kiss+You+Off','tracks/scissor-sisters--kiss-you-off.png'),(325,'Just an Illusion','Imagination','https://www.last.fm/music/Imagination/_/Just+an+Illusion','tracks/imagination--just-an-illusion.png'),(326,'If I Can\'t Have You','Yvonne Elliman','https://www.last.fm/music/Yvonne+Elliman/_/If+I+Can%27t+Have+You','tracks/yvonne-elliman--if-i-cant-have-you.png'),(327,'Dangerous (feat. Joywave)','Big Data','https://www.last.fm/music/Big+Data/_/Dangerous+(feat.+Joywave)','tracks/big-data--dangerous-feat-joywave.png'),(328,'Boogie Shoes','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/Boogie+Shoes','tracks/kc-and-the-sunshine-band--boogie-shoes.png'),(329,'Lowdown','Boz Scaggs','https://www.last.fm/music/Boz+Scaggs/_/Lowdown','tracks/boz-scaggs--lowdown.png'),(330,'I Created Disco','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/I+Created+Disco','tracks/calvin-harris--i-created-disco.png'),(331,'King for a Day','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/King+for+a+Day','tracks/jamiroquai--king-for-a-day.png'),(332,'Didjerama','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Didjerama','tracks/jamiroquai--didjerama.png'),(333,'I Don\'t Feel Like Dancing','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/I+Don%27t+Feel+Like+Dancing','tracks/scissor-sisters--i-dont-feel-like-dancing.png'),(334,'Disco Heat','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Disco+Heat','tracks/calvin-harris--disco-heat.png'),(335,'Little Pink Plastic Bags','Gorillaz','https://www.last.fm/music/Gorillaz/_/Little+Pink+Plastic+Bags','tracks/gorillaz--little-pink-plastic-bags.png'),(336,'Let It Whip','Dazz Band','https://www.last.fm/music/Dazz+Band/_/Let+It+Whip','tracks/dazz-band--let-it-whip.png'),(337,'Come With Me','Special D.','https://www.last.fm/music/Special+D./_/Come+With+Me','tracks/special-d--come-with-me.png'),(338,'This Is the Industry','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/This+Is+the+Industry','tracks/calvin-harris--this-is-the-industry.png'),(339,'Solid Gold','The Golden Filter','https://www.last.fm/music/The+Golden+Filter/_/Solid+Gold','tracks/the-golden-filter--solid-gold.png'),(340,'Sugar Baby Love','The Rubettes','https://www.last.fm/music/The+Rubettes/_/Sugar+Baby+Love','tracks/the-rubettes--sugar-baby-love.png'),(341,'Uptight Downtown','La Roux','https://www.last.fm/music/La+Roux/_/Uptight+Downtown','tracks/la-roux--uptight-downtown.png'),(342,'Heaven Must Be Missing an Angel','Tavares','https://www.last.fm/music/Tavares/_/Heaven+Must+Be+Missing+an+Angel','tracks/tavares--heaven-must-be-missing-an-angel.png'),(343,'Lady Marmalade','Labelle','https://www.last.fm/music/Labelle/_/Lady+Marmalade','tracks/labelle--lady-marmalade.png'),(344,'I Do, I Do, I Do, I Do, I Do','ABBA','https://www.last.fm/music/ABBA/_/I+Do,+I+Do,+I+Do,+I+Do,+I+Do','tracks/abba--i-do-i-do-i-do-i-do-i-do.png'),(345,'Voyage voyage','Desireless','https://www.last.fm/music/Desireless/_/Voyage+voyage','tracks/desireless--voyage-voyage.png'),(346,'Fashion!','Lady Gaga','https://www.last.fm/music/Lady+Gaga/_/Fashion%21','tracks/lady-gaga--fashion.png'),(347,'Cherish','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Cherish','tracks/kool-the-gang--cherish.png'),(348,'Platoon','Jungle','https://www.last.fm/music/Jungle/_/Platoon','tracks/jungle--platoon.png'),(349,'Vegas','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Vegas','tracks/calvin-harris--vegas.png'),(350,'Boogie Nights','Heatwave','https://www.last.fm/music/Heatwave/_/Boogie+Nights','tracks/heatwave--boogie-nights.png'),(351,'House','Kindness','https://www.last.fm/music/Kindness/_/House','tracks/kindness--house.png'),(352,'Love Really Hurts Without You','Billy Ocean','https://www.last.fm/music/Billy+Ocean/_/Love+Really+Hurts+Without+You','tracks/billy-ocean--love-really-hurts-without-you.png'),(353,'Stop Don\'t Panic','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Stop+Don%27t+Panic','tracks/jamiroquai--stop-dont-panic.png'),(354,'Outside','George Michael','https://www.last.fm/music/George+Michael/_/Outside','tracks/george-michael--outside.png'),(355,'Young Hearts Run Free','Candi Staton','https://www.last.fm/music/Candi+Staton/_/Young+Hearts+Run+Free','tracks/candi-staton--young-hearts-run-free.png'),(356,'I Want Your Love','Chic','https://www.last.fm/music/Chic/_/I+Want+Your+Love','tracks/chic--i-want-your-love.png'),(357,'Knock on Wood','Amii Stewart','https://www.last.fm/music/Amii+Stewart/_/Knock+on+Wood','tracks/amii-stewart--knock-on-wood.png'),(358,'Hot Tequila Brown','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Hot+Tequila+Brown','tracks/jamiroquai--hot-tequila-brown.png'),(359,'Shake Your Body (Down to the Ground)','The Jacksons','https://www.last.fm/music/The+Jacksons/_/Shake+Your+Body+(Down+to+the+Ground)','tracks/the-jacksons--shake-your-body-down-to-the-ground.png'),(360,'Picture of My Life','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Picture+of+My+Life','tracks/jamiroquai--picture-of-my-life.png'),(361,'This Is My Love','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/This+Is+My+Love','tracks/hercules-and-love-affair--this-is-my-love.png'),(362,'Don\'t Deny Your Heart','Hot Chip','https://www.last.fm/music/Hot+Chip/_/Don%27t+Deny+Your+Heart','tracks/hot-chip--dont-deny-your-heart.png'),(363,'Words','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Words','tracks/bee-gees--words.png'),(364,'Got to Get You into My Life','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Got+to+Get+You+into+My+Life','tracks/earth-wind-fire--got-to-get-you-into-my-life.png'),(365,'What a Feeling','Irene Cara','https://www.last.fm/music/Irene+Cara/_/What+a+Feeling','tracks/irene-cara--what-a-feeling.png'),(366,'The Secret Life of Arabia','David Bowie','https://www.last.fm/music/David+Bowie/_/The+Secret+Life+of+Arabia','tracks/david-bowie--the-secret-life-of-arabia.png'),(367,'Sing A Song','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Sing+A+Song','tracks/earth-wind-fire--sing-a-song.png'),(368,'Runaway','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Runaway','tracks/jamiroquai--runaway.png'),(369,'You Make Me Feel Like Dancing','Leo Sayer','https://www.last.fm/music/Leo+Sayer/_/You+Make+Me+Feel+Like+Dancing','tracks/leo-sayer--you-make-me-feel-like-dancing.png'),(370,'Black Capricorn Day','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Black+Capricorn+Day','tracks/jamiroquai--black-capricorn-day.png'),(371,'Hunter','Pharrell Williams','https://www.last.fm/music/Pharrell+Williams/_/Hunter','tracks/pharrell-williams--hunter.png'),(372,'It\'s the Falling in Love','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/It%27s+the+Falling+in+Love','tracks/michael-jackson--its-the-falling-in-love.png'),(373,'Soul Education','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Soul+Education','tracks/jamiroquai--soul-education.png'),(374,'Footprints','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Footprints','tracks/roisin-murphy--footprints.png'),(375,'Alive','Goldfrapp','https://www.last.fm/music/Goldfrapp/_/Alive','tracks/goldfrapp--alive.png'),(376,'Stayin\' Alive (Remastered Album Version)','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Stayin%27+Alive+(Remastered+Album+Version)','tracks/bee-gees--stayin-alive-remastered-album-version.png'),(377,'Lights','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Lights','tracks/scissor-sisters--lights.png'),(378,'Machine Gun','Commodores','https://www.last.fm/music/Commodores/_/Machine+Gun','tracks/commodores--machine-gun.png'),(379,'Move in the Right Direction','Gossip','https://www.last.fm/music/Gossip/_/Move+in+the+Right+Direction','tracks/gossip--move-in-the-right-direction.png'),(380,'Feel So Good','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Feel+So+Good','tracks/jamiroquai--feel-so-good.png'),(381,'Hollywood Swinging','Kool & The Gang','https://www.last.fm/music/Kool+&+The+Gang/_/Hollywood+Swinging','tracks/kool-the-gang--hollywood-swinging.png'),(382,'Love to Love You Baby','Donna Summer','https://www.last.fm/music/Donna+Summer/_/Love+to+Love+You+Baby','tracks/donna-summer--love-to-love-you-baby.png'),(383,'The Weekend','Michael Gray','https://www.last.fm/music/Michael+Gray/_/The+Weekend','tracks/michael-gray--the-weekend.png'),(384,'Move','Cansei de Ser Sexy','https://www.last.fm/music/Cansei+de+Ser+Sexy/_/Move','tracks/cansei-de-ser-sexy--move.png'),(385,'Black Devil Car','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Black+Devil+Car','tracks/jamiroquai--black-devil-car.png'),(386,'Sleeping With A Friend','Neon Trees','https://www.last.fm/music/Neon+Trees/_/Sleeping+With+A+Friend','tracks/neon-trees--sleeping-with-a-friend.png'),(387,'Cry Baby','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Cry+Baby','tracks/roisin-murphy--cry-baby.png'),(388,'Id Engager','of Montreal','https://www.last.fm/music/of+Montreal/_/Id+Engager','tracks/of-montreal--id-engager.png'),(389,'Planet Home','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Planet+Home','tracks/jamiroquai--planet-home.png'),(390,'Easy','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/Easy','tracks/hercules-and-love-affair--easy.png'),(391,'Traffic Cops','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Traffic+Cops','tracks/calvin-harris--traffic-cops.png'),(392,'Voulez Vous','ABBA','https://www.last.fm/music/ABBA/_/Voulez+Vous','tracks/abba--voulez-vous_DkHk1Ui.png'),(393,'Sipping On The Sweet Nectar','Jens Lekman','https://www.last.fm/music/Jens+Lekman/_/Sipping+On+The+Sweet+Nectar','tracks/jens-lekman--sipping-on-the-sweet-nectar.png'),(394,'Take Your Mama Out','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Take+Your+Mama+Out','tracks/scissor-sisters--take-your-mama-out.png'),(395,'Disco','Metro Station','https://www.last.fm/music/Metro+Station/_/Disco','tracks/metro-station--disco.png'),(396,'You Make Me Feel (Mighty Real)','Sylvester','https://www.last.fm/music/Sylvester/_/You+Make+Me+Feel+(Mighty+Real)','tracks/sylvester--you-make-me-feel-mighty-real.png'),(397,'Honey, Honey','ABBA','https://www.last.fm/music/ABBA/_/Honey,+Honey','tracks/abba--honey-honey.png'),(398,'Last Dance','Donna Summer','https://www.last.fm/music/Donna+Summer/_/Last+Dance','tracks/donna-summer--last-dance.png'),(399,'Call on Me (radio edit)','Eric Prydz','https://www.last.fm/music/Eric+Prydz/_/Call+on+Me+(radio+edit)','tracks/eric-prydz--call-on-me-radio-edit.png'),(400,'Falling','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Falling','tracks/jamiroquai--falling.png'),(401,'Dancing Machine','The Jackson 5','https://www.last.fm/music/The+Jackson+5/_/Dancing+Machine','tracks/the-jackson-5--dancing-machine.png'),(402,'When the Going Gets Tough, the Tough Get Going','Billy Ocean','https://www.last.fm/music/Billy+Ocean/_/When+the+Going+Gets+Tough,+the+Tough+Get+Going','tracks/billy-ocean--when-the-going-gets-tough-the-tough-get-going.png'),(403,'World That He Wants','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/World+That+He+Wants','tracks/jamiroquai--world-that-he-wants.png'),(404,'Psychic City (Classixx Remix)','Yacht','https://www.last.fm/music/Yacht/_/Psychic+City+(Classixx+Remix)','tracks/yacht--psychic-city-classixx-remix.png'),(405,'Ain\'t Nobody','Rufus','https://www.last.fm/music/Rufus/_/Ain%27t+Nobody','tracks/rufus--aint-nobody.png'),(406,'Retro, Dance, Freak','Lady Gaga','https://www.last.fm/music/Lady+Gaga/_/Retro,+Dance,+Freak','tracks/lady-gaga--retro-dance-freak.png'),(407,'Sandcastle Disco','Solange','https://www.last.fm/music/Solange/_/Sandcastle+Disco','tracks/solange--sandcastle-disco.png'),(408,'Macho Man','Village People','https://www.last.fm/music/Village+People/_/Macho+Man','tracks/village-people--macho-man.png'),(409,'Cut Your Teeth - Kygo Remix','Kyla La Grange','https://www.last.fm/music/Kyla+La+Grange/_/Cut+Your+Teeth+-+Kygo+Remix','tracks/kyla-la-grange--cut-your-teeth-kygo-remix.png'),(410,'Feelin\' Myself','will.i.am','https://www.last.fm/music/will.i.am/_/Feelin%27+Myself','tracks/william--feelin-myself.png'),(411,'Jus 1 Kiss','Basement Jaxx','https://www.last.fm/music/Basement+Jaxx/_/Jus+1+Kiss','tracks/basement-jaxx--jus-1-kiss.png'),(412,'Hunger','Rhye','https://www.last.fm/music/Rhye/_/Hunger','tracks/rhye--hunger.png'),(413,'Ooh','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Ooh','tracks/scissor-sisters--ooh.png'),(414,'La Vie En Rose','Grace Jones','https://www.last.fm/music/Grace+Jones/_/La+Vie+En+Rose','tracks/grace-jones--la-vie-en-rose.png'),(415,'Signs of Life','Arcade Fire','https://www.last.fm/music/Arcade+Fire/_/Signs+of+Life','tracks/arcade-fire--signs-of-life.png'),(416,'On the Radio','Donna Summer','https://www.last.fm/music/Donna+Summer/_/On+the+Radio','tracks/donna-summer--on-the-radio.png'),(417,'Beverly Kills','Ariel Pink\'s Haunted Graffiti','https://www.last.fm/music/Ariel+Pink%27s+Haunted+Graffiti/_/Beverly+Kills','tracks/ariel-pinks-haunted-graffiti--beverly-kills.png'),(418,'Chain Reaction','Diana Ross','https://www.last.fm/music/Diana+Ross/_/Chain+Reaction','tracks/diana-ross--chain-reaction.png'),(419,'Uncle Ace','Blood Orange','https://www.last.fm/music/Blood+Orange/_/Uncle+Ace','tracks/blood-orange--uncle-ace.png'),(420,'Uh','Fujiya & Miyagi','https://www.last.fm/music/Fujiya+&+Miyagi/_/Uh','tracks/fujiya-miyagi--uh.png'),(421,'So Insane','Discovery','https://www.last.fm/music/Discovery/_/So+Insane','tracks/discovery--so-insane.png'),(422,'Do It Again','Holy Ghost!','https://www.last.fm/music/Holy+Ghost%21/_/Do+It+Again','tracks/holy-ghost--do-it-again.png'),(423,'Greedy','Ariana Grande','https://www.last.fm/music/Ariana+Grande/_/Greedy','tracks/ariana-grande--greedy.png'),(424,'Summer Night City','ABBA','https://www.last.fm/music/ABBA/_/Summer+Night+City','tracks/abba--summer-night-city.png'),(425,'All Night Long','Mary Jane Girls','https://www.last.fm/music/Mary+Jane+Girls/_/All+Night+Long','tracks/mary-jane-girls--all-night-long.png'),(426,'Come Alive (feat. Toro y Moi)','Chromeo','https://www.last.fm/music/Chromeo/_/Come+Alive+(feat.+Toro+y+Moi)','tracks/chromeo--come-alive-feat-toro-y-moi.png'),(427,'Chillin\'','Modjo','https://www.last.fm/music/Modjo/_/Chillin%27','tracks/modjo--chillin.png'),(428,'Fine China','Chris Brown','https://www.last.fm/music/Chris+Brown/_/Fine+China','tracks/chris-brown--fine-china.png'),(429,'Automatic','The Pointer Sisters','https://www.last.fm/music/The+Pointer+Sisters/_/Automatic','tracks/the-pointer-sisters--automatic.png'),(430,'Intermission','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Intermission','tracks/scissor-sisters--intermission.png'),(431,'Gloria','Laura Branigan','https://www.last.fm/music/Laura+Branigan/_/Gloria','tracks/laura-branigan--gloria.png'),(432,'Paul McCartney','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Paul+McCartney','tracks/scissor-sisters--paul-mccartney.png'),(433,'Certified','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Certified','tracks/calvin-harris--certified.png'),(434,'Juicy Fruit','Mtume','https://www.last.fm/music/Mtume/_/Juicy+Fruit','tracks/mtume--juicy-fruit.png'),(435,'I Want You Back','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/I+Want+You+Back','tracks/michael-jackson--i-want-you-back.png'),(436,'Butterfly','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Butterfly','tracks/jamiroquai--butterfly.png'),(437,'If I Like It, I Do It','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/If+I+Like+It,+I+Do+It','tracks/jamiroquai--if-i-like-it-i-do-it.png'),(438,'Paper Planes (DFA Remix)','M.I.A.','https://www.last.fm/music/M.I.A./_/Paper+Planes+(DFA+Remix)','tracks/mia--paper-planes-dfa-remix.png'),(439,'I Want You','Moloko','https://www.last.fm/music/Moloko/_/I+Want+You','tracks/moloko--i-want-you.png'),(440,'Music Gets the Best of Me','Sophie Ellis-Bextor','https://www.last.fm/music/Sophie+Ellis-Bextor/_/Music+Gets+the+Best+of+Me','tracks/sophie-ellis-bextor--music-gets-the-best-of-me.png'),(441,'Walk This Way','MØ','https://www.last.fm/music/M%C3%98/_/Walk+This+Way','tracks/m--walk-this-way.png'),(442,'Love Come Down','Evelyn \"Champagne\" King','https://www.last.fm/music/Evelyn+%22Champagne%22+King/_/Love+Come+Down','tracks/evelyn-champagne-king--love-come-down.png'),(443,'Making Out','No Doubt','https://www.last.fm/music/No+Doubt/_/Making+Out','tracks/no-doubt--making-out.png'),(444,'When Will I See You Again','The Three Degrees','https://www.last.fm/music/The+Three+Degrees/_/When+Will+I+See+You+Again','tracks/the-three-degrees--when-will-i-see-you-again.png'),(445,'Disco','Crossfade','https://www.last.fm/music/Crossfade/_/Disco','tracks/crossfade--disco.png'),(446,'Teardrops','Womack & Womack','https://www.last.fm/music/Womack+&+Womack/_/Teardrops','tracks/womack-womack--teardrops.png'),(447,'Leave It Alone','Broken Bells','https://www.last.fm/music/Broken+Bells/_/Leave+It+Alone','tracks/broken-bells--leave-it-alone.png'),(448,'Love Is in the Air','John Paul Young','https://www.last.fm/music/John+Paul+Young/_/Love+Is+in+the+Air','tracks/john-paul-young--love-is-in-the-air.png'),(449,'In The Navy','Village People','https://www.last.fm/music/Village+People/_/In+The+Navy','tracks/village-people--in-the-navy.png'),(450,'Getaway','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Getaway','tracks/earth-wind-fire--getaway.png'),(451,'Me & the Rhythm','Selena Gomez','https://www.last.fm/music/Selena+Gomez/_/Me+&+the+Rhythm','tracks/selena-gomez--me-the-rhythm.png'),(452,'Twenty Zero One','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Twenty+Zero+One','tracks/jamiroquai--twenty-zero-one.png'),(453,'When You\'re In Love With A Beautiful Woman','Dr. Hook','https://www.last.fm/music/Dr.+Hook/_/When+You%27re+In+Love+With+A+Beautiful+Woman','tracks/dr-hook--when-youre-in-love-with-a-beautiful-woman.png'),(454,'Shame','Evelyn \"Champagne\" King','https://www.last.fm/music/Evelyn+%22Champagne%22+King/_/Shame','tracks/evelyn-champagne-king--shame.png'),(455,'Might Tell You Tonight','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Might+Tell+You+Tonight','tracks/scissor-sisters--might-tell-you-tonight.png'),(456,'Let The Music Play','Shannon','https://www.last.fm/music/Shannon/_/Let+The+Music+Play','tracks/shannon--let-the-music-play.png'),(457,'Time Won\'t Wait','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Time+Won%27t+Wait','tracks/jamiroquai--time-wont-wait.png'),(458,'Synthesizer','Electric Six','https://www.last.fm/music/Electric+Six/_/Synthesizer','tracks/electric-six--synthesizer.png'),(459,'Never Can Say Goodbye','Gloria Gaynor','https://www.last.fm/music/Gloria+Gaynor/_/Never+Can+Say+Goodbye','tracks/gloria-gaynor--never-can-say-goodbye.png'),(460,'Safe And Sound','Justice','https://www.last.fm/music/Justice/_/Safe+And+Sound','tracks/justice--safe-and-sound.png'),(461,'Wait and See','Holy Ghost!','https://www.last.fm/music/Holy+Ghost%21/_/Wait+and+See','tracks/holy-ghost--wait-and-see.png'),(462,'I Love to Love','Tina Charles','https://www.last.fm/music/Tina+Charles/_/I+Love+to+Love','tracks/tina-charles--i-love-to-love.png'),(463,'Another Star','Stevie Wonder','https://www.last.fm/music/Stevie+Wonder/_/Another+Star','tracks/stevie-wonder--another-star.png'),(464,'Stomp','Brothers Johnson','https://www.last.fm/music/Brothers+Johnson/_/Stomp','tracks/brothers-johnson--stomp.png'),(465,'The Other Side','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/The+Other+Side','tracks/scissor-sisters--the-other-side.png'),(466,'I Like Chopin','Gazebo','https://www.last.fm/music/Gazebo/_/I+Like+Chopin','tracks/gazebo--i-like-chopin.png'),(467,'New York City Boy','Pet Shop Boys','https://www.last.fm/music/Pet+Shop+Boys/_/New+York+City+Boy',''),(468,'Better Luck','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Better+Luck','tracks/scissor-sisters--better-luck.png'),(469,'Perfect World','Broken Bells','https://www.last.fm/music/Broken+Bells/_/Perfect+World','tracks/broken-bells--perfect-world.png'),(470,'Dirty Mind','Prince','https://www.last.fm/music/Prince/_/Dirty+Mind','tracks/prince--dirty-mind.png'),(471,'Ring Ring','ABBA','https://www.last.fm/music/ABBA/_/Ring+Ring','tracks/abba--ring-ring.png'),(472,'The Day Before You Came','ABBA','https://www.last.fm/music/ABBA/_/The+Day+Before+You+Came','tracks/abba--the-day-before-you-came.png'),(473,'Samba de Janeiro','Bellini','https://www.last.fm/music/Bellini/_/Samba+de+Janeiro','tracks/bellini--samba-de-janeiro.png'),(474,'Sex Bomb','Tom Jones','https://www.last.fm/music/Tom+Jones/_/Sex+Bomb','tracks/tom-jones--sex-bomb.png'),(475,'Make Luv','Room 5','https://www.last.fm/music/Room+5/_/Make+Luv','tracks/room-5--make-luv.png'),(476,'Ivan Meets G.I. Joe','The Clash','https://www.last.fm/music/The+Clash/_/Ivan+Meets+G.I.+Joe','tracks/the-clash--ivan-meets-gi-joe.png'),(477,'Everybody','Madonna','https://www.last.fm/music/Madonna/_/Everybody','tracks/madonna--everybody.png'),(478,'Relax','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Relax','tracks/calvin-harris--relax.png'),(479,'VHS Sex','Com Truise','https://www.last.fm/music/Com+Truise/_/VHS+Sex','tracks/com-truise--vhs-sex.png'),(480,'Born to Be Alive','Patrick Hernandez','https://www.last.fm/music/Patrick+Hernandez/_/Born+to+Be+Alive','tracks/patrick-hernandez--born-to-be-alive.png'),(481,'You See The Trouble With Me','Barry White','https://www.last.fm/music/Barry+White/_/You+See+The+Trouble+With+Me','tracks/barry-white--you-see-the-trouble-with-me.png'),(482,'La Passion','Gigi D\'Agostino','https://www.last.fm/music/Gigi+D%27Agostino/_/La+Passion','tracks/gigi-dagostino--la-passion.png'),(483,'December, 1963 (Oh What A Night!)','Frankie Valli & the Four Seasons','https://www.last.fm/music/Frankie+Valli+&+the+Four+Seasons/_/December,+1963+(Oh+What+A+Night%21)','tracks/frankie-valli-the-four-seasons--december-1963-oh-what-a-night.png'),(484,'Dreaming','Goldfrapp','https://www.last.fm/music/Goldfrapp/_/Dreaming','tracks/goldfrapp--dreaming.png'),(485,'Click','Little Boots','https://www.last.fm/music/Little+Boots/_/Click','tracks/little-boots--click.png'),(486,'Feelings','Maroon 5','https://www.last.fm/music/Maroon+5/_/Feelings','tracks/maroon-5--feelings.png'),(487,'Touch','Shura','https://www.last.fm/music/Shura/_/Touch','tracks/shura--touch.png'),(488,'Lady Marmalade','Patti LaBelle','https://www.last.fm/music/Patti+LaBelle/_/Lady+Marmalade','tracks/patti-labelle--lady-marmalade.png'),(489,'Men in This Town','Shakira','https://www.last.fm/music/Shakira/_/Men+in+This+Town','tracks/shakira--men-in-this-town.png'),(490,'Improper Dancing','Electric Six','https://www.last.fm/music/Electric+Six/_/Improper+Dancing','tracks/electric-six--improper-dancing.png'),(491,'Beatific','Glass Candy','https://www.last.fm/music/Glass+Candy/_/Beatific','tracks/glass-candy--beatific.png'),(492,'Love Blind','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Love+Blind','tracks/jamiroquai--love-blind.png'),(493,'Better the Devil You Know','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Better+the+Devil+You+Know','tracks/kylie-minogue--better-the-devil-you-know.png'),(494,'Let\'s Dance - 1999 Digital Remaster','David Bowie','https://www.last.fm/music/David+Bowie/_/Let%27s+Dance+-+1999+Digital+Remaster','tracks/david-bowie--lets-dance-1999-digital-remaster.png'),(495,'Love Souvenir','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Love+Souvenir','tracks/calvin-harris--love-souvenir.png'),(496,'Any Which Way','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Any+Which+Way','tracks/scissor-sisters--any-which-way.png'),(497,'Push Up','Freestylers','https://www.last.fm/music/Freestylers/_/Push+Up','tracks/freestylers--push-up.png'),(498,'Dear Diary','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Dear+Diary','tracks/roisin-murphy--dear-diary.png'),(499,'Grease','Frankie Valli','https://www.last.fm/music/Frankie+Valli/_/Grease','tracks/frankie-valli--grease.png'),(500,'Lovelight','Robbie Williams','https://www.last.fm/music/Robbie+Williams/_/Lovelight','tracks/robbie-williams--lovelight.png'),(501,'Slave to the Rhythm','Grace Jones','https://www.last.fm/music/Grace+Jones/_/Slave+to+the+Rhythm','tracks/grace-jones--slave-to-the-rhythm.png'),(502,'Kicking And Screaming','The Presets','https://www.last.fm/music/The+Presets/_/Kicking+And+Screaming','tracks/the-presets--kicking-and-screaming.png'),(503,'Electro Man','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Electro+Man','tracks/calvin-harris--electro-man.png'),(504,'Love In The First Degree','Bananarama','https://www.last.fm/music/Bananarama/_/Love+In+The+First+Degree','tracks/bananarama--love-in-the-first-degree.png'),(505,'I Look to You','Miami Horror','https://www.last.fm/music/Miami+Horror/_/I+Look+to+You','tracks/miami-horror--i-look-to-you.png'),(506,'Acceptable in the 80s','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Acceptable+in+the+80s','tracks/calvin-harris--acceptable-in-the-80s_M458W45.png'),(507,'Scatman','Scatman John','https://www.last.fm/music/Scatman+John/_/Scatman','tracks/scatman-john--scatman.png'),(508,'True/False, Fake/Real','Hercules and Love Affair','https://www.last.fm/music/Hercules+and+Love+Affair/_/True%2FFalse,+Fake%2FReal','tracks/hercules-and-love-affair--truefalse-fakereal.png'),(509,'Boogie Oogie Oogie','A Taste Of Honey','https://www.last.fm/music/A+Taste+Of+Honey/_/Boogie+Oogie+Oogie','tracks/a-taste-of-honey--boogie-oogie-oogie.png'),(510,'Everybody Wants the Same Thing','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Everybody+Wants+the+Same+Thing','tracks/scissor-sisters--everybody-wants-the-same-thing.png'),(511,'Get Down Saturday Night','Oliver Cheatham','https://www.last.fm/music/Oliver+Cheatham/_/Get+Down+Saturday+Night','tracks/oliver-cheatham--get-down-saturday-night.png'),(512,'Kylie','Akcent','https://www.last.fm/music/Akcent/_/Kylie','tracks/akcent--kylie.png'),(513,'Never Give Up on the Good Times','Spice Girls','https://www.last.fm/music/Spice+Girls/_/Never+Give+Up+on+the+Good+Times','tracks/spice-girls--never-give-up-on-the-good-times.png'),(514,'Deeper and Deeper','Madonna','https://www.last.fm/music/Madonna/_/Deeper+and+Deeper','tracks/madonna--deeper-and-deeper.png'),(515,'Ready for the Good Times','Shakira','https://www.last.fm/music/Shakira/_/Ready+for+the+Good+Times','tracks/shakira--ready-for-the-good-times.png'),(516,'Sub-Culture','New Order','https://www.last.fm/music/New+Order/_/Sub-Culture','tracks/new-order--sub-culture.png'),(517,'Shallow End','Morcheeba','https://www.last.fm/music/Morcheeba/_/Shallow+End','tracks/morcheeba--shallow-end.png'),(518,'Over Your Shoulder','Chromeo','https://www.last.fm/music/Chromeo/_/Over+Your+Shoulder','tracks/chromeo--over-your-shoulder.png'),(519,'Nights on Broadway','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Nights+on+Broadway','tracks/bee-gees--nights-on-broadway.png'),(520,'Moskau','Dschinghis Khan','https://www.last.fm/music/Dschinghis+Khan/_/Moskau','tracks/dschinghis-khan--moskau.png'),(521,'Heatstroke','Calvin Harris','https://www.last.fm/music/Calvin+Harris/_/Heatstroke','tracks/calvin-harris--heatstroke.png'),(522,'Uptown Funk (feat. Bruno Mars)','Mark Ronson','https://www.last.fm/music/Mark+Ronson/_/Uptown+Funk+(feat.+Bruno+Mars)','tracks/mark-ronson--uptown-funk-feat-bruno-mars.png'),(523,'Baby I\'m Yours (Feat. Irfane)','Breakbot','https://www.last.fm/music/Breakbot/_/Baby+I%27m+Yours+(Feat.+Irfane)','tracks/breakbot--baby-im-yours-feat-irfane.png'),(524,'Break in Case of Anything','!!!','https://www.last.fm/music/%21%21%21/_/Break+in+Case+of+Anything','tracks/--break-in-case-of-anything.png'),(525,'Swingin\' Party','Kindness','https://www.last.fm/music/Kindness/_/Swingin%27+Party','tracks/kindness--swingin-party.png'),(526,'I Love Music','The O\'Jays','https://www.last.fm/music/The+O%27Jays/_/I+Love+Music','tracks/the-ojays--i-love-music.png'),(527,'Two of Hearts','Stacey Q','https://www.last.fm/music/Stacey+Q/_/Two+of+Hearts','tracks/stacey-q--two-of-hearts.png'),(528,'Candy Castle','Glass Candy','https://www.last.fm/music/Glass+Candy/_/Candy+Castle','tracks/glass-candy--candy-castle.png'),(529,'Mothership Reconnection (Feat Parliament/Funkadelic) (Daft Punk Remix)','Scott Grooves','https://www.last.fm/music/Scott+Grooves/_/Mothership+Reconnection+(Feat+Parliament%2FFunkadelic)+(Daft+Punk+Remix)','tracks/scott-grooves--mothership-reconnection-feat-parliamentfunkadelic-daft-punk-remix.png'),(530,'Rock The Boat','Hues Corporation','https://www.last.fm/music/Hues+Corporation/_/Rock+The+Boat','tracks/hues-corporation--rock-the-boat.png'),(531,'Stayin\' Alive - 2007 Remastered Version Saturday Night Fever','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Stayin%27+Alive+-+2007+Remastered+Version+Saturday+Night+Fever','tracks/bee-gees--stayin-alive-2007-remastered-version-saturday-night-fever.png'),(532,'Ends of the Earth','Hot Chip','https://www.last.fm/music/Hot+Chip/_/Ends+of+the+Earth','tracks/hot-chip--ends-of-the-earth.png'),(533,'Anniemal','Annie','https://www.last.fm/music/Annie/_/Anniemal','tracks/annie--anniemal.png'),(534,'Head Over Heels','ABBA','https://www.last.fm/music/ABBA/_/Head+Over+Heels','tracks/abba--head-over-heels.png'),(535,'Lost In Music','Sister Sledge','https://www.last.fm/music/Sister+Sledge/_/Lost+In+Music','tracks/sister-sledge--lost-in-music.png'),(536,'Popcorn','Hot Butter','https://www.last.fm/music/Hot+Butter/_/Popcorn','tracks/hot-butter--popcorn.png'),(537,'Heart Beat Rock','Kylie Minogue','https://www.last.fm/music/Kylie+Minogue/_/Heart+Beat+Rock','tracks/kylie-minogue--heart-beat-rock.png'),(538,'More Than a Woman','Tavares','https://www.last.fm/music/Tavares/_/More+Than+a+Woman','tracks/tavares--more-than-a-woman.png'),(539,'Destitute Illusions','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Destitute+Illusions','tracks/jamiroquai--destitute-illusions.png'),(540,'Beautiful Song','Cansei de Ser Sexy','https://www.last.fm/music/Cansei+de+Ser+Sexy/_/Beautiful+Song','tracks/cansei-de-ser-sexy--beautiful-song.png'),(541,'Impressive Instant','Madonna','https://www.last.fm/music/Madonna/_/Impressive+Instant','tracks/madonna--impressive-instant.png'),(542,'I\'m the Bomb','Electric Six','https://www.last.fm/music/Electric+Six/_/I%27m+the+Bomb','tracks/electric-six--im-the-bomb.png'),(543,'Gotta Go Home','Boney M.','https://www.last.fm/music/Boney+M./_/Gotta+Go+Home','tracks/boney-m--gotta-go-home.png'),(544,'(Shake, Shake, Shake) Shake Your Booty','KC and The Sunshine Band','https://www.last.fm/music/KC+and+The+Sunshine+Band/_/(Shake,+Shake,+Shake)+Shake+Your+Booty','tracks/kc-and-the-sunshine-band--shake-shake-shake-shake-your-booty.png'),(545,'Respectable','Mel & Kim','https://www.last.fm/music/Mel+&+Kim/_/Respectable','tracks/mel-kim--respectable.png'),(546,'Everybody Dance','Chic','https://www.last.fm/music/Chic/_/Everybody+Dance','tracks/chic--everybody-dance.png'),(547,'Don\'t Go Breaking My Heart','Elton John & Kiki Dee','https://www.last.fm/music/Elton+John+&+Kiki+Dee/_/Don%27t+Go+Breaking+My+Heart','tracks/elton-john-kiki-dee--dont-go-breaking-my-heart.png'),(548,'Making Your Mind Up','Bucks Fizz','https://www.last.fm/music/Bucks+Fizz/_/Making+Your+Mind+Up','tracks/bucks-fizz--making-your-mind-up.png'),(549,'Main Vein','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Main+Vein','tracks/jamiroquai--main-vein.png'),(550,'Silly Love Songs','Wings','https://www.last.fm/music/Wings/_/Silly+Love+Songs','tracks/wings--silly-love-songs.png'),(551,'She\'s White','Electric Six','https://www.last.fm/music/Electric+Six/_/She%27s+White','tracks/electric-six--shes-white.png'),(552,'Parallel Lives','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Parallel+Lives','tracks/roisin-murphy--parallel-lives.png'),(553,'Naked Pictures (Of Your Mother)','Electric Six','https://www.last.fm/music/Electric+Six/_/Naked+Pictures+(Of+Your+Mother)','tracks/electric-six--naked-pictures-of-your-mother.png'),(554,'Disco Tits','Tove Lo','https://www.last.fm/music/Tove+Lo/_/Disco+Tits','tracks/tove-lo--disco-tits.png'),(555,'Touched Something\'s Hollow','of Montreal','https://www.last.fm/music/of+Montreal/_/Touched+Something%27s+Hollow','tracks/of-montreal--touched-somethings-hollow.png'),(556,'In the Heat of the Night','Sandra','https://www.last.fm/music/Sandra/_/In+the+Heat+of+the+Night','tracks/sandra--in-the-heat-of-the-night.png'),(557,'Slave to the Rhythm','Michael Jackson','https://www.last.fm/music/Michael+Jackson/_/Slave+to+the+Rhythm','tracks/michael-jackson--slave-to-the-rhythm.png'),(558,'From Paris To Berlin','Infernal','https://www.last.fm/music/Infernal/_/From+Paris+To+Berlin','tracks/infernal--from-paris-to-berlin.png'),(559,'First Love','Uffie','https://www.last.fm/music/Uffie/_/First+Love','tracks/uffie--first-love.png'),(560,'Brown Girl in the Ring','Boney M.','https://www.last.fm/music/Boney+M./_/Brown+Girl+in+the+Ring','tracks/boney-m--brown-girl-in-the-ring.png'),(561,'Invisible Light','Scissor Sisters','https://www.last.fm/music/Scissor+Sisters/_/Invisible+Light','tracks/scissor-sisters--invisible-light.png'),(562,'Shiny and Warm','Goldfrapp','https://www.last.fm/music/Goldfrapp/_/Shiny+and+Warm','tracks/goldfrapp--shiny-and-warm.png'),(563,'Copacabana','Barry Manilow','https://www.last.fm/music/Barry+Manilow/_/Copacabana','tracks/barry-manilow--copacabana.png'),(564,'Never Knew Love Like This Before','Stephanie Mills','https://www.last.fm/music/Stephanie+Mills/_/Never+Knew+Love+Like+This+Before','tracks/stephanie-mills--never-knew-love-like-this-before.png'),(565,'Ain\'t No Stoppin\' Us Now','McFadden & Whitehead','https://www.last.fm/music/McFadden+&+Whitehead/_/Ain%27t+No+Stoppin%27+Us+Now','tracks/mcfadden-whitehead--aint-no-stoppin-us-now.png'),(566,'Our Last Summer','ABBA','https://www.last.fm/music/ABBA/_/Our+Last+Summer','tracks/abba--our-last-summer.png'),(567,'Serpentine Fire','Earth, Wind & Fire','https://www.last.fm/music/Earth,+Wind+&+Fire/_/Serpentine+Fire','tracks/earth-wind-fire--serpentine-fire.png'),(568,'All Good in the Hood','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/All+Good+in+the+Hood','tracks/jamiroquai--all-good-in-the-hood.png'),(569,'Smoke and Mirrors','Jamiroquai','https://www.last.fm/music/Jamiroquai/_/Smoke+and+Mirrors','tracks/jamiroquai--smoke-and-mirrors.png'),(570,'Blame It On The Boogie','The Jackson 5','https://www.last.fm/music/The+Jackson+5/_/Blame+It+On+The+Boogie','tracks/the-jackson-5--blame-it-on-the-boogie.png'),(571,'Angel Eyes','Roxy Music','https://www.last.fm/music/Roxy+Music/_/Angel+Eyes','tracks/roxy-music--angel-eyes.png'),(572,'On A Mission','The Rakes','https://www.last.fm/music/The+Rakes/_/On+A+Mission','tracks/the-rakes--on-a-mission.png'),(573,'Love You Inside Out','Bee Gees','https://www.last.fm/music/Bee+Gees/_/Love+You+Inside+Out','tracks/bee-gees--love-you-inside-out.png'),(574,'Fun It','Queen','https://www.last.fm/music/Queen/_/Fun+It','tracks/queen--fun-it.png'),(575,'Body Language','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Body+Language','tracks/roisin-murphy--body-language.png'),(576,'Song Away','Hockey','https://www.last.fm/music/Hockey/_/Song+Away','tracks/hockey--song-away.png'),(577,'Can\'t Get Enough Of Your Love','Barry White','https://www.last.fm/music/Barry+White/_/Can%27t+Get+Enough+Of+Your+Love','tracks/barry-white--cant-get-enough-of-your-love.png'),(578,'Say My Name','Holy Ghost!','https://www.last.fm/music/Holy+Ghost%21/_/Say+My+Name','tracks/holy-ghost--say-my-name.png'),(579,'Making the Most of the Night','Carly Rae Jepsen','https://www.last.fm/music/Carly+Rae+Jepsen/_/Making+the+Most+of+the+Night','tracks/carly-rae-jepsen--making-the-most-of-the-night.png'),(580,'Sinking Feeling','Róisín Murphy','https://www.last.fm/music/R%C3%B3is%C3%ADn+Murphy/_/Sinking+Feeling','tracks/roisin-murphy--sinking-feeling.png'),(581,'Rolling Down The Hills','Glass Candy','https://www.last.fm/music/Glass+Candy/_/Rolling+Down+The+Hills','tracks/glass-candy--rolling-down-the-hills.png'),(582,'SOS','ABBA','https://www.last.fm/music/ABBA/_/SOS','tracks/abba--sos_1C4GXqD.png'),(583,'Even When the Water\'s Cold','!!!','https://www.last.fm/music/%21%21%21/_/Even+When+the+Water%27s+Cold','tracks/--even-when-the-waters-cold.png'),(584,'You\'re A Woman','Bad Boys Blue','https://www.last.fm/music/Bad+Boys+Blue/_/You%27re+A+Woman',''),(585,'Hurt','Johnny Cash','https://www.last.fm/music/Johnny+Cash/_/Hurt',''),(586,'Skinny Love','Bon Iver','https://www.last.fm/music/Bon+Iver/_/Skinny+Love',''),(587,'The Sound of Silence','Simon & Garfunkel','https://www.last.fm/music/Simon+&+Garfunkel/_/The+Sound+of+Silence','tracks/simon-garfunkel--the-sound-of-silence.png'),(588,'Like a Rolling Stone','Bob Dylan','https://www.last.fm/music/Bob+Dylan/_/Like+a+Rolling+Stone','tracks/bob-dylan--like-a-rolling-stone.png'),(589,'Heartbeats','José González','https://www.last.fm/music/Jos%C3%A9+Gonz%C3%A1lez/_/Heartbeats','tracks/jose-gonzalez--heartbeats.png'),(590,'Little Lion Man','Mumford & Sons','https://www.last.fm/music/Mumford+&+Sons/_/Little+Lion+Man','tracks/mumford-sons--little-lion-man.png'),(591,'The Cave','Mumford & Sons','https://www.last.fm/music/Mumford+&+Sons/_/The+Cave','tracks/mumford-sons--the-cave.png'),(592,'Hallelujah','Jeff Buckley','https://www.last.fm/music/Jeff+Buckley/_/Hallelujah','tracks/jeff-buckley--hallelujah.png'),(593,'Little Talks','Of Monsters and Men','https://www.last.fm/music/Of+Monsters+and+Men/_/Little+Talks','tracks/of-monsters-and-men--little-talks.png'),(594,'Home','Edward Sharpe & The Magnetic Zeros','https://www.last.fm/music/Edward+Sharpe+&+The+Magnetic+Zeros/_/Home','tracks/edward-sharpe-the-magnetic-zeros--home.png'),(595,'Flume','Bon Iver','https://www.last.fm/music/Bon+Iver/_/Flume','tracks/bon-iver--flume.png'),(596,'Ho Hey','The Lumineers','https://www.last.fm/music/The+Lumineers/_/Ho+Hey','tracks/the-lumineers--ho-hey.png'),(597,'Brown Eyed Girl','Van Morrison','https://www.last.fm/music/Van+Morrison/_/Brown+Eyed+Girl','tracks/van-morrison--brown-eyed-girl.png'),(598,'Mrs. Robinson','Simon & Garfunkel','https://www.last.fm/music/Simon+&+Garfunkel/_/Mrs.+Robinson','');
/*!40000 ALTER TABLE `music_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_slug_70d3148d` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (7,'Web Development with Django Cookbook, Second Edition','web-development-django-cookbook-second-edition','',NULL),(8,'jQuery UI 1.8: The User Interface Library for jQuery','jquery-ui-1-8-user-interface-library','',44.99),(9,'Developing Responsive Web Applications with AJAX and jQuery','developing-responsive-web-apps-ajax-jquery','',39.99),(10,'Django JavaScript Integration: AJAX and jQuery','django-javascript-integration-ajax-jquery','',44.99),(11,'Django: Web Development with Python','django-web-development-with-python','',NULL),(12,'Web Development with Django Cookbook, Third Edition','web-development-django-cookbook-third-edition','',NULL);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productphoto`
--

DROP TABLE IF EXISTS `products_productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_productphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productphoto_product_id_93bcbc5e_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_productphoto_product_id_93bcbc5e_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productphoto`
--

LOCK TABLES `products_productphoto` WRITE;
/*!40000 ALTER TABLE `products_productphoto` DISABLE KEYS */;
INSERT INTO `products_productphoto` VALUES (6,'products/django-web-development-with-python/20180924011225.png',11),(7,'products/django-javascript-integration-ajax-jquery/20180924011235.jpg',10),(8,'products/developing-responsive-web-apps-ajax-jquery/20180924011243.jpg',9),(9,'products/jquery-ui-1-8-user-interface-library/20180924011300.jpg',8),(10,'products/web-development-django-cookbook-second-edition/20180924011311.jpg',7);
/*!40000 ALTER TABLE `products_productphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes_inspirationalquote`
--

DROP TABLE IF EXISTS `quotes_inspirationalquote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_inspirationalquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `quote` longtext NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes_inspirationalquote`
--

LOCK TABLES `quotes_inspirationalquote` WRITE;
/*!40000 ALTER TABLE `quotes_inspirationalquote` DISABLE KEYS */;
INSERT INTO `quotes_inspirationalquote` VALUES (1,'Walt Disney','If you can dream it, you can do it.','quotes/2018/09/20180913143638.png',''),(2,'Unknown','You can make it idiot proof, but they\'ll make a better idiot.','','');
/*!40000 ALTER TABLE `quotes_inspirationalquote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'auth0','auth0|5afc41015d7d1617fd7d1dac','{\"auth_time\": 1537864769, \"picture\": \"https://s.gravatar.com/avatar/3f87068c0d915e017aef6a5cc87672d8?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fjk.png\", \"access_token\": \"oqGWVvMg2I94ozrhGrtuVOup_R3_GwFH\", \"token_type\": \"Bearer\"}',8);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_key_17b411bb` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_8c8fa920_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
INSERT INTO `tastypie_apikey` VALUES (1,'8f7a978ba5d4cc5644149443e95250efef5cc5d6','2018-10-05 16:37:33.000000',8);
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||0ef3e092bc15f62e8ea7ae0e38262398','{\"name\": \"cache/99/b8/99b898cb435bb2aff3424c09cae7102f.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||155ddfb28e8f5e91609fa8099eadf4c6','{\"name\": \"products/web-development-django-cookbook-second-edition/20180924010134.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||1b590cb98f912a4c029ae2df3860420f','{\"name\": \"cache/7c/35/7c35289a0b858acc484ea7bdf97505f3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [767, 511]}'),('sorl-thumbnail||image||1c755babfcd1f6ba3e3618895f492817','{\"name\": \"products/developing-responsive-web-apps-ajax-jquery/20180924005938.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [2245, 2776]}'),('sorl-thumbnail||image||2591e04c2b25da15be9c744839f19964','{\"name\": \"products/django-web-development-with-python/20180924011225.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||2c5ef14aa0420ef37494146e8654190b','{\"name\": \"cache/3f/cf/3fcf7de7455839345cc359920d77c205.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [200, 133]}'),('sorl-thumbnail||image||35c3d2ad3fb46c29bfc3ae09e3d4e97a','{\"name\": \"cache/c5/5d/c55df64f05566e3730324dd3aa72a350.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [480, 270]}'),('sorl-thumbnail||image||3b800490bb63e2359eee1f66ec489fbb','{\"name\": \"cache/af/e2/afe26bfd0c9f7fe3f811231b596309f1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [1024, 576]}'),('sorl-thumbnail||image||3ba3c6b77b7fd2fc2906c509f7c74f63','{\"name\": \"products/django-javascript-integration-ajax-jquery/20180924010050.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||405a89c861e2ae3b0533a62d211afca4','{\"name\": \"quotes/2018/09/20180913143638.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [554, 348]}'),('sorl-thumbnail||image||568312a57c39712bf5e526540127d5bc','{\"name\": \"cache/0c/1d/0c1dea9bf7689cf45569fd98aa15d0af.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||5a29c92a5f417e8286f1b135c6ca3cee','{\"name\": \"cache/29/d6/29d68687b58b910094351a2e0229f76e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||5dff972e04d74c3fe14fe9bbe37f8794','{\"name\": \"products/jquery-ui-1-8-user-interface-library/20180924011300.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [477, 617]}'),('sorl-thumbnail||image||617a1d2596a7b6aab86646bc9a7fb33f','{\"name\": \"cache/9a/81/9a81bba62fa8fb9998f6daa5e6305651.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 124]}'),('sorl-thumbnail||image||6d3f59546d726c02344ebc46cd8e6d73','{\"name\": \"cache/2f/38/2f3812dee51a31b19d555ef47d446d03.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 63]}'),('sorl-thumbnail||image||71874bb11833308aa57a93c3bff8da4e','{\"name\": \"cache/98/80/98805b29d4c063c4b9fdf0d7da2efe9e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 129]}'),('sorl-thumbnail||image||732abdb4d3afce91d09fb92af3016e7c','{\"name\": \"products/django-web-development-with-python/20180924010114.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||77cc8cacf9c49697439ab939430aed44','{\"name\": \"cache/d4/83/d483f0d25beb81e3a922f801c3fbd5a1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 129]}'),('sorl-thumbnail||image||7f7fc44db4acb6ab0efe9ad703216e3f','{\"name\": \"upload/quotes/user-1/2018/09/22/disney-dream-it-do-it.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [554, 348]}'),('sorl-thumbnail||image||822d2853e28c3780545304048b0ffa6c','{\"name\": \"locations/somewhere-out-there.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [1280, 720]}'),('sorl-thumbnail||image||8ce2819b102643c36c32348cfcc3ea4c','{\"name\": \"cache/3b/53/3b5367ca2c8e578aee9986582c5db3ee.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [200, 126]}'),('sorl-thumbnail||image||9618351c53b9ee29444364906f34f4ef','{\"name\": \"products/web-development-django-cookbook-second-edition/20180924011311.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||9a0a01c8a0fcd226e96036513f1f0a95','{\"name\": \"products/developing-responsive-web-apps-ajax-jquery/20180924011243.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [2245, 2776]}'),('sorl-thumbnail||image||9b79f5a76baa90e765e901b23474e14d','{\"name\": \"cache/70/59/705965ea015c2d1ee2298fec58cd89c1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [480, 320]}'),('sorl-thumbnail||image||bc8b30a42224b8aab869e62852ddeeea','{\"name\": \"cache/a5/65/a56558bd83a2fd420af598fb9424f028.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||be3d861cf90430675b7aad35ce682b47','{\"name\": \"products/django-javascript-integration-ajax-jquery/20180924011235.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [500, 617]}'),('sorl-thumbnail||image||be86abbc87dd2e2a96fe8210952d5245','{\"name\": \"products/jquery-ui-1-8-user-interface-library/20180924005912.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [477, 617]}'),('sorl-thumbnail||image||c82c7e690c2d62febe1c9a84375bd2ad','{\"name\": \"cache/4f/d2/4fd254f904dd0e62217beda9b68e2a1a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||c9f7f7ba39068e06362b13e8770966a9','{\"name\": \"cache/dc/2c/dc2ca5b9935ba48a83ad5601cf397bee.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [768, 432]}'),('sorl-thumbnail||image||d01bc33e6dd90a34ccceae6f6528865f','{\"name\": \"locations/eiffel-tower.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [3003, 2000]}'),('sorl-thumbnail||image||d8b6bca858b18f259d31da51852e36dc','{\"name\": \"cache/2e/0a/2e0a6efadd8c5a73b6d59720db6d1339.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 124]}'),('sorl-thumbnail||image||db9305579c119c98664fa6eb9f8eac78','{\"name\": \"cache/1e/81/1e81955f9b01c62eac6a666970dde2b3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 123]}'),('sorl-thumbnail||image||e3fa214ff2f4cc01c0dc609747ce063f','{\"name\": \"cache/f7/c2/f7c27035056b18b8918071b1c0abece9.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [1024, 682]}'),('sorl-thumbnail||image||e7d7a258d221ad15822256c3edc928a4','{\"name\": \"cache/b1/02/b102123a70320d9427652bac9c819b90.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [199, 112]}'),('sorl-thumbnail||thumbnails||155ddfb28e8f5e91609fa8099eadf4c6','[\"0ef3e092bc15f62e8ea7ae0e38262398\"]'),('sorl-thumbnail||thumbnails||1c755babfcd1f6ba3e3618895f492817','[\"d8b6bca858b18f259d31da51852e36dc\"]'),('sorl-thumbnail||thumbnails||2591e04c2b25da15be9c744839f19964','[\"5a29c92a5f417e8286f1b135c6ca3cee\"]'),('sorl-thumbnail||thumbnails||3ba3c6b77b7fd2fc2906c509f7c74f63','[\"c82c7e690c2d62febe1c9a84375bd2ad\"]'),('sorl-thumbnail||thumbnails||405a89c861e2ae3b0533a62d211afca4','[\"6d3f59546d726c02344ebc46cd8e6d73\"]'),('sorl-thumbnail||thumbnails||5dff972e04d74c3fe14fe9bbe37f8794','[\"71874bb11833308aa57a93c3bff8da4e\"]'),('sorl-thumbnail||thumbnails||732abdb4d3afce91d09fb92af3016e7c','[\"568312a57c39712bf5e526540127d5bc\"]'),('sorl-thumbnail||thumbnails||7f7fc44db4acb6ab0efe9ad703216e3f','[\"8ce2819b102643c36c32348cfcc3ea4c\"]'),('sorl-thumbnail||thumbnails||822d2853e28c3780545304048b0ffa6c','[\"c9f7f7ba39068e06362b13e8770966a9\", \"35c3d2ad3fb46c29bfc3ae09e3d4e97a\", \"e7d7a258d221ad15822256c3edc928a4\", \"3b800490bb63e2359eee1f66ec489fbb\"]'),('sorl-thumbnail||thumbnails||9618351c53b9ee29444364906f34f4ef','[\"db9305579c119c98664fa6eb9f8eac78\"]'),('sorl-thumbnail||thumbnails||9a0a01c8a0fcd226e96036513f1f0a95','[\"617a1d2596a7b6aab86646bc9a7fb33f\"]'),('sorl-thumbnail||thumbnails||be3d861cf90430675b7aad35ce682b47','[\"bc8b30a42224b8aab869e62852ddeeea\"]'),('sorl-thumbnail||thumbnails||be86abbc87dd2e2a96fe8210952d5245','[\"77cc8cacf9c49697439ab939430aed44\"]'),('sorl-thumbnail||thumbnails||d01bc33e6dd90a34ccceae6f6528865f','[\"e3fa214ff2f4cc01c0dc609747ce063f\", \"2c5ef14aa0420ef37494146e8654190b\", \"1b590cb98f912a4c029ae2df3860420f\", \"9b79f5a76baa90e765e901b23474e14d\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viral_videos_viralvideo`
--

DROP TABLE IF EXISTS `viral_videos_viralvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viral_videos_viralvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `embed_code` longtext NOT NULL,
  `anonymous_views` int(10) unsigned NOT NULL,
  `authenticated_views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viral_videos_viralvideo`
--

LOCK TABLES `viral_videos_viralvideo` WRITE;
/*!40000 ALTER TABLE `viral_videos_viralvideo` DISABLE KEYS */;
INSERT INTO `viral_videos_viralvideo` VALUES (1,'2018-10-07 05:52:51.394431','2018-10-08 19:47:57.517358','Michael Jackson - Thriller (Official Video)','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/sOnqjkJTMaA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>',20823,1685),(2,'2018-10-08 19:49:01.935412','2018-10-08 19:49:01.935487','Awesome film','',0,0),(3,'2018-10-08 19:49:37.997040','2018-10-08 19:49:37.997098','Awesome film 2','',0,0);
/*!40000 ALTER TABLE `viral_videos_viralvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watermarker_watermark`
--

DROP TABLE IF EXISTS `watermarker_watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watermarker_watermark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watermarker_watermark`
--

LOCK TABLES `watermarker_watermark` WRITE;
/*!40000 ALTER TABLE `watermarker_watermark` DISABLE KEYS */;
INSERT INTO `watermarker_watermark` VALUES (1,'Basic Two-Tone','watermarks/watermark.png',1,'2018-09-25 07:01:16.280820','2018-09-25 07:01:16.280890');
/*!40000 ALTER TABLE `watermarker_watermark` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19 14:22:03
