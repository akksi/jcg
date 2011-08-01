-- phpMyAdmin SQL Dump
-- version 3.3.10.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-07-2011 a las 18:35:00
-- Versión del servidor: 5.0.92
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `telefoni_clarogames`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatars`
--

CREATE TABLE IF NOT EXISTS `avatars` (
  `idAvatars` int(11) NOT NULL,
  `name` varchar(45) default NULL,
  `description` varchar(45) default NULL,
  PRIMARY KEY  (`idAvatars`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `avatars`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `Idbanner` int(11) NOT NULL,
  `name` varchar(1003) NOT NULL,
  `description` text,
  `urlImage` varchar(300) default NULL,
  `uploadIp` varchar(255) default NULL,
  `idBannerCategory` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY  (`Idbanner`),
  KEY `fk_banner_bannerCategory` (`idBannerCategory`),
  KEY `fk_banner_status` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `banner`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bannerCategory`
--

CREATE TABLE IF NOT EXISTS `bannerCategory` (
  `idBannerCategory` int(11) NOT NULL,
  `name` varchar(100) default NULL,
  `activationDate` datetime default NULL,
  `expirationDate` varchar(45) default NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY  (`idBannerCategory`),
  KEY `fk_bannerCategory_status` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `bannerCategory`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bannerGame`
--

CREATE TABLE IF NOT EXISTS `bannerGame` (
  `game_idGame` int(11) NOT NULL,
  `Idbanner` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY  (`game_idGame`,`Idbanner`),
  KEY `fk_bannerGame_game` (`game_idGame`),
  KEY `fk_bannerGame_banner` (`Idbanner`),
  KEY `fk_bannerGame_status` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `bannerGame`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoryContent`
--

CREATE TABLE IF NOT EXISTS `categoryContent` (
  `idCategoryContent` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creationDate` datetime default NULL,
  `expirationDate` datetime default NULL,
  `status_idStatus` int(11) NOT NULL,
  PRIMARY KEY  (`idCategoryContent`),
  KEY `fk_categoryContent_status` (`status_idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `categoryContent`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `idContent` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) default NULL,
  `creationDate` datetime NOT NULL,
  `expirationDate` datetime default NULL,
  `idCategoryContent` int(11) NOT NULL,
  `status_idStatus` int(11) NOT NULL,
  `idGame` int(11) default NULL,
  PRIMARY KEY  (`idContent`),
  KEY `fk_content_categoryContent` (`idCategoryContent`),
  KEY `fk_content_status` (`status_idStatus`),
  KEY `fk_content_game` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `content`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `file_category`
--

CREATE TABLE IF NOT EXISTS `file_category` (
  `file_category_id` int(11) NOT NULL auto_increment,
  `file_category_description` varchar(100) NOT NULL,
  PRIMARY KEY  (`file_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `file_category`
--

INSERT INTO `file_category` (`file_category_id`, `file_category_description`) VALUES
(1, 'Categoría de Flash'),
(2, 'Categoría de Preview'),
(3, 'Categoría de Thumbnails');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `idGame` int(11) NOT NULL auto_increment,
  `name` varchar(300) NOT NULL,
  `creationDate` datetime NOT NULL,
  `activationDate` datetime default NULL,
  `expirationDate` datetime default NULL,
  `description` varchar(300) default NULL,
  `creationIp` varchar(255) default NULL,
  `expirationIp` varchar(255) default NULL,
  `idStatus` int(11) NOT NULL,
  `idFileFlash` int(11) NOT NULL,
  `idFilePreview` int(11) NOT NULL,
  `idFileThumbnail` int(11) NOT NULL,
  `banner_id` int(11) default NULL,
  PRIMARY KEY  (`idGame`),
  KEY `fk_game_status` (`idStatus`),
  KEY `fk_file_flash` (`idFileFlash`),
  KEY `fk_file_preview` (`idFilePreview`),
  KEY `fk_file_thumbnail` (`idFileThumbnail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `game`
--

INSERT INTO `game` (`idGame`, `name`, `creationDate`, `activationDate`, `expirationDate`, `description`, `creationIp`, `expirationIp`, `idStatus`, `idFileFlash`, `idFilePreview`, `idFileThumbnail`, `banner_id`) VALUES
(1, 'Buscar Patos', '2011-07-07 16:04:14', '2011-07-07 16:04:18', NULL, 'Juego de prueba para la funcionalidad global', NULL, NULL, 1, 1, 2, 3, 1),
(2, 'Mario Bros', '2011-07-13 11:55:10', '2011-07-13 11:55:13', NULL, 'Juego de prueba Mario', NULL, NULL, 1, 4, 5, 6, 1),
(3, 'La Granja', '2011-07-13 12:01:40', '2011-07-13 12:01:42', NULL, 'Juego de prueba Granja', NULL, NULL, 1, 7, 8, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gameDetails`
--

CREATE TABLE IF NOT EXISTS `gameDetails` (
  `idGameDetails` int(11) NOT NULL,
  `startDate` datetime default NULL,
  `endDate` varchar(45) default NULL,
  `notes` text,
  `idGame` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pointsGame` varchar(45) default NULL,
  `idGift` int(11) NOT NULL,
  PRIMARY KEY  (`idGameDetails`),
  KEY `fk_gameDetails_gamesUserFb` (`idGame`,`uid`),
  KEY `fk_gameDetails_gift` (`idGift`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `gameDetails`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamePlayFriend`
--

CREATE TABLE IF NOT EXISTS `gamePlayFriend` (
  `idGamePlayFriend` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `uidFriend` int(11) NOT NULL,
  `gameDetails_idGameDetails` int(11) NOT NULL,
  `idAvatars` int(11) NOT NULL,
  PRIMARY KEY  (`idGamePlayFriend`),
  KEY `fk_friend_userFBA` (`uid`),
  KEY `fk_friend_userFB` (`uidFriend`),
  KEY `fk_friend_gameDetails` (`gameDetails_idGameDetails`),
  KEY `fk_gamePlayFriend_avatars` (`idAvatars`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `gamePlayFriend`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamesUserFb`
--

CREATE TABLE IF NOT EXISTS `gamesUserFb` (
  `game_idGame` int(11) NOT NULL,
  `userFB_uid` int(11) NOT NULL,
  `assignmentDate` datetime default NULL,
  `expirationDate` datetime default NULL,
  `notes` text,
  `totalPoints` int(11) default NULL,
  `idStatus` int(11) NOT NULL,
  `idGift` int(11) NOT NULL,
  PRIMARY KEY  (`game_idGame`,`userFB_uid`),
  KEY `fk_gamesUserFb_game` (`game_idGame`),
  KEY `fk_gamesUserFb_userFB` (`userFB_uid`),
  KEY `fk_gamesUserFb_status` (`idStatus`),
  KEY `fk_gamesUserFb_gift` (`idGift`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `gamesUserFb`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gift`
--

CREATE TABLE IF NOT EXISTS `gift` (
  `idGift` int(11) NOT NULL,
  `name` varchar(45) default NULL,
  `creationDate` varchar(45) default NULL,
  `idTypeGift` int(11) NOT NULL,
  PRIMARY KEY  (`idGift`),
  KEY `fk_gift_typeGift` (`idTypeGift`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `gift`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  `banner_id` int(11) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`, `banner_id`) VALUES
(1, 0, '', 'Juego 1', 'bannertestjuego1', 0, 0, 0, '', '', '2011-07-11 21:44:08', 1, 0, '0000-00-00 00:00:00', '', '  <script type=''text/javascript''><!--//<![CDATA[\r\n        var m3_u = (location.protocol==''https:''?''https://publicidad.claro.com.gt/www/delivery/ajs.php'':''http://publicidad.claro.com.gt/www/delivery/ajs.php'');\r\n        var m3_r = Math.floor(Math.random()*99999999999);\r\n        if (!document.MAX_used) document.MAX_used = '','';\r\n        document.write ("<scr"+"ipt type=''text/javascript'' src=''"+m3_u);\r\n        document.write ("?campaignid=16");\r\n        document.write (''&amp;cb='' + m3_r);\r\n        if (document.MAX_used != '','') document.write ("&amp;exclude=" + document.MAX_used);\r\n        document.write (document.charset ? ''&amp;charset=''+document.charset : (document.characterSet ? ''&amp;charset=''+document.characterSet : ''''));\r\n        document.write ("&amp;loc=" + escape(window.location));\r\n        if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));\r\n        if (document.context) document.write ("&context=" + escape(document.context));\r\n        if (document.mmm_fo) document.write ("&amp;mmm_fo=1");\r\n        document.write ("''><\\/scr"+"ipt>");\r\n        //]]>--></script><noscript><a href=''http://publicidad.claro.com.gt/www/delivery/ck.php?n=a4d2d63a&amp;cb=78945623169'' target=''_blank''><img src=''http://publicidad.claro.com.gt/www/delivery/avw.php?campaignid=16&amp;cb=78945623169&amp;n=a4d2d63a'' border=''0'' alt='''' /></a></noscript>', 0, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'width=0\nheight=0', 1),
(2, 0, '', 'Juego 1 - Banner 2', 'juego1vertical', 0, 0, 0, '', '', '2011-07-12 22:58:41', 1, 0, '0000-00-00 00:00:00', '', '<script type=''text/javascript''><!--//<![CDATA[\r\n   var m3_u = (location.protocol==''https:''?''https://adsever.telefoniaguatemala.com/www/delivery/ajs.php'':''http://adsever.telefoniaguatemala.com/www/delivery/ajs.php'');\r\n   var m3_r = Math.floor(Math.random()*99999999999);\r\n   if (!document.MAX_used) document.MAX_used = '','';\r\n   document.write ("<scr"+"ipt type=''text/javascript'' src=''"+m3_u);\r\n   document.write ("?campaignid=13");\r\n   document.write (''&amp;cb='' + m3_r);\r\n   if (document.MAX_used != '','') document.write ("&amp;exclude=" + document.MAX_used);\r\n   document.write (document.charset ? ''&amp;charset=''+document.charset : (document.characterSet ? ''&amp;charset=''+document.characterSet : ''''));\r\n   document.write ("&amp;loc=" + escape(window.location));\r\n   if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));\r\n   if (document.context) document.write ("&context=" + escape(document.context));\r\n   if (document.mmm_fo) document.write ("&amp;mmm_fo=1");\r\n   document.write ("''><\\/scr"+"ipt>");\r\n//]]>--></script><noscript><a href=''http://adsever.telefoniaguatemala.com/www/delivery/ck.php?n=aaee2482&amp;cb=78945623169'' target=''_blank''><img src=''http://adsever.telefoniaguatemala.com/www/delivery/avw.php?campaignid=13&amp;cb=78945623169&amp;n=aaee2482'' border=''0'' alt='''' /></a></noscript>', 0, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'width=0\nheight=0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_bannergame`
--

CREATE TABLE IF NOT EXISTS `jos_bannergame` (
  `id` int(11) NOT NULL auto_increment,
  `greeting` varchar(25) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `jos_bannergame`
--

INSERT INTO `jos_bannergame` (`id`, `greeting`) VALUES
(1, 'Hello, World!'),
(2, 'Bonjour, Monde!f'),
(3, 'Ciao, Mondo!'),
(4, 'Hallo, Welt ;)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Volcar la base de datos para la tabla `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'EasyCreator', 'option=com_easycreator', 0, 0, 'option=com_easycreator', 'EasyCreator', 'com_easycreator', 0, 'components/com_easycreator/assets/images/easy-joomla-favicon.ico', 0, 'cred_author=\ncred_author_email=\ncred_author_url=\ncred_license=http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL\ncred_copyright=\narchive_zip=on\ncustom_name_1=_*VERSION*_*SVNREV*_*DATETIMEymd_Hi*\ncustom_name_2=_*VERSION*_*DATETIMEymd_Hi*\ncustom_name_3=_*VERSION*\nlogging=1\nprofile=1\nfiles=1\necr_help=all\neditarea_type=edit_area_full.js\nlocal_api_copy=\nwarn_livesite=1\nuse_google_trans_api=1\nlangfiles_chk_utf8=0\nlangfiles_chk_bom=1\necr_debug=0\necr_debug_type=krumo\n\n', 1),
(35, 'clarogames', 'option=com_clarogames', 0, 0, 'option=com_clarogames', 'clarogames', 'com_clarogames', 0, 'components/com_clarogames/assets/images/com_clarogames.ico', 0, '', 1),
(37, 'Facebook Graph Connect', 'option=com_fbjconnect', 0, 0, 'option=com_fbjconnect', 'Facebook Graph Connect', 'com_fbjconnect', 0, 'components/com_fbjconnect/facebookicon.png', 0, 'appid=145773315482539\nappsecret=795b288856f388ce6e507e216bdff8f0\nconnect-type=1\nlink-with-email=1\nlength-of-randstring=4\nlist-no-of-reg-users=10\nemailsender=1\nviewlayout=1\n\n', 1),
(38, 'bannergame', 'option=com_bannergame', 0, 0, 'option=com_bannergame', 'bannergame', 'com_bannergame', 0, 'components/com_bannergame/assets/images/com_bannergame.ico', 0, '', 1),
(39, 'claroforms', 'option=com_claroforms', 0, 0, 'option=com_claroforms', 'claroforms', 'com_claroforms', 0, 'js/ThemeOffice/component.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_contact_details`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, '455', 'tdd', '', '<p>Esta es una prueba de html <img src="images/powered_by.png" border="0" alt="asdf" width="165" height="68" /></p>', '', 1, 0, 0, 0, '2011-07-14 16:05:02', 62, '', '2011-07-14 18:52:46', 62, 0, '0000-00-00 00:00:00', '2011-07-14 16:05:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 3, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcar la base de datos para la tabla `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'David Bac', 0),
(12, 'users', '64', 0, 'David Bac', 0),
(13, 'users', '65', 0, 'David Bac', 0),
(14, 'users', '66', 0, 'Willber Barrios', 0),
(15, 'users', '67', 0, 'Tegua PirataNet', 0),
(16, 'users', '68', 0, 'David Bac', 0),
(17, 'users', '69', 0, 'David Bac', 0),
(18, 'users', '70', 0, 'Tpp Desarrollador', 0),
(19, 'users', '71', 0, 'David Bac', 0),
(20, 'users', '72', 0, 'Guillermo Psychopsia', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Volcar la base de datos para la tabla `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 11),
(18, '', 12),
(18, '', 13),
(18, '', 14),
(18, '', 15),
(18, '', 16),
(18, '', 17),
(18, '', 18),
(18, '', 19),
(18, '', 20),
(25, '', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_facebook_joomla_connect`
--

CREATE TABLE IF NOT EXISTS `jos_facebook_joomla_connect` (
  `joomla_userid` int(15) NOT NULL,
  `facebook_userid` bigint(20) unsigned NOT NULL,
  `joined_date` int(15) NOT NULL,
  `linked` smallint(4) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) default NULL,
  `mobilePhone` varchar(100) default NULL,
  `email` varchar(255) NOT NULL,
  `birthday` date default NULL,
  `cedulaDpi` varchar(255) default NULL,
  `gender` varchar(100) default NULL,
  `address` varchar(255) default NULL,
  `homePhone` varchar(100) default NULL,
  `maritalStatus` varchar(100) default NULL,
  `verified` int(11) default NULL,
  `website` varchar(100) default NULL,
  PRIMARY KEY  (`joomla_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_facebook_joomla_connect`
--

INSERT INTO `jos_facebook_joomla_connect` (`joomla_userid`, `facebook_userid`, `joined_date`, `linked`, `firstName`, `lastName`, `mobilePhone`, `email`, `birthday`, `cedulaDpi`, `gender`, `address`, `homePhone`, `maritalStatus`, `verified`, `website`) VALUES
(72, 1134314335, 1310408507, 1, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 100000138684000, 1310150214, 1, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_jconnector_ids`
--

CREATE TABLE IF NOT EXISTS `jos_jconnector_ids` (
  `user_id` int(11) NOT NULL,
  `facebook_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_jconnector_ids`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Juegos', 'juegos', 'index.php?option=com_clarogames&view=clarogames', 'component', 1, 0, 35, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'test', 'Vista', 'vistacom', 'index.php?option=com_clarogames&view=addfan', 'component', 1, 0, 35, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'Headings-List', 'Top Games', 'topgames', '#top', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(5, 'Headings-List', 'Juegos Nuevos', 'juegosnuevos', '#new', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(6, 'Headings-List', 'Todos los Juegos', 'todosjuegos', '#all', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(7, 'Headings-List', 'Mis Juegos', 'misjuegos', '#my', 'url', 1, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(8, 'test', 'sf', 'sf', 'index.php?option=com_content&view=article&id=1', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'test', 'Prueba', 'prueba'),
(3, 'Headings-List', 'Headings List', 'Claro Headings');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_messages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Volcar la base de datos para la tabla `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(21, 'jConnector', '', 2, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_jconnector', 0, 0, 1, 'fb_key=124953950923159\nfb_secret=c48e767ef1ab5ac29b68605fd2e678b7\n\n', 0, 0, ''),
(20, 'Facebook Connect Login Module', '', 4, 'breadcrumb', 0, '0000-00-00 00:00:00', 0, 'mod_jfbgconnect', 0, 0, 1, 'show-only-button=0\nusesecure=1\nfbshowprofileimage=0\nlinkprofileimage=0\nfbavatarimgsize=large\nfacebook-button-type=small-blue.gif\nshow_forgotpass=1\nshow_forgotusername=1\nshow_manualreg=1\nauthor-initial=1\nlink-text-margin-left=5\nlink-text-margin-right=0\nbutton-margin-left=5\nbutton-margin-right=0\nadditionalcss=.skmfbdivstyle {z-index:1000;width:500px;height:40px;border:solid 1px #c0c0c0;color:#333333;left:35%;margin-left: -70px;background: #FFCCCC;font: bold medium/35px Arial, Helvetica, sans-serif;position: absolute;top: 40%;}\n\n', 0, 0, ''),
(22, 'prueba', '', 3, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=test', 0, 0, ''),
(23, 'Bannersh', '', 0, 'bannerbody', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 1, 'target=1\ncount=1\ncid=1\ncatid=1\ntag_search=0\nordering=random\nheader_text=\nfooter_text=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(24, '78954', '', 0, 'menugames', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=test\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(31, 'Banners Claro', '', 0, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_banners_claro_interna', 0, 0, 0, 'cid=2\n\n', 0, 0, ''),
(25, 'Claro Preview', '', 0, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_preview', 0, 0, 0, 'clase=preview\nasignarCss=1\n\n', 0, 0, ''),
(26, 'Claro Thumbnails', '', 0, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_thumbnails', 0, 0, 0, 'clase=thumbnails\nasignarCss=1\n\n', 0, 0, ''),
(28, 'Banners Claro', '', 0, 'bannerbody', 62, '2011-07-12 20:40:08', 1, 'mod_banners_claro', 0, 0, 0, 'cid=1\n\n', 0, 0, ''),
(29, 'Claro List', '', 4, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_list', 0, 0, 0, 'clase=list\nasignarCss=1\n\n', 0, 0, ''),
(32, 'Menú superior', '', 0, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_menu_superior', 0, 0, 0, 'menid=test\n\n', 0, 0, ''),
(30, 'Claro Headings', '', 0, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=Headings-List\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx= headings menu_heading\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(33, 'Claro Game Search', '', 5, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_gsearch', 0, 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Volcar la base de datos para la tabla `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 0, 1, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_polls`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_sections`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('admin', '1310685173', '09f1eaf5be87c7bff146cc1380571534', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:22:"session.client.browser";s:103:"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.14) Gecko/20110221 Ubuntu/10.04 (lucid) Firefox/3.6.14";s:15:"session.counter";i:38;s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:4:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}s:9:"com_menus";a:1:{s:4:"data";O:8:"stdClass":1:{s:8:"menutype";s:4:"test";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:27:"dbac@telefoniaguatemala.com";s:8:"password";s:65:"ce6b590f42497ecf66875a804b988fbc:lTc5pJ2aplQPeHbCVqf3GxscE9QfOq7Y";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2011-06-27 18:23:55";s:13:"lastvisitDate";s:19:"2011-07-14 19:15:57";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"d312dde50480e8b4c7d5dfd474d874cc";s:19:"session.timer.start";i:1310675362;s:18:"session.timer.last";i:1310685169;s:17:"session.timer.now";i:1310685173;}'),
('', '1310685609', '435277a5a45a4bf5d832f8e2fe29dc82', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:3;s:19:"session.timer.start";i:1310685574;s:18:"session.timer.last";i:1310685590;s:17:"session.timer.now";i:1310685609;s:22:"session.client.browser";s:103:"Mozilla/5.0 (X11; U; Linux i686; es-AR; rv:1.9.2.16) Gecko/20110323 Ubuntu/10.04 (lucid) Firefox/3.6.16";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"641ddebbd09b5d83ce745487239542e7";}'),
('', '1310683728', '3a9c09e9b397a7bf563b67b4cdfd8446', 1, 0, '', 0, 0, '__default|a:8:{s:15:"session.counter";i:15;s:19:"session.timer.start";i:1310681013;s:18:"session.timer.last";i:1310683721;s:17:"session.timer.now";i:1310683728;s:22:"session.client.browser";s:137:"Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.30 (KHTML, like Gecko) Ubuntu/11.04 Chromium/12.0.742.112 Chrome/12.0.742.112 Safari/534.30";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:16:"com_mailto.links";a:1:{s:40:"0566902e4e1be8e0ca937bab932324da81d1a31d";O:8:"stdClass":2:{s:4:"link";s:104:"http://www.telefoniaguatemala.com/clarogames/index.php?option=com_content&view=article&id=1:tdd&Itemid=8";s:6:"expiry";i:1310683728;}}}'),
('', '1310682856', '276a468b22156b83a58f92d4aa6fb924', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1310682854;s:18:"session.timer.last";i:1310682854;s:17:"session.timer.now";i:1310682854;s:22:"session.client.browser";s:137:"Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.30 (KHTML, like Gecko) Ubuntu/11.04 Chromium/12.0.742.112 Chrome/12.0.742.112 Safari/534.30";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"3ea1d8b7b5d69b5ea054cba83cb19250";}'),
('admin', '1310686312', 'f9cf444f6b6c503f157697bab73c35d5', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:28;s:19:"session.timer.start";i:1310682854;s:18:"session.timer.last";i:1310686271;s:17:"session.timer.now";i:1310686312;s:22:"session.client.browser";s:137:"Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.30 (KHTML, like Gecko) Ubuntu/11.04 Chromium/12.0.742.112 Chrome/12.0.742.112 Safari/534.30";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:4:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":3:{s:20:"com_claroformssearch";s:0:"";s:26:"com_claroformsfilter_order";s:6:"idGame";s:30:"com_claroformsfilter_order_Dir";s:3:"ASC";}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}s:6:"global";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";s:2:"20";}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:27:"dbac@telefoniaguatemala.com";s:8:"password";s:65:"ce6b590f42497ecf66875a804b988fbc:lTc5pJ2aplQPeHbCVqf3GxscE9QfOq7Y";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2011-06-27 18:23:55";s:13:"lastvisitDate";s:19:"2011-07-14 20:29:22";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"3ea1d8b7b5d69b5ea054cba83cb19250";}'),
('', '1310685570', 'f3dc15d64b36850447fc136206d2aad0', 1, 0, '', 0, 0, '__default|a:7:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1310685570;s:18:"session.timer.last";i:1310685570;s:17:"session.timer.now";i:1310685570;s:22:"session.client.browser";s:103:"Mozilla/5.0 (X11; U; Linux i686; es-AR; rv:1.9.2.16) Gecko/20110323 Ubuntu/10.04 (lucid) Firefox/3.6.16";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:77:"/home/telefoni/public_html/clarogames/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('beez', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Volcar la base de datos para la tabla `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'dbac@telefoniaguatemala.com', 'ce6b590f42497ecf66875a804b988fbc:lTc5pJ2aplQPeHbCVqf3GxscE9QfOq7Y', 'Super Administrator', 0, 1, 25, '2011-06-27 18:23:55', '2011-07-14 22:34:16', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(70, 'Tpp Desarrollador', 'tppgnkq', 'app+44ihvavotb.2qudmpk359.0ae4d01a2c568ebd39eb3e311b7b12ba@proxymail.facebook.com', '1e9d026af2bfa0f935523e6e6cafc30e:fO7TmDwMOhJ1vZkQHWvNdyVOu6wFSVeq', 'Registered', 0, 0, 18, '2011-07-07 17:45:19', '2011-07-07 17:45:19', '', '\n'),
(66, 'Willber Barrios', 'willbereugl', 'w2501@hotmail.com', 'ed7502b93322b6157a6be0a12ab5349f:mLJz84oSRgV7yzDmLG4a6DNWjJWrQJPA', 'Registered', 0, 0, 18, '2011-07-04 20:27:12', '2011-07-04 20:27:12', '', '\n'),
(67, 'Tegua PirataNet', 'teguagibw', 'diebevares@hotmail.es', '8a58d441790f4c5678c2bc3633fc38c9:3VLPC9VubeYZAlkCWNYfPrTnDZappkNx', 'Registered', 0, 0, 18, '2011-07-04 20:29:34', '2011-07-04 20:29:34', '', '\n'),
(71, 'David Bac', 'davidq3te', 'davidbac0910@yahoo.com', '2a96688e17a21c3b2771fc10350700b3:kg3H2WLb8Z4HVPD6LqcWRY1SHL5XZXdI', 'Registered', 0, 0, 18, '2011-07-08 18:36:54', '2011-07-12 20:34:09', '', '\n'),
(72, 'Guillermo Psychopsia', 'guillermohv0j', 'nopticon@gmail.com', '18d34fada98f754d7310cb64c2a37314:JQn4PERyVTEq2y7yrO5Wt3Dt2YyHNk9b', 'Registered', 0, 0, 18, '2011-07-11 18:21:47', '2011-07-12 18:37:08', '', '\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jos_weblinks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merchant`
--

CREATE TABLE IF NOT EXISTS `merchant` (
  `idMerchant` int(11) NOT NULL,
  `name` varchar(45) default NULL,
  `address` varchar(45) default NULL,
  `phone` varchar(45) default NULL,
  PRIMARY KEY  (`idMerchant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `merchant`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `idStatus` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`idStatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `status`
--

INSERT INTO `status` (`idStatus`, `name`) VALUES
(1, 'Activo'),
(2, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeGift`
--

CREATE TABLE IF NOT EXISTS `typeGift` (
  `idTypeGift` int(11) NOT NULL,
  `name` varchar(45) default NULL,
  `idMerchant` int(11) NOT NULL,
  PRIMARY KEY  (`idTypeGift`),
  KEY `fk_typeGift_merchant` (`idMerchant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `typeGift`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uploaded_files`
--

CREATE TABLE IF NOT EXISTS `uploaded_files` (
  `file_id` int(11) NOT NULL auto_increment,
  `file_category_id` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `webpath` varchar(200) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `mime_type` varchar(45) NOT NULL,
  `file_size` double NOT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY  (`file_id`),
  KEY `file_category_id` (`file_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `uploaded_files`
--

INSERT INTO `uploaded_files` (`file_id`, `file_category_id`, `path`, `webpath`, `file_name`, `mime_type`, `file_size`, `upload_time`) VALUES
(1, 1, '', 'http://www.telefoniaguatemala.com/clarogames/games/duck.jpg', 'Duck Flash', 'flash/x-stream', 10.26, '2011-07-07 16:07:15'),
(2, 2, '', 'http://www.telefoniaguatemala.com/clarogames/games/duck-preview.jpg', '', 'image/jpeg', 0, '2011-07-13 11:39:01'),
(3, 3, '', 'http://www.telefoniaguatemala.com/clarogames/games/duck-thumbnail.jpg', '', '', 0, '2011-07-13 11:39:38'),
(4, 1, '', 'http://www.telefoniaguatemala.com/clarogames/games/mario.jpg', '', '', 0, '2011-07-13 11:53:30'),
(5, 2, '', 'http://www.telefoniaguatemala.com/clarogames/games/mario-thumbnail.jpg', '', '', 0, '2011-07-13 11:54:07'),
(6, 3, '', 'http://www.telefoniaguatemala.com/clarogames/games/mario-thumbnail.jpg', '', '', 0, '2011-07-13 11:54:22'),
(7, 1, '', 'http://www.telefoniaguatemala.com/clarogames/games/farm.jpg', '', '', 0, '2011-07-13 12:00:42'),
(8, 2, '', 'http://www.telefoniaguatemala.com/clarogames/games/farm-preview.jpg', '', '', 0, '2011-07-13 12:01:03'),
(9, 3, '', 'http://www.telefoniaguatemala.com/clarogames/games/farm-thumbnail.jpg', '', '', 0, '2011-07-13 12:01:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userFB`
--

CREATE TABLE IF NOT EXISTS `userFB` (
  `uid` int(100) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) default NULL,
  `mobilePhone` varchar(100) default NULL,
  `email` varchar(255) NOT NULL,
  `birthday` date default NULL,
  `cedulaDpi` varchar(255) default NULL,
  `facebookId` varchar(100) default NULL,
  `gender` varchar(100) default NULL,
  `address` varchar(255) default NULL,
  `homePhone` varchar(100) default NULL,
  `maritalStatus` varchar(100) default NULL,
  `verified` int(11) default NULL,
  `website` varchar(100) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `userFB`
--

INSERT INTO `userFB` (`uid`, `firstName`, `lastName`, `mobilePhone`, `email`, `birthday`, `cedulaDpi`, `facebookId`, `gender`, `address`, `homePhone`, `maritalStatus`, `verified`, `website`) VALUES
(2147483647, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `fk_banner_bannerCategory` FOREIGN KEY (`idBannerCategory`) REFERENCES `bannerCategory` (`idBannerCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_banner_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bannerCategory`
--
ALTER TABLE `bannerCategory`
  ADD CONSTRAINT `fk_bannerCategory_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bannerGame`
--
ALTER TABLE `bannerGame`
  ADD CONSTRAINT `fk_bannerGame_game` FOREIGN KEY (`game_idGame`) REFERENCES `game` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bannerGame_banner` FOREIGN KEY (`Idbanner`) REFERENCES `banner` (`Idbanner`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bannerGame_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoryContent`
--
ALTER TABLE `categoryContent`
  ADD CONSTRAINT `fk_categoryContent_status` FOREIGN KEY (`status_idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_content_categoryContent` FOREIGN KEY (`idCategoryContent`) REFERENCES `categoryContent` (`idCategoryContent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_content_status` FOREIGN KEY (`status_idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_content_game` FOREIGN KEY (`idGame`) REFERENCES `game` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_file_flash` FOREIGN KEY (`idFileFlash`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_file_preview` FOREIGN KEY (`idFilePreview`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_file_thumbnail` FOREIGN KEY (`idFileThumbnail`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gameDetails`
--
ALTER TABLE `gameDetails`
  ADD CONSTRAINT `fk_gameDetails_gamesUserFb` FOREIGN KEY (`idGame`, `uid`) REFERENCES `gamesUserFb` (`game_idGame`, `userFB_uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameDetails_gift` FOREIGN KEY (`idGift`) REFERENCES `gift` (`idGift`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gamePlayFriend`
--
ALTER TABLE `gamePlayFriend`
  ADD CONSTRAINT `fk_friend_userFB` FOREIGN KEY (`uid`) REFERENCES `userFB` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_friend_userFBC` FOREIGN KEY (`uidFriend`) REFERENCES `userFB` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_friend_gameDetails` FOREIGN KEY (`gameDetails_idGameDetails`) REFERENCES `gameDetails` (`idGameDetails`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamePlayFriend_avatars` FOREIGN KEY (`idAvatars`) REFERENCES `avatars` (`idAvatars`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gamesUserFb`
--
ALTER TABLE `gamesUserFb`
  ADD CONSTRAINT `fk_gamesUserFb_game` FOREIGN KEY (`game_idGame`) REFERENCES `game` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamesUserFb_userFB` FOREIGN KEY (`userFB_uid`) REFERENCES `userFB` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamesUserFb_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamesUserFb_gift` FOREIGN KEY (`idGift`) REFERENCES `gift` (`idGift`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gift`
--
ALTER TABLE `gift`
  ADD CONSTRAINT `fk_gift_typeGift` FOREIGN KEY (`idTypeGift`) REFERENCES `typeGift` (`idTypeGift`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `typeGift`
--
ALTER TABLE `typeGift`
  ADD CONSTRAINT `fk_typeGift_merchant` FOREIGN KEY (`idMerchant`) REFERENCES `merchant` (`idMerchant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `uploaded_files_ibfk_10` FOREIGN KEY (`file_category_id`) REFERENCES `file_category` (`file_category_id`);
