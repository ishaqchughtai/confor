/*
Navicat MySQL Data Transfer

Source Server         : huunam09
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conforus_conforus

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-10-28 16:59:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbladvertisement_text`
-- ----------------------------
DROP TABLE IF EXISTS `tbladvertisement_text`;
CREATE TABLE `tbladvertisement_text` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  `Body` text NOT NULL,
  `DateBeginning` date NOT NULL,
  `DateExpiry` date NOT NULL,
  `AdvertiserEmail` varchar(100) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `Viewed` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbladvertisement_text
-- ----------------------------
INSERT INTO tbladvertisement_text VALUES ('3', 'nam tesssss', 'asdasdas\nasdsacl asd', '2010-10-27', '2010-11-30', 'nam@gmail.com', 'http://daaaab', '1');
INSERT INTO tbladvertisement_text VALUES ('4', 'Patch vi?t hóa t?m th?i c?a b?n 863', 'asdasd\nPatch vi?t hóa t?m th?i c?a b?n 863 server trung qu?c', '2010-10-28', '2010-10-31', 'nam@gmail.com', 'http://daaaab', '0');
INSERT INTO tbladvertisement_text VALUES ('5', 'dantri.com', 'dantri.com\ndantri.com\ndantri.comdantri.com asdsd', '2010-10-28', '2011-03-26', 'nam@gmail.com', 'http://dantri.com', '0');
INSERT INTO tbladvertisement_text VALUES ('6', 'Google.com', 'Google.comGoogle.comGoogle.comGoogle.com\nGoogle.comGoogle.com\nGoogle.comGoogle.comGoogle.com\nGoogle.com', '2010-10-28', '2011-02-28', 'teS@Gmail.com', 'http://google.com', '0');
