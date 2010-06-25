/*
MySQL Data Transfer
Source Host: localhost
Source Database: confor
Target Host: localhost
Target Database: confor
Date: 24/06/2010 11:55:47 CH
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `membership_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(50) default NULL,
  `company_name` varchar(100) default NULL,
  `country` varchar(50) default NULL,
  `password` varchar(255) NOT NULL,
  `cookie_id` varchar(100) NOT NULL default '0',
  `token` varchar(100) NOT NULL default '0',
  `register_date` datetime NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_access` datetime NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `userlevel` tinyint(1) NOT NULL default '1',
  `language` varchar(4) NOT NULL default 'en',
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'admin', 'yugi3000@gmail.com', 'Webmaster', null, null, '1', 'ac48ec59d616758e95e63b08a1689240', '3e31ecb790b293b9e24319a2a374ac53', '0', '2010-03-03 15:08:38', '127.0.0.1', '2010-06-24 14:49:12', '1', '1', '9', 'en', null);
INSERT INTO `users` VALUES ('24', '1', 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '1', '21232f297a57a5a743894a0e4a801fc3', 'a45e8a7bb02c385c5ae9046aa4971ace', '0', '2010-06-23 14:06:30', '127.0.0.1', '0000-00-00 00:00:00', '0', '1', '1', 'en', null);
INSERT INTO `users` VALUES ('25', '1', 'zun3000', 'zun3000@gmail.com', 'Mz MEO', 'meo', 'XEMMEX', '1', 'ac48ec59d616758e95e63b08a1689240', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no info');
INSERT INTO `users` VALUES ('26', '1', 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'ac48ec59d616758e95e63b08a1689240', '96408e1b61f380e679e0c49d74c5e64f', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'abc e');
