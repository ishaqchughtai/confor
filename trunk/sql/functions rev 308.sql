/*
MySQL Data Transfer
Source Host: localhost
Source Database: conferen_conferen
Target Host: localhost
Target Database: conferen_conferen
Date: 21/07/2010 2:29:09 CH
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `functions` VALUES ('1', 'Create new video', 'vspeaker/new_video_conference');
INSERT INTO `functions` VALUES ('2', 'Video modification', 'vspeaker/edit_video_conference');
INSERT INTO `functions` VALUES ('3', 'Create event', 'manage_event/add');
INSERT INTO `functions` VALUES ('4', 'Send ticket', 'ticket/send_ticket_by_speaker');
