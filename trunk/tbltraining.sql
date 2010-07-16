/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-07-16 19:47:49
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbltraining`
-- ----------------------------
DROP TABLE IF EXISTS `tbltraining`;
CREATE TABLE `tbltraining` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Content` text NOT NULL,
  `Lang` char(4) NOT NULL DEFAULT 'fr',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltraining
-- ----------------------------
INSERT INTO `tbltraining` VALUES ('3', 'Test French 1', '2010-07-16', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('2', 'Test English', '2010-07-15', 'Test English', 'en');
INSERT INTO `tbltraining` VALUES ('4', 'Test French 2', '2010-07-15', 'Test French 2', 'fr');
INSERT INTO `tbltraining` VALUES ('5', 'Test French 3', '2010-07-16', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('6', 'Test French 4', '2010-07-16', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('7', 'Test French 5', '2010-07-15', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('8', 'Test French 6', '2010-07-15', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('9', 'Test French 7', '2010-07-16', 'Test French', 'fr');
INSERT INTO `tbltraining` VALUES ('10', 'Test French 8', '2010-07-16', 'Test French', 'fr');
