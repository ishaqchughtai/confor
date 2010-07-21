/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2010-07-19 17:39:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbladvertisement`
-- ----------------------------
DROP TABLE IF EXISTS `tbladvertisement`;
CREATE TABLE `tbladvertisement` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DateBeginning` date NOT NULL,
  `DateExpiry` date NOT NULL,
  `AdvertiserName` varchar(50) NOT NULL,
  `AdvertiserEmail` varchar(50) NOT NULL,
  `URL` text NOT NULL,
  `TextTips` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL,
  `Viewed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbladvertisement
-- ----------------------------
INSERT INTO `tbladvertisement` VALUES ('29', '2010-07-07', '2010-07-21', 'Confor.ca Ad', 'admin@confor.ca', 'http://conferences-formations.com/index.php/contact', 'Annoncez-vous chez Confor.ca', 'confor_ad_285x285.jpg', '1');
INSERT INTO `tbladvertisement` VALUES ('31', '2010-07-08', '2010-07-23', 'Vaincre la peur en avion', 'admin@confor.ca', 'http://conferences-formations.com/index.php/blog/blog_content/admin/Atelier', 'Atelier - Vaincre la peur en avion!', 'peur_ad_285x285.jpg', '1');
INSERT INTO `tbladvertisement` VALUES ('32', '2010-07-15', '2010-07-18', 'tét', 'sadasdasd@gmail.com', 'http://dsdsd', 'no thing', 'xvbtnwAXLtDrseTO.jpg', '1');
INSERT INTO `tbladvertisement` VALUES ('33', '2010-07-15', '2010-07-26', 'tét', 'sadasdasd@gmail.com', 'http://ádasdasdasd', 'ádasdasd', 'sYdLwZlXHpygY7sv.png', '2');
INSERT INTO `tbladvertisement` VALUES ('34', '2010-07-15', '2010-08-07', 'dang the cuong', 'cuongdt90@gmail.com', 'http://dantri.com.vn', 'no thing', 'e30FLc3X3K8mJFTj.jpg', '1');
INSERT INTO `tbladvertisement` VALUES ('36', '2010-07-18', '2010-07-20', 'asdadasd', 'cuongdt90@gmail.com', 'http://dantri.com.vn', 'kf slkfj lasfjlasjfsf', 'nPbkYYLym9iqF9yW.jpg', '2');
INSERT INTO `tbladvertisement` VALUES ('39', '2010-07-19', '2010-07-19', 'dang the cuong', 'cuongdt90@gmail.com', 'http://dantri.com.vn', 'nfgnfn', 'NfPR5mqGLzc5ywKB.jpg', '2');
