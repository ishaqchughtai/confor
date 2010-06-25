/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : confor

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-06-24 08:51:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `videos`
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `vid_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `converted` enum('0','1') NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `viewed` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`vid_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('100000', '12', 'abc1', 'xxxx', '1', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100001', '12', 'abc2', 'xxxx', '2', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100002', '12', 'abc3', 'xxxx', '3', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100003', '12', 'abc4', 'xxxx', '4', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100004', '12', 'abc5', 'xxxx', '2', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100005', '12', 'abc6', 'xxxx', '2', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
INSERT INTO `videos` VALUES ('100006', '12', 'abc7', 'xxxx', '2', '|aaaa|', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', '87/0b/c7/870bc725b8e76c7', '', '0', '0', '0', '1277174807', '0', '0', '0', '0', '0');
