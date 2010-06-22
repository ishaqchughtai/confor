/*
MySQL Data Transfer
Source Host: localhost
Source Database: confor
Target Host: localhost
Target Database: confor
Date: 22/06/2010 7:46:20 CH
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for activity
-- ----------------------------
CREATE TABLE `activity` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `action` tinyint(3) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `details` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_mail
-- ----------------------------
CREATE TABLE `admin_mail` (
  `mes_id` bigint(20) unsigned NOT NULL auto_increment,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `recipients` text NOT NULL,
  PRIMARY KEY  (`mes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_session
-- ----------------------------
CREATE TABLE `admin_session` (
  `ses_id` varchar(250) NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for associations
-- ----------------------------
CREATE TABLE `associations` (
  `assoc_type` enum('auth','form','menu','task') NOT NULL,
  `page` varchar(50) NOT NULL,
  `association` varchar(50) NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `assoc_type` (`assoc_type`,`page`,`association`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
CREATE TABLE `banners` (
  `ban_id` bigint(20) unsigned NOT NULL auto_increment,
  `cmp_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `format` tinyint(4) NOT NULL,
  `type` enum('external','static','rich') NOT NULL,
  `primary_file` varchar(250) NOT NULL,
  `secondary_file` varchar(250) NOT NULL,
  `tag` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `areas` varchar(250) NOT NULL,
  `pages` text NOT NULL,
  `countries` text NOT NULL,
  `video_categories` text NOT NULL,
  `group_categories` text NOT NULL,
  `impressions` bigint(20) unsigned NOT NULL,
  `clicks` bigint(20) unsigned NOT NULL,
  `last_shown` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`ban_id`),
  KEY `cmp_id` (`cmp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for billing
-- ----------------------------
CREATE TABLE `billing` (
  `ord_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`ord_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bookmarks
-- ----------------------------
CREATE TABLE `bookmarks` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bulletins
-- ----------------------------
CREATE TABLE `bulletins` (
  `bul_id` bigint(20) unsigned NOT NULL auto_increment,
  `from` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`bul_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for campaigns
-- ----------------------------
CREATE TABLE `campaigns` (
  `cmp_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  `theme` varchar(250) NOT NULL,
  `type` enum('external','ppc','impressions','subscription') NOT NULL,
  `price` double NOT NULL,
  `currency` char(10) NOT NULL,
  `credit` double NOT NULL,
  `start` bigint(20) unsigned NOT NULL,
  `end` bigint(20) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`cmp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for code
-- ----------------------------
CREATE TABLE `code` (
  `ip` char(15) NOT NULL,
  `code` char(6) NOT NULL,
  `try` tinyint(3) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for channel_comments
-- ----------------------------
CREATE TABLE `channel_comments` (
  `com_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `from` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`com_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
CREATE TABLE `channels` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `comments` tinyint(4) NOT NULL default '1',
  `comment_allow` tinyint(4) NOT NULL default '1',
  `bulletins` tinyint(4) NOT NULL default '1',
  `featured` varchar(250) NOT NULL,
  `colors` text NOT NULL,
  `bcg` varchar(250) NOT NULL,
  `boxes` varchar(250) NOT NULL,
  `videos` varchar(250) NOT NULL,
  `favorites` varchar(250) NOT NULL,
  `playlists` varchar(250) NOT NULL,
  `views` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
CREATE TABLE `email_templates` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for geo_countries
-- ----------------------------
CREATE TABLE `geo_countries` (
  `con_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY  (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group_forum
-- ----------------------------
CREATE TABLE `group_forum` (
  `pst_id` bigint(20) unsigned NOT NULL auto_increment,
  `reply_to` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`pst_id`),
  KEY `mem_id` (`mem_id`),
  KEY `grp_id` (`grp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group_members
-- ----------------------------
CREATE TABLE `group_members` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `grp_id` (`grp_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group_videos
-- ----------------------------
CREATE TABLE `group_videos` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  UNIQUE KEY `grp_id` (`grp_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
CREATE TABLE `groups` (
  `grp_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `tags` varchar(250) NOT NULL,
  `privacy` tinyint(3) unsigned NOT NULL,
  `videos` tinyint(3) unsigned NOT NULL,
  `forum` tinyint(3) unsigned NOT NULL,
  `icon` bigint(20) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `viewed` bigint(20) unsigned NOT NULL,
  `featured` enum('0','1') NOT NULL,
  `folder` varchar(250) NOT NULL,
  PRIMARY KEY  (`grp_id`),
  UNIQUE KEY `folder` (`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ignores
-- ----------------------------
CREATE TABLE `ignores` (
  `ign_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`ign_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for invitations
-- ----------------------------
CREATE TABLE `invitations` (
  `inv_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `email` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `stat` enum('p','j','f') NOT NULL default 'p',
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `pla_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(250) NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `inv_id` (`inv_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for javascripts
-- ----------------------------
CREATE TABLE `javascripts` (
  `page` varchar(50) NOT NULL,
  `onload` text NOT NULL,
  `code` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mailbox
-- ----------------------------
CREATE TABLE `mailbox` (
  `mes_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `mailbox` enum('inbox','shared','invites','comments','responses','groups','sent') NOT NULL default 'inbox',
  `viewed` enum('0','1') NOT NULL default '0',
  `special` varchar(250) NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`mes_id`),
  KEY `mem_id` (`mem_id`),
  KEY `per_id` (`per_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mass_mail
-- ----------------------------
CREATE TABLE `mass_mail` (
  `mail_id` bigint(20) unsigned NOT NULL auto_increment,
  `to` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `headers` varchar(250) NOT NULL,
  PRIMARY KEY  (`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for members
-- ----------------------------
CREATE TABLE `members` (
  `mem_id` bigint(20) unsigned NOT NULL auto_increment,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `verified` enum('0','1') NOT NULL default '0',
  `banned` enum('0','1') NOT NULL default '0',
  `membership` tinyint(4) NOT NULL default '0',
  `access_end` bigint(20) NOT NULL,
  `member_type` enum('a','m','u') NOT NULL default 'u',
  `diskspace` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for members_settings
-- ----------------------------
CREATE TABLE `members_settings` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `hide_location` enum('0','1') NOT NULL default '0',
  `hide_gender` enum('0','1') NOT NULL default '0',
  `hide_age` enum('0','1') NOT NULL default '0',
  `hide_status` enum('0','1') NOT NULL default '0',
  `notifications` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for memberships
-- ----------------------------
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `free` tinyint(1) NOT NULL default '0',
  `public` tinyint(1) NOT NULL default '1',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_session
-- ----------------------------
CREATE TABLE `mod_session` (
  `ses_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for moderators
-- ----------------------------
CREATE TABLE `moderators` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `access` text NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for network
-- ----------------------------
CREATE TABLE `network` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `friends` text NOT NULL,
  `friends_count` bigint(20) unsigned NOT NULL,
  `update` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
CREATE TABLE `newsletter` (
  `let_id` bigint(20) unsigned NOT NULL auto_increment,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `forced` enum('0','1') NOT NULL default '0',
  `send_to` bigint(20) unsigned NOT NULL,
  `complete` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`let_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
CREATE TABLE `orders` (
  `ord_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `refunded` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`ord_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment_gateway
-- ----------------------------
CREATE TABLE `payment_gateway` (
  `order_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` tinyint(3) unsigned NOT NULL,
  `order_name` varchar(250) NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) default NULL,
  `recurrent` enum('0','1') default NULL,
  `last_paid` bigint(20) unsigned NOT NULL,
  `next_payment` bigint(20) unsigned NOT NULL,
  `period` char(30) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `status` enum('pending','paid') default NULL,
  `now` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`order_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=334456778 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payments
-- ----------------------------
CREATE TABLE `payments` (
  `id` int(11) NOT NULL auto_increment,
  `txn_id` varchar(100) default NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate_amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for playlist_videos
-- ----------------------------
CREATE TABLE `playlist_videos` (
  `pla_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `main` enum('0','1') NOT NULL default '0',
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `pla_id` (`pla_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playlists
-- ----------------------------
CREATE TABLE `playlists` (
  `pla_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(250) NOT NULL,
  `privacy` tinyint(3) unsigned NOT NULL,
  `embedding` tinyint(3) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`pla_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for private_access
-- ----------------------------
CREATE TABLE `private_access` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`type`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
CREATE TABLE `profiles` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `joined` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `last_visit` bigint(20) unsigned NOT NULL,
  `last_click` bigint(20) unsigned NOT NULL,
  `country` int(10) unsigned NOT NULL,
  `city` varchar(250) NOT NULL,
  `hometown` varchar(250) NOT NULL,
  `zip` varchar(250) NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `birthdate` bigint(20) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `avatar_approved` enum('0','1') NOT NULL default '0',
  `website` varchar(250) NOT NULL,
  `about_me` text NOT NULL,
  `d_status` tinyint(4) NOT NULL,
  `occupations` varchar(250) NOT NULL,
  `companies` varchar(250) NOT NULL,
  `schools` varchar(250) NOT NULL,
  `interests` text NOT NULL,
  `movies` text NOT NULL,
  `music` text NOT NULL,
  `books` text NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rates
-- ----------------------------
CREATE TABLE `rates` (
  `id` int(11) NOT NULL auto_increment,
  `membership_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `amount` varchar(255) NOT NULL,
  `term` bigint(255) NOT NULL,
  `term_c` varchar(1) NOT NULL,
  `automatic` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for reports
-- ----------------------------
CREATE TABLE `reports` (
  `rep_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `report` enum('spam','mature','mis-categorized','copyright') NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `special` varchar(250) NOT NULL,
  PRIMARY KEY  (`rep_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sessiondata
-- ----------------------------
CREATE TABLE `sessiondata` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `saved` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
CREATE TABLE `settings` (
  `site_name` varchar(100) NOT NULL,
  `site_slogan` varchar(100) NOT NULL,
  `site_url` varchar(100) NOT NULL,
  `keywords` text NOT NULL,
  `desc` text NOT NULL,
  `site_email` varchar(100) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `sandbox` tinyint(1) NOT NULL,
  `reg_verify` tinyint(1) NOT NULL default '0',
  `reg_allowed` tinyint(1) NOT NULL default '1',
  `user_limit` varchar(5) NOT NULL default '0',
  `currency` varchar(3) NOT NULL,
  `cur_symbol` varchar(5) NOT NULL,
  `captcha` tinyint(1) NOT NULL default '1',
  `version` varchar(5) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for social_bookmarking_engines
-- ----------------------------
CREATE TABLE `social_bookmarking_engines` (
  `eng_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `enabled` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`eng_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `sub_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` enum('channel','playlist') NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sub_id` (`sub_id`,`mem_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tags_cache
-- ----------------------------
CREATE TABLE `tags_cache` (
  `type` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `weight` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbladmin
-- ----------------------------
CREATE TABLE `tbladmin` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PayPalAccount` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Right` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbladvertisement
-- ----------------------------
CREATE TABLE `tbladvertisement` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `DateBeginning` date NOT NULL,
  `DateExpiry` date NOT NULL,
  `AdvertiserName` varchar(50) NOT NULL,
  `AdvertiserEmail` varchar(50) NOT NULL,
  `URL` text NOT NULL,
  `TextTips` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblblog
-- ----------------------------
CREATE TABLE `tblblog` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Author` int(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(200) NOT NULL,
  `Text` text NOT NULL,
  `Link` varchar(200) NOT NULL,
  `CountView` int(11) unsigned default NULL,
  `CountComment` int(11) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblblog_tbladmin` (`Author`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblcategory
-- ----------------------------
CREATE TABLE `tblcategory` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(70) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblcomment
-- ----------------------------
CREATE TABLE `tblcomment` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Comment` text NOT NULL,
  `Blog` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Website` varchar(200) default NULL,
  `Email` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblcomment_tblblog` (`Blog`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblevent
-- ----------------------------
CREATE TABLE `tblevent` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` char(4) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Speaker` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblfeedback
-- ----------------------------
CREATE TABLE `tblfeedback` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Date` text NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Message` text NOT NULL,
  `Ticket` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblfeedback_tbladmin` (`Admin`),
  KEY `FK_tblfeedback_tblticket` (`Ticket`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblremember_me
-- ----------------------------
CREATE TABLE `tblremember_me` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(16) character set latin1 collate latin1_general_cs default NULL,
  `usernamehash` varchar(128) default NULL,
  `random_string` varchar(128) default NULL,
  `origin_time` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblspeaker
-- ----------------------------
CREATE TABLE `tblspeaker` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `CompanyName` varchar(50) default NULL,
  `Email` varchar(50) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Language` varchar(10) default 'en',
  `Password` varchar(50) NOT NULL,
  `Description` text,
  `Subscription` int(10) unsigned NOT NULL,
  `Suspend` tinyint(1) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Subscription` (`Subscription`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblsubscription
-- ----------------------------
CREATE TABLE `tblsubscription` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `SubcriptionDate` date default NULL,
  `SubscriptionType` int(10) unsigned default NULL,
  `SubscriptionExpiration` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SubscriptionType` (`SubscriptionType`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblsubscriptiontype
-- ----------------------------
CREATE TABLE `tblsubscriptiontype` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `TypeName` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblticket
-- ----------------------------
CREATE TABLE `tblticket` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Date` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Message` text NOT NULL,
  `Speaker` int(11) default NULL,
  `Is_answered` tinyint(1) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblticket_tblspeaker` (`Speaker`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblvideoconference
-- ----------------------------
CREATE TABLE `tblvideoconference` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Viewed` int(11) unsigned NOT NULL,
  `Upload` tinyint(1) NOT NULL,
  `Recording` tinyint(1) NOT NULL,
  `VideoLink` varchar(200) NOT NULL,
  `Ticket` int(11) default NULL,
  `Speaker` int(11) unsigned NOT NULL,
  `ImagesLink` varchar(200) default NULL,
  `Category` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Ticket` (`Ticket`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tips
-- ----------------------------
CREATE TABLE `tips` (
  `page` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `membership_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(50) default NULL,
  `company_name` varchar(100) default NULL,
  `country` varchar(50) default NULL,
  `password` varchar(255) NOT NULL,
  `cookie_id` varchar(100) NOT NULL default '0',
  `token` varchar(100) NOT NULL default '0',
  `register_date` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_access` datetime NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `userlevel` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users_copy
-- ----------------------------
CREATE TABLE `users_copy` (
  `id` int(11) NOT NULL auto_increment,
  `membership_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(50) default NULL,
  `company_name` varchar(100) default NULL,
  `country` varchar(50) default NULL,
  `password` varchar(255) NOT NULL,
  `cookie_id` varchar(100) NOT NULL default '0',
  `token` varchar(100) NOT NULL default '0',
  `register_date` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_access` datetime NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `userlevel` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for verification
-- ----------------------------
CREATE TABLE `verification` (
  `val` char(6) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `inv_id` char(40) NOT NULL,
  UNIQUE KEY `val` (`val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_comment_votes
-- ----------------------------
CREATE TABLE `video_comment_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `com_id` bigint(20) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_comments
-- ----------------------------
CREATE TABLE `video_comments` (
  `com_id` bigint(20) unsigned NOT NULL auto_increment,
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `reply_to` bigint(20) unsigned NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  `rating` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`com_id`),
  KEY `vid_id` (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_convert
-- ----------------------------
CREATE TABLE `video_convert` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `hash` varchar(100) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `tstamp` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_responses
-- ----------------------------
CREATE TABLE `video_responses` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `response_to` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  `posted` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`response_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_votes
-- ----------------------------
CREATE TABLE `video_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `rate` tinyint(3) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_watch
-- ----------------------------
CREATE TABLE `video_watch` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `expire` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
CREATE TABLE `videos` (
  `vid_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `category` bigint(20) unsigned NOT NULL,
  `tags` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `country` int(10) unsigned NOT NULL,
  `location` varchar(250) NOT NULL,
  `broadcast` tinyint(3) unsigned NOT NULL,
  `comments` tinyint(3) unsigned NOT NULL,
  `comment_voting` tinyint(3) unsigned NOT NULL,
  `responses` tinyint(3) unsigned NOT NULL,
  `ratings` tinyint(3) unsigned NOT NULL,
  `embedding` tinyint(3) unsigned NOT NULL,
  `vhash` varchar(250) NOT NULL,
  `shash` varchar(250) NOT NULL,
  `length` bigint(20) unsigned NOT NULL,
  `rating` bigint(20) unsigned NOT NULL,
  `votes` bigint(20) unsigned NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `screenshot` tinyint(3) unsigned NOT NULL,
  `converted` enum('0','1') NOT NULL default '0',
  `featured` enum('0','1') NOT NULL default '0',
  `approved` enum('0','1') NOT NULL default '0',
  `viewed` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`vid_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for viewkeys
-- ----------------------------
CREATE TABLE `viewkeys` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `viewkey` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `viewkey` (`viewkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for get speaker by id
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get speaker by id` AS select `tblspeaker`.`Email` AS `Email`,`tblspeaker`.`ID` AS `ID`,`tblsubscriptiontype`.`TypeName` AS `TypeName` from ((`tblspeaker` join `tblsubscription` on((`tblspeaker`.`Subscription` = `tblsubscription`.`ID`))) join `tblsubscriptiontype` on((`tblsubscription`.`SubscriptionType` = `tblsubscriptiontype`.`ID`))) order by `tblspeaker`.`ID` limit 2,4;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin_session` VALUES ('482932f4c78636f89f4fe3c14489f725', '1277195290');
INSERT INTO `associations` VALUES ('auth', 'account', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'billing', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_browse', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_design', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_info', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_share_win', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'delete', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invitations', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invite', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invite_report', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_add_videos', 'auth_group_action_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_add_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_browse', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_create', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_discussions', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_discussions', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_edit', 'auth_group_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_invite', 'auth_group_action_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_invite', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_manage', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_videos', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_view_discussion', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_view_discussion', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'ignores', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'join', 'auth_join', 'default');
INSERT INTO `associations` VALUES ('auth', 'join_options', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_comments', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_groups', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_invites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_message', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_responses', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_sent', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_shared', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_view', 'auth_view_message', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_create', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_modify', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_modify', 'auth_playlist_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_share_win', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_view', 'auth_playlist_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlist_edit', 'auth_playlist_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'search', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'subscriptions', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'upgrade', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_activity', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_edit', 'auth_video_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_manage', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_respond', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_respond', 'auth_video_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload_complete', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload_general', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_view', 'auth_video_access', 'default');
INSERT INTO `associations` VALUES ('form', 'about', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_change_email', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_change_password', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_info', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_personal', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_settings', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'advertise', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'billing', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'channel_bulletin', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'channel_comment', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_browse', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'channel_boxes', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'channel_style', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_favorites', 'channel_favorites', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_info', 'channel_info', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_info', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_videos', 'channel_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_share_win', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_share_win', 'share_channel', 'default');
INSERT INTO `associations` VALUES ('form', 'delete', 'delete', 'default');
INSERT INTO `associations` VALUES ('form', 'delete', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'forgot', 'forgot', 'default');
INSERT INTO `associations` VALUES ('form', 'forgot', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends', 'friends', 'default');
INSERT INTO `associations` VALUES ('form', 'friends', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invitations', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite', 'invite', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite_report', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_add_videos', 'group_add_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_add_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_browse', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_create', 'group_create', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_create', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_discussions', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_discussions', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_approve_topics', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_approve_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_members', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_topics', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_remove', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_invite', 'group_invite', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_invite', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_manage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_view_discussion', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_view_discussion', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'help', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'homepage', 'login', 'default');
INSERT INTO `associations` VALUES ('form', 'homepage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'ignores', 'ignores', 'default');
INSERT INTO `associations` VALUES ('form', 'ignores', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'join', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'login', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_options', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_verification', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_verification', 'verification', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_comments', 'comments', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_comments', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_groups', 'groups', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_groups', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_invites', 'invites', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_invites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_message', 'message', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_message', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_responses', 'responses', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_responses', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_sent', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_sent', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_shared', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_shared', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_view', 'message_view', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_view', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_create', 'playlist_create', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_create', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_edit', 'playlist_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_modify', 'playlist_arrange', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_modify', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_share_win', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_share_win', 'share_playlist', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_view', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'privacy', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'rss', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'search', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'subscriptions', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'terms', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'upgrade', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'upgrade', 'upgrade', 'default');
INSERT INTO `associations` VALUES ('form', 'videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_edit', 'video_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_manage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_respond', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_respond', 'video_response', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload', 'video_upload', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_complete', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_general', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_general', 'video_upload_general', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'comment', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'comment_embed', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'search', 'default');
INSERT INTO `associations` VALUES ('menu', 'about', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'about', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'advertise', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'advertise', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'membership', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'channel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'channel_connect', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'subchannels', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'delete', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'delete', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'forgot', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'forgot', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_add_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_add_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'subgroups', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_create', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_create', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_discussions', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_discussions', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'groupmanage', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_invite', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_invite', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'mygroups', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_view_discussion', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_view_discussion', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'help', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'help', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'membership', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_options', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_options', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_verification', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_verification', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_view', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'privacy', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'privacy', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'rss', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'rss', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'search', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'search', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'terms', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'terms', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'upgrade', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'upgrade', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'subvideos', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_respond', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_respond', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_complete', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_complete', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_general', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_general', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_view', 'top', 'default');
INSERT INTO `associations` VALUES ('task', 'billing', 'channels|billing', 'default');
INSERT INTO `associations` VALUES ('task', 'channels', 'channels|channel_view', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_browse', 'channels|channels_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_browse', 'channels|channels_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_design', 'channels|channel_design', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_favorites', 'channels|channel_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_favorites', 'channels|channel_my_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_info', 'channels|channel_info', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_videos', 'channels|channel_my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_videos', 'channels|channel_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'favorites', 'favorites|my_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'friends', 'friends|my_friends', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_favorites', 'friends|my_friends_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_invitations', 'friends|my_invitations', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_videos', 'friends|my_friends_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups', 'groups|group_view', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|group_pro', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|my_group_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|my_group_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_browse', 'groups|groups_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_browse', 'groups|groups_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_discussions', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_discussions', 'groups|group_discussions', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_edit', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_edit', 'groups|group_edit', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_invite', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_manage', 'groups|my_groups', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_videos', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_videos', 'groups|group_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_view_discussion', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_view_discussion', 'groups|group_discussion', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'channels|membership', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'videos|videos_homepage_boxes', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'videos|videos_statistics', 'default');
INSERT INTO `associations` VALUES ('task', 'ignores', 'channels|ignores', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox', 'mailbox|mailbox_inbox', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_comments', 'mailbox|mailbox_comments', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_groups', 'mailbox|mailbox_groups', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_invites', 'mailbox|mailbox_invites', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_message', 'mailbox|mailbox_message', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_responses', 'mailbox|mailbox_responses', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_sent', 'mailbox|mailbox_sent', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_shared', 'mailbox|mailbox_shared', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_view', 'mailbox|mailbox_view', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists', 'playlists|my_playlists', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists_modify', 'playlists|playlist_modify', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists_view', 'playlists|playlist_view', 'default');
INSERT INTO `associations` VALUES ('task', 'search', 'videos|videos_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'subscriptions', 'subscriptions|my_subscriptions', 'default');
INSERT INTO `associations` VALUES ('task', 'videos', 'videos|videos_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'videos', 'videos|videos_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'channels|membership', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|friend_activity', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|videos_homepage_boxes', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|videos_statistics', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_edit', 'videos|video_screenshots', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_manage', 'videos|my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_respond', 'videos|my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_respond', 'videos|vidinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_upload_complete', 'videos|vidinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_view', 'videos|video_view', 'default');
INSERT INTO `channels` VALUES ('100000', '1', 'admin', '', '1', '1', '1', '', 'grey', '', 'box_featured,box_subscriptions,box_bulletins,box_videos,box_favorites,box_friends,box_comments', '', '', '', '0');
INSERT INTO `email_templates` VALUES ('1', 'Registration Email', 'Please verify your email', 'Welcome [USERNAME]! Thanks for registering.\r\n---------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n---------------------------------------------------\r\n\r\nThe administrator of this site has requested all new accounts\r\nto be activated by the users who created them thus your account\r\nis currently inactive. To activate your account,\r\nplease visit this link:\r\n[LINK]\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('2', 'Forgot Password Email', 'Password Reset', 'New password reset from [SITE_NAME]!\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello, [USERNAME]\r\n\r\nIt seems that you or someone requested a new password for you.\r\n\r\nWe have generated a new password, as requested:\r\n\r\nYour new password: [PASSWORD]\r\n\r\n\r\nTo use the new password you need to activate it. To do this click the link provided below and login with your new password.\r\n[LINK]\r\n\r\nYou can change your password after you sign in.\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nPassword requested from IP: [IP]');
INSERT INTO `email_templates` VALUES ('3', 'Welcome Mail From Admin', 'You have been registered', 'Welcome [NAME]! Thanks for registering.\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('4', 'Default Newsletter', 'Newsletter', 'Hello,\r\n[USERNAME]\r\nYou are receiving this email as a part of your newsletter subscription\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHere goes your newsletter content\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n---------------------------------------------------------------------------------------------------------\r\nTo stop receiving future newsletters please login into your account\r\nand uncheck newsletter subscription box.');
INSERT INTO `email_templates` VALUES ('5', 'Transaction Completed', 'Payment from payPal', 'Hello, Admin\r\n\r\nYou have received new PayPal payment following:\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nUsername: [USERNAME]\r\nItem: [ITEMNAME]\r\nPrice: [PRICE]\r\n\r\nStatus: [STATUS] \r\n\r\n---------------------------------------------------------------------------------------------------------\r\nYou can view this transaction from [URL]');
INSERT INTO `email_templates` VALUES ('6', 'Transaction Suspicious', 'Suspicious Transaction', 'Hello, Admin\r\n----------------------------------------------------------\r\nThe following transaction has been disabled due to suspicious activity:\r\n\r\nBuyer: [USERNAME]\r\nItem: [ITEM]\r\nPrice: [PRICE]\r\nStatus: [STATUS]\r\n\r\n----------------------------------------------------------\r\nPlease verify this transaction is correct. If it is, please activate it in the transaction section of your site\'s \r\nadministration control panel. If not, it appears that someone tried to fraudulently obtain products from your site.');
INSERT INTO `geo_countries` VALUES ('1', 'Antarctica');
INSERT INTO `geo_countries` VALUES ('2', 'Argentina');
INSERT INTO `geo_countries` VALUES ('3', 'Falkland Islands');
INSERT INTO `geo_countries` VALUES ('4', 'Chile');
INSERT INTO `geo_countries` VALUES ('5', 'French Southern Territories');
INSERT INTO `geo_countries` VALUES ('6', 'New Zealand');
INSERT INTO `geo_countries` VALUES ('7', 'Saint Helena');
INSERT INTO `geo_countries` VALUES ('8', 'Uruguay');
INSERT INTO `geo_countries` VALUES ('9', 'South Africa');
INSERT INTO `geo_countries` VALUES ('10', 'Brazil');
INSERT INTO `geo_countries` VALUES ('11', 'Lesotho');
INSERT INTO `geo_countries` VALUES ('12', 'Namibia');
INSERT INTO `geo_countries` VALUES ('13', 'French Polynesia');
INSERT INTO `geo_countries` VALUES ('14', 'Paraguay');
INSERT INTO `geo_countries` VALUES ('15', 'Swaziland');
INSERT INTO `geo_countries` VALUES ('16', 'Smaller Territories of Chile');
INSERT INTO `geo_countries` VALUES ('17', 'Botswana');
INSERT INTO `geo_countries` VALUES ('18', 'Mozambique');
INSERT INTO `geo_countries` VALUES ('19', 'Madagascar');
INSERT INTO `geo_countries` VALUES ('20', 'Smaller Territories of the UK');
INSERT INTO `geo_countries` VALUES ('21', 'Bolivia');
INSERT INTO `geo_countries` VALUES ('22', 'New Caledonia');
INSERT INTO `geo_countries` VALUES ('23', 'Zimbabwe');
INSERT INTO `geo_countries` VALUES ('24', 'Cook Islands');
INSERT INTO `geo_countries` VALUES ('25', 'Reunion');
INSERT INTO `geo_countries` VALUES ('26', 'Tonga');
INSERT INTO `geo_countries` VALUES ('27', 'Mauritius');
INSERT INTO `geo_countries` VALUES ('28', 'Vanuatu');
INSERT INTO `geo_countries` VALUES ('29', 'Fiji Islands');
INSERT INTO `geo_countries` VALUES ('30', 'Peru');
INSERT INTO `geo_countries` VALUES ('31', 'Zambia');
INSERT INTO `geo_countries` VALUES ('32', 'Angola');
INSERT INTO `geo_countries` VALUES ('33', 'Malawi');
INSERT INTO `geo_countries` VALUES ('34', 'American Samoa');
INSERT INTO `geo_countries` VALUES ('35', 'Wallis and Futuna');
INSERT INTO `geo_countries` VALUES ('36', 'Samoa');
INSERT INTO `geo_countries` VALUES ('37', 'Mayotte');
INSERT INTO `geo_countries` VALUES ('38', 'Comoros');
INSERT INTO `geo_countries` VALUES ('39', 'External Territories of Australia');
INSERT INTO `geo_countries` VALUES ('40', 'Congo (Dem. Rep.)');
INSERT INTO `geo_countries` VALUES ('41', 'Solomon Islands');
INSERT INTO `geo_countries` VALUES ('42', 'Tanzania');
INSERT INTO `geo_countries` VALUES ('43', 'Papua New Guinea');
INSERT INTO `geo_countries` VALUES ('44', 'Indonesia');
INSERT INTO `geo_countries` VALUES ('45', 'Tokelau');
INSERT INTO `geo_countries` VALUES ('46', 'Tuvalu');
INSERT INTO `geo_countries` VALUES ('47', 'East Timor');
INSERT INTO `geo_countries` VALUES ('48', 'Congo');
INSERT INTO `geo_countries` VALUES ('49', 'Kenya');
INSERT INTO `geo_countries` VALUES ('50', 'Ecuador');
INSERT INTO `geo_countries` VALUES ('51', 'Colombia');
INSERT INTO `geo_countries` VALUES ('52', 'Burundi');
INSERT INTO `geo_countries` VALUES ('53', 'Gabon');
INSERT INTO `geo_countries` VALUES ('54', 'Kiribati');
INSERT INTO `geo_countries` VALUES ('55', 'Rwanda');
INSERT INTO `geo_countries` VALUES ('56', 'Equatorial Guinea');
INSERT INTO `geo_countries` VALUES ('57', 'Uganda');
INSERT INTO `geo_countries` VALUES ('58', 'Somalia');
INSERT INTO `geo_countries` VALUES ('59', 'Maldives');
INSERT INTO `geo_countries` VALUES ('60', 'Nauru');
INSERT INTO `geo_countries` VALUES ('61', 'São Tomé and Príncipe');
INSERT INTO `geo_countries` VALUES ('62', 'Malaysia');
INSERT INTO `geo_countries` VALUES ('63', 'Cameroon');
INSERT INTO `geo_countries` VALUES ('64', 'Palau');
INSERT INTO `geo_countries` VALUES ('65', 'French Guiana');
INSERT INTO `geo_countries` VALUES ('66', 'Guyana');
INSERT INTO `geo_countries` VALUES ('67', 'Central African Republic');
INSERT INTO `geo_countries` VALUES ('68', 'Ethiopia');
INSERT INTO `geo_countries` VALUES ('69', 'Micronesia');
INSERT INTO `geo_countries` VALUES ('70', 'Sudan');
INSERT INTO `geo_countries` VALUES ('71', 'Nigeria');
INSERT INTO `geo_countries` VALUES ('72', 'Liberia');
INSERT INTO `geo_countries` VALUES ('73', 'Ivory Coast');
INSERT INTO `geo_countries` VALUES ('74', 'Brunei');
INSERT INTO `geo_countries` VALUES ('75', 'Marshall Islands');
INSERT INTO `geo_countries` VALUES ('76', 'Philippines');
INSERT INTO `geo_countries` VALUES ('77', 'Ghana');
INSERT INTO `geo_countries` VALUES ('78', 'Suriname');
INSERT INTO `geo_countries` VALUES ('79', 'Venezuela');
INSERT INTO `geo_countries` VALUES ('80', 'Thailand');
INSERT INTO `geo_countries` VALUES ('81', 'Sri Lanka');
INSERT INTO `geo_countries` VALUES ('82', 'Togo');
INSERT INTO `geo_countries` VALUES ('83', 'Benin');
INSERT INTO `geo_countries` VALUES ('84', 'Sierra Leone');
INSERT INTO `geo_countries` VALUES ('85', 'Panama');
INSERT INTO `geo_countries` VALUES ('86', 'Guinea');
INSERT INTO `geo_countries` VALUES ('87', 'Chad');
INSERT INTO `geo_countries` VALUES ('88', 'India');
INSERT INTO `geo_countries` VALUES ('89', 'Costa Rica');
INSERT INTO `geo_countries` VALUES ('90', 'Vietnam');
INSERT INTO `geo_countries` VALUES ('91', 'Burkina Faso');
INSERT INTO `geo_countries` VALUES ('92', 'Trinidad and Tobago');
INSERT INTO `geo_countries` VALUES ('93', 'Cambodia');
INSERT INTO `geo_countries` VALUES ('94', 'Nicaragua');
INSERT INTO `geo_countries` VALUES ('95', 'Mali');
INSERT INTO `geo_countries` VALUES ('96', 'Djibouti');
INSERT INTO `geo_countries` VALUES ('97', 'Guinea-Bissau');
INSERT INTO `geo_countries` VALUES ('98', 'Niger');
INSERT INTO `geo_countries` VALUES ('99', 'Grenada');
INSERT INTO `geo_countries` VALUES ('100', 'Netherlands Antilles');
INSERT INTO `geo_countries` VALUES ('101', 'Myanmar');
INSERT INTO `geo_countries` VALUES ('102', 'Senegal');
INSERT INTO `geo_countries` VALUES ('103', 'Yemen');
INSERT INTO `geo_countries` VALUES ('104', 'Saint Vincent and The Grenadines');
INSERT INTO `geo_countries` VALUES ('105', 'Eritrea');
INSERT INTO `geo_countries` VALUES ('106', 'Barbados');
INSERT INTO `geo_countries` VALUES ('107', 'Honduras');
INSERT INTO `geo_countries` VALUES ('108', 'Gambia');
INSERT INTO `geo_countries` VALUES ('109', 'El Salvador');
INSERT INTO `geo_countries` VALUES ('110', 'Guam');
INSERT INTO `geo_countries` VALUES ('111', 'Saint Lucia');
INSERT INTO `geo_countries` VALUES ('112', 'Guatemala');
INSERT INTO `geo_countries` VALUES ('113', 'Northern Mariana Islands');
INSERT INTO `geo_countries` VALUES ('114', 'Martinique');
INSERT INTO `geo_countries` VALUES ('115', 'Mexico');
INSERT INTO `geo_countries` VALUES ('116', 'Cape Verde');
INSERT INTO `geo_countries` VALUES ('117', 'Laos');
INSERT INTO `geo_countries` VALUES ('118', 'Mauritania');
INSERT INTO `geo_countries` VALUES ('119', 'Dominica');
INSERT INTO `geo_countries` VALUES ('120', 'Guadeloupe');
INSERT INTO `geo_countries` VALUES ('121', 'Belize');
INSERT INTO `geo_countries` VALUES ('122', 'Saudi Arabia');
INSERT INTO `geo_countries` VALUES ('123', 'Oman');
INSERT INTO `geo_countries` VALUES ('124', 'Antigua and Barbuda');
INSERT INTO `geo_countries` VALUES ('125', 'Saint Kitts and Nevis');
INSERT INTO `geo_countries` VALUES ('126', 'Virgin Islands of the United States');
INSERT INTO `geo_countries` VALUES ('127', 'Jamaica');
INSERT INTO `geo_countries` VALUES ('128', 'Dominican Republic');
INSERT INTO `geo_countries` VALUES ('129', 'Puerto Rico');
INSERT INTO `geo_countries` VALUES ('130', 'Haiti');
INSERT INTO `geo_countries` VALUES ('131', 'China');
INSERT INTO `geo_countries` VALUES ('132', 'British Virgin Islands');
INSERT INTO `geo_countries` VALUES ('133', 'Cayman Islands');
INSERT INTO `geo_countries` VALUES ('134', 'Algeria');
INSERT INTO `geo_countries` VALUES ('135', 'Cuba');
INSERT INTO `geo_countries` VALUES ('136', 'Bangladesh');
INSERT INTO `geo_countries` VALUES ('137', 'Bahamas');
INSERT INTO `geo_countries` VALUES ('138', 'Turks and Caicos Islands');
INSERT INTO `geo_countries` VALUES ('139', 'Taiwan');
INSERT INTO `geo_countries` VALUES ('140', 'Western Sahara');
INSERT INTO `geo_countries` VALUES ('141', 'Egypt');
INSERT INTO `geo_countries` VALUES ('142', 'Pakistan');
INSERT INTO `geo_countries` VALUES ('143', 'Libya');
INSERT INTO `geo_countries` VALUES ('144', 'United Arab Emirates');
INSERT INTO `geo_countries` VALUES ('145', 'Japan');
INSERT INTO `geo_countries` VALUES ('146', 'Qatar');
INSERT INTO `geo_countries` VALUES ('147', 'Iran');
INSERT INTO `geo_countries` VALUES ('148', 'Bahrain');
INSERT INTO `geo_countries` VALUES ('149', 'Nepal');
INSERT INTO `geo_countries` VALUES ('150', 'Bhutan');
INSERT INTO `geo_countries` VALUES ('151', 'Spain');
INSERT INTO `geo_countries` VALUES ('152', 'Morocco');
INSERT INTO `geo_countries` VALUES ('153', 'Kuwait');
INSERT INTO `geo_countries` VALUES ('154', 'Jordan');
INSERT INTO `geo_countries` VALUES ('155', 'Israel');
INSERT INTO `geo_countries` VALUES ('156', 'Iraq');
INSERT INTO `geo_countries` VALUES ('157', 'Afghanistan');
INSERT INTO `geo_countries` VALUES ('158', 'Palestine');
INSERT INTO `geo_countries` VALUES ('159', 'Tunisia');
INSERT INTO `geo_countries` VALUES ('160', 'Bermuda');
INSERT INTO `geo_countries` VALUES ('161', 'Syria');
INSERT INTO `geo_countries` VALUES ('162', 'Portugal');
INSERT INTO `geo_countries` VALUES ('163', 'Lebanon');
INSERT INTO `geo_countries` VALUES ('164', 'Korea (South)');
INSERT INTO `geo_countries` VALUES ('165', 'Cyprus');
INSERT INTO `geo_countries` VALUES ('166', 'Greece');
INSERT INTO `geo_countries` VALUES ('167', 'Malta');
INSERT INTO `geo_countries` VALUES ('168', 'Turkey');
INSERT INTO `geo_countries` VALUES ('169', 'Italy');
INSERT INTO `geo_countries` VALUES ('170', 'Uzbekistan');
INSERT INTO `geo_countries` VALUES ('171', 'Tajikistan');
INSERT INTO `geo_countries` VALUES ('172', 'Turkmenistan');
INSERT INTO `geo_countries` VALUES ('173', 'Korea (North)');
INSERT INTO `geo_countries` VALUES ('174', 'Azerbaijan');
INSERT INTO `geo_countries` VALUES ('175', 'Armenia');
INSERT INTO `geo_countries` VALUES ('176', 'Albania');
INSERT INTO `geo_countries` VALUES ('177', 'Kyrgyzstan');
INSERT INTO `geo_countries` VALUES ('178', 'Kazakhstan');
INSERT INTO `geo_countries` VALUES ('179', 'Macedonia');
INSERT INTO `geo_countries` VALUES ('180', 'Georgia');
INSERT INTO `geo_countries` VALUES ('181', 'Russia');
INSERT INTO `geo_countries` VALUES ('182', 'France');
INSERT INTO `geo_countries` VALUES ('183', 'Bulgaria');
INSERT INTO `geo_countries` VALUES ('184', 'Serbia and Montenegro');
INSERT INTO `geo_countries` VALUES ('185', 'Andorra');
INSERT INTO `geo_countries` VALUES ('186', 'Croatia');
INSERT INTO `geo_countries` VALUES ('187', 'Bosnia and Herzegovina');
INSERT INTO `geo_countries` VALUES ('188', 'Mongolia');
INSERT INTO `geo_countries` VALUES ('189', 'Romania');
INSERT INTO `geo_countries` VALUES ('190', 'Monaco');
INSERT INTO `geo_countries` VALUES ('191', 'San Marino');
INSERT INTO `geo_countries` VALUES ('192', 'Ukraine');
INSERT INTO `geo_countries` VALUES ('193', 'Slovenia');
INSERT INTO `geo_countries` VALUES ('194', 'Moldova');
INSERT INTO `geo_countries` VALUES ('195', 'Hungary');
INSERT INTO `geo_countries` VALUES ('196', 'Switzerland');
INSERT INTO `geo_countries` VALUES ('197', 'Austria');
INSERT INTO `geo_countries` VALUES ('198', 'Saint Pierre and Miquelon');
INSERT INTO `geo_countries` VALUES ('199', 'Liechtenstein');
INSERT INTO `geo_countries` VALUES ('200', 'Germany');
INSERT INTO `geo_countries` VALUES ('201', 'Slovakia');
INSERT INTO `geo_countries` VALUES ('202', 'Czech Republic');
INSERT INTO `geo_countries` VALUES ('203', 'Jersey');
INSERT INTO `geo_countries` VALUES ('204', 'Poland');
INSERT INTO `geo_countries` VALUES ('205', 'Guernsey and Alderney');
INSERT INTO `geo_countries` VALUES ('206', 'Luxembourg');
INSERT INTO `geo_countries` VALUES ('207', 'Belgium');
INSERT INTO `geo_countries` VALUES ('208', 'Netherlands');
INSERT INTO `geo_countries` VALUES ('209', 'Ireland');
INSERT INTO `geo_countries` VALUES ('210', 'Belarus');
INSERT INTO `geo_countries` VALUES ('211', 'Lithuania');
INSERT INTO `geo_countries` VALUES ('212', 'Isle of Man');
INSERT INTO `geo_countries` VALUES ('213', 'Denmark');
INSERT INTO `geo_countries` VALUES ('214', 'Sweden');
INSERT INTO `geo_countries` VALUES ('215', 'Latvia');
INSERT INTO `geo_countries` VALUES ('216', 'Estonia');
INSERT INTO `geo_countries` VALUES ('217', 'Norway');
INSERT INTO `geo_countries` VALUES ('218', 'Finland');
INSERT INTO `geo_countries` VALUES ('219', 'Greenland');
INSERT INTO `geo_countries` VALUES ('220', 'Faroe Islands');
INSERT INTO `geo_countries` VALUES ('221', 'Iceland');
INSERT INTO `geo_countries` VALUES ('222', 'Svalbard and Jan Mayen');
INSERT INTO `geo_countries` VALUES ('223', 'United States');
INSERT INTO `geo_countries` VALUES ('224', 'Canada');
INSERT INTO `geo_countries` VALUES ('225', 'United Kingdom');
INSERT INTO `geo_countries` VALUES ('226', 'Australia');
INSERT INTO `javascripts` VALUES ('all', '', '<script src=\"::URL::/js/CH_ThumbsPreview.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_browse', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_design', '', '<script src=\"::URL::/js/CH_ChannelDesign.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_favorites', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelEdit.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_videos', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelEdit.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('groups_edit', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('groups_invite', '', '<script src=\"::URL::/js/CH_GroupInvite.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('homepage', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_HomePage.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_comments', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_groups', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_invites', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_responses', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_sent', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_shared', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('playlists_view', '', '<script src=\"::URL::/js/CH_PlaylistView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('search', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('subscriptions', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Subscriptions.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos_respond', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos_view', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_VideoView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('', '', '', 'default');
INSERT INTO `members` VALUES ('100000', '', 'admin', 'ac48ec59d616758e95e63b08a1689240', 'Nguyen', 'Hai Dang', '1', '0', '0', '0', 'a', '0');
INSERT INTO `members_settings` VALUES ('100000', '0', '0', '0', '0', '1');
INSERT INTO `memberships` VALUES ('1', 'Bronzes free', 'Bronzes free', '1', '1', '1');
INSERT INTO `memberships` VALUES ('2', 'Super Membership', 'This is super membership', '1', '1', '1');
INSERT INTO `memberships` VALUES ('3', 'Silver', 'Silver', '1', '1', '1');
INSERT INTO `memberships` VALUES ('4', 'Bronze', 'Bronze', '1', '1', '1');
INSERT INTO `memberships` VALUES ('5', 'Gold', 'Gold', '0', '1', '1');
INSERT INTO `network` VALUES ('100000', ',', '0', '0');
INSERT INTO `payments` VALUES ('1', null, '2', '1', '2', '0.99', '2010-03-02 12:10:14', '1');
INSERT INTO `profiles` VALUES ('100000', '1277174436', '1277174690', '1277188865', '1277188865', '90', 'Ha Noi', '', '', '1', '416250059', '', '0', '', '', '0', '', '', '', '', '', '', '', '1');
INSERT INTO `rates` VALUES ('1', '2', 'Weekly', 'Weekly access to protected areas', '0.99', '1', 'W', '1');
INSERT INTO `rates` VALUES ('2', '2', 'Monthly', 'Monthly access to protected areas', '1.99', '1', 'M', '1');
INSERT INTO `rates` VALUES ('3', '2', 'Yearly', 'Yearly access to protected areas', '10.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('4', '3', 'Full', 'Unlimited access to protected areas', '19.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('10', '5', 'monthly', 'monthly gold', '50', '30', 'D', '1');
INSERT INTO `rates` VALUES ('11', '4', 'year', 'year bronzes', '500', '1', 'Y', '1');
INSERT INTO `sessiondata` VALUES ('1', '100000', 'a%3A17%3A%7Bs%3A11%3A%22response_to%22%3Bs%3A0%3A%22%22%3Bs%3A5%3A%22title%22%3Bs%3A3%3A%22abc%22%3Bs%3A11%3A%22description%22%3Bs%3A4%3A%22xxxx%22%3Bs%3A8%3A%22category%22%3Bs%3A2%3A%2215%22%3Bs%3A4%3A%22tags%22%3Bs%3A4%3A%22aaaa%22%3Bs%3A4%3A%22date%22%3Bi%3A1230742859%3Bs%3A8%3A%22location%22%3Bs%3A2%3A%22ad%22%3Bs%3A7%3A%22country%22%3Bs%3A3%3A%22223%22%3Bs%3A9%3A%22broadcast%22%3Bs%3A1%3A%220%22%3Bs%3A8%3A%22comments%22%3Bs%3A1%3A%221%22%3Bs%3A14%3A%22comment_voting%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22responses%22%3Bs%3A1%3A%221%22%3Bs%3A7%3A%22ratings%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22embedding%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22err_page%22%3Bs%3A6%3A%22videos%22%3Bs%3A11%3A%22err_section%22%3Bs%3A14%3A%22upload_general%22%3Bs%3A6%3A%22source%22%3Bs%3A6%3A%22upload%22%3B%7D', '1277174767');
INSERT INTO `settings` VALUES ('Your Site Name', 'Your Site Name Slogan', 'http://localhost/project/confor/pay', 'site keywords,separated,by,coma', 'Meta Description', 'yoursite@email.com', 'paypal@youremail.com', '1', '1', '1', '0', 'USD', '$', '1', 'v.1.0');
INSERT INTO `social_bookmarking_engines` VALUES ('1', 'Favorites', 'sbAddtoFavorites(\'|link|\',\'|title|\')', 'star.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('2', 'Del.icio.us', 'http://del.icio.us/post?url=|link|;title=|title|', 'delicious.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('3', 'Digg', 'http://digg.com/submit?phase=2&url=|link|&title=|title|', 'digg.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('4', 'Furl', 'http://www.furl.net/storeIt.jsp?u=|link|&t=|title|', 'furl.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('5', 'Magnolia', 'http://ma.gnolia.com/bookmarklet/add?url=|link|&title=|title|', 'magnolia.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('6', 'StumbleUpon', 'http://www.stumbleupon.com/submit?url=|link|&title=|title|', 'stumbleupon.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('7', 'Google', 'http://www.google.com/bookmarks/mark?op=edit&bkmk=|link|&title=|title|', 'google.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('8', 'Yahoo', 'http://myweb2.search.yahoo.com/myresults/bookmarklet?t=|title|&u=|link|', 'yahoo.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('9', 'Technorati', 'http://technorati.com/faves?add=|link|', 'technorati.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('10', 'BlinkList', 'http://www.blinklist.com/index.php?Action=Blink/addblink.php&Url=|link|&Title=|title|', 'blinklist.png', '1');
INSERT INTO `tags_cache` VALUES ('videos', '', '', '1277174694');
INSERT INTO `tbladmin` VALUES ('9', 'Quyet', 'Dao Van', 'daovanquyet@xemmex.net', 'daovanquyet@paypal.com', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tbladmin` VALUES ('8', 'admin', 'admin', 'admin@confor.ca', 'admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `tbladvertisement` VALUES ('1', '2010-06-14', '2010-06-21', 'dang the cuong', 'cuongdt90@gmail.com', 'http://vnexpress.net/GL/Home/', 'Donec quam felis, ultricies nec, pellentesque eu, ', 'cuu_vui_ve_va_soi_xam16.jpg');
INSERT INTO `tbladvertisement` VALUES ('26', '2010-06-16', '2010-06-30', 'nguyen van a', 'abcd@yahoo.com', 'http://abc.com', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam14.jpg');
INSERT INTO `tbladvertisement` VALUES ('25', '2010-06-16', '2010-06-16', 'NGUYEN HAI DANG', 'a@yahoo.com', 'http://vnexpress.net/GL/Home/', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam15.jpg');
INSERT INTO `tbladvertisement` VALUES ('22', '2010-06-16', '2010-06-22', 'CUONG', 'abc@yahoo.com', 'http://dantri.com.vn/', 'Consequat massa quis enim. Donec pede justo, fring', 'cuu_vui_ve_va_soi_xam1.jpg');
INSERT INTO `tbladvertisement` VALUES ('23', '2010-06-16', '2010-06-22', 'avs', 'abcz@yahoo.com', 'http://dantri.com.vn/', 'Eequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam4.jpg');
INSERT INTO `tblblog` VALUES ('1', '2010-06-13', '8', 'new blog', 'new blog', 'asda', '<p><strong><em><u>asdasdasd</u></em></strong></p>\n<p>asdasdasdasd</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('2', '2010-06-13', '8', 'asdasd test', 'asdasdasd', 'asda', '<p>asdasd</p>', 'slider_2.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('3', '2010-06-13', '8', 'thu cai asdasd', 'asdasdasd', '1231', '<p>asdasd</p>', 'AudiLogo_1_.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('5', '2010-06-13', '8', 'asdqwe2', 'qwe', 'q2', '<p>wqqqqqqqqqqqqqqqqqqqqqq</p>', 'google_maps.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('7', '2010-06-13', '8', '321312', '1231231', '1231', '<p>123123qweqwe</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('8', '2010-06-16', '8', '213qweqwe', 'qweqweqwe', 'asdasdasd asdas asdasd sadasd', '<p>qweqweqweqweqweqwe</p>', 'Love-Is.jpg', '26', '2');
INSERT INTO `tblblog` VALUES ('9', '2010-06-13', '8', 'qweqweqweqwe', 'weqweqwe', 'qweq', '<p>qweqweqwe</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('13', '2010-06-13', '8', 'Blog ngay 13', 'asdasdasd', 'asda', '<p>asdasdasdasdasdasd</p>', 'Blue_hills.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('16', '2010-06-13', '8', '213qweqwe11', 'asdasdasd', '11 2', '<p>asdas</p>', 'google_maps.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('10', '2010-06-13', '8', 'new nhat', 'asdasdasd', 'asda', '<p>sdasdasdasd</p>', '650jma.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('11', '2010-06-13', '8', 'aw', 'qwe', 'qweq', '<p>qweqweqweqwe</p>', 'Sunset.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('12', '2010-06-13', '8', 'asdasdasdasdasdasdasd', 'asdas', 'asda', '<p>asdasdasdasd</p>', '650jma.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('14', '2010-06-13', '8', '213qweqwem', '112323123333333333333', '124', '<p>mkm</p>', '0-3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('15', '2010-06-13', '8', 'blog chieu', 'asdkak', 'asdk', '<p>sadasdasdasd</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('17', '2010-06-15', '8', 'blog toi 13 a', 'asdasd', 'asda', '<p>asdasdasd</p>', 'AudiLogo_1_.jpg', '23', '1');
INSERT INTO `tblblog` VALUES ('18', '2010-06-13', '8', 'need iphone', 'new blog', 'asdk', '<p>asdasdasdasd</p>', 'boeing-737-business-jet-model-plane_m.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('19', '2010-06-14', '8', 'test lan cuoi', 'asdasd', 'asda', '<p>asdasdasdas</p>', 'hubert.jpg', '3', '0');
INSERT INTO `tblblog` VALUES ('20', '2010-06-14', '8', 'thu id ', 'qweqwe', 'qweq', '<p>weqweqaw</p>', 'post_2.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('21', '2010-06-14', '8', 'thu id asd', 'asdasd', 'asda', '<p>asdasdasd</p>', 'post_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('22', '2010-06-14', '8', 'thu lai id ', 'asdasd', 'adas', '<p>adasdasda</p>', 'port_6.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('23', '2010-06-14', '8', 'chiu 24', 'qwe', 'qweq', '<p>sdfsdfsdf</p>', 'sponsor_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('31', '2010-06-15', '8', 'blog dem 15', 'new blog', 'asda', '<p>asdasd</p>', 'port_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('27', '2010-06-15', '8', 'blog toi 15', 'hekeka', 'asda', '<p>asdasd</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('28', '2010-06-15', '8', 'mkmmkkkkkkk', 'asdasdasd', 'asda', '<p>ghcvhc</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('29', '2010-06-15', '8', 'tessssssss', 'asdasdasd', 'asda', '<p>asdasd</p>', 'port_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('44', '2010-06-22', '8', 'blog dem 15 1', 'asdasdasd', 'asd asdas asda asda', '<p>abc <span style=\"font-size: xx-large;\"><span style=\"font-family: Comic Sans MS;\">def </span></span></p>', 'port_4.jpg', '6', '0');
INSERT INTO `tblblog` VALUES ('42', '2010-06-16', '8', 'blog chieu 16 1511', 'asdasd', 'asd asdas asda', '<p>asdasd</p>', 'google_maps.jpg', '8', '0');
INSERT INTO `tblblog` VALUES ('46', '2010-06-17', '8', 'nguoi viet', 'xxx', 'yyy', '<p><span style=\"font-size: xx-large;\"><span style=\"font-family: Arial;\"><span style=\"color: rgb(153, 204, 0);\">oap.</span></span></span> ac.</p>', 'pet.JPG', '87', '3');
INSERT INTO `tblcategory` VALUES ('1', 'Actuality');
INSERT INTO `tblcategory` VALUES ('2', 'Technology');
INSERT INTO `tblcategory` VALUES ('3', 'Interview');
INSERT INTO `tblcategory` VALUES ('4', 'Design');
INSERT INTO `tblcategory` VALUES ('5', 'Mobile');
INSERT INTO `tblcategory` VALUES ('6', 'Movies');
INSERT INTO `tblcomment` VALUES ('67', '11111111111111111', '8', '2010-06-16 04:06:52', 'xemmex new', 'http://asdasdasd.com', 'huunam09@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('66', 'ádasdasd', '8', '2010-06-16 02:06:41', 'admin', 'http://google.com', 'se7max@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('68', 'asdasd', '17', '2010-06-16 05:06:05', 'xemmex new', 'http://asdasdasd.com', 'huunam09@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('69', 'oh my god', '8', '2010-06-17 04:06:30', 'Dang', 'www.abc', 'yugi3000@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('70', 'oh my god', '8', '2010-06-17 04:06:04', 'Dang', 'www.abc', 'yugi3000@gmail.com', '0');
INSERT INTO `tblcomment` VALUES ('73', 'xxxxxxx', '46', '2010-06-17 06:06:15', 'toiotoi', 'oh oh', 'yugi3000@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('74', 'bbbbb', '46', '2010-06-17 06:06:14', 'meomeo', 'xsafsafaf', 'yugi3000@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('75', 'sasdfasfasfasf', '46', '2010-06-22 05:06:34', 'meomeo', 'dfsaf', 'yugi3000@gmail.com', '1');
INSERT INTO `tblevent` VALUES ('1', '2010-06-12', 'abc', 'haha', 'acbd', 'sdfr sfs fsa fasf', '1', '1');
INSERT INTO `tblevent` VALUES ('2', '2010-06-12', 'skjfh askfjh afkj shadfkj as', 'sdkj fhska fhskj dfskja dfh', 'hsdh', 's dkfhskdj fhakjs fhkjs dfhkjas hdfkja skhfj askjf hkjash fkj shkjf hksjahfakjsfh kajh fkajfh kjfh kj fhkjasfh kjsahf ksjhfskajfh', '2', '1');
INSERT INTO `tblevent` VALUES ('3', '2010-06-12', 'adjsk dkjs dsk sklfa slkf slkfjl', 'kldsjfasklf jaskldfjlasjflas ', 'skjd', 'kdslfjasf jaslkf jalk f', '1', '0');
INSERT INTO `tblevent` VALUES ('4', '2010-06-12', 'xyzww', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('5', '2010-06-12', 'fdfsd', 'fsfsafsa', 'ddsf', '<p>&nbsp;sdfas fasf<img src=\"http://localhost/confor/system/plugins/fckeditor/editor/images/smiley/msn/angry_smile.gif\" alt=\"\" /></p>', '2', '1');
INSERT INTO `tblevent` VALUES ('6', '2010-06-16', 'sadadasd', 'adsadada', 'adad', '<p>?asd ad ad ad ad a d?d</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('7', '2010-06-16', '7wqeqewqewqe', 'xyzwwsdqweq', 'qwqw', '<p>456sq qw e qqeq</p>\n<p>?</p>', '7', '1');
INSERT INTO `tblevent` VALUES ('8', '2010-06-17', ' skjfh askj fhaskjh fkjas f', 'sfsa fs fsfs fsfsa', 'sfds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a \"significant change\".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an \"independent public commission\" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', '1', '1');
INSERT INTO `tblevent` VALUES ('9', '2010-06-17', 'csdfsfs', 'sdfasfssd sdf sdf ', 'sdds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a \"significant change\".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an \"independent public commission\" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', '1', '1');
INSERT INTO `tblevent` VALUES ('21', '2010-06-18', 'oi con meo', 'con meo dien', 'a b', '<p>Sed vel urna neque, ut ornare lacus. Aenean pretium luctus elit, id dictum dolor varius quis. Morbi venenatis ante quis nunc vehicula pellentesque. Sed et elit eu metus porta egestas. Ut adipiscing dui at dolor lacinia eleifend. Sed et leo neque. Nullam placerat sagittis tristique. In sed cursus purus. Nulla.<br />\n&nbsp;</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('18', '2010-06-17', 'skjfh askj fhaskjh fkjas fssssdasd', 'adadadds?sasas', 'adaq', '<p>asda a ad ad asd asda ?&acirc; da da ?a ada adadadad </p>', '1', '1');
INSERT INTO `tblevent` VALUES ('19', '2010-06-18', 'oh oh oh yeah', 'mmmmm ac ac', 'sac', '<p><span style=\"font-size: xx-large;\"><span style=\"font-family: Verdana;\">sl <span style=\"color: rgb(153, 204, 0);\">fsld fslf sklf alf ald fasl</span>f dslf asf</span></span></p>\n<p><strong>daf alsf alf alf asfasfasf</strong></p>', '2', '1');
INSERT INTO `tblevent` VALUES ('22', '2010-06-18', '111111111111111111111', '2222222222222', '3333', '<p>4444444444444444444444444444444444</p>', '10', '1');
INSERT INTO `tblevent` VALUES ('23', '2010-06-18', 'xyz', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '7', '1');
INSERT INTO `tblfeedback` VALUES ('10', '2010-06-21 02:06:46', 'admin tra loi', 'asdasd', '2', '8');
INSERT INTO `tblfeedback` VALUES ('11', '2010-06-21 02:06:11', 'admin tra loi 1', 'weqweqw', '2', '8');
INSERT INTO `tblfeedback` VALUES ('12', '2010-06-21 03:06:24', 'admin tra loi 12', 'asdasdads', '2', '8');
INSERT INTO `tblfeedback` VALUES ('13', '2010-06-21 03:06:48', 'admin tra loi 12', 'asdasdads', '2', '8');
INSERT INTO `tblfeedback` VALUES ('14', '2010-06-21 03:06:30', 'admin tra loi', 'asdasdasdasdasdasdas', '2', '8');
INSERT INTO `tblfeedback` VALUES ('15', '2010-06-21 03:06:29', 'admin tra loi 12', 'asdasd', '15', '8');
INSERT INTO `tblfeedback` VALUES ('16', '2010-06-22 11:06:14', 'meo dien', 'cdl fdlf  sld dsl fsf sdoi a', '18', '8');
INSERT INTO `tblspeaker` VALUES ('1', 'Phong', 'Nguyen ', 'XEMMEX', 'abc@gmail.com', '1', 'fr', 'e10adc3949ba59abbe56e057f20f883e', 'bbb cccc dddd', '2', '0');
INSERT INTO `tblspeaker` VALUES ('2', 'abcxxx', 'Meo meo', 'xemmex', 'def@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'adf  asdf sdf', '2', null);
INSERT INTO `tblspeaker` VALUES ('3', '', 'adsafsfa', 'llllm', 'abc11@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'afaf', '1', null);
INSERT INTO `tblspeaker` VALUES ('4', '', 'asaa dafsf', 'kkkk', 'abc10@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'asfaf', '1', null);
INSERT INTO `tblspeaker` VALUES ('5', '', 'aabb ccdd', 'yyy', 'abc9@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'asfa', '1', null);
INSERT INTO `tblspeaker` VALUES ('6', '', 'eee fff ggg', 'hhhh', 'abc8@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'as', '1', null);
INSERT INTO `tblspeaker` VALUES ('7', 'daica', 'gg  adaf', 'gggg', 'abc7@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('8', '', 'sda asadfasf', 'ffff', 'abc6@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fa', '1', null);
INSERT INTO `tblspeaker` VALUES ('9', '', 'adfadf', 'eeee', 'abc5@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('10', '', 'adfa  afff', 'dddd', 'abc4@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('11', '', 'adf saaaa', 'cccc', 'abc3@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fd', '1', null);
INSERT INTO `tblspeaker` VALUES ('12', '', 'bbdddsaf', 'bbbb', 'abc2@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fdff', '1', null);
INSERT INTO `tblsubscription` VALUES ('1', '2010-06-07', '1', '2014-08-08');
INSERT INTO `tblsubscription` VALUES ('2', '2010-06-16', '2', '2010-07-10');
INSERT INTO `tblsubscription` VALUES ('3', null, '2', null);
INSERT INTO `tblsubscription` VALUES ('4', null, '3', null);
INSERT INTO `tblsubscription` VALUES ('5', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('6', null, '2', null);
INSERT INTO `tblsubscription` VALUES ('7', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('8', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('9', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('10', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('11', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('12', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('13', null, '1', null);
INSERT INTO `tblsubscriptiontype` VALUES ('1', 'level1');
INSERT INTO `tblsubscriptiontype` VALUES ('2', 'level2');
INSERT INTO `tblsubscriptiontype` VALUES ('3', 'level3');
INSERT INTO `tblsubscriptiontype` VALUES ('4', 'level4');
INSERT INTO `tblsubscriptiontype` VALUES ('5', 'level5');
INSERT INTO `tblticket` VALUES ('1', '2010-06-18 00:00:00', 'admin', '0', 'as', '2', '1');
INSERT INTO `tblticket` VALUES ('2', '2010-06-18 00:00:00', 'asdas', '0', 'asas', '2', '1');
INSERT INTO `tblticket` VALUES ('3', '2010-06-18 00:00:00', 'asdas', '0', '', '2', '0');
INSERT INTO `tblticket` VALUES ('4', '2010-06-18 00:00:00', 'asdasd', '0', '', '3', '0');
INSERT INTO `tblticket` VALUES ('5', '2010-06-18 00:00:00', 'admin', '0', '', '2', '0');
INSERT INTO `tblticket` VALUES ('6', '2010-06-18 00:00:00', 'admin', '0', 'asdasd\nasdasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('7', '2010-06-18 00:00:00', 'admin', '0', 'asdasdasd\nasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('8', '2010-06-18 00:00:00', 'admin', '0', 'asdasdasd\nasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('9', '2010-06-18 00:00:00', 'admin', '0', 'asdasdasd\nasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('10', '2010-06-19 00:00:00', 'hoi cai', '0', 'ádasdsad', '2', '1');
INSERT INTO `tblticket` VALUES ('11', '2010-06-19 00:00:00', 'hoi caia', '0', 'ádasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('12', '2010-06-19 00:00:00', 'hoi caiaaaa', '3', 'ádasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('13', '2010-06-19 00:00:00', 'hoi caiaaaa', '3', 'ádasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('15', '2010-06-21 02:06:43', 'ticket 21', '1', 'hoi ciasad ', '2', '1');
INSERT INTO `tblticket` VALUES ('16', '2010-06-21 02:06:44', 'test', '0', 'asdadsasdasd', '2', '0');
INSERT INTO `tblticket` VALUES ('18', '2010-06-22 11:06:26', 'Hoi admin ti', '2', 'what we kr l f dlf adslf', '1', '1');
INSERT INTO `tblticket` VALUES ('19', '2010-06-22 05:06:30', 'meo meo meo hoi ti', '1', 'asdoi oi con meo', '1', '0');
INSERT INTO `tblvideoconference` VALUES ('1', '2010-06-11 14:26:58', 'Bullshit', 'Bullshit', 'a', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '22', '1', '0', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.flv', '10', '1', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('3', '2010-06-16 09:05:51', 'YouTube - Funny Commercial', 'YouTube - Funny Commercial', 'a b c', 'YouTube - Funny Commercial', '2', '1', '0', 'YouTube - Funny Commercial(1).flv', '1', '3', 'YouTube - Funny Commercial.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('4', '2010-06-16 09:08:18', 'best, funniest commercial video', 'best, funniest commercial video', 'a b c d', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', '2', '1', '0', 'best, funniest commercial video.flv', '3', '3', 'best, funniest commercial video.jpg', '2');
INSERT INTO `tblvideoconference` VALUES ('5', '2010-06-16 09:10:40', 'funny Commercial', 'funny Commercial', 'a b c d e', 'funny Commercial', '2', '1', '0', 'funny Commercial.flv', '4', '4', 'funny Commercial.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('6', '2010-06-16 09:11:37', 'without brains', 'without brains', 'a b c d e f', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', '2', '1', '0', 'without brains.flv', '5', '5', 'without brains.jpg', '2');
INSERT INTO `tips` VALUES ('join_verification', 'You may receive your verification email to your junk mailbox.', 'default');
INSERT INTO `tips` VALUES ('upgrade', 'Upgrade your account to get full access to all categories and videos on this site!', 'default');
INSERT INTO `tips` VALUES ('videos_upload', 'Do not upload any TV shows, music videos, music concerts, or commercials without permission unless they consist entirely of content you created yourself.', 'default');
INSERT INTO `tips` VALUES ('videos_upload_complete', 'It may take up to several minutes before your video will be converted and published.', 'default');
INSERT INTO `tips` VALUES ('videos_upload_general', 'Uploads usually take 1-5 minutes per MB on a high-speed connection, and converting your video takes a few minutes.<br /><br /><strong>Your video is limited to ;module;videos;maxtime; minutes and ;module;videos;maxsize; MB.</strong>', 'default');
INSERT INTO `tips` VALUES ('', '', 'default');
INSERT INTO `users` VALUES ('1', '1', 'admin', 'admin@emailaddress.com', 'Webmaster', null, null, null, '21232f297a57a5a743894a0e4a801fc3', '0aea3a54307e553f35f7c5ca358b0b3b', '0', '2010-03-03 15:08:38', '127.0.0.1', '2010-06-22 16:09:34', '1', '1', '9');
INSERT INTO `users_copy` VALUES ('1', '1', 'admin', 'admin@emailaddress.com', 'Webmaster', null, null, null, '21232f297a57a5a743894a0e4a801fc3', '2caf514cf33dd0472169a4e46ece3569', '0', '2010-03-03 15:08:38', '127.0.0.1', '2010-06-22 00:54:51', '1', '1', '9');
INSERT INTO `video_convert` VALUES ('100000', '87/0b/c7/870bc725b8e76c7', '.mp4', '1277174807');
INSERT INTO `videos` VALUES ('100000', '100000', 'abc', 'xxxx', '15', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
