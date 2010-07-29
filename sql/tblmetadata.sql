/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2010-07-29 21:16:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tblmetadata`
-- ----------------------------
DROP TABLE IF EXISTS `tblmetadata`;
CREATE TABLE `tblmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `type_resource` varchar(100) NOT NULL,
  `id_resource` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmetadata
-- ----------------------------
INSERT INTO `tblmetadata` VALUES ('1', 'kjdash fkjashf', 'kjadsh fdkjashf', 'kdfsh dskajdfh ', 'ksjfh askjh f', 'event', '43');
INSERT INTO `tblmetadata` VALUES ('4', 'sad fsad fsfasf', 'yeu em nhieu lam', 'nguoi la noi cuoi con duongf', 'asda dasd as dada d', 'event', '42');
INSERT INTO `tblmetadata` VALUES ('5', 'sad fsad fsfasf', 'key word tieng anh', 'Conférence Commandant Piché-peur en avion123', 'asda dasd as dada d', 'office', '12');
