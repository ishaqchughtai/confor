/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-08-05 01:02:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tblspamemail`
-- ----------------------------
DROP TABLE IF EXISTS `tblspamemail`;
CREATE TABLE `tblspamemail` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblspamemail
-- ----------------------------
INSERT INTO `tblspamemail` VALUES ('1', 'huunam09@email.com');
INSERT INTO `tblspamemail` VALUES ('4', 'test@email.com');
INSERT INTO `tblspamemail` VALUES ('6', 'sac@gmail.com');
INSERT INTO `tblspamemail` VALUES ('7', 'sac@gmail.com.vn');
INSERT INTO `tblspamemail` VALUES ('8', 'sac@gmail.com.us');
INSERT INTO `tblspamemail` VALUES ('9', 'sac@gmail.com');
