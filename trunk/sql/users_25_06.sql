/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : confor

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-06-25 18:59:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `cookie_id` varchar(100) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL DEFAULT '0',
  `register_date` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_access` datetime NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userlevel` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(4) NOT NULL DEFAULT 'en',
  `description` text,
  `tempPassword` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'admin', 'yugi3000@gmail.com', 'Webmaster', null, null, '1', 'fcea920f7412b5da7be0cf42b8c93759', 'd73afbe01cc44f65ab776533f86015a8', '0', '2010-03-03 15:08:38', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '9', 'en', null, '7W1Toep46ypnPAtzsmb1');
INSERT INTO `users` VALUES ('24', '1', 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '1', '21232f297a57a5a743894a0e4a801fc3', 'a45e8a7bb02c385c5ae9046aa4971ace', '0', '2010-06-23 14:06:30', '127.0.0.1', '0000-00-00 00:00:00', '0', '1', '1', 'en', null, null);
INSERT INTO `users` VALUES ('25', '1', 'zun3000', 'zun3000@gmail.com', 'Mz MEO', 'meo', 'XEMMEX', '1', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no info', null);
INSERT INTO `users` VALUES ('26', '1', 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', '09bd6b044f68755b69cee95dd985f9d8', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'abc e', null);
INSERT INTO `users` VALUES ('27', '1', 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'af', null);
