/*
MySQL Data Transfer
Source Host: localhost
Source Database: conferen_conferen
Target Host: localhost
Target Database: conferen_conferen
Date: 21/07/2010 6:58:32 CH
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `num_per_page_video` tinyint(11) NOT NULL DEFAULT '7',
  `num_per_page_conf` tinyint(11) NOT NULL DEFAULT '7',
  `num_per_page_blog` tinyint(11) NOT NULL DEFAULT '7',
  `order_conf_field` varchar(50) DEFAULT NULL,
  `order_video_field` varchar(50) DEFAULT NULL,
  `order_blog_field` varchar(50) DEFAULT NULL,
  `site_off` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `system_settings` VALUES ('1', '7', '7', '7', 'date', 'date', 'viewed', '0');
