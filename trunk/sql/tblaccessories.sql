/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : confor

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-06-24 13:40:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tblaccessories`
-- ----------------------------
DROP TABLE IF EXISTS `tblaccessories`;
CREATE TABLE `tblaccessories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ElementName` varchar(50) DEFAULT NULL,
  `ElementContent` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblaccessories
-- ----------------------------
INSERT INTO `tblaccessories` VALUES ('1', 'About', '<p>&nbsp;Hello Confor.ca</p>');
INSERT INTO `tblaccessories` VALUES ('2', 'How', null);
INSERT INTO `tblaccessories` VALUES ('3', 'Rules', null);
INSERT INTO `tblaccessories` VALUES ('4', 'Training', null);
