/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-07-27 18:27:09
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
  `Image` varchar(200) DEFAULT 'noimage.gif',
  `No` int(11) DEFAULT NULL,
  `No_temp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbloffice
-- ----------------------------
INSERT INTO `tbloffice` VALUES ('6', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', null, '2');
INSERT INTO `tbloffice` VALUES ('2', 'hehehe', 'chang co noi dung gi dau ma vao xem', '2010-07-16', 'fr', 'noimage.gif', null, '1');
INSERT INTO `tbloffice` VALUES ('3', 'title tieng phap154545', '<p>noi dung cui mia</p>', '2010-07-16', 'fr', 'noimage.gif', null, '4');
INSERT INTO `tbloffice` VALUES ('4', 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'fr', 'noimage.gif', null, '6');
INSERT INTO `tbloffice` VALUES ('7', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', null, '3');
INSERT INTO `tbloffice` VALUES ('8', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', null, '7');
INSERT INTO `tbloffice` VALUES ('9', 'Eng 2', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif', '1', null);
INSERT INTO `tbloffice` VALUES ('10', 'Eng 3', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif', '2', null);
INSERT INTO `tbloffice` VALUES ('11', 'title tieng phap154545', '<p>title tieng phap154545</p>', '2010-07-17', 'fr', 'noimage.gif', null, '5');
INSERT INTO `tbloffice` VALUES ('12', 'Eng 4', '<p>title tieng phap154545</p>', '2010-07-17', 'en', 'noimage.gif', '4', null);
INSERT INTO `tbloffice` VALUES ('13', 'Eng 5', '<p>title tieng phap154545</p>', '2010-07-17', 'en', 'noimage.gif', '5', null);
INSERT INTO `tbloffice` VALUES ('14', 'Eng 6', '<p>test new</p>', '2010-07-23', 'en', '6O5pKXd5hUPmcQ17.jpg', '3', null);
INSERT INTO `tbloffice` VALUES ('18', 'asdasdasd', '<p>asdasdasdasd</p>', '2010-07-27', 'en', 'noimage.gif', '6', null);

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
  `Image` varchar(200) DEFAULT 'noimage.gif',
  `No` int(10) unsigned DEFAULT NULL,
  `No_temp` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltraining
-- ----------------------------
INSERT INTO `tbltraining` VALUES ('1', 'test lan 2', '2010-07-25', '<p>tesssssssssssssssss</p>', 'en', null, '3', null);
INSERT INTO `tbltraining` VALUES ('4', 'asdasdasd', '2010-07-27', '<p>asdasdasd</p>', 'fr', 'noimage.gif', null, '1');
INSERT INTO `tbltraining` VALUES ('5', 'kakakaka', '2010-07-27', '<p>kakakaakakaka</p>', 'en', 'noimage.gif', '1', null);
INSERT INTO `tbltraining` VALUES ('6', 'aaw', '2010-07-27', '<p>asd</p>', 'en', 'noimage.gif', '4', null);
INSERT INTO `tbltraining` VALUES ('7', 'thu1', '2010-07-27', '<p>thuw353253</p>', 'en', 'noimage.gif', '2', null);
INSERT INTO `tbltraining` VALUES ('8', 'Cuong bi dien', '2010-07-27', '<p>Cuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dienCuong bi dien</p>', 'en', 'noimage.gif', '5', null);
INSERT INTO `tbltraining` VALUES ('9', 'dasdasd', '2010-07-05', 'asdasd', 'fr', 'noimage.gif', null, '2');
INSERT INTO `tbltraining` VALUES ('10', 'asa', '2010-07-21', 'asdasd', 'fr', 'noimage.gif', null, '3');
INSERT INTO `tbltraining` VALUES ('11', 'test new a', '2010-07-27', '<p>asssssssssssss</p>', 'en', 'noimage.gif', '7', null);
INSERT INTO `tbltraining` VALUES ('12', 'test tieng phap', '2010-07-27', '<p>asaaaa</p>', 'fr', 'noimage.gif', null, '4');
INSERT INTO `tbltraining` VALUES ('15', 'awdawdad', '2010-07-27', '<p>aaaaaaaawwwwwwwwwwwwwww</p>', 'fr', 'noimage.gif', null, '5');
INSERT INTO `tbltraining` VALUES ('16', 'awdd', '2010-07-27', '<p>awd</p>', 'en', 'noimage.gif', '6', null);
