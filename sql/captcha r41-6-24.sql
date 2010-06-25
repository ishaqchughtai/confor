/*
MySQL Data Transfer
Source Host: localhost
Source Database: xemmex
Target Host: localhost
Target Database: xemmex
Date: 25/06/2010 8:51:03 SA
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for captcha
-- ----------------------------
CREATE TABLE `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL auto_increment,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY  (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
