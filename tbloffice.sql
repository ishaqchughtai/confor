/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2010-07-16 19:47:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbloffice`
-- ----------------------------
DROP TABLE IF EXISTS `tbloffice`;
CREATE TABLE `tbloffice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `lang` char(4) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbloffice
-- ----------------------------
INSERT INTO `tbloffice` VALUES ('6', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('2', 'hehehe', 'chang co noi dung gi dau ma vao xem', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('3', 'title tieng phap154545', '<p>noi dung cui mia</p>', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('4', 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('5', 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'en');
INSERT INTO `tbloffice` VALUES ('7', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('8', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr');
INSERT INTO `tbloffice` VALUES ('9', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'en');
INSERT INTO `tbloffice` VALUES ('10', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'en');
