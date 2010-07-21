/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-07-16 09:22:36
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblaccessories
-- ----------------------------
INSERT INTO `tblaccessories` VALUES ('1', 'About', '<p><span class=\"long_text\" id=\"result_box\"><span title=\"\" style=\"\">We are:<br />\n<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">- An  international agency for speakers<br />\n<br />\n</span><span title=\"\">- An  agency for trainers<br />\n<br />\n</span><span title=\"\">- A WebTV<br />\n<br />\n</span><span title=\"\">- Rental of HD video studio<br />\n<br />\n</span><span title=\"\">-  Studio HD video editing<br />\n<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">- Audio Recording Studio<br />\n<br />\n&nbsp;<br />\n<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">Conferences  &amp; Training Group Inc. Confor.<br />\n</span><span title=\"\">110  Notre-Dame<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">Thetford Mines, Quebec, Canada<br />\n</span><span title=\"\">G6G  2J8<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">1-418-622-2000 ext 130<br />\n</span><span title=\"\" style=\"background-color: rgb(255, 255, 255);\">1-877-523-8647 ext 130<br />\n</span><span title=\"\">info@confor.ca</span></span></p>');
INSERT INTO `tblaccessories` VALUES ('2', 'How', '<p>How it works ?</p>');
INSERT INTO `tblaccessories` VALUES ('3', 'Rules', '<p>The rules</p>');
INSERT INTO `tblaccessories` VALUES ('6', 'About_fr', '<p>Nous sommes:</p>\n<p>- Une agence de conf&eacute;renciers international</p>\n<p>- Une agence pour formateurs</p>\n<p>- Une WebTV</p>\n<p>- Location de studio vid&eacute;o HD</p>\n<p>- Studio de montage vid&eacute;o HD</p>\n<p>- Studio d\'enregistrement audio</p>\n<p>&nbsp;</p>\n<p><span style=\"font-family: Verdana;\">Groupe Confor formations &amp;  conf&eacute;rences inc. <br />\n110 Notre-Dame Est <br />\nThetford Mines, Qu&eacute;bec, Canada<br />\nG6G 2J8<br />\n1-418-622-2000 poste 130<br />\n1-877-523-8647 poste 130<br />\ninfo@confor.ca</span></p>');
INSERT INTO `tblaccessories` VALUES ('7', 'How_fr', '<p>Comment &ccedil;a marche?</p>');
INSERT INTO `tblaccessories` VALUES ('8', 'Rules_fr', '<p>Les r&egrave;gles</p>');
