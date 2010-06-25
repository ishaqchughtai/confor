/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : confor

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2010-06-24 15:34:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `videos`
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `vid_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `category` bigint(20) unsigned NOT NULL,
  `tags` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `country` int(10) unsigned NOT NULL,
  `location` varchar(250) NOT NULL,
  `broadcast` tinyint(3) unsigned NOT NULL,
  `comments` tinyint(3) unsigned NOT NULL,
  `comment_voting` tinyint(3) unsigned NOT NULL,
  `responses` tinyint(3) unsigned NOT NULL,
  `ratings` tinyint(3) unsigned NOT NULL,
  `embedding` tinyint(3) unsigned NOT NULL,
  `vhash` varchar(250) NOT NULL,
  `shash` varchar(250) NOT NULL,
  `length` bigint(20) unsigned NOT NULL,
  `rating` bigint(20) unsigned NOT NULL,
  `votes` bigint(20) unsigned NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `screenshot` tinyint(3) unsigned NOT NULL,
  `converted` enum('0','1') NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `viewed` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`vid_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('100000', '1', 'abc', 'xxxx', '1', 'as adj kajsd askj', '1230742859', '223', 'ad', '0', '1', '1', '1', '1', '1', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.flv', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.jpg', '0', '0', '0', '1277174807', '0', '0', '0', '0', '24');
INSERT INTO `videos` VALUES ('100001', '1', 'Bullshit', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '1', 'as adj kajsd askj', '1230742859', '223', 'dsfasdfasfas', '0', '1', '1', '1', '1', '1', 'YouTube - Funny Commercial(1).flv', 'YouTube - Funny Commercial.jpg', '0', '0', '0', '1277174', '0', '0', '0', '0', '14');
INSERT INTO `videos` VALUES ('100002', '1', 'YouTube - Funny Commercial', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '2', 'as adj kajsd askj', '1230742820', '1', 'sdf sdfs dfs afsafsf', '0', '1', '1', '1', '1', '1', 'best, funniest commercial video', 'best, funniest commercial video.jpg', '0', '0', '0', '12771745', '0', '0', '0', '0', '11');
INSERT INTO `videos` VALUES ('100003', '4', 'best, funniest commercial video', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '3', 'ds sd qw assd', '1230742859', '100', 'ds s sdf sf safasfasf', '0', '1', '1', '1', '1', '1', 'funny Commercial.flv', 'funny Commercial.jpg', '0', '0', '0', '12771741', '0', '0', '0', '0', '6');
INSERT INTO `videos` VALUES ('100004', '3', '100 bucks you will laugh', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '4', 'ds sd sd sd', '1230742859', '20', 'akldj akldj akldj akldj ald', '0', '0', '0', '0', '0', '0', '100 bucks you will laugh.flv', 'fat_dance.jpg', '0', '0', '0', '12771741', '0', '0', '0', '0', '2227');
INSERT INTO `videos` VALUES ('100005', '2', 'Fat Kid Gets Owned', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '5', 'ds sa wer sd', '1230742859', '34', 'sad sdf sdfsaf sf à', '0', '0', '0', '0', '0', '0', 'Fat Kid Gets Owned.flv', 'Fat Kid Gets Owned.jpg', '0', '0', '0', '12771741', '0', '0', '0', '0', '343436');
INSERT INTO `videos` VALUES ('100006', '3', 'Funniest Goal', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '2', 'sd sdw svc', '1230742859', '54', 'asdasdads ad adad', '0', '0', '0', '0', '0', '0', 'Funniest Goal.flv', 'Funniest Goal.jpg', '0', '0', '0', '12771741', '0', '0', '0', '0', '425');
INSERT INTO `videos` VALUES ('100007', '4', 'GIRL GETS OWNED BY RC TRUCK LOL', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '5', 'sd sdw svc', '1230742859', '23', 'a dadad adadasdad', '0', '0', '0', '0', '0', '0', 'GIRL GETS OWNED BY RC TRUCK LOL.flv', 'GIRL GETS OWNED BY RC TRUCK LOL.jpg', '0', '0', '0', '12771741', '0', '0', '0', '0', '5454');
