/*
MySQL Data Transfer
Source Host: localhost
Source Database: conferen_conferen
Target Host: localhost
Target Database: conferen_conferen
Date: 21/07/2010 12:06:59 CH
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for functions
-- ----------------------------
CREATE TABLE `functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for membership_functions
-- ----------------------------
CREATE TABLE `membership_functions` (
  `function_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  PRIMARY KEY (`function_id`,`membership_id`),
  KEY `membership_id` (`membership_id`),
  CONSTRAINT `membership_functions_ibfk_1` FOREIGN KEY (`function_id`) REFERENCES `functions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `membership_functions_ibfk_2` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for memberships
-- ----------------------------
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `functions` VALUES ('1', 'Create new video', 'vspeaker/new_video_conference');
INSERT INTO `functions` VALUES ('2', 'Video modification', 'vspeaker/edit_video_conference');
INSERT INTO `membership_functions` VALUES ('2', '1');
INSERT INTO `membership_functions` VALUES ('1', '3');
INSERT INTO `membership_functions` VALUES ('1', '4');
INSERT INTO `membership_functions` VALUES ('1', '5');
INSERT INTO `memberships` VALUES ('1', 'Bronzes free', 'Bronzes free', '1', '1', '1');
INSERT INTO `memberships` VALUES ('2', 'Super Membership', 'This is super membership', '1', '1', '1');
INSERT INTO `memberships` VALUES ('3', 'Silver', 'Silver', '1', '1', '1');
INSERT INTO `memberships` VALUES ('4', 'Bronze', 'Bronze', '1', '1', '1');
INSERT INTO `memberships` VALUES ('5', 'Gold', 'Gold', '0', '1', '1');
