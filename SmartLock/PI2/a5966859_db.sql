
-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2016 at 01:47 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a5966859_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admins`
--

CREATE TABLE `Admins` (
  `identification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `firstName` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondName` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `firstSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `bornDate` date NOT NULL,
  `gender` enum('Unknown','Male','Female') COLLATE latin1_general_ci NOT NULL,
  `cellPhone` bigint(16) NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `address` varchar(64) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`identification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `Admins`
--

INSERT INTO `Admins` VALUES('root', 'toor', 'root', NULL, 'root', 'root', '2015-10-12', '', 69, '69', '69');

-- --------------------------------------------------------

--
-- Table structure for table `Locks`
--

CREATE TABLE `Locks` (
  `serial` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `ownerIdentification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `address` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `model` varchar(32) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `ownerIdentification` (`ownerIdentification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `Locks`
--

INSERT INTO `Locks` VALUES('mansion', 'alejo', 'cerros del monte', 'yale');
INSERT INTO `Locks` VALUES('finca', 'alejo', 'santa fe Antioquia', 'Yale');
INSERT INTO `Locks` VALUES('apartamento', 'blackgersain', 'Robledo', 'Gato');
INSERT INTO `Locks` VALUES('oficina', 'blackgersain', 'Guayabal La Raya', 'Gato');

-- --------------------------------------------------------

--
-- Table structure for table `LogSessions`
--

CREATE TABLE `LogSessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerIdentification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `startDateHour` datetime NOT NULL,
  `endDateHour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerIdentification` (`ownerIdentification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LogSessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `LogUses`
--

CREATE TABLE `LogUses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lockSerial` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `code` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `dateHour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lockSerial` (`lockSerial`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LogUses`
--


-- --------------------------------------------------------

--
-- Table structure for table `OwnerCodes`
--

CREATE TABLE `OwnerCodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lockSerial` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `code` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `dateHour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lockSerial` (`lockSerial`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=155 ;

--
-- Dumping data for table `OwnerCodes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Owners`
--

CREATE TABLE `Owners` (
  `identification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `firstName` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondName` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `firstSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `bornDate` date NOT NULL,
  `gender` enum('Unknown','Male','Female') COLLATE latin1_general_ci NOT NULL,
  `cellPhone` bigint(16) NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `address` varchar(64) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`identification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `Owners`
--

INSERT INTO `Owners` VALUES('blackgersain', 'toor', 'Gersain', '', 'Castañeda', 'Muñoz', '2015-10-12', 'Male', 69, '69', '69');
INSERT INTO `Owners` VALUES('alejo', 'toor', 'Alejandro', NULL, 'Cadavid', 'Correa', '2015-10-12', 'Male', 69, '69', '69');

-- --------------------------------------------------------

--
-- Table structure for table `Permissions`
--

CREATE TABLE `Permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lockSerial` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `recipientIdentification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `startDateHour` datetime NOT NULL,
  `endDateHour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lockSerial` (`lockSerial`),
  KEY `recipientIdentification` (`recipientIdentification`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Permissions`
--

INSERT INTO `Permissions` VALUES(3, 'apartamento', 'hijo', '2015-11-09 00:00:00', '2015-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `RecipientCodes`
--

CREATE TABLE `RecipientCodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `code` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `dateHour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissionId` (`permissionId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=70 ;

--
-- Dumping data for table `RecipientCodes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Recipients`
--

CREATE TABLE `Recipients` (
  `identification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `ownerIdentification` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `firstName` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondName` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `firstSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `secondSurname` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `bornDate` date NOT NULL,
  `gender` enum('Unknown','Male','Female') COLLATE latin1_general_ci NOT NULL,
  `cellPhone` bigint(16) NOT NULL,
  `email` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `address` varchar(64) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`identification`),
  KEY `ownerIdentification` (`ownerIdentification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `Recipients`
--

INSERT INTO `Recipients` VALUES('root', 'alejo', 'toor', 'h', 'h', 'h', 'h', '2015-11-11', 'Male', 7, 'y', 'y');
INSERT INTO `Recipients` VALUES('hijo', 'blackgersain', 'hijo', 'hijo', 'hijo', 'hijo', 'hijo', '2015-11-13', 'Male', 3, '3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_commentmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` VALUES(1, 1, 'Señor WordPress', '', 'https://wordpress.org/', '', '2015-10-27 17:42:44', '2015-10-27 17:42:44', 'Hola, esto es un comentario.\nPara eliminar un comentario, sólo necesita iniciar sesión y ver los comentarios de la entrada. Allí tendrá la opción de editar o eliminarlos.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` VALUES(1, 'siteurl', 'http://internetdelascosas.freeiz.com/wordpress', 'yes');
INSERT INTO `wp_options` VALUES(2, 'home', 'http://internetdelascosas.freeiz.com/wordpress', 'yes');
INSERT INTO `wp_options` VALUES(3, 'blogname', 'SmartLock', 'yes');
INSERT INTO `wp_options` VALUES(4, 'blogdescription', '', 'yes');
INSERT INTO `wp_options` VALUES(5, 'users_can_register', '0', 'yes');
INSERT INTO `wp_options` VALUES(6, 'admin_email', 'lalejandro1091@hotmail.com', 'yes');
INSERT INTO `wp_options` VALUES(7, 'start_of_week', '1', 'yes');
INSERT INTO `wp_options` VALUES(8, 'use_balanceTags', '0', 'yes');
INSERT INTO `wp_options` VALUES(9, 'use_smilies', '1', 'yes');
INSERT INTO `wp_options` VALUES(10, 'require_name_email', '1', 'yes');
INSERT INTO `wp_options` VALUES(11, 'comments_notify', '1', 'yes');
INSERT INTO `wp_options` VALUES(12, 'posts_per_rss', '10', 'yes');
INSERT INTO `wp_options` VALUES(13, 'rss_use_excerpt', '0', 'yes');
INSERT INTO `wp_options` VALUES(14, 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `wp_options` VALUES(15, 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `wp_options` VALUES(16, 'mailserver_pass', 'password', 'yes');
INSERT INTO `wp_options` VALUES(17, 'mailserver_port', '110', 'yes');
INSERT INTO `wp_options` VALUES(18, 'default_category', '1', 'yes');
INSERT INTO `wp_options` VALUES(19, 'default_comment_status', 'open', 'yes');
INSERT INTO `wp_options` VALUES(20, 'default_ping_status', 'open', 'yes');
INSERT INTO `wp_options` VALUES(21, 'default_pingback_flag', '1', 'yes');
INSERT INTO `wp_options` VALUES(22, 'posts_per_page', '10', 'yes');
INSERT INTO `wp_options` VALUES(23, 'date_format', 'j F, Y', 'yes');
INSERT INTO `wp_options` VALUES(24, 'time_format', 'g:i a', 'yes');
INSERT INTO `wp_options` VALUES(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes');
INSERT INTO `wp_options` VALUES(26, 'comment_moderation', '0', 'yes');
INSERT INTO `wp_options` VALUES(27, 'moderation_notify', '1', 'yes');
INSERT INTO `wp_options` VALUES(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes');
INSERT INTO `wp_options` VALUES(29, 'gzipcompression', '0', 'yes');
INSERT INTO `wp_options` VALUES(30, 'hack_file', '0', 'yes');
INSERT INTO `wp_options` VALUES(31, 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `wp_options` VALUES(32, 'moderation_keys', '', 'no');
INSERT INTO `wp_options` VALUES(33, 'active_plugins', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES(34, 'category_base', '', 'yes');
INSERT INTO `wp_options` VALUES(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `wp_options` VALUES(36, 'advanced_edit', '0', 'yes');
INSERT INTO `wp_options` VALUES(37, 'comment_max_links', '2', 'yes');
INSERT INTO `wp_options` VALUES(38, 'gmt_offset', '0', 'yes');
INSERT INTO `wp_options` VALUES(39, 'default_email_category', '1', 'yes');
INSERT INTO `wp_options` VALUES(40, 'recently_edited', '', 'no');
INSERT INTO `wp_options` VALUES(41, 'template', 'MyBlog-WordpressTheme-master', 'yes');
INSERT INTO `wp_options` VALUES(42, 'stylesheet', 'MyBlog-WordpressTheme-master', 'yes');
INSERT INTO `wp_options` VALUES(43, 'comment_whitelist', '1', 'yes');
INSERT INTO `wp_options` VALUES(44, 'blacklist_keys', '', 'no');
INSERT INTO `wp_options` VALUES(45, 'comment_registration', '0', 'yes');
INSERT INTO `wp_options` VALUES(46, 'html_type', 'text/html', 'yes');
INSERT INTO `wp_options` VALUES(47, 'use_trackback', '0', 'yes');
INSERT INTO `wp_options` VALUES(48, 'default_role', 'subscriber', 'yes');
INSERT INTO `wp_options` VALUES(49, 'db_version', '33056', 'yes');
INSERT INTO `wp_options` VALUES(50, 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `wp_options` VALUES(51, 'upload_path', '', 'yes');
INSERT INTO `wp_options` VALUES(52, 'blog_public', '1', 'yes');
INSERT INTO `wp_options` VALUES(53, 'default_link_category', '2', 'yes');
INSERT INTO `wp_options` VALUES(54, 'show_on_front', 'posts', 'yes');
INSERT INTO `wp_options` VALUES(55, 'tag_base', '', 'yes');
INSERT INTO `wp_options` VALUES(56, 'show_avatars', '1', 'yes');
INSERT INTO `wp_options` VALUES(57, 'avatar_rating', 'G', 'yes');
INSERT INTO `wp_options` VALUES(58, 'upload_url_path', '', 'yes');
INSERT INTO `wp_options` VALUES(59, 'thumbnail_size_w', '150', 'yes');
INSERT INTO `wp_options` VALUES(60, 'thumbnail_size_h', '150', 'yes');
INSERT INTO `wp_options` VALUES(61, 'thumbnail_crop', '1', 'yes');
INSERT INTO `wp_options` VALUES(62, 'medium_size_w', '300', 'yes');
INSERT INTO `wp_options` VALUES(63, 'medium_size_h', '300', 'yes');
INSERT INTO `wp_options` VALUES(64, 'avatar_default', 'mystery', 'yes');
INSERT INTO `wp_options` VALUES(65, 'large_size_w', '1024', 'yes');
INSERT INTO `wp_options` VALUES(66, 'large_size_h', '1024', 'yes');
INSERT INTO `wp_options` VALUES(67, 'image_default_link_type', 'file', 'yes');
INSERT INTO `wp_options` VALUES(68, 'image_default_size', '', 'yes');
INSERT INTO `wp_options` VALUES(69, 'image_default_align', '', 'yes');
INSERT INTO `wp_options` VALUES(70, 'close_comments_for_old_posts', '0', 'yes');
INSERT INTO `wp_options` VALUES(71, 'close_comments_days_old', '14', 'yes');
INSERT INTO `wp_options` VALUES(72, 'thread_comments', '1', 'yes');
INSERT INTO `wp_options` VALUES(73, 'thread_comments_depth', '5', 'yes');
INSERT INTO `wp_options` VALUES(74, 'page_comments', '0', 'yes');
INSERT INTO `wp_options` VALUES(75, 'comments_per_page', '50', 'yes');
INSERT INTO `wp_options` VALUES(76, 'default_comments_page', 'newest', 'yes');
INSERT INTO `wp_options` VALUES(77, 'comment_order', 'asc', 'yes');
INSERT INTO `wp_options` VALUES(78, 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `wp_options` VALUES(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(82, 'uninstall_plugins', 'a:0:{}', 'no');
INSERT INTO `wp_options` VALUES(83, 'timezone_string', '', 'yes');
INSERT INTO `wp_options` VALUES(84, 'page_for_posts', '0', 'yes');
INSERT INTO `wp_options` VALUES(85, 'page_on_front', '0', 'yes');
INSERT INTO `wp_options` VALUES(86, 'default_post_format', '0', 'yes');
INSERT INTO `wp_options` VALUES(87, 'link_manager_enabled', '0', 'yes');
INSERT INTO `wp_options` VALUES(88, 'finished_splitting_shared_terms', '1', 'yes');
INSERT INTO `wp_options` VALUES(89, 'initial_db_version', '33056', 'yes');
INSERT INTO `wp_options` VALUES(90, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes');
INSERT INTO `wp_options` VALUES(91, 'WPLANG', 'es_CO', 'yes');
INSERT INTO `wp_options` VALUES(92, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(93, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(94, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(95, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(96, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(97, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}', 'yes');
INSERT INTO `wp_options` VALUES(101, 'rewrite_rules', 'a:58:{s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes');
INSERT INTO `wp_options` VALUES(99, 'cron', 'a:4:{i:1446010965;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446019020;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446054181;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes');
INSERT INTO `wp_options` VALUES(116, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1446010999', 'no');
INSERT INTO `wp_options` VALUES(113, '_transient_random_seed', '4ca193a1f3f6296a958660b46d407003', 'yes');
INSERT INTO `wp_options` VALUES(110, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:6:"locale";s:5:"es_CO";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.3.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.3.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.3.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.3.1";s:7:"version";s:5:"4.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1445967777;s:15:"version_checked";s:5:"4.3.1";s:12:"translations";a:0:{}}', 'yes');
INSERT INTO `wp_options` VALUES(115, 'can_compress_scripts', '1', 'yes');
INSERT INTO `wp_options` VALUES(106, '_site_transient_timeout_theme_roots', '1445971080', 'yes');
INSERT INTO `wp_options` VALUES(107, '_site_transient_theme_roots', 'a:4:{s:28:"MyBlog-WordpressTheme-master";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes');
INSERT INTO `wp_options` VALUES(118, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1445967799', 'no');
INSERT INTO `wp_options` VALUES(119, '_transient_timeout_plugin_slugs', '1446054209', 'no');
INSERT INTO `wp_options` VALUES(120, '_transient_plugin_slugs', 'a:2:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";}', 'no');
INSERT INTO `wp_options` VALUES(121, '_transient_timeout_dash_8ed47f02370e4304b3fb8352267b4572', '1446011009', 'no');
INSERT INTO `wp_options` VALUES(122, '_transient_dash_8ed47f02370e4304b3fb8352267b4572', '<div class="rss-widget"><p><strong>Error de RSS</strong>: WP HTTP Error: connect() timed out!</p></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wptavern.com/how-to-prepare-and-take-advantage-of-language-packs-for-plugins-hosted-on-wordpress-org''>WPTavern: How to Prepare and Take Advantage of Language Packs for Plugins Hosted on WordPress.org</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/test-new-wordpress-features-without-installing-anything-via-trywpbeta''>WPTavern: Test New WordPress Features Without Installing Anything via TryWPBeta</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/versionpress-raises-400k-in-seed-funding''>WPTavern: VersionPress Raises $400K in Seed Funding</a></li></ul></div><div class="rss-widget"><ul></ul></div>', 'no');
INSERT INTO `wp_options` VALUES(111, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1445967779;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.3";s:14:"twentyfourteen";s:3:"1.5";s:14:"twentythirteen";s:3:"1.6";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes');
INSERT INTO `wp_options` VALUES(112, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1445967778;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.5";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.5.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes');
INSERT INTO `wp_options` VALUES(117, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1446010999', 'no');
INSERT INTO `wp_options` VALUES(123, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(124, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(125, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(126, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(127, '_transient_is_multi_author', '0', 'yes');
INSERT INTO `wp_options` VALUES(128, '_transient_twentyfifteen_categories', '1', 'yes');
INSERT INTO `wp_options` VALUES(129, 'widget_widget_twentyfourteen_ephemera', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `wp_options` VALUES(132, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1445968103;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes');
INSERT INTO `wp_options` VALUES(131, '_transient_twentyfourteen_category_count', '1', 'yes');
INSERT INTO `wp_options` VALUES(133, 'current_theme', 'Myblog', 'yes');
INSERT INTO `wp_options` VALUES(134, 'theme_mods_twentyfourteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1445969304;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes');
INSERT INTO `wp_options` VALUES(135, 'theme_switched', '', 'yes');
INSERT INTO `wp_options` VALUES(136, 'theme_switched_via_customizer', '', 'yes');
INSERT INTO `wp_options` VALUES(142, 'theme_mods_MyBlog-WordpressTheme-master', 'a:1:{i:0;b:0;}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` VALUES(1, 2, '_wp_page_template', 'default');
INSERT INTO `wp_postmeta` VALUES(2, 3, '_edit_last', '1');
INSERT INTO `wp_postmeta` VALUES(3, 3, '_edit_lock', '1445967809:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` VALUES(1, 1, '2015-10-27 17:42:44', '2015-10-27 17:42:44', 'Bienvenido a WordPress. Esta es tu primera entrada. Edítela o borrela, y ¡comience a redactar!', '¡Hola mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2015-10-27 17:42:44', '2015-10-27 17:42:44', '', 0, 'http://internetdelascosas.freeiz.com/wordpress/?p=1', 0, 'post', '', 1);
INSERT INTO `wp_posts` VALUES(2, 1, '2015-10-27 17:42:44', '2015-10-27 17:42:44', 'Esta es una página de ejemplo. Es diferente a una entrada del blog, ya que se quedará en un lugar y se mostrará en la navegación del sitio (en la mayoría de temas). La mayoría de personas empieza con una página "Acerca de" que brinda información a los visitantes. Se podría decir algo como esto:\n\n<blockquote>¡Hola! Durante el día soy un mensajero, un aspirante a actor por la noche, y este es mi blog. Vivo en Lima, tengo un enorme perro llamado Pocho, y me gusta el Pisco Sour. (Y caminar bajo la lluvia.)</blockquote>\n\n...o algo como esto:\n\n<blockquote>La compañía XYZ, se fundó en 1971, y ha estado desde entonces, proporcionando artilugios de calidad al público. Está situado en la ciudad de Lima, XYZ emplea a más de 2,000 personas y hace todo tipo de cosas sorprendentes para la comunidad limeña.</blockquote>\n\nComo nuevo usuario de WordPress, usted debe ir a <a href="http://internetdelascosas.freeiz.com/wordpress/wp-admin/">su panel</a> para eliminar esta página y crear nuevas para su contenido. ¡Que se divierta!', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-de-ejemplo', '', '', '2015-10-27 17:42:44', '2015-10-27 17:42:44', '', 0, 'http://internetdelascosas.freeiz.com/wordpress/?page_id=2', 0, 'page', '', 0);
INSERT INTO `wp_posts` VALUES(3, 1, '2015-10-27 17:43:06', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-10-27 17:43:06', '0000-00-00 00:00:00', '', 0, 'http://internetdelascosas.freeiz.com/wordpress/?p=3', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` VALUES(1, 'Sin categoría', 'sin-categoria', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` VALUES(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` VALUES(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` VALUES(1, 1, 'nickname', 'root');
INSERT INTO `wp_usermeta` VALUES(2, 1, 'first_name', '');
INSERT INTO `wp_usermeta` VALUES(3, 1, 'last_name', '');
INSERT INTO `wp_usermeta` VALUES(4, 1, 'description', '');
INSERT INTO `wp_usermeta` VALUES(5, 1, 'rich_editing', 'true');
INSERT INTO `wp_usermeta` VALUES(6, 1, 'comment_shortcuts', 'false');
INSERT INTO `wp_usermeta` VALUES(7, 1, 'admin_color', 'fresh');
INSERT INTO `wp_usermeta` VALUES(8, 1, 'use_ssl', '0');
INSERT INTO `wp_usermeta` VALUES(9, 1, 'show_admin_bar_front', 'true');
INSERT INTO `wp_usermeta` VALUES(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO `wp_usermeta` VALUES(11, 1, 'wp_user_level', '10');
INSERT INTO `wp_usermeta` VALUES(12, 1, 'dismissed_wp_pointers', '');
INSERT INTO `wp_usermeta` VALUES(13, 1, 'show_welcome_panel', '1');
INSERT INTO `wp_usermeta` VALUES(14, 1, 'session_tokens', 'a:1:{s:64:"56bfbe1f64ed8e491b92fbdb2669cbbce66e82ce04baa089237bea9f3ea6f723";a:4:{s:10:"expiration";i:1447177381;s:2:"ip";s:14:"181.134.19.229";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36";s:5:"login";i:1445967781;}}');
INSERT INTO `wp_usermeta` VALUES(15, 1, 'wp_dashboard_quick_press_last_post_id', '3');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` VALUES(1, 'root', '$P$BHkJhslNaRwWwc4Auk6H/QEePpKTrI0', 'root', 'lalejandro1091@hotmail.com', '', '2015-10-27 17:42:44', '', 0, 'root');
