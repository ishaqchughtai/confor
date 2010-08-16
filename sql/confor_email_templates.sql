/*
Navicat MySQL Data Transfer

Source Server         : confor.tv
Source Server Version : 50091
Source Host           : 65.60.51.108:3306
Source Database       : conforus_conforus

Target Server Type    : MYSQL
Target Server Version : 50091
File Encoding         : 65001

Date: 2010-08-16 23:05:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `confor_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `confor_email_templates`;
CREATE TABLE `confor_email_templates` (
  `id` int(5) NOT NULL auto_increment,
  `code` varchar(10) default NULL,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  `lang` varchar(5) NOT NULL default 'en',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of confor_email_templates
-- ----------------------------
INSERT INTO `confor_email_templates` VALUES ('1', 'VS', 'Video Suspension', 'Video Suspension', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nVideo [VIDEO_NAME] has been locked from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('2', 'AS', 'Account Suspension', 'Account Suspension', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nAccount  [USER_NAME] has been locked from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('3', 'DV', 'Delete Video', 'Your Video has been deleted !', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nVideo [VIDEO_NAME] has been removed from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !\n', 'en');
INSERT INTO `confor_email_templates` VALUES ('4', 'DA', 'Delete Account', 'Your Account has been deleted', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\n Account [USER_NAME] has been removed from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN] or register at here [LINK_REG]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('5', 'CB', 'Comment Blog (To Speaker)', 'You have just posted a comment on : [TITLE]', 'Dear [NAME] !\n\n____________________________________________________\n\nYou have just posted a comment .\nBlog Title: [TITLE] .\nContent: [BODY].\n____________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('6', 'CBA', 'Comment Blog (To Admin)', 'New Comment !', 'Dear Administrator !\n________________________________________________________\n\nYour comment was send by [NAME] .\nYou need to check in Blog Control\nTitle: [TITLE] .\nContent: [BODY] .\nThank your for your attention!\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('7', 'TK', 'Ticket (To Speaker)', 'Ticket', 'Dear [NAME]!\n____________________________________________________\n\nYour ticket was send by Administrator.\nTitle: [TITLE]\nContent: [BODY].\nThank your for your attention!\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('8', 'TKA', 'Ticket (To Admin)', 'Your ticket was send by Speaker', 'Dear Administrator !\n_____________________________________________________\n\nYour ticket was send by Speaker.\nTitle: [TITLE]\nContent: [BODY].\nThank your for your attention !\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('9', 'FGP', 'Forgot Password', 'Retrieve your password from http://confor.tv', 'Dear SPEAKER !\n_____________________________________________________\n\nYour password to login at website [SITE_URL] is: [LINK]\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'en');
INSERT INTO `confor_email_templates` VALUES ('10', 'BAU', 'Bronzes Account Update', '', null, 'en');
INSERT INTO `confor_email_templates` VALUES ('11', 'SAU', 'Silver Account Update', '', null, 'en');
INSERT INTO `confor_email_templates` VALUES ('12', 'GAU', 'Gold Account Update', '', null, 'en');
INSERT INTO `confor_email_templates` VALUES ('13', 'VS', 'fr_Video Suspension', 'fr_Video Suspension', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nVideo [VIDEO_NAME] has been locked from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('14', 'AS', 'fr_Account Suspension', 'fr_Account Suspension', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nAccount  [USER_NAME] has been locked from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('15', 'DV', 'fr_Delete Video', 'fr_Your Video has been deleted !', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\nVideo [VIDEO_NAME] has been removed from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !\n', 'fr');
INSERT INTO `confor_email_templates` VALUES ('16', 'DA', 'fr_Delete Account', 'fr_Your Account has been deleted', 'Dear [FIRST_NAME] [NAME] !\n_____________________________________________________________\n\n Account [USER_NAME] has been removed from [SITE_URL] !\nPlease contact the administrator via email: [EMAIL_ADMIN] or register at here [LINK_REG]\n\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('17', 'CB', 'fr_Comment Blog (To Speaker)', 'fr_You have just posted a comment on : [TITLE]', 'Dear [NAME] !\n\n____________________________________________________\n\nYou have just posted a comment .\nBlog Title: [TITLE] .\nContent: [BODY].\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('18', 'CBA', 'fr_Comment Blog (To Admin)', 'fr_New Comment !', 'Dear Administrator !\n________________________________________________________\n\nYour comment was send by [NAME] .\nYou need to check in Blog Control\nTitle: [TITLE] .\nContent: [BODY] .\nThank your for your attention!\n_____________________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('19', 'TK', 'fr_Ticket (To Speaker)', 'fr_Ticket', 'Dear [NAME]!\n____________________________________________________\n\nYour ticket was send by Administrator.\nTitle: [TITLE]\nContent: [BODY].\nThank your for your attention!\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('20', 'TKA', 'fr_Ticket (To Admin)', 'fr_Your ticket was send by Speaker', 'Dear Administrator !\n_____________________________________________________\n\nYour ticket was send by Speaker.\nTitle: [TITLE]\nContent: [BODY].\nThank your for your attention !\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('21', 'FGP', 'fr_Forgot Password', 'fr_Retrieve your password from http://confor.tv', 'Dear SPEAKER !\n_____________________________________________________\n\nYour password to login at website [SITE_URL] is: [LINK]\n_____________________________________________________\n\n[SITE_URL] TEAM !', 'fr');
INSERT INTO `confor_email_templates` VALUES ('22', 'BAU', 'f_Bronzes Account Update', '', null, 'fr');
INSERT INTO `confor_email_templates` VALUES ('23', 'SAU', 'f_Silver Account Update', '', null, 'fr');
INSERT INTO `confor_email_templates` VALUES ('24', 'GAU', 'f_Gold Account Update', '', null, 'fr');
