SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for payvideos
-- ----------------------------
CREATE TABLE `payvideos` (
  `vid_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `vhash` varchar(250) NOT NULL,
  `shash` varchar(250) NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `viewed` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
