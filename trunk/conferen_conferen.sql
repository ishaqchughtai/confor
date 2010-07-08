/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : confor

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-07-08 16:09:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `action` tinyint(3) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `details` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_mail`
-- ----------------------------
DROP TABLE IF EXISTS `admin_mail`;
CREATE TABLE `admin_mail` (
  `mes_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `recipients` text NOT NULL,
  PRIMARY KEY (`mes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_session`
-- ----------------------------
DROP TABLE IF EXISTS `admin_session`;
CREATE TABLE `admin_session` (
  `ses_id` varchar(250) NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_session
-- ----------------------------
INSERT INTO `admin_session` VALUES ('77447e4cec4ee666a678f04cc8e768e4', '1277346196');

-- ----------------------------
-- Table structure for `associations`
-- ----------------------------
DROP TABLE IF EXISTS `associations`;
CREATE TABLE `associations` (
  `assoc_type` enum('auth','form','menu','task') NOT NULL,
  `page` varchar(50) NOT NULL,
  `association` varchar(50) NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `assoc_type` (`assoc_type`,`page`,`association`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of associations
-- ----------------------------
INSERT INTO `associations` VALUES ('auth', 'account', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'billing', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_browse', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_design', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_info', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_edit_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'channels_share_win', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'delete', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_favorites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invitations', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invite', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_invite_report', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'friends_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_add_videos', 'auth_group_action_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_add_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_browse', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_create', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_discussions', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_discussions', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_edit', 'auth_group_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_invite', 'auth_group_action_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_invite', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_manage', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_videos', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_view_discussion', 'auth_group_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'groups_view_discussion', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'ignores', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'join', 'auth_join', 'default');
INSERT INTO `associations` VALUES ('auth', 'join_options', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_comments', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_groups', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_invites', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_message', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_responses', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_sent', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_shared', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'mailbox_view', 'auth_view_message', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_create', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_modify', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_modify', 'auth_playlist_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_share_win', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlists_view', 'auth_playlist_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'playlist_edit', 'auth_playlist_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'search', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'subscriptions', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'upgrade', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_activity', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_edit', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_edit', 'auth_video_edit_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_manage', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_respond', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_respond', 'auth_video_access', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload_complete', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_upload_general', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_view', 'auth_member', 'default');
INSERT INTO `associations` VALUES ('auth', 'videos_view', 'auth_video_access', 'default');
INSERT INTO `associations` VALUES ('form', 'about', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_change_email', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_change_password', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_info', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_personal', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'account_settings', 'default');
INSERT INTO `associations` VALUES ('form', 'account', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'advertise', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'billing', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'channel_bulletin', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'channel_comment', 'default');
INSERT INTO `associations` VALUES ('form', 'channels', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_browse', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'channel_boxes', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'channel_style', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_design', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_favorites', 'channel_favorites', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_info', 'channel_info', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_info', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_videos', 'channel_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_edit_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_share_win', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'channels_share_win', 'share_channel', 'default');
INSERT INTO `associations` VALUES ('form', 'delete', 'delete', 'default');
INSERT INTO `associations` VALUES ('form', 'delete', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'forgot', 'forgot', 'default');
INSERT INTO `associations` VALUES ('form', 'forgot', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends', 'friends', 'default');
INSERT INTO `associations` VALUES ('form', 'friends', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_favorites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invitations', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite', 'invite', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_invite_report', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'friends_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_add_videos', 'group_add_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_add_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_browse', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_create', 'group_create', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_create', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_discussions', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_discussions', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_approve_topics', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_approve_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_members', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_topics', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_edit_videos', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'group_remove', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_invite', 'group_invite', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_invite', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_manage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_view_discussion', 'group_topic', 'default');
INSERT INTO `associations` VALUES ('form', 'groups_view_discussion', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'help', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'homepage', 'login', 'default');
INSERT INTO `associations` VALUES ('form', 'homepage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'ignores', 'ignores', 'default');
INSERT INTO `associations` VALUES ('form', 'ignores', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'join', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'login', 'default');
INSERT INTO `associations` VALUES ('form', 'join', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_options', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_verification', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'join_verification', 'verification', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_comments', 'comments', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_comments', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_groups', 'groups', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_groups', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_invites', 'invites', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_invites', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_message', 'message', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_message', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_responses', 'responses', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_responses', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_sent', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_sent', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_shared', 'messages', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_shared', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_view', 'message_view', 'default');
INSERT INTO `associations` VALUES ('form', 'mailbox_view', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_create', 'playlist_create', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_create', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_edit', 'playlist_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_modify', 'playlist_arrange', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_modify', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_share_win', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_share_win', 'share_playlist', 'default');
INSERT INTO `associations` VALUES ('form', 'playlists_view', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'privacy', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'rss', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'search', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'subscriptions', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'terms', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'upgrade', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'upgrade', 'upgrade', 'default');
INSERT INTO `associations` VALUES ('form', 'videos', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_edit', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_edit', 'video_edit', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_manage', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_respond', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_respond', 'video_response', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload', 'video_upload', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_complete', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_general', 'search', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_upload_general', 'video_upload_general', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'comment', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'comment_embed', 'default');
INSERT INTO `associations` VALUES ('form', 'videos_view', 'search', 'default');
INSERT INTO `associations` VALUES ('menu', 'about', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'about', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'account', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'advertise', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'advertise', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'membership', 'default');
INSERT INTO `associations` VALUES ('menu', 'billing', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'channel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'channel_connect', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'subchannels', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_browse', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_design', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_info', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'mychannel', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'channels_edit_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'delete', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'delete', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'forgot', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'forgot', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_favorites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invitations', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_invite_report', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'subfriends', 'default');
INSERT INTO `associations` VALUES ('menu', 'friends_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_add_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_add_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'subgroups', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_browse', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_create', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_create', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_discussions', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_discussions', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'groupmanage', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_invite', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_invite', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'mygroups', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_manage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_view_discussion', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'groups_view_discussion', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'help', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'help', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'membership', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'homepage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'ignores', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_options', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_options', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_verification', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'join_verification', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_comments', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_groups', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_invites', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_message', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_responses', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_sent', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_shared', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'mailbox', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'mailbox_view', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_create', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_modify', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'playlists_view', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'privacy', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'privacy', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'rss', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'rss', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'search', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'search', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'subscriptions', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'terms', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'terms', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'upgrade', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'upgrade', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'subvideos', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_activity', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_edit', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'subhome', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_manage', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_respond', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_respond', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_complete', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_complete', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_general', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_upload_general', 'top', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_view', 'main', 'default');
INSERT INTO `associations` VALUES ('menu', 'videos_view', 'top', 'default');
INSERT INTO `associations` VALUES ('task', 'billing', 'channels|billing', 'default');
INSERT INTO `associations` VALUES ('task', 'channels', 'channels|channel_view', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_browse', 'channels|channels_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_browse', 'channels|channels_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_design', 'channels|channel_design', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_favorites', 'channels|channel_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_favorites', 'channels|channel_my_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_info', 'channels|channel_info', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_videos', 'channels|channel_my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'channels_edit_videos', 'channels|channel_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'favorites', 'favorites|my_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'friends', 'friends|my_friends', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_favorites', 'friends|my_friends_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_invitations', 'friends|my_invitations', 'default');
INSERT INTO `associations` VALUES ('task', 'friends_videos', 'friends|my_friends_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups', 'groups|group_view', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|group_pro', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|my_group_favorites', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_add_videos', 'groups|my_group_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_browse', 'groups|groups_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_browse', 'groups|groups_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_discussions', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_discussions', 'groups|group_discussions', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_edit', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_edit', 'groups|group_edit', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_invite', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_manage', 'groups|my_groups', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_videos', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_videos', 'groups|group_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_view_discussion', 'groups|groupinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'groups_view_discussion', 'groups|group_discussion', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'channels|membership', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'videos|videos_homepage_boxes', 'default');
INSERT INTO `associations` VALUES ('task', 'homepage', 'videos|videos_statistics', 'default');
INSERT INTO `associations` VALUES ('task', 'ignores', 'channels|ignores', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox', 'mailbox|mailbox_inbox', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_comments', 'mailbox|mailbox_comments', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_groups', 'mailbox|mailbox_groups', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_invites', 'mailbox|mailbox_invites', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_message', 'mailbox|mailbox_message', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_responses', 'mailbox|mailbox_responses', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_sent', 'mailbox|mailbox_sent', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_shared', 'mailbox|mailbox_shared', 'default');
INSERT INTO `associations` VALUES ('task', 'mailbox_view', 'mailbox|mailbox_view', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists', 'playlists|my_playlists', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists_modify', 'playlists|playlist_modify', 'default');
INSERT INTO `associations` VALUES ('task', 'playlists_view', 'playlists|playlist_view', 'default');
INSERT INTO `associations` VALUES ('task', 'search', 'videos|videos_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'subscriptions', 'subscriptions|my_subscriptions', 'default');
INSERT INTO `associations` VALUES ('task', 'videos', 'videos|videos_browse', 'default');
INSERT INTO `associations` VALUES ('task', 'videos', 'videos|videos_browse_data', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'channels|membership', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|friend_activity', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|videos_homepage_boxes', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_activity', 'videos|videos_statistics', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_edit', 'videos|video_screenshots', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_manage', 'videos|my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_respond', 'videos|my_videos', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_respond', 'videos|vidinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_upload_complete', 'videos|vidinfo', 'default');
INSERT INTO `associations` VALUES ('task', 'videos_view', 'videos|video_view', 'default');

-- ----------------------------
-- Table structure for `banners`
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `ban_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cmp_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `format` tinyint(4) NOT NULL,
  `type` enum('external','static','rich') NOT NULL,
  `primary_file` varchar(250) NOT NULL,
  `secondary_file` varchar(250) NOT NULL,
  `tag` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `areas` varchar(250) NOT NULL,
  `pages` text NOT NULL,
  `countries` text NOT NULL,
  `video_categories` text NOT NULL,
  `group_categories` text NOT NULL,
  `impressions` bigint(20) unsigned NOT NULL,
  `clicks` bigint(20) unsigned NOT NULL,
  `last_shown` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `cmp_id` (`cmp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banners
-- ----------------------------

-- ----------------------------
-- Table structure for `billing`
-- ----------------------------
DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `ord_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ord_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billing
-- ----------------------------

-- ----------------------------
-- Table structure for `bookmarks`
-- ----------------------------
DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookmarks
-- ----------------------------

-- ----------------------------
-- Table structure for `bulletins`
-- ----------------------------
DROP TABLE IF EXISTS `bulletins`;
CREATE TABLE `bulletins` (
  `bul_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`bul_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bulletins
-- ----------------------------

-- ----------------------------
-- Table structure for `campaigns`
-- ----------------------------
DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `cmp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `theme` varchar(250) NOT NULL,
  `type` enum('external','ppc','impressions','subscription') NOT NULL,
  `price` double NOT NULL,
  `currency` char(10) NOT NULL,
  `credit` double NOT NULL,
  `start` bigint(20) unsigned NOT NULL,
  `end` bigint(20) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`cmp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for `captcha`
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha
-- ----------------------------
INSERT INTO `captcha` VALUES ('110', '1278448235', '205.237.48.52', 'SNRYYR');
INSERT INTO `captcha` VALUES ('109', '1278448145', '205.237.48.52', '4IGB8N');
INSERT INTO `captcha` VALUES ('115', '1278452437', '205.237.48.52', '9GRVBE');
INSERT INTO `captcha` VALUES ('114', '1278452328', '205.237.48.52', 'OYQZMQ');
INSERT INTO `captcha` VALUES ('113', '1278449108', '205.237.48.52', 'D2CBQ5');
INSERT INTO `captcha` VALUES ('112', '1278448996', '205.237.48.52', 'ARQRT5');
INSERT INTO `captcha` VALUES ('111', '1278448299', '205.237.48.52', 'SOLA6J');

-- ----------------------------
-- Table structure for `channels`
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `comments` tinyint(4) NOT NULL DEFAULT '1',
  `comment_allow` tinyint(4) NOT NULL DEFAULT '1',
  `bulletins` tinyint(4) NOT NULL DEFAULT '1',
  `featured` varchar(250) NOT NULL,
  `colors` text NOT NULL,
  `bcg` varchar(250) NOT NULL,
  `boxes` varchar(250) NOT NULL,
  `videos` varchar(250) NOT NULL,
  `favorites` varchar(250) NOT NULL,
  `playlists` varchar(250) NOT NULL,
  `views` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of channels
-- ----------------------------
INSERT INTO `channels` VALUES ('100000', '1', 'admin', '', '1', '1', '1', '', 'grey', '', 'box_featured,box_subscriptions,box_bulletins,box_videos,box_favorites,box_friends,box_comments', '', '', '', '0');

-- ----------------------------
-- Table structure for `channel_comments`
-- ----------------------------
DROP TABLE IF EXISTS `channel_comments`;
CREATE TABLE `channel_comments` (
  `com_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `from` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of channel_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `code`
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `ip` char(15) NOT NULL,
  `code` char(6) NOT NULL,
  `try` tinyint(3) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('127.0.0.1', '7245F5', '1', '1277346146');

-- ----------------------------
-- Table structure for `email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of email_templates
-- ----------------------------
INSERT INTO `email_templates` VALUES ('1', 'Registration Email', 'Please verify your email', 'Welcome [USERNAME]! Thanks for registering.\r\n---------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n---------------------------------------------------\r\n\r\nThe administrator of this site has requested all new accounts\r\nto be activated by the users who created them thus your account\r\nis currently inactive. To activate your account,\r\nplease visit this link:\r\n[LINK]\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('2', 'Forgot Password Email', 'Password Reset', 'New password reset from [SITE_NAME]!\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello, [USERNAME]\r\n\r\nIt seems that you or someone requested a new password for you.\r\n\r\nWe have generated a new password, as requested:\r\n\r\nYour new password: [PASSWORD]\r\n\r\n\r\nTo use the new password you need to activate it. To do this click the link provided below and login with your new password.\r\n[LINK]\r\n\r\nYou can change your password after you sign in.\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nPassword requested from IP: [IP]');
INSERT INTO `email_templates` VALUES ('3', 'Welcome Mail From Admin', 'You have been registered', 'Welcome [NAME]! Thanks for registering.\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('4', 'Default Newsletter', 'Newsletter', 'Hello,\r\n[USERNAME]\r\nYou are receiving this email as a part of your newsletter subscription\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHere goes your newsletter content\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n---------------------------------------------------------------------------------------------------------\r\nTo stop receiving future newsletters please login into your account\r\nand uncheck newsletter subscription box.');
INSERT INTO `email_templates` VALUES ('5', 'Transaction Completed', 'Payment from payPal', 'Hello, Admin\r\n\r\nYou have received new PayPal payment following:\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nUsername: [USERNAME]\r\nItem: [ITEMNAME]\r\nPrice: [PRICE]\r\n\r\nStatus: [STATUS] \r\n\r\n---------------------------------------------------------------------------------------------------------\r\nYou can view this transaction from [URL]');
INSERT INTO `email_templates` VALUES ('6', 'Transaction Suspicious', 'Suspicious Transaction', 'Hello, Admin\r\n----------------------------------------------------------\r\nThe following transaction has been disabled due to suspicious activity:\r\n\r\nBuyer: [USERNAME]\r\nItem: [ITEM]\r\nPrice: [PRICE]\r\nStatus: [STATUS]\r\n\r\n----------------------------------------------------------\r\nPlease verify this transaction is correct. If it is, please activate it in the transaction section of your site\'s \r\nadministration control panel. If not, it appears that someone tried to fraudulently obtain products from your site.');

-- ----------------------------
-- Table structure for `geo_countries`
-- ----------------------------
DROP TABLE IF EXISTS `geo_countries`;
CREATE TABLE `geo_countries` (
  `con_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of geo_countries
-- ----------------------------
INSERT INTO `geo_countries` VALUES ('1', 'Antarctica');
INSERT INTO `geo_countries` VALUES ('2', 'Argentina');
INSERT INTO `geo_countries` VALUES ('3', 'Falkland Islands');
INSERT INTO `geo_countries` VALUES ('4', 'Chile');
INSERT INTO `geo_countries` VALUES ('5', 'French Southern Territories');
INSERT INTO `geo_countries` VALUES ('6', 'New Zealand');
INSERT INTO `geo_countries` VALUES ('7', 'Saint Helena');
INSERT INTO `geo_countries` VALUES ('8', 'Uruguay');
INSERT INTO `geo_countries` VALUES ('9', 'South Africa');
INSERT INTO `geo_countries` VALUES ('10', 'Brazil');
INSERT INTO `geo_countries` VALUES ('11', 'Lesotho');
INSERT INTO `geo_countries` VALUES ('12', 'Namibia');
INSERT INTO `geo_countries` VALUES ('13', 'French Polynesia');
INSERT INTO `geo_countries` VALUES ('14', 'Paraguay');
INSERT INTO `geo_countries` VALUES ('15', 'Swaziland');
INSERT INTO `geo_countries` VALUES ('16', 'Smaller Territories of Chile');
INSERT INTO `geo_countries` VALUES ('17', 'Botswana');
INSERT INTO `geo_countries` VALUES ('18', 'Mozambique');
INSERT INTO `geo_countries` VALUES ('19', 'Madagascar');
INSERT INTO `geo_countries` VALUES ('20', 'Smaller Territories of the UK');
INSERT INTO `geo_countries` VALUES ('21', 'Bolivia');
INSERT INTO `geo_countries` VALUES ('22', 'New Caledonia');
INSERT INTO `geo_countries` VALUES ('23', 'Zimbabwe');
INSERT INTO `geo_countries` VALUES ('24', 'Cook Islands');
INSERT INTO `geo_countries` VALUES ('25', 'Reunion');
INSERT INTO `geo_countries` VALUES ('26', 'Tonga');
INSERT INTO `geo_countries` VALUES ('27', 'Mauritius');
INSERT INTO `geo_countries` VALUES ('28', 'Vanuatu');
INSERT INTO `geo_countries` VALUES ('29', 'Fiji Islands');
INSERT INTO `geo_countries` VALUES ('30', 'Peru');
INSERT INTO `geo_countries` VALUES ('31', 'Zambia');
INSERT INTO `geo_countries` VALUES ('32', 'Angola');
INSERT INTO `geo_countries` VALUES ('33', 'Malawi');
INSERT INTO `geo_countries` VALUES ('34', 'American Samoa');
INSERT INTO `geo_countries` VALUES ('35', 'Wallis and Futuna');
INSERT INTO `geo_countries` VALUES ('36', 'Samoa');
INSERT INTO `geo_countries` VALUES ('37', 'Mayotte');
INSERT INTO `geo_countries` VALUES ('38', 'Comoros');
INSERT INTO `geo_countries` VALUES ('39', 'External Territories of Australia');
INSERT INTO `geo_countries` VALUES ('40', 'Congo (Dem. Rep.)');
INSERT INTO `geo_countries` VALUES ('41', 'Solomon Islands');
INSERT INTO `geo_countries` VALUES ('42', 'Tanzania');
INSERT INTO `geo_countries` VALUES ('43', 'Papua New Guinea');
INSERT INTO `geo_countries` VALUES ('44', 'Indonesia');
INSERT INTO `geo_countries` VALUES ('45', 'Tokelau');
INSERT INTO `geo_countries` VALUES ('46', 'Tuvalu');
INSERT INTO `geo_countries` VALUES ('47', 'East Timor');
INSERT INTO `geo_countries` VALUES ('48', 'Congo');
INSERT INTO `geo_countries` VALUES ('49', 'Kenya');
INSERT INTO `geo_countries` VALUES ('50', 'Ecuador');
INSERT INTO `geo_countries` VALUES ('51', 'Colombia');
INSERT INTO `geo_countries` VALUES ('52', 'Burundi');
INSERT INTO `geo_countries` VALUES ('53', 'Gabon');
INSERT INTO `geo_countries` VALUES ('54', 'Kiribati');
INSERT INTO `geo_countries` VALUES ('55', 'Rwanda');
INSERT INTO `geo_countries` VALUES ('56', 'Equatorial Guinea');
INSERT INTO `geo_countries` VALUES ('57', 'Uganda');
INSERT INTO `geo_countries` VALUES ('58', 'Somalia');
INSERT INTO `geo_countries` VALUES ('59', 'Maldives');
INSERT INTO `geo_countries` VALUES ('60', 'Nauru');
INSERT INTO `geo_countries` VALUES ('61', 'São Tomé and Príncipe');
INSERT INTO `geo_countries` VALUES ('62', 'Malaysia');
INSERT INTO `geo_countries` VALUES ('63', 'Cameroon');
INSERT INTO `geo_countries` VALUES ('64', 'Palau');
INSERT INTO `geo_countries` VALUES ('65', 'French Guiana');
INSERT INTO `geo_countries` VALUES ('66', 'Guyana');
INSERT INTO `geo_countries` VALUES ('67', 'Central African Republic');
INSERT INTO `geo_countries` VALUES ('68', 'Ethiopia');
INSERT INTO `geo_countries` VALUES ('69', 'Micronesia');
INSERT INTO `geo_countries` VALUES ('70', 'Sudan');
INSERT INTO `geo_countries` VALUES ('71', 'Nigeria');
INSERT INTO `geo_countries` VALUES ('72', 'Liberia');
INSERT INTO `geo_countries` VALUES ('73', 'Ivory Coast');
INSERT INTO `geo_countries` VALUES ('74', 'Brunei');
INSERT INTO `geo_countries` VALUES ('75', 'Marshall Islands');
INSERT INTO `geo_countries` VALUES ('76', 'Philippines');
INSERT INTO `geo_countries` VALUES ('77', 'Ghana');
INSERT INTO `geo_countries` VALUES ('78', 'Suriname');
INSERT INTO `geo_countries` VALUES ('79', 'Venezuela');
INSERT INTO `geo_countries` VALUES ('80', 'Thailand');
INSERT INTO `geo_countries` VALUES ('81', 'Sri Lanka');
INSERT INTO `geo_countries` VALUES ('82', 'Togo');
INSERT INTO `geo_countries` VALUES ('83', 'Benin');
INSERT INTO `geo_countries` VALUES ('84', 'Sierra Leone');
INSERT INTO `geo_countries` VALUES ('85', 'Panama');
INSERT INTO `geo_countries` VALUES ('86', 'Guinea');
INSERT INTO `geo_countries` VALUES ('87', 'Chad');
INSERT INTO `geo_countries` VALUES ('88', 'India');
INSERT INTO `geo_countries` VALUES ('89', 'Costa Rica');
INSERT INTO `geo_countries` VALUES ('90', 'Vietnam');
INSERT INTO `geo_countries` VALUES ('91', 'Burkina Faso');
INSERT INTO `geo_countries` VALUES ('92', 'Trinidad and Tobago');
INSERT INTO `geo_countries` VALUES ('93', 'Cambodia');
INSERT INTO `geo_countries` VALUES ('94', 'Nicaragua');
INSERT INTO `geo_countries` VALUES ('95', 'Mali');
INSERT INTO `geo_countries` VALUES ('96', 'Djibouti');
INSERT INTO `geo_countries` VALUES ('97', 'Guinea-Bissau');
INSERT INTO `geo_countries` VALUES ('98', 'Niger');
INSERT INTO `geo_countries` VALUES ('99', 'Grenada');
INSERT INTO `geo_countries` VALUES ('100', 'Netherlands Antilles');
INSERT INTO `geo_countries` VALUES ('101', 'Myanmar');
INSERT INTO `geo_countries` VALUES ('102', 'Senegal');
INSERT INTO `geo_countries` VALUES ('103', 'Yemen');
INSERT INTO `geo_countries` VALUES ('104', 'Saint Vincent and The Grenadines');
INSERT INTO `geo_countries` VALUES ('105', 'Eritrea');
INSERT INTO `geo_countries` VALUES ('106', 'Barbados');
INSERT INTO `geo_countries` VALUES ('107', 'Honduras');
INSERT INTO `geo_countries` VALUES ('108', 'Gambia');
INSERT INTO `geo_countries` VALUES ('109', 'El Salvador');
INSERT INTO `geo_countries` VALUES ('110', 'Guam');
INSERT INTO `geo_countries` VALUES ('111', 'Saint Lucia');
INSERT INTO `geo_countries` VALUES ('112', 'Guatemala');
INSERT INTO `geo_countries` VALUES ('113', 'Northern Mariana Islands');
INSERT INTO `geo_countries` VALUES ('114', 'Martinique');
INSERT INTO `geo_countries` VALUES ('115', 'Mexico');
INSERT INTO `geo_countries` VALUES ('116', 'Cape Verde');
INSERT INTO `geo_countries` VALUES ('117', 'Laos');
INSERT INTO `geo_countries` VALUES ('118', 'Mauritania');
INSERT INTO `geo_countries` VALUES ('119', 'Dominica');
INSERT INTO `geo_countries` VALUES ('120', 'Guadeloupe');
INSERT INTO `geo_countries` VALUES ('121', 'Belize');
INSERT INTO `geo_countries` VALUES ('122', 'Saudi Arabia');
INSERT INTO `geo_countries` VALUES ('123', 'Oman');
INSERT INTO `geo_countries` VALUES ('124', 'Antigua and Barbuda');
INSERT INTO `geo_countries` VALUES ('125', 'Saint Kitts and Nevis');
INSERT INTO `geo_countries` VALUES ('126', 'Virgin Islands of the United States');
INSERT INTO `geo_countries` VALUES ('127', 'Jamaica');
INSERT INTO `geo_countries` VALUES ('128', 'Dominican Republic');
INSERT INTO `geo_countries` VALUES ('129', 'Puerto Rico');
INSERT INTO `geo_countries` VALUES ('130', 'Haiti');
INSERT INTO `geo_countries` VALUES ('131', 'China');
INSERT INTO `geo_countries` VALUES ('132', 'British Virgin Islands');
INSERT INTO `geo_countries` VALUES ('133', 'Cayman Islands');
INSERT INTO `geo_countries` VALUES ('134', 'Algeria');
INSERT INTO `geo_countries` VALUES ('135', 'Cuba');
INSERT INTO `geo_countries` VALUES ('136', 'Bangladesh');
INSERT INTO `geo_countries` VALUES ('137', 'Bahamas');
INSERT INTO `geo_countries` VALUES ('138', 'Turks and Caicos Islands');
INSERT INTO `geo_countries` VALUES ('139', 'Taiwan');
INSERT INTO `geo_countries` VALUES ('140', 'Western Sahara');
INSERT INTO `geo_countries` VALUES ('141', 'Egypt');
INSERT INTO `geo_countries` VALUES ('142', 'Pakistan');
INSERT INTO `geo_countries` VALUES ('143', 'Libya');
INSERT INTO `geo_countries` VALUES ('144', 'United Arab Emirates');
INSERT INTO `geo_countries` VALUES ('145', 'Japan');
INSERT INTO `geo_countries` VALUES ('146', 'Qatar');
INSERT INTO `geo_countries` VALUES ('147', 'Iran');
INSERT INTO `geo_countries` VALUES ('148', 'Bahrain');
INSERT INTO `geo_countries` VALUES ('149', 'Nepal');
INSERT INTO `geo_countries` VALUES ('150', 'Bhutan');
INSERT INTO `geo_countries` VALUES ('151', 'Spain');
INSERT INTO `geo_countries` VALUES ('152', 'Morocco');
INSERT INTO `geo_countries` VALUES ('153', 'Kuwait');
INSERT INTO `geo_countries` VALUES ('154', 'Jordan');
INSERT INTO `geo_countries` VALUES ('155', 'Israel');
INSERT INTO `geo_countries` VALUES ('156', 'Iraq');
INSERT INTO `geo_countries` VALUES ('157', 'Afghanistan');
INSERT INTO `geo_countries` VALUES ('158', 'Palestine');
INSERT INTO `geo_countries` VALUES ('159', 'Tunisia');
INSERT INTO `geo_countries` VALUES ('160', 'Bermuda');
INSERT INTO `geo_countries` VALUES ('161', 'Syria');
INSERT INTO `geo_countries` VALUES ('162', 'Portugal');
INSERT INTO `geo_countries` VALUES ('163', 'Lebanon');
INSERT INTO `geo_countries` VALUES ('164', 'Korea (South)');
INSERT INTO `geo_countries` VALUES ('165', 'Cyprus');
INSERT INTO `geo_countries` VALUES ('166', 'Greece');
INSERT INTO `geo_countries` VALUES ('167', 'Malta');
INSERT INTO `geo_countries` VALUES ('168', 'Turkey');
INSERT INTO `geo_countries` VALUES ('169', 'Italy');
INSERT INTO `geo_countries` VALUES ('170', 'Uzbekistan');
INSERT INTO `geo_countries` VALUES ('171', 'Tajikistan');
INSERT INTO `geo_countries` VALUES ('172', 'Turkmenistan');
INSERT INTO `geo_countries` VALUES ('173', 'Korea (North)');
INSERT INTO `geo_countries` VALUES ('174', 'Azerbaijan');
INSERT INTO `geo_countries` VALUES ('175', 'Armenia');
INSERT INTO `geo_countries` VALUES ('176', 'Albania');
INSERT INTO `geo_countries` VALUES ('177', 'Kyrgyzstan');
INSERT INTO `geo_countries` VALUES ('178', 'Kazakhstan');
INSERT INTO `geo_countries` VALUES ('179', 'Macedonia');
INSERT INTO `geo_countries` VALUES ('180', 'Georgia');
INSERT INTO `geo_countries` VALUES ('181', 'Russia');
INSERT INTO `geo_countries` VALUES ('182', 'France');
INSERT INTO `geo_countries` VALUES ('183', 'Bulgaria');
INSERT INTO `geo_countries` VALUES ('184', 'Serbia and Montenegro');
INSERT INTO `geo_countries` VALUES ('185', 'Andorra');
INSERT INTO `geo_countries` VALUES ('186', 'Croatia');
INSERT INTO `geo_countries` VALUES ('187', 'Bosnia and Herzegovina');
INSERT INTO `geo_countries` VALUES ('188', 'Mongolia');
INSERT INTO `geo_countries` VALUES ('189', 'Romania');
INSERT INTO `geo_countries` VALUES ('190', 'Monaco');
INSERT INTO `geo_countries` VALUES ('191', 'San Marino');
INSERT INTO `geo_countries` VALUES ('192', 'Ukraine');
INSERT INTO `geo_countries` VALUES ('193', 'Slovenia');
INSERT INTO `geo_countries` VALUES ('194', 'Moldova');
INSERT INTO `geo_countries` VALUES ('195', 'Hungary');
INSERT INTO `geo_countries` VALUES ('196', 'Switzerland');
INSERT INTO `geo_countries` VALUES ('197', 'Austria');
INSERT INTO `geo_countries` VALUES ('198', 'Saint Pierre and Miquelon');
INSERT INTO `geo_countries` VALUES ('199', 'Liechtenstein');
INSERT INTO `geo_countries` VALUES ('200', 'Germany');
INSERT INTO `geo_countries` VALUES ('201', 'Slovakia');
INSERT INTO `geo_countries` VALUES ('202', 'Czech Republic');
INSERT INTO `geo_countries` VALUES ('203', 'Jersey');
INSERT INTO `geo_countries` VALUES ('204', 'Poland');
INSERT INTO `geo_countries` VALUES ('205', 'Guernsey and Alderney');
INSERT INTO `geo_countries` VALUES ('206', 'Luxembourg');
INSERT INTO `geo_countries` VALUES ('207', 'Belgium');
INSERT INTO `geo_countries` VALUES ('208', 'Netherlands');
INSERT INTO `geo_countries` VALUES ('209', 'Ireland');
INSERT INTO `geo_countries` VALUES ('210', 'Belarus');
INSERT INTO `geo_countries` VALUES ('211', 'Lithuania');
INSERT INTO `geo_countries` VALUES ('212', 'Isle of Man');
INSERT INTO `geo_countries` VALUES ('213', 'Denmark');
INSERT INTO `geo_countries` VALUES ('214', 'Sweden');
INSERT INTO `geo_countries` VALUES ('215', 'Latvia');
INSERT INTO `geo_countries` VALUES ('216', 'Estonia');
INSERT INTO `geo_countries` VALUES ('217', 'Norway');
INSERT INTO `geo_countries` VALUES ('218', 'Finland');
INSERT INTO `geo_countries` VALUES ('219', 'Greenland');
INSERT INTO `geo_countries` VALUES ('220', 'Faroe Islands');
INSERT INTO `geo_countries` VALUES ('221', 'Iceland');
INSERT INTO `geo_countries` VALUES ('222', 'Svalbard and Jan Mayen');
INSERT INTO `geo_countries` VALUES ('223', 'United States');
INSERT INTO `geo_countries` VALUES ('224', 'Canada');
INSERT INTO `geo_countries` VALUES ('225', 'United Kingdom');
INSERT INTO `geo_countries` VALUES ('226', 'Australia');

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `grp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `tags` varchar(250) NOT NULL,
  `privacy` tinyint(3) unsigned NOT NULL,
  `videos` tinyint(3) unsigned NOT NULL,
  `forum` tinyint(3) unsigned NOT NULL,
  `icon` bigint(20) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `viewed` bigint(20) unsigned NOT NULL,
  `featured` enum('0','1') NOT NULL,
  `folder` varchar(250) NOT NULL,
  PRIMARY KEY (`grp_id`),
  UNIQUE KEY `folder` (`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------

-- ----------------------------
-- Table structure for `group_forum`
-- ----------------------------
DROP TABLE IF EXISTS `group_forum`;
CREATE TABLE `group_forum` (
  `pst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reply_to` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`pst_id`),
  KEY `mem_id` (`mem_id`),
  KEY `grp_id` (`grp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_forum
-- ----------------------------

-- ----------------------------
-- Table structure for `group_members`
-- ----------------------------
DROP TABLE IF EXISTS `group_members`;
CREATE TABLE `group_members` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `grp_id` (`grp_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_members
-- ----------------------------

-- ----------------------------
-- Table structure for `group_videos`
-- ----------------------------
DROP TABLE IF EXISTS `group_videos`;
CREATE TABLE `group_videos` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  UNIQUE KEY `grp_id` (`grp_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_videos
-- ----------------------------

-- ----------------------------
-- Table structure for `ignores`
-- ----------------------------
DROP TABLE IF EXISTS `ignores`;
CREATE TABLE `ignores` (
  `ign_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ign_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ignores
-- ----------------------------

-- ----------------------------
-- Table structure for `invitations`
-- ----------------------------
DROP TABLE IF EXISTS `invitations`;
CREATE TABLE `invitations` (
  `inv_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `email` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `stat` enum('p','j','f') NOT NULL DEFAULT 'p',
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `pla_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(250) NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `inv_id` (`inv_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitations
-- ----------------------------

-- ----------------------------
-- Table structure for `javascripts`
-- ----------------------------
DROP TABLE IF EXISTS `javascripts`;
CREATE TABLE `javascripts` (
  `page` varchar(50) NOT NULL,
  `onload` text NOT NULL,
  `code` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of javascripts
-- ----------------------------
INSERT INTO `javascripts` VALUES ('all', '', '<script src=\"::URL::/js/CH_ThumbsPreview.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_browse', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_design', '', '<script src=\"::URL::/js/CH_ChannelDesign.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_favorites', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelEdit.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('channels_edit_videos', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_ChannelEdit.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('groups_edit', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('groups_invite', '', '<script src=\"::URL::/js/CH_GroupInvite.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('homepage', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_HomePage.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_comments', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_groups', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_invites', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_responses', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_sent', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('mailbox_shared', '', '<script src=\"::URL::/js/CH_Mailbox.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('playlists_view', '', '<script src=\"::URL::/js/CH_PlaylistView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('search', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('subscriptions', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Subscriptions.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos', '', '<script src=\"::URL::/js/CH_VideosBrowse.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos_respond', '', '<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('videos_view', '', '<script src=\"::URL::/js/AC_RunActiveContent.js\" type=\"text/javascript\"></script><script src=\"::URL::/js/AC_ActiveX.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/zxml.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_Ajax.js\" type=\"text/javascript\"></script>\n<script src=\"::URL::/js/CH_VideoView.js\" type=\"text/javascript\"></script>', 'default');
INSERT INTO `javascripts` VALUES ('', '', '', 'default');

-- ----------------------------
-- Table structure for `mailbox`
-- ----------------------------
DROP TABLE IF EXISTS `mailbox`;
CREATE TABLE `mailbox` (
  `mes_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `mailbox` enum('inbox','shared','invites','comments','responses','groups','sent') NOT NULL DEFAULT 'inbox',
  `viewed` enum('0','1') NOT NULL DEFAULT '0',
  `special` varchar(250) NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`mes_id`),
  KEY `mem_id` (`mem_id`),
  KEY `per_id` (`per_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mailbox
-- ----------------------------

-- ----------------------------
-- Table structure for `mass_mail`
-- ----------------------------
DROP TABLE IF EXISTS `mass_mail`;
CREATE TABLE `mass_mail` (
  `mail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `headers` varchar(250) NOT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mass_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `mem_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `verified` enum('0','1') NOT NULL DEFAULT '0',
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `access_end` bigint(20) NOT NULL,
  `member_type` enum('a','m','u') NOT NULL DEFAULT 'u',
  `diskspace` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('100000', '', 'admin', 'ac48ec59d616758e95e63b08a1689240', 'Nguyen', 'Hai Dang', '1', '0', '0', '0', 'a', '0');

-- ----------------------------
-- Table structure for `memberships`
-- ----------------------------
DROP TABLE IF EXISTS `memberships`;
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of memberships
-- ----------------------------
INSERT INTO `memberships` VALUES ('1', 'Bronzes free', 'Bronzes free', '1', '1', '1');
INSERT INTO `memberships` VALUES ('2', 'Super Membership', 'This is super membership', '1', '1', '1');
INSERT INTO `memberships` VALUES ('3', 'Silver', 'Silver', '1', '1', '1');
INSERT INTO `memberships` VALUES ('4', 'Bronze', 'Bronze', '1', '1', '1');
INSERT INTO `memberships` VALUES ('5', 'Gold', 'Gold', '0', '1', '1');

-- ----------------------------
-- Table structure for `members_settings`
-- ----------------------------
DROP TABLE IF EXISTS `members_settings`;
CREATE TABLE `members_settings` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `hide_location` enum('0','1') NOT NULL DEFAULT '0',
  `hide_gender` enum('0','1') NOT NULL DEFAULT '0',
  `hide_age` enum('0','1') NOT NULL DEFAULT '0',
  `hide_status` enum('0','1') NOT NULL DEFAULT '0',
  `notifications` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members_settings
-- ----------------------------
INSERT INTO `members_settings` VALUES ('100000', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `moderators`
-- ----------------------------
DROP TABLE IF EXISTS `moderators`;
CREATE TABLE `moderators` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `access` text NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moderators
-- ----------------------------

-- ----------------------------
-- Table structure for `mod_session`
-- ----------------------------
DROP TABLE IF EXISTS `mod_session`;
CREATE TABLE `mod_session` (
  `ses_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mod_session
-- ----------------------------

-- ----------------------------
-- Table structure for `network`
-- ----------------------------
DROP TABLE IF EXISTS `network`;
CREATE TABLE `network` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `friends` text NOT NULL,
  `friends_count` bigint(20) unsigned NOT NULL,
  `update` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of network
-- ----------------------------
INSERT INTO `network` VALUES ('100000', ',', '0', '0');

-- ----------------------------
-- Table structure for `newsletter`
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter` (
  `let_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `forced` enum('0','1') NOT NULL DEFAULT '0',
  `send_to` bigint(20) unsigned NOT NULL,
  `complete` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`let_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsletter
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ord_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `refunded` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`ord_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate_amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('1', null, '3', '2', '2', '0.99', '2010-07-14 12:10:14', '1');

-- ----------------------------
-- Table structure for `payment_gateway`
-- ----------------------------
DROP TABLE IF EXISTS `payment_gateway`;
CREATE TABLE `payment_gateway` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` tinyint(3) unsigned NOT NULL,
  `order_name` varchar(250) NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) DEFAULT NULL,
  `recurrent` enum('0','1') DEFAULT NULL,
  `last_paid` bigint(20) unsigned NOT NULL,
  `next_payment` bigint(20) unsigned NOT NULL,
  `period` char(30) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `status` enum('pending','paid') DEFAULT NULL,
  `now` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=334456778 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_gateway
-- ----------------------------

-- ----------------------------
-- Table structure for `playlists`
-- ----------------------------
DROP TABLE IF EXISTS `playlists`;
CREATE TABLE `playlists` (
  `pla_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(250) NOT NULL,
  `privacy` tinyint(3) unsigned NOT NULL,
  `embedding` tinyint(3) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pla_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playlists
-- ----------------------------

-- ----------------------------
-- Table structure for `playlist_videos`
-- ----------------------------
DROP TABLE IF EXISTS `playlist_videos`;
CREATE TABLE `playlist_videos` (
  `pla_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `main` enum('0','1') NOT NULL DEFAULT '0',
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `pla_id` (`pla_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playlist_videos
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_access`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_access`;
CREATE TABLE `presshop_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_access
-- ----------------------------
INSERT INTO `presshop_access` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '2', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '3', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '4', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '5', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '6', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '7', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '8', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '9', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '10', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '11', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '12', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '13', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '14', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '15', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '16', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '17', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '18', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '19', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '20', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '21', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '22', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '23', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '24', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '26', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '27', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '28', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '29', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '30', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '31', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '32', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '33', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '34', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '35', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '36', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '37', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '38', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '39', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '40', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '41', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '42', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '43', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '44', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '46', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '47', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '48', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '49', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '50', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '51', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '52', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '53', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '54', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '55', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '56', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '57', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '58', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '59', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '60', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '61', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '62', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '63', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '64', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '65', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '66', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '67', '1', '1', '1', '1');
INSERT INTO `presshop_access` VALUES ('1', '68', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `presshop_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_accessory`;
CREATE TABLE `presshop_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_accessory
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_address`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_address`;
CREATE TABLE `presshop_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(16) DEFAULT NULL,
  `phone_mobile` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_address
-- ----------------------------
INSERT INTO `presshop_address` VALUES ('1', '21', '5', '0', '1', '0', 'manufacturer', null, 'JOBS', 'STEVE', '1 Infinite Loop', null, '95014', 'Cupertino', null, '(800) 275-2273', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53', '1', '0');
INSERT INTO `presshop_address` VALUES ('2', '8', '0', '1', '0', '0', 'Mon adresse', 'My Company', 'DOE', 'John', '16, Main street', '2nd floor', '75000', 'Paris ', null, '0102030405', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53', '1', '0');
INSERT INTO `presshop_address` VALUES ('3', '222', '0', '2', '0', '0', 'My address', '', 'nam', 'nam', 'aaaaa', '', '10000', 'ha noi', '', '', '', '2010-07-03 03:40:43', '2010-07-03 03:40:43', '1', '0');
INSERT INTO `presshop_address` VALUES ('4', '4', '54', '3', '0', '0', 'Mon adresse', 'XemmeX', 'May Webber', 'Michael', '840A, John-West', '', 'G1V 3E1', 'Québec', '', '', '', '2010-07-06 22:35:14', '2010-07-06 22:35:14', '1', '0');
INSERT INTO `presshop_address` VALUES ('5', '222', '0', '4', '0', '0', 'lethitham', 'Test', 'le', 'tham', '306/27 Nguyen Thai SOn', '', '70000', 'HCM', '', '', '', '2010-07-07 01:46:25', '2010-07-07 01:46:25', '1', '0');

-- ----------------------------
-- Table structure for `presshop_alias`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_alias`;
CREATE TABLE `presshop_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_alias
-- ----------------------------
INSERT INTO `presshop_alias` VALUES ('4', 'piod', 'ipod', '1');
INSERT INTO `presshop_alias` VALUES ('3', 'ipdo', 'ipod', '1');

-- ----------------------------
-- Table structure for `presshop_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attachment`;
CREATE TABLE `presshop_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `mime` varchar(32) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_attachment_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attachment_lang`;
CREATE TABLE `presshop_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attachment_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attribute`;
CREATE TABLE `presshop_attribute` (
  `id_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attribute
-- ----------------------------
INSERT INTO `presshop_attribute` VALUES ('1', '1', null);
INSERT INTO `presshop_attribute` VALUES ('2', '1', null);
INSERT INTO `presshop_attribute` VALUES ('8', '1', null);
INSERT INTO `presshop_attribute` VALUES ('9', '1', null);
INSERT INTO `presshop_attribute` VALUES ('10', '3', null);
INSERT INTO `presshop_attribute` VALUES ('11', '3', null);
INSERT INTO `presshop_attribute` VALUES ('12', '1', null);
INSERT INTO `presshop_attribute` VALUES ('13', '1', null);
INSERT INTO `presshop_attribute` VALUES ('3', '2', '#D2D6D5');
INSERT INTO `presshop_attribute` VALUES ('4', '2', '#008CB7');
INSERT INTO `presshop_attribute` VALUES ('5', '2', '#F3349E');
INSERT INTO `presshop_attribute` VALUES ('6', '2', '#93D52D');
INSERT INTO `presshop_attribute` VALUES ('7', '2', '#FD9812');
INSERT INTO `presshop_attribute` VALUES ('15', '1', '');
INSERT INTO `presshop_attribute` VALUES ('16', '1', '');
INSERT INTO `presshop_attribute` VALUES ('17', '1', '');
INSERT INTO `presshop_attribute` VALUES ('18', '2', '#7800F0');
INSERT INTO `presshop_attribute` VALUES ('19', '2', '#F6EF04');
INSERT INTO `presshop_attribute` VALUES ('20', '2', '#F60409');
INSERT INTO `presshop_attribute` VALUES ('14', '2', '#000000');

-- ----------------------------
-- Table structure for `presshop_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attribute_group`;
CREATE TABLE `presshop_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attribute_group
-- ----------------------------
INSERT INTO `presshop_attribute_group` VALUES ('1', '0');
INSERT INTO `presshop_attribute_group` VALUES ('2', '1');
INSERT INTO `presshop_attribute_group` VALUES ('3', '0');

-- ----------------------------
-- Table structure for `presshop_attribute_group_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attribute_group_lang`;
CREATE TABLE `presshop_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attribute_group_lang
-- ----------------------------
INSERT INTO `presshop_attribute_group_lang` VALUES ('1', '1', 'Disk space', 'Disk space');
INSERT INTO `presshop_attribute_group_lang` VALUES ('1', '2', 'Capacité', 'Capacité');
INSERT INTO `presshop_attribute_group_lang` VALUES ('2', '1', 'Color', 'Color');
INSERT INTO `presshop_attribute_group_lang` VALUES ('2', '2', 'Couleur', 'Couleur');
INSERT INTO `presshop_attribute_group_lang` VALUES ('3', '1', 'ICU', 'Processor');
INSERT INTO `presshop_attribute_group_lang` VALUES ('3', '2', 'ICU', 'Processeur');

-- ----------------------------
-- Table structure for `presshop_attribute_impact`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attribute_impact`;
CREATE TABLE `presshop_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` float NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attribute_impact
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_attribute_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_attribute_lang`;
CREATE TABLE `presshop_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_attribute_lang
-- ----------------------------
INSERT INTO `presshop_attribute_lang` VALUES ('1', '1', '2GB');
INSERT INTO `presshop_attribute_lang` VALUES ('1', '2', '2Go');
INSERT INTO `presshop_attribute_lang` VALUES ('2', '1', '4GB');
INSERT INTO `presshop_attribute_lang` VALUES ('2', '2', '4Go');
INSERT INTO `presshop_attribute_lang` VALUES ('3', '1', 'Metal');
INSERT INTO `presshop_attribute_lang` VALUES ('3', '2', 'Metal');
INSERT INTO `presshop_attribute_lang` VALUES ('4', '1', 'Blue');
INSERT INTO `presshop_attribute_lang` VALUES ('4', '2', 'Bleu');
INSERT INTO `presshop_attribute_lang` VALUES ('5', '1', 'Pink');
INSERT INTO `presshop_attribute_lang` VALUES ('5', '2', 'Rose');
INSERT INTO `presshop_attribute_lang` VALUES ('6', '1', 'Green');
INSERT INTO `presshop_attribute_lang` VALUES ('6', '2', 'Vert');
INSERT INTO `presshop_attribute_lang` VALUES ('7', '1', 'Orange');
INSERT INTO `presshop_attribute_lang` VALUES ('7', '2', 'Orange');
INSERT INTO `presshop_attribute_lang` VALUES ('8', '1', 'Optional 64GB solid-state drive');
INSERT INTO `presshop_attribute_lang` VALUES ('8', '2', 'Disque dur SSD (solid-state drive) de 64 Go ');
INSERT INTO `presshop_attribute_lang` VALUES ('9', '1', '80GB Parallel ATA Drive @ 4200 rpm');
INSERT INTO `presshop_attribute_lang` VALUES ('9', '2', 'Disque dur PATA de 80 Go à 4 200 tr/min');
INSERT INTO `presshop_attribute_lang` VALUES ('10', '1', '1.60GHz Intel Core 2 Duo');
INSERT INTO `presshop_attribute_lang` VALUES ('10', '2', 'Intel Core 2 Duo à 1,6 GHz');
INSERT INTO `presshop_attribute_lang` VALUES ('11', '1', '1.80GHz Intel Core 2 Duo');
INSERT INTO `presshop_attribute_lang` VALUES ('11', '2', 'Intel Core 2 Duo à 1,8 GHz');
INSERT INTO `presshop_attribute_lang` VALUES ('12', '1', '80GB: 20,000 Songs');
INSERT INTO `presshop_attribute_lang` VALUES ('12', '2', '80 Go : 20 000 chansons');
INSERT INTO `presshop_attribute_lang` VALUES ('13', '1', '160GB: 40,000 Songs');
INSERT INTO `presshop_attribute_lang` VALUES ('13', '2', '160 Go : 40 000 chansons');
INSERT INTO `presshop_attribute_lang` VALUES ('14', '2', 'Noir');
INSERT INTO `presshop_attribute_lang` VALUES ('14', '1', 'Black');
INSERT INTO `presshop_attribute_lang` VALUES ('15', '1', '8Go');
INSERT INTO `presshop_attribute_lang` VALUES ('15', '2', '8Go');
INSERT INTO `presshop_attribute_lang` VALUES ('16', '1', '16Go');
INSERT INTO `presshop_attribute_lang` VALUES ('16', '2', '16Go');
INSERT INTO `presshop_attribute_lang` VALUES ('17', '1', '32Go');
INSERT INTO `presshop_attribute_lang` VALUES ('17', '2', '32Go');
INSERT INTO `presshop_attribute_lang` VALUES ('18', '1', 'Purple');
INSERT INTO `presshop_attribute_lang` VALUES ('18', '2', 'Violet');
INSERT INTO `presshop_attribute_lang` VALUES ('19', '1', 'Yellow');
INSERT INTO `presshop_attribute_lang` VALUES ('19', '2', 'Jaune');
INSERT INTO `presshop_attribute_lang` VALUES ('20', '1', 'Red');
INSERT INTO `presshop_attribute_lang` VALUES ('20', '2', 'Rouge');

-- ----------------------------
-- Table structure for `presshop_block_cms`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_block_cms`;
CREATE TABLE `presshop_block_cms` (
  `id_block` int(10) unsigned NOT NULL,
  `id_cms` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_block`,`id_cms`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_block_cms
-- ----------------------------
INSERT INTO `presshop_block_cms` VALUES ('12', '1');
INSERT INTO `presshop_block_cms` VALUES ('12', '2');
INSERT INTO `presshop_block_cms` VALUES ('12', '3');
INSERT INTO `presshop_block_cms` VALUES ('12', '4');
INSERT INTO `presshop_block_cms` VALUES ('23', '3');
INSERT INTO `presshop_block_cms` VALUES ('23', '4');

-- ----------------------------
-- Table structure for `presshop_carrier`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_carrier`;
CREATE TABLE `presshop_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tax` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax` (`id_tax`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_carrier
-- ----------------------------
INSERT INTO `presshop_carrier` VALUES ('1', '0', '0', null, '1', '0', '0', '0', '0');
INSERT INTO `presshop_carrier` VALUES ('2', '1', 'My carrier', null, '1', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for `presshop_carrier_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_carrier_group`;
CREATE TABLE `presshop_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_carrier` (`id_carrier`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_carrier_group
-- ----------------------------
INSERT INTO `presshop_carrier_group` VALUES ('1', '1');
INSERT INTO `presshop_carrier_group` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `presshop_carrier_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_carrier_lang`;
CREATE TABLE `presshop_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  UNIQUE KEY `shipper_lang_index` (`id_lang`,`id_carrier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_carrier_lang
-- ----------------------------
INSERT INTO `presshop_carrier_lang` VALUES ('1', '1', 'Pick up in-store');
INSERT INTO `presshop_carrier_lang` VALUES ('1', '2', 'Retrait au magasin');
INSERT INTO `presshop_carrier_lang` VALUES ('2', '1', 'Delivery next day!');
INSERT INTO `presshop_carrier_lang` VALUES ('2', '2', 'Livraison le lendemain !');

-- ----------------------------
-- Table structure for `presshop_carrier_zone`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_carrier_zone`;
CREATE TABLE `presshop_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_carrier_zone
-- ----------------------------
INSERT INTO `presshop_carrier_zone` VALUES ('1', '1');
INSERT INTO `presshop_carrier_zone` VALUES ('2', '1');
INSERT INTO `presshop_carrier_zone` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `presshop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_cart`;
CREATE TABLE `presshop_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_cart
-- ----------------------------
INSERT INTO `presshop_cart` VALUES ('1', '2', '2', '6', '6', '1', '1', '1', '1', '0', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_cart` VALUES ('2', '0', '2', '0', '0', '2', '0', '3', '1', '0', '', '2010-07-01 10:33:00', '2010-07-01 10:58:58');
INSERT INTO `presshop_cart` VALUES ('3', '0', '1', '3', '3', '2', '2', '5', '1', '0', '', '2010-07-02 09:49:47', '2010-07-04 10:44:59');
INSERT INTO `presshop_cart` VALUES ('5', '0', '2', '0', '0', '2', '0', '26', '1', '0', '', '2010-07-06 22:14:52', '2010-07-06 23:40:20');
INSERT INTO `presshop_cart` VALUES ('4', '0', '1', '0', '0', '2', '0', '17', '1', '0', '', '2010-07-04 03:48:52', '2010-07-04 03:48:52');
INSERT INTO `presshop_cart` VALUES ('6', '0', '2', '4', '4', '2', '3', '27', '1', '0', '', '2010-07-06 22:23:21', '2010-07-06 22:35:14');
INSERT INTO `presshop_cart` VALUES ('7', '0', '1', '5', '5', '2', '4', '30', '1', '0', '', '2010-07-07 01:04:52', '2010-07-07 05:38:12');
INSERT INTO `presshop_cart` VALUES ('8', '0', '1', '0', '0', '2', '0', '31', '1', '0', '', '2010-07-07 02:48:12', '2010-07-07 02:51:51');
INSERT INTO `presshop_cart` VALUES ('9', '0', '2', '0', '0', '2', '0', '33', '1', '0', '', '2010-07-07 09:31:33', '2010-07-07 09:31:46');
INSERT INTO `presshop_cart` VALUES ('10', '0', '2', '0', '0', '2', '0', '36', '1', '0', '', '2010-07-07 14:48:46', '2010-07-07 14:48:46');
INSERT INTO `presshop_cart` VALUES ('11', '0', '2', '0', '0', '2', '0', '35', '1', '0', '', '2010-07-07 22:17:57', '2010-07-07 22:17:57');
INSERT INTO `presshop_cart` VALUES ('12', '0', '1', '0', '0', '2', '0', '23', '1', '0', '', '2010-07-08 03:46:05', '2010-07-08 03:46:05');

-- ----------------------------
-- Table structure for `presshop_cart_discount`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_cart_discount`;
CREATE TABLE `presshop_cart_discount` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  KEY `cart_discount_index` (`id_cart`,`id_discount`),
  KEY `id_discount` (`id_discount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_cart_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_cart_product`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_cart_product`;
CREATE TABLE `presshop_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  KEY `cart_product_index` (`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_cart_product
-- ----------------------------
INSERT INTO `presshop_cart_product` VALUES ('7', '11', '0', '1', '2010-07-07 05:40:01');
INSERT INTO `presshop_cart_product` VALUES ('6', '10', '0', '1', '2010-07-06 22:35:52');
INSERT INTO `presshop_cart_product` VALUES ('3', '10', '0', '1', '2010-07-07 01:59:37');
INSERT INTO `presshop_cart_product` VALUES ('3', '12', '0', '1', '2010-07-07 01:59:43');
INSERT INTO `presshop_cart_product` VALUES ('3', '11', '0', '1', '2010-07-07 01:59:34');
INSERT INTO `presshop_cart_product` VALUES ('9', '13', '0', '1', '2010-07-07 10:19:27');
INSERT INTO `presshop_cart_product` VALUES ('10', '14', '0', '1', '2010-07-07 14:48:46');
INSERT INTO `presshop_cart_product` VALUES ('11', '10', '0', '1', '2010-07-07 22:17:57');
INSERT INTO `presshop_cart_product` VALUES ('12', '10', '0', '20', '2010-07-08 03:46:05');
INSERT INTO `presshop_cart_product` VALUES ('12', '14', '0', '6', '2010-07-08 03:47:03');
INSERT INTO `presshop_cart_product` VALUES ('12', '13', '0', '1', '2010-07-08 03:47:20');
INSERT INTO `presshop_cart_product` VALUES ('12', '12', '0', '1', '2010-07-08 03:47:34');
INSERT INTO `presshop_cart_product` VALUES ('12', '11', '0', '10', '2010-07-08 03:55:43');

-- ----------------------------
-- Table structure for `presshop_category`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_category`;
CREATE TABLE `presshop_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_category
-- ----------------------------
INSERT INTO `presshop_category` VALUES ('1', '0', '0', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_category` VALUES ('6', '1', '1', '1', '2010-07-06 21:07:58', '2010-07-06 21:07:58');
INSERT INTO `presshop_category` VALUES ('5', '1', '1', '1', '2010-07-06 21:02:04', '2010-07-06 21:02:04');
INSERT INTO `presshop_category` VALUES ('7', '1', '1', '1', '2010-07-06 21:10:47', '2010-07-06 21:10:47');

-- ----------------------------
-- Table structure for `presshop_category_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_category_group`;
CREATE TABLE `presshop_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  KEY `category_group_index` (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_category_group
-- ----------------------------
INSERT INTO `presshop_category_group` VALUES ('1', '1');
INSERT INTO `presshop_category_group` VALUES ('5', '1');
INSERT INTO `presshop_category_group` VALUES ('6', '1');
INSERT INTO `presshop_category_group` VALUES ('7', '1');

-- ----------------------------
-- Table structure for `presshop_category_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_category_lang`;
CREATE TABLE `presshop_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `category_lang_index` (`id_category`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_category_lang
-- ----------------------------
INSERT INTO `presshop_category_lang` VALUES ('1', '1', 'Home', '', 'home', null, null, null);
INSERT INTO `presshop_category_lang` VALUES ('1', '2', 'Accueil', '', 'home', null, null, null);
INSERT INTO `presshop_category_lang` VALUES ('5', '1', 'Online conference ', 'Conference to be viewed online', 'online-conference-', 'Online conference ', 'conference online', 'Conference to be viewed online');
INSERT INTO `presshop_category_lang` VALUES ('5', '2', 'Conférence en ligne', 'Conférence que vous pouvez écouter en ligne.', 'conference-en-ligne', 'Conférence en ligne', 'conférence', 'Conférence que vous pouvez écouter en ligne.');
INSERT INTO `presshop_category_lang` VALUES ('6', '1', 'Books', 'Books to be buy that is about our speakers', 'books', 'Book', 'books', 'Books to be buy that is about our speakers');
INSERT INTO `presshop_category_lang` VALUES ('6', '2', 'Livre', 'Vente de livre', 'livre', 'Livre', 'livre', 'Vente de livre');
INSERT INTO `presshop_category_lang` VALUES ('7', '1', 'CD', 'CD to be buy that is about our speakers', 'cd', 'CD', 'CD', 'CD to be buy that is about our speakers');
INSERT INTO `presshop_category_lang` VALUES ('7', '2', 'CD', 'CD à vendre', 'cd', 'CD', 'CD', 'CD à vendre');

-- ----------------------------
-- Table structure for `presshop_category_product`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_category_product`;
CREATE TABLE `presshop_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `category_product_index` (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_category_product
-- ----------------------------
INSERT INTO `presshop_category_product` VALUES ('6', '14', '3');
INSERT INTO `presshop_category_product` VALUES ('6', '13', '2');
INSERT INTO `presshop_category_product` VALUES ('6', '11', '0');
INSERT INTO `presshop_category_product` VALUES ('6', '12', '1');
INSERT INTO `presshop_category_product` VALUES ('7', '10', '0');

-- ----------------------------
-- Table structure for `presshop_cms`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_cms`;
CREATE TABLE `presshop_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cms`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_cms
-- ----------------------------
INSERT INTO `presshop_cms` VALUES ('1');
INSERT INTO `presshop_cms` VALUES ('2');
INSERT INTO `presshop_cms` VALUES ('3');
INSERT INTO `presshop_cms` VALUES ('4');
INSERT INTO `presshop_cms` VALUES ('5');

-- ----------------------------
-- Table structure for `presshop_cms_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_cms_lang`;
CREATE TABLE `presshop_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_cms_lang
-- ----------------------------
INSERT INTO `presshop_cms_lang` VALUES ('1', '1', 'Delivery', 'Our terms and conditions of delivery', 'conditions, delivery, delay, shipment, pack', '<h2>Shipments and returns</h2>\r\n<h3>Your pack shipment</h3>\r\n<p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via parcel without tracking and drop-off without signature of Canada Post. If you prefer delivery by Parcel Express with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p>\r\n<p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>', 'delivery');
INSERT INTO `presshop_cms_lang` VALUES ('1', '2', 'Livraison', 'Nos conditions générales de livraison', 'conditions, livraison, délais, transport, colis', '<h2>Livraisons et retours</h2>\r\n<h3>Le transport de votre colis</h3>\r\n<p>Les colis sont g&eacute;n&eacute;ralement exp&eacute;di&eacute;s en 48h apr&egrave;s r&eacute;ception de votre paiement. Le mode d\'exp&eacute;didition standard est le colis sans suivi, remis sans signature de Postes Canada. Si vous souhaitez une remise avec signature, un co&ucirc;t suppl&eacute;mentaire s\'applique, merci de nous contacter. Quel que soit le mode d\'exp&eacute;dition choisi, nous vous fournirons d&egrave;s que possible un lien qui vous permettra de suivre en ligne la livraison de votre colis, le cas &eacute;ch&eacute;an.</p>\r\n<p>Les frais d\'exp&eacute;dition comprennent l\'emballage, la manutention et les frais postaux. Ils peuvent contenir une partie fixe et une partie variable en fonction du prix ou du poids de votre commande. Nous vous conseillons de regrouper vos achats en une unique commande. Nous ne pouvons pas grouper deux commandes distinctes et vous devrez vous acquitter des frais de port pour chacune d\'entre elles. Votre colis est exp&eacute;di&eacute; &agrave; vos propres risques, un soin particulier est apport&eacute; au colis contenant des produits fragiles..<br /><br />Les colis sont surdimensionn&eacute;s et prot&eacute;g&eacute;s.</p>', 'livraison');
INSERT INTO `presshop_cms_lang` VALUES ('2', '1', 'Legal Notice', 'Legal notice', 'notice, legal, credits', '<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>', 'legal-notice');
INSERT INTO `presshop_cms_lang` VALUES ('2', '2', 'Mentions légales', 'Mentions légales', 'mentions, légales, crédits', '<h2>Mentions l&eacute;gales</h2><h3>Cr&eacute;dits</h3><p>Concept et production :</p><p>Ce site internet a &eacute;t&eacute; r&eacute;alis&eacute; en utilisant la solution open-source <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; .</p>', 'mentions-legales');
INSERT INTO `presshop_cms_lang` VALUES ('3', '1', 'Terms and conditions of use', 'Our terms and conditions of use', 'conditions, terms, use, sell', '<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>', 'terms-and-conditions-of-use');
INSERT INTO `presshop_cms_lang` VALUES ('3', '2', 'Conditions d\'utilisation', 'Nos conditions générales de ventes', 'conditions, utilisation, générales, ventes', '<h2>Vos conditions de ventes</h2><h3>Règle n°1</h3><p>Contenu de la règle numéro 1</p>\r\n<h3>Règle n°2</h3><p>Contenu de la règle numéro 2</p>\r\n<h3>Règle n°3</h3><p>Contenu de la règle numéro 3</p>', 'conditions-generales-de-ventes');
INSERT INTO `presshop_cms_lang` VALUES ('4', '1', 'About us', 'Learn more about us', 'about us, informations', '<h2>About us</h2>\r\n<h3>Our company</h3>\r\n<p>Our company</p>\r\n<h3>Our team</h3>\r\n<p>Our team</p>\r\n<h3>Informations</h3>\r\n<p>Informations</p>', 'about-us');
INSERT INTO `presshop_cms_lang` VALUES ('4', '2', 'A propos', 'Apprenez-en d\'avantage sur nous', 'à propos, informations', '<h2>A propos</h2>\r\n<h3>Notre entreprise</h3>\r\n<p>Confor.ca  vous est offert par le Groupe Confor, une soci&eacute;t&eacute; qu&eacute;b&eacute;coise oeuvrant dans le  domaine des communications depuis plus de deux ans.</p>\r\n<h3>Notre &eacute;quipe</h3>\r\n<p>Notre &eacute;quipe</p>\r\n<h3>Informations</h3>\r\n<p>Informations</p>', 'a-propos');
INSERT INTO `presshop_cms_lang` VALUES ('5', '1', 'Secure payment', 'Our secure payment mean', 'secure payment, ssl, visa, mastercard, paypal', '<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>', 'secure-payment');
INSERT INTO `presshop_cms_lang` VALUES ('5', '2', 'Paiement sécurisé', 'Notre offre de paiement sécurisé', 'paiement sécurisé, ssl, visa, mastercard, paypal', '<h2>Paiement sécurisé</h2>\r\n<h3>Notre offre de paiement sécurisé</h3><p>Avec SSL</p>\r\n<h3>Utilisation de Visa/Mastercard/Paypal</h3><p>A propos de ces services</p>', 'paiement-securise');

-- ----------------------------
-- Table structure for `presshop_configuration`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_configuration`;
CREATE TABLE `presshop_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_configuration
-- ----------------------------
INSERT INTO `presshop_configuration` VALUES ('1', 'PS_LANG_DEFAULT', '2', '2010-06-30 10:43:53', '2010-07-07 19:29:38');
INSERT INTO `presshop_configuration` VALUES ('2', 'PS_CURRENCY_DEFAULT', '2', '2010-06-30 10:43:53', '2010-06-30 11:15:29');
INSERT INTO `presshop_configuration` VALUES ('3', 'PS_COUNTRY_DEFAULT', '4', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('4', 'PS_REWRITING_SETTINGS', '0', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('5', 'PS_ORDER_OUT_OF_STOCK', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('6', 'PS_LAST_QTIES', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('7', 'PS_CART_REDIRECT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('8', 'PS_HELPBOX', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('9', 'PS_CONDITIONS', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('10', 'PS_RECYCLABLE_PACK', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('11', 'PS_GIFT_WRAPPING', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('12', 'PS_GIFT_WRAPPING_PRICE', '0', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('13', 'PS_STOCK_MANAGEMENT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('14', 'PS_NAVIGATION_PIPE', '>', '2010-06-30 10:43:53', '2010-07-07 19:23:01');
INSERT INTO `presshop_configuration` VALUES ('15', 'PS_PRODUCTS_PER_PAGE', '10', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('16', 'PS_PURCHASE_MINIMUM', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('17', 'PS_PRODUCTS_ORDER_WAY', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('18', 'PS_PRODUCTS_ORDER_BY', '4', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('19', 'PS_DISPLAY_QTIES', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('20', 'PS_SHIPPING_HANDLING', '2', '2010-06-30 10:43:53', '2010-07-07 01:10:56');
INSERT INTO `presshop_configuration` VALUES ('21', 'PS_SHIPPING_FREE_PRICE', '300', '2010-06-30 10:43:53', '2010-07-07 01:10:56');
INSERT INTO `presshop_configuration` VALUES ('22', 'PS_SHIPPING_FREE_WEIGHT', '20', '2010-06-30 10:43:53', '2010-07-07 01:10:56');
INSERT INTO `presshop_configuration` VALUES ('23', 'PS_SHIPPING_METHOD', '0', '2010-06-30 10:43:53', '2010-07-07 01:10:56');
INSERT INTO `presshop_configuration` VALUES ('24', 'PS_TAX', '1', '2010-06-30 10:43:53', '2010-07-07 02:25:38');
INSERT INTO `presshop_configuration` VALUES ('25', 'PS_SHOP_ENABLE', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('26', 'PS_NB_DAYS_NEW_PRODUCT', '20', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('27', 'PS_SSL_ENABLED', '0', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('28', 'PS_WEIGHT_UNIT', 'kg', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('29', 'PS_BLOCK_CART_AJAX', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('30', 'PS_ORDER_RETURN', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('31', 'PS_ORDER_RETURN_NB_DAYS', '7', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('32', 'PS_MAIL_TYPE', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('33', 'PS_PRODUCT_PICTURE_MAX_SIZE', '131072', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('34', 'PS_PRODUCT_PICTURE_WIDTH', '64', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('35', 'PS_PRODUCT_PICTURE_HEIGHT', '64', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('36', 'PS_INVOICE_PREFIX', 'IN', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('37', 'PS_INVOICE_NUMBER', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('38', 'PS_DELIVERY_PREFIX', 'DE', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('39', 'PS_DELIVERY_NUMBER', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('40', 'PS_INVOICE', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('41', 'PS_PASSWD_TIME_BACK', '360', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('42', 'PS_PASSWD_TIME_FRONT', '360', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('43', 'PS_DISP_UNAVAILABLE_ATTR', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('44', 'PS_VOUCHERS', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('45', 'PS_SEARCH_MINWORDLEN', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('46', 'PS_SEARCH_BLACKLIST', '', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('47', 'PS_SEARCH_WEIGHT_PNAME', '6', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('48', 'PS_SEARCH_WEIGHT_REF', '10', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('49', 'PS_SEARCH_WEIGHT_SHORTDESC', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('50', 'PS_SEARCH_WEIGHT_DESC', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('51', 'PS_SEARCH_WEIGHT_CNAME', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('52', 'PS_SEARCH_WEIGHT_MNAME', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('53', 'PS_SEARCH_WEIGHT_TAG', '4', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('54', 'PS_SEARCH_WEIGHT_ATTRIBUTE', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('55', 'PS_SEARCH_WEIGHT_FEATURE', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('56', 'PS_SEARCH_AJAX', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('57', 'PS_TIMEZONE', '158', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('58', 'PS_THEME_V11', '0', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('59', 'PRESTASTORE_LIVE', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('60', 'PS_TIN_ACTIVE', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('61', 'PS_SHOW_ALL_MODULES', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('62', 'PS_BACKUP_ALL', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('63', 'PS_1_3_UPDATE_DATE', '2010-06-30 10:43:53', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('64', 'PS_PRICE_ROUND_MODE', '2', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('65', 'PS_CARRIER_DEFAULT', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('66', 'PAYPAL_BUSINESS', 'paypal@prestashop.com', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('67', 'PAYPAL_SANDBOX', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('68', 'PAYPAL_CURRENCY', 'customer', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('69', 'BANK_WIRE_CURRENCIES', '2,1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('70', 'CHEQUE_CURRENCIES', '2,1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('71', 'PRODUCTS_VIEWED_NBR', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('72', 'BLOCK_CATEG_DHTML', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('73', 'BLOCK_CATEG_MAX_DEPTH', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('74', 'MANUFACTURER_DISPLAY_FORM', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('75', 'MANUFACTURER_DISPLAY_TEXT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('76', 'MANUFACTURER_DISPLAY_TEXT_NB', '5', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('77', 'NEW_PRODUCTS_NBR', '5', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('78', 'STATSHOME_YEAR_FROM', '2010', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('79', 'STATSHOME_MONTH_FROM', '06', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('80', 'STATSHOME_DAY_FROM', '30', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('81', 'STATSHOME_YEAR_TO', '2010', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('82', 'STATSHOME_MONTH_TO', '06', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('83', 'STATSHOME_DAY_TO', '30', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('84', 'PS_TOKEN_ENABLE', '1', '2010-06-30 10:43:53', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('85', 'PS_STATS_RENDER', 'graphxmlswfcharts', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('86', 'PS_STATS_OLD_CONNECT_AUTO_CLEAN', 'never', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('87', 'PS_STATS_GRID_RENDER', 'gridextjs', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('88', 'BLOCKTAGS_NBR', '10', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('89', 'CHECKUP_DESCRIPTIONS_LT', '100', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('90', 'CHECKUP_DESCRIPTIONS_GT', '400', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('91', 'CHECKUP_IMAGES_LT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('92', 'CHECKUP_IMAGES_GT', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('93', 'CHECKUP_SALES_LT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('94', 'CHECKUP_SALES_GT', '2', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('95', 'CHECKUP_STOCK_LT', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('96', 'CHECKUP_STOCK_GT', '3', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('97', 'PS_SHOP_NAME', 'Boutique Confor.ca', '2010-06-30 10:47:18', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('98', 'PS_SHOP_EMAIL', 'admin@conferences-formations.com', '2010-06-30 10:47:18', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('99', 'PS_MAIL_METHOD', '1', '2010-06-30 10:47:18', '2010-06-30 10:47:18');
INSERT INTO `presshop_configuration` VALUES ('100', 'PS_LOGO', '', '2010-06-30 16:59:35', '2010-07-07 19:23:01');
INSERT INTO `presshop_configuration` VALUES ('101', 'PS_FAVICON', '', '2010-06-30 16:59:35', '2010-07-07 19:23:01');
INSERT INTO `presshop_configuration` VALUES ('102', 'PS_BASE_URI', '/prestashop/', '2010-06-30 17:00:13', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('103', 'PS_MAINTENANCE_IP', '', '2010-06-30 17:00:13', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('104', 'PS_GIFT_WRAPPING_TAX', '0', '2010-06-30 17:00:13', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('105', 'PS_CART_FOLLOWING', '0', '2010-06-30 17:00:13', '2010-06-30 17:00:13');
INSERT INTO `presshop_configuration` VALUES ('106', 'PS_SHOP_DETAILS', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('107', 'PS_SHOP_ADDR1', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('108', 'PS_SHOP_ADDR2', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('109', 'PS_SHOP_CODE', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('110', 'PS_SHOP_CITY', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('111', 'PS_SHOP_STATE', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('112', 'PS_SHOP_COUNTRY', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('113', 'PS_SHOP_PHONE', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('114', 'PS_SHOP_FAX', '', '2010-07-07 19:26:19', '2010-07-07 19:26:19');
INSERT INTO `presshop_configuration` VALUES ('115', 'PS_PDF_ENCODING_FR', 'cp1250', '2010-07-07 19:28:54', '2010-07-07 19:28:54');
INSERT INTO `presshop_configuration` VALUES ('116', 'PS_PDF_FONT_FR', 'helvetica', '2010-07-07 19:28:54', '2010-07-07 19:28:54');

-- ----------------------------
-- Table structure for `presshop_configuration_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_configuration_lang`;
CREATE TABLE `presshop_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_configuration_lang
-- ----------------------------
INSERT INTO `presshop_configuration_lang` VALUES ('36', '1', 'IN', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('36', '2', 'FA', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('38', '1', 'DE', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('38', '2', 'LI', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('46', '1', 'a|the|of|on|in|and|to', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('46', '2', 'le|les|de|et|en|des|les|une', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_connections`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_connections`;
CREATE TABLE `presshop_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_connections
-- ----------------------------
INSERT INTO `presshop_connections` VALUES ('1', '1', '1', '2130706433', '2010-06-30 10:43:53', 'http://www.prestashop.com');
INSERT INTO `presshop_connections` VALUES ('2', '2', '1', '2111079152', '2010-06-30 16:50:08', '');
INSERT INTO `presshop_connections` VALUES ('3', '3', '1', '415986775', '2010-06-30 16:51:22', '');
INSERT INTO `presshop_connections` VALUES ('4', '4', '1', '1984389664', '2010-06-30 14:09:17', '');
INSERT INTO `presshop_connections` VALUES ('5', '5', '1', '2147483647', '2010-07-01 00:30:51', '');
INSERT INTO `presshop_connections` VALUES ('6', '2', '1', '2064972877', '2010-07-01 08:38:46', '');
INSERT INTO `presshop_connections` VALUES ('7', '6', '1', '2064972877', '2010-07-01 09:34:12', '');
INSERT INTO `presshop_connections` VALUES ('8', '4', '1', '1984389664', '2010-07-01 10:04:59', '');
INSERT INTO `presshop_connections` VALUES ('9', '3', '1', '415986775', '2010-07-01 10:31:42', '');
INSERT INTO `presshop_connections` VALUES ('10', '7', '8', '415986775', '2010-07-01 10:33:49', '');
INSERT INTO `presshop_connections` VALUES ('11', '8', '8', '415986775', '2010-07-01 10:34:05', '');
INSERT INTO `presshop_connections` VALUES ('12', '9', '8', '415986775', '2010-07-01 10:34:49', '');
INSERT INTO `presshop_connections` VALUES ('13', '10', '1', '415986775', '2010-07-01 10:35:45', '');
INSERT INTO `presshop_connections` VALUES ('14', '6', '1', '2064972877', '2010-07-01 10:39:22', '');
INSERT INTO `presshop_connections` VALUES ('15', '2', '1', '2064971462', '2010-07-02 09:23:57', '');
INSERT INTO `presshop_connections` VALUES ('16', '10', '1', '415986775', '2010-07-02 10:56:53', '');
INSERT INTO `presshop_connections` VALUES ('17', '11', '15', '2064971462', '2010-07-02 11:08:43', '');
INSERT INTO `presshop_connections` VALUES ('18', '4', '1', '1984389664', '2010-07-02 12:29:43', '');
INSERT INTO `presshop_connections` VALUES ('19', '5', '1', '985339025', '2010-07-02 12:31:15', '');
INSERT INTO `presshop_connections` VALUES ('20', '12', '16', '415986775', '2010-07-02 12:39:53', '');
INSERT INTO `presshop_connections` VALUES ('21', '13', '1', '415986775', '2010-07-02 18:38:06', '');
INSERT INTO `presshop_connections` VALUES ('22', '14', '1', '2147483647', '2010-07-02 23:54:26', '');
INSERT INTO `presshop_connections` VALUES ('23', '15', '1', '2147483647', '2010-07-03 04:44:36', '');
INSERT INTO `presshop_connections` VALUES ('24', '16', '1', '1984389664', '2010-07-04 01:28:42', '');
INSERT INTO `presshop_connections` VALUES ('25', '17', '1', '1906881648', '2010-07-04 03:47:58', '');
INSERT INTO `presshop_connections` VALUES ('26', '18', '16', '2111078582', '2010-07-04 09:51:27', '');
INSERT INTO `presshop_connections` VALUES ('27', '19', '8', '2111078582', '2010-07-04 10:07:46', '');
INSERT INTO `presshop_connections` VALUES ('28', '20', '8', '2111078582', '2010-07-04 10:19:52', '');
INSERT INTO `presshop_connections` VALUES ('29', '18', '1', '2111078582', '2010-07-04 10:40:14', '');
INSERT INTO `presshop_connections` VALUES ('30', '21', '11', '1984288449', '2010-07-05 03:52:36', '');
INSERT INTO `presshop_connections` VALUES ('31', '22', '11', '1984288449', '2010-07-05 03:52:39', '');
INSERT INTO `presshop_connections` VALUES ('32', '23', '1', '2147483647', '2010-07-05 04:09:30', '');
INSERT INTO `presshop_connections` VALUES ('33', '24', '1', '2147483647', '2010-07-05 10:37:09', '');
INSERT INTO `presshop_connections` VALUES ('34', '25', '1', '2147483647', '2010-07-05 13:33:14', '');
INSERT INTO `presshop_connections` VALUES ('35', '26', '1', '2147483647', '2010-07-06 13:29:18', '');
INSERT INTO `presshop_connections` VALUES ('36', '27', '1', '415986775', '2010-07-06 21:18:33', '');
INSERT INTO `presshop_connections` VALUES ('37', '28', '28', '2147483647', '2010-07-06 22:21:13', '');
INSERT INTO `presshop_connections` VALUES ('38', '29', '1', '2147483647', '2010-07-06 23:38:11', '');
INSERT INTO `presshop_connections` VALUES ('39', '30', '31', '1984288449', '2010-07-07 00:34:26', '');
INSERT INTO `presshop_connections` VALUES ('40', '31', '1', '1934413330', '2010-07-07 01:32:54', '');
INSERT INTO `presshop_connections` VALUES ('41', '32', '31', '1934413330', '2010-07-07 02:49:28', '');
INSERT INTO `presshop_connections` VALUES ('42', '31', '1', '1934413330', '2010-07-07 04:30:35', '');
INSERT INTO `presshop_connections` VALUES ('43', '22', '31', '1984288449', '2010-07-07 05:40:42', '');
INSERT INTO `presshop_connections` VALUES ('44', '33', '28', '2147483647', '2010-07-07 09:31:10', '');
INSERT INTO `presshop_connections` VALUES ('45', '34', '1', '415986775', '2010-07-07 11:37:13', '');
INSERT INTO `presshop_connections` VALUES ('46', '35', '31', '1265222898', '2010-07-07 13:40:57', '');
INSERT INTO `presshop_connections` VALUES ('47', '36', '1', '2147483647', '2010-07-07 14:48:21', '');
INSERT INTO `presshop_connections` VALUES ('48', '37', '1', '2147483647', '2010-07-07 15:41:10', '');
INSERT INTO `presshop_connections` VALUES ('49', '38', '1', '415986775', '2010-07-07 19:20:00', '');

-- ----------------------------
-- Table structure for `presshop_connections_page`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_connections_page`;
CREATE TABLE `presshop_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_connections_page
-- ----------------------------
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 16:50:08', '2010-06-30 16:50:14');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 16:50:20', '2010-06-30 16:52:29');
INSERT INTO `presshop_connections_page` VALUES ('3', '1', '2010-06-30 16:51:22', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '1', '2010-06-30 16:51:33', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '1', '2010-06-30 16:51:36', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '2', '2010-06-30 16:52:26', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:52:37', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:56:59', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:57:08', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:57:31', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:57:47', null);
INSERT INTO `presshop_connections_page` VALUES ('3', '3', '2010-06-30 16:58:02', null);
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:00:35', '2010-06-30 11:00:38');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:00:40', '2010-06-30 11:05:40');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:06:22', '2010-06-30 11:06:34');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:10:06', null);
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:10:14', '2010-06-30 11:10:17');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:10:18', '2010-06-30 11:10:56');
INSERT INTO `presshop_connections_page` VALUES ('2', '3', '2010-06-30 11:10:57', '2010-06-30 11:15:33');
INSERT INTO `presshop_connections_page` VALUES ('2', '3', '2010-06-30 11:15:34', '2010-06-30 11:15:40');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:15:46', '2010-06-30 11:17:59');
INSERT INTO `presshop_connections_page` VALUES ('2', '1', '2010-06-30 11:18:00', '2010-06-30 11:18:08');
INSERT INTO `presshop_connections_page` VALUES ('4', '1', '2010-06-30 14:09:17', '2010-06-30 14:10:50');
INSERT INTO `presshop_connections_page` VALUES ('4', '4', '2010-06-30 14:11:01', '2010-06-30 14:11:32');
INSERT INTO `presshop_connections_page` VALUES ('4', '1', '2010-06-30 14:11:38', '2010-06-30 14:11:40');
INSERT INTO `presshop_connections_page` VALUES ('4', '1', '2010-06-30 14:16:55', '2010-06-30 14:17:24');
INSERT INTO `presshop_connections_page` VALUES ('4', '1', '2010-06-30 14:40:35', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '1', '2010-07-01 00:30:51', '2010-07-01 00:31:05');
INSERT INTO `presshop_connections_page` VALUES ('5', '5', '2010-07-01 00:31:14', '2010-07-01 00:31:44');
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 08:38:46', '2010-07-01 08:39:00');
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 08:39:06', '2010-07-01 08:44:06');
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:22:49', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:23:37', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:25:49', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:26:30', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:27:16', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:28:32', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:28:53', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:29:52', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:32:12', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:32:48', null);
INSERT INTO `presshop_connections_page` VALUES ('7', '1', '2010-07-01 09:34:12', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '6', '2010-07-01 09:34:28', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '6', '2010-07-01 09:34:32', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '4', '2010-07-01 09:38:43', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '4', '2010-07-01 09:38:58', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '7', '2010-07-01 09:39:07', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 09:39:55', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:04:59', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:19:42', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:19:43', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:19:51', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:20:45', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:21:00', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:21:10', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:21:44', null);
INSERT INTO `presshop_connections_page` VALUES ('8', '1', '2010-07-01 10:22:12', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-01 10:31:42', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-01 10:32:12', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-01 10:32:46', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '8', '2010-07-01 10:32:50', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:33:28', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '8', '2010-07-01 10:33:49', null);
INSERT INTO `presshop_connections_page` VALUES ('11', '8', '2010-07-01 10:34:05', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:34:28', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:34:35', null);
INSERT INTO `presshop_connections_page` VALUES ('12', '8', '2010-07-01 10:34:49', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:35:04', null);
INSERT INTO `presshop_connections_page` VALUES ('13', '1', '2010-07-01 10:35:45', null);
INSERT INTO `presshop_connections_page` VALUES ('14', '1', '2010-07-01 10:39:22', null);
INSERT INTO `presshop_connections_page` VALUES ('14', '1', '2010-07-01 10:39:29', null);
INSERT INTO `presshop_connections_page` VALUES ('12', '8', '2010-07-01 10:39:50', null);
INSERT INTO `presshop_connections_page` VALUES ('13', '1', '2010-07-01 10:40:24', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '8', '2010-07-01 10:40:33', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 10:46:12', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '9', '2010-07-01 10:58:52', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '9', '2010-07-01 10:58:59', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 11:10:44', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 11:10:51', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 11:11:05', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 11:11:10', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '1', '2010-07-01 11:11:13', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '10', '2010-07-01 11:23:32', null);
INSERT INTO `presshop_connections_page` VALUES ('6', '10', '2010-07-02 07:41:17', null);
INSERT INTO `presshop_connections_page` VALUES ('15', '1', '2010-07-02 09:23:57', null);
INSERT INTO `presshop_connections_page` VALUES ('15', '5', '2010-07-02 09:24:17', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '11', '2010-07-02 09:47:19', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '5', '2010-07-02 09:47:46', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '7', '2010-07-02 09:49:18', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '12', '2010-07-02 09:49:32', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '13', '2010-07-02 09:49:58', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '9', '2010-07-02 09:50:24', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '14', '2010-07-02 09:50:33', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '9', '2010-07-02 09:50:37', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '3', '2010-07-02 09:50:51', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '3', '2010-07-02 09:52:02', null);
INSERT INTO `presshop_connections_page` VALUES ('5', '3', '2010-07-02 09:52:16', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '8', '2010-07-02 09:53:58', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '15', '2010-07-02 10:50:22', null);
INSERT INTO `presshop_connections_page` VALUES ('16', '1', '2010-07-02 10:56:53', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-02 11:08:43', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-02 11:35:52', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-02 11:42:19', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-02 12:29:43', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-02 12:31:15', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-02 12:31:49', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-02 12:34:19', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-02 12:34:58', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-02 12:35:21', null);
INSERT INTO `presshop_connections_page` VALUES ('15', '5', '2010-07-02 12:37:58', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-02 12:38:37', null);
INSERT INTO `presshop_connections_page` VALUES ('20', '16', '2010-07-02 12:39:53', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '5', '2010-07-02 12:41:03', null);
INSERT INTO `presshop_connections_page` VALUES ('12', '8', '2010-07-02 12:41:46', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-02 12:42:01', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-02 12:43:12', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-02 18:38:06', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '17', '2010-07-02 18:39:23', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '7', '2010-07-02 18:39:58', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '18', '2010-07-02 18:40:08', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-02 22:47:50', null);
INSERT INTO `presshop_connections_page` VALUES ('22', '1', '2010-07-02 23:54:26', null);
INSERT INTO `presshop_connections_page` VALUES ('22', '19', '2010-07-02 23:55:16', null);
INSERT INTO `presshop_connections_page` VALUES ('22', '8', '2010-07-02 23:55:32', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-03 03:13:24', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-03 03:13:47', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-03 03:13:53', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-03 03:14:24', null);
INSERT INTO `presshop_connections_page` VALUES ('17', '15', '2010-07-03 03:14:27', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '5', '2010-07-03 03:33:30', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '4', '2010-07-03 03:36:44', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '5', '2010-07-03 03:36:59', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '11', '2010-07-03 03:37:10', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:37:36', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:37:42', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:37:54', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:37:58', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:38:03', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '9', '2010-07-03 03:38:32', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '3', '2010-07-03 03:38:40', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '3', '2010-07-03 03:38:54', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '3', '2010-07-03 03:39:14', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '3', '2010-07-03 03:40:21', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '20', '2010-07-03 03:40:45', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '21', '2010-07-03 03:40:55', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '22', '2010-07-03 03:41:04', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '23', '2010-07-03 03:41:46', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '23', '2010-07-03 03:41:56', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-03 03:42:07', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-03 03:42:13', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '5', '2010-07-03 03:42:19', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '5', '2010-07-03 03:42:35', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '24', '2010-07-03 03:42:38', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '25', '2010-07-03 03:42:48', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '26', '2010-07-03 03:42:53', null);
INSERT INTO `presshop_connections_page` VALUES ('23', '1', '2010-07-03 04:44:36', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-03 07:07:38', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-03 07:49:22', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-03 07:49:49', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-03 08:01:18', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-03 08:18:03', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-03 08:23:48', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-03 19:46:34', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-03 21:20:00', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '11', '2010-07-03 21:22:05', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '1', '2010-07-04 01:28:42', null);
INSERT INTO `presshop_connections_page` VALUES ('25', '1', '2010-07-04 03:47:58', null);
INSERT INTO `presshop_connections_page` VALUES ('25', '16', '2010-07-04 03:48:40', null);
INSERT INTO `presshop_connections_page` VALUES ('25', '9', '2010-07-04 03:49:02', null);
INSERT INTO `presshop_connections_page` VALUES ('26', '16', '2010-07-04 09:51:27', null);
INSERT INTO `presshop_connections_page` VALUES ('26', '16', '2010-07-04 09:51:32', null);
INSERT INTO `presshop_connections_page` VALUES ('26', '16', '2010-07-04 10:00:21', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:01:02', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:02:58', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:03:03', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:07:19', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:07:37', null);
INSERT INTO `presshop_connections_page` VALUES ('27', '8', '2010-07-04 10:07:46', null);
INSERT INTO `presshop_connections_page` VALUES ('27', '8', '2010-07-04 10:08:14', null);
INSERT INTO `presshop_connections_page` VALUES ('27', '8', '2010-07-04 10:08:19', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:09:23', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '8', '2010-07-04 10:19:52', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '8', '2010-07-04 10:20:14', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '8', '2010-07-04 10:20:23', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '1', '2010-07-04 10:27:36', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:31:56', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '1', '2010-07-04 10:37:21', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '1', '2010-07-04 10:39:43', null);
INSERT INTO `presshop_connections_page` VALUES ('29', '1', '2010-07-04 10:40:14', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '1', '2010-07-04 10:40:59', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:41:09', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 10:41:14', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '16', '2010-07-04 10:44:09', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:04:26', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:04:31', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:04:36', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:04:37', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:04:38', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-04 11:04:46', null);
INSERT INTO `presshop_connections_page` VALUES ('9', '1', '2010-07-04 11:05:00', null);
INSERT INTO `presshop_connections_page` VALUES ('27', '8', '2010-07-04 11:11:32', null);
INSERT INTO `presshop_connections_page` VALUES ('10', '1', '2010-07-04 11:33:18', null);
INSERT INTO `presshop_connections_page` VALUES ('11', '1', '2010-07-04 11:33:45', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '5', '2010-07-04 17:13:57', null);
INSERT INTO `presshop_connections_page` VALUES ('30', '11', '2010-07-05 03:52:36', null);
INSERT INTO `presshop_connections_page` VALUES ('31', '11', '2010-07-05 03:52:39', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '1', '2010-07-05 04:09:30', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '1', '2010-07-05 04:11:34', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-05 07:47:02', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '10', '2010-07-05 07:47:12', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-05 07:58:37', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '16', '2010-07-05 08:52:16', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '17', '2010-07-05 08:52:21', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '15', '2010-07-05 09:33:32', null);
INSERT INTO `presshop_connections_page` VALUES ('33', '1', '2010-07-05 10:37:09', null);
INSERT INTO `presshop_connections_page` VALUES ('33', '7', '2010-07-05 11:00:12', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '8', '2010-07-05 11:02:32', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '1', '2010-07-05 13:33:14', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '1', '2010-07-05 15:21:44', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '12', '2010-07-05 15:21:58', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '4', '2010-07-05 15:23:02', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-06 02:05:20', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-06 02:57:15', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-06 02:58:13', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '1', '2010-07-06 08:30:51', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '1', '2010-07-06 08:40:09', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '7', '2010-07-06 08:40:14', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '4', '2010-07-06 08:40:27', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '4', '2010-07-06 08:40:54', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '8', '2010-07-06 08:44:12', null);
INSERT INTO `presshop_connections_page` VALUES ('34', '5', '2010-07-06 08:46:32', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-06 13:29:18', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '1', '2010-07-06 21:18:33', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '1', '2010-07-06 22:09:26', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '27', '2010-07-06 22:09:55', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 22:10:03', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-06 22:10:08', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '27', '2010-07-06 22:10:18', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '27', '2010-07-06 22:10:26', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '27', '2010-07-06 22:17:29', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:18:52', null);
INSERT INTO `presshop_connections_page` VALUES ('37', '28', '2010-07-06 22:21:13', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:22:03', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '1', '2010-07-06 22:22:32', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '27', '2010-07-06 22:22:36', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '27', '2010-07-06 22:22:47', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:22:50', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 22:22:53', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:23:45', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:24:59', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:26:54', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:32:06', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '1', '2010-07-06 22:32:12', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:32:14', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 22:32:16', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '3', '2010-07-06 22:32:27', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:32:33', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:32:47', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:32:58', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '3', '2010-07-06 22:33:11', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '3', '2010-07-06 22:34:06', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '21', '2010-07-06 22:35:15', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 22:35:17', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 22:35:28', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:35:35', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:35:40', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '9', '2010-07-06 22:35:43', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:35:44', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 22:35:48', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '9', '2010-07-06 22:35:55', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '9', '2010-07-06 22:36:20', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '27', '2010-07-06 22:36:34', null);
INSERT INTO `presshop_connections_page` VALUES ('36', '28', '2010-07-06 23:08:03', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 23:19:27', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '28', '2010-07-06 23:30:54', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-06 23:31:18', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '29', '2010-07-06 23:31:21', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '30', '2010-07-06 23:36:56', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '2', '2010-07-06 23:37:17', null);
INSERT INTO `presshop_connections_page` VALUES ('38', '1', '2010-07-06 23:38:11', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '2', '2010-07-06 23:38:31', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '2', '2010-07-06 23:38:44', null);
INSERT INTO `presshop_connections_page` VALUES ('38', '1', '2010-07-06 23:38:46', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '2', '2010-07-06 23:38:52', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-06 23:39:06', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '31', '2010-07-06 23:39:27', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-07 00:02:29', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '29', '2010-07-07 00:02:42', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '31', '2010-07-07 00:04:11', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-07 00:16:38', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '29', '2010-07-07 00:16:47', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '29', '2010-07-07 00:17:50', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '31', '2010-07-07 00:34:26', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '31', '2010-07-07 00:59:32', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '1', '2010-07-07 01:00:50', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '29', '2010-07-07 01:02:37', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '32', '2010-07-07 01:02:49', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '32', '2010-07-07 01:11:12', null);
INSERT INTO `presshop_connections_page` VALUES ('35', '1', '2010-07-07 01:15:32', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '1', '2010-07-07 01:32:54', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 01:34:25', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '29', '2010-07-07 01:36:52', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '3', '2010-07-07 01:37:12', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 01:37:50', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '3', '2010-07-07 01:41:45', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '3', '2010-07-07 01:44:37', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '21', '2010-07-07 01:46:26', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 01:53:45', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '32', '2010-07-07 01:54:34', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '32', '2010-07-07 01:55:01', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '21', '2010-07-07 01:55:08', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '29', '2010-07-07 01:55:16', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '33', '2010-07-07 01:55:20', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '33', '2010-07-07 01:55:40', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 01:56:21', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '30', '2010-07-07 01:59:58', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '34', '2010-07-07 02:00:33', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '20', '2010-07-07 02:00:37', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 02:08:04', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 02:08:23', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 02:09:33', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '27', '2010-07-07 02:09:50', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 02:10:29', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '35', '2010-07-07 02:11:15', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 02:12:20', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 02:12:32', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '31', '2010-07-07 02:46:46', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '9', '2010-07-07 02:49:23', null);
INSERT INTO `presshop_connections_page` VALUES ('41', '31', '2010-07-07 02:49:28', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '9', '2010-07-07 03:08:34', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 03:19:17', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-07 03:27:58', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 03:34:20', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 03:38:02', null);
INSERT INTO `presshop_connections_page` VALUES ('40', '29', '2010-07-07 03:59:54', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '1', '2010-07-07 04:30:35', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 04:31:56', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '27', '2010-07-07 05:11:43', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:12:37', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:13:26', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:14:58', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:18:18', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:22:02', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:23:32', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:23:40', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:29:06', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:33:44', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:36:28', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '29', '2010-07-07 05:37:33', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '31', '2010-07-07 05:38:27', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:39:15', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:40:21', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:40:26', null);
INSERT INTO `presshop_connections_page` VALUES ('43', '31', '2010-07-07 05:40:42', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:41:41', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:41:48', null);
INSERT INTO `presshop_connections_page` VALUES ('42', '29', '2010-07-07 05:43:12', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '31', '2010-07-07 05:43:38', null);
INSERT INTO `presshop_connections_page` VALUES ('39', '29', '2010-07-07 05:44:06', null);
INSERT INTO `presshop_connections_page` VALUES ('43', '31', '2010-07-07 05:44:11', null);
INSERT INTO `presshop_connections_page` VALUES ('43', '29', '2010-07-07 05:44:19', null);
INSERT INTO `presshop_connections_page` VALUES ('43', '32', '2010-07-07 05:45:12', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '28', '2010-07-07 06:12:10', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '28', '2010-07-07 09:31:10', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '29', '2010-07-07 09:31:52', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '1', '2010-07-07 10:09:57', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:10:03', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:10:43', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:12:57', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:13:21', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:13:55', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:14:21', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:15:19', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '29', '2010-07-07 10:15:36', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:15:48', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:16:08', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:18:09', null);
INSERT INTO `presshop_connections_page` VALUES ('44', '36', '2010-07-07 10:19:11', null);
INSERT INTO `presshop_connections_page` VALUES ('45', '1', '2010-07-07 11:37:13', null);
INSERT INTO `presshop_connections_page` VALUES ('45', '1', '2010-07-07 11:38:42', null);
INSERT INTO `presshop_connections_page` VALUES ('27', '1', '2010-07-07 13:01:05', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '31', '2010-07-07 13:40:57', null);
INSERT INTO `presshop_connections_page` VALUES ('47', '1', '2010-07-07 14:48:21', null);
INSERT INTO `presshop_connections_page` VALUES ('47', '37', '2010-07-07 14:48:28', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '8', '2010-07-07 14:56:44', null);
INSERT INTO `presshop_connections_page` VALUES ('48', '1', '2010-07-07 15:41:10', null);
INSERT INTO `presshop_connections_page` VALUES ('48', '1', '2010-07-07 15:57:47', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 19:20:00', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 19:31:31', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 19:31:39', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 19:41:04', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 20:04:20', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 20:04:56', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 20:18:24', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 20:21:20', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '1', '2010-07-07 20:21:35', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '37', '2010-07-07 21:22:42', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '29', '2010-07-07 21:23:01', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:23:10', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:28:05', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:28:11', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:28:17', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:31:56', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:34:26', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:34:32', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:37:37', null);
INSERT INTO `presshop_connections_page` VALUES ('49', '31', '2010-07-07 21:38:38', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '1', '2010-07-07 22:13:16', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '1', '2010-07-07 22:13:39', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '6', '2010-07-07 22:15:05', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '30', '2010-07-07 22:15:12', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '27', '2010-07-07 22:15:38', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '27', '2010-07-07 22:15:39', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '29', '2010-07-07 22:15:51', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '27', '2010-07-07 22:16:35', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '28', '2010-07-07 22:16:51', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '28', '2010-07-07 22:16:59', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '3', '2010-07-07 22:18:08', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '1', '2010-07-07 23:53:07', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '28', '2010-07-08 03:44:58', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '37', '2010-07-08 03:46:24', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '36', '2010-07-08 03:47:14', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '33', '2010-07-08 03:47:27', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '32', '2010-07-08 03:47:33', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '33', '2010-07-08 03:54:54', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '31', '2010-07-08 03:55:22', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '9', '2010-07-08 03:55:51', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '14', '2010-07-08 03:55:57', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '14', '2010-07-08 03:55:58', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '9', '2010-07-08 03:56:03', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '9', '2010-07-08 03:56:05', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '9', '2010-07-08 03:56:14', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '31', '2010-07-08 04:54:13', null);

-- ----------------------------
-- Table structure for `presshop_connections_source`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_connections_source`;
CREATE TABLE `presshop_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_connections_source
-- ----------------------------
INSERT INTO `presshop_connections_source` VALUES ('1', '5', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=5', '', '2010-07-02 09:47:19');
INSERT INTO `presshop_connections_source` VALUES ('2', '9', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=2&lang=2', '', '2010-07-02 09:53:58');
INSERT INTO `presshop_connections_source` VALUES ('3', '9', 'http://conferences-formations.com/index.php/contact', 'conferences-formations.com/prestashop/product.php?id_product=9&lang=2', '', '2010-07-02 10:50:22');
INSERT INTO `presshop_connections_source` VALUES ('4', '17', 'http://conferences-formations.com/index.php/home/play/100014', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-02 11:08:43');
INSERT INTO `presshop_connections_source` VALUES ('5', '19', 'http://conferences-formations.com/index.php/conference_office/index/10', 'conferences-formations.com/prestashop/', '', '2010-07-02 12:34:19');
INSERT INTO `presshop_connections_source` VALUES ('6', '9', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/', '', '2010-07-02 12:35:21');
INSERT INTO `presshop_connections_source` VALUES ('7', '20', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=6&lang=2', '', '2010-07-02 12:39:53');
INSERT INTO `presshop_connections_source` VALUES ('8', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=7&lang=2', '', '2010-07-02 12:41:03');
INSERT INTO `presshop_connections_source` VALUES ('9', '12', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=2&lang=2', '', '2010-07-02 12:41:46');
INSERT INTO `presshop_connections_source` VALUES ('10', '19', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-02 12:43:12');
INSERT INTO `presshop_connections_source` VALUES ('11', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-02 18:38:06');
INSERT INTO `presshop_connections_source` VALUES ('12', '21', 'http://conferences-formations.com/index.php/home/play/100003', 'conferences-formations.com/prestashop/product.php?id_product=8&lang=2', '', '2010-07-02 18:39:23');
INSERT INTO `presshop_connections_source` VALUES ('13', '18', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-02 22:47:50');
INSERT INTO `presshop_connections_source` VALUES ('14', '22', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-02 23:54:26');
INSERT INTO `presshop_connections_source` VALUES ('15', '17', 'http://conferences-formations.com/index.php/home/play/100006', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-03 03:13:24');
INSERT INTO `presshop_connections_source` VALUES ('16', '17', 'http://conferences-formations.com/index.php/home/play/100006', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-03 03:13:47');
INSERT INTO `presshop_connections_source` VALUES ('17', '17', 'http://conferences-formations.com/index.php/home/play/100006', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-03 03:13:53');
INSERT INTO `presshop_connections_source` VALUES ('18', '17', 'http://conferences-formations.com/index.php/home/play/100006', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-03 03:14:24');
INSERT INTO `presshop_connections_source` VALUES ('19', '17', 'http://conferences-formations.com/index.php/home/play/100006', 'conferences-formations.com/prestashop/product.php?id_product=9', '', '2010-07-03 03:14:27');
INSERT INTO `presshop_connections_source` VALUES ('20', '19', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/product.php?id_product=7', '', '2010-07-03 03:33:30');
INSERT INTO `presshop_connections_source` VALUES ('21', '23', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-03 04:44:36');
INSERT INTO `presshop_connections_source` VALUES ('22', '19', 'http://conferences-formations.com/index.php/accessories/show_element/training', 'conferences-formations.com/prestashop/', '', '2010-07-03 07:07:38');
INSERT INTO `presshop_connections_source` VALUES ('23', '10', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/', '', '2010-07-03 07:49:22');
INSERT INTO `presshop_connections_source` VALUES ('24', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-03 07:49:49');
INSERT INTO `presshop_connections_source` VALUES ('25', '10', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/', '', '2010-07-03 08:01:18');
INSERT INTO `presshop_connections_source` VALUES ('26', '9', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/', '', '2010-07-03 08:18:03');
INSERT INTO `presshop_connections_source` VALUES ('27', '10', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/', '', '2010-07-03 08:23:48');
INSERT INTO `presshop_connections_source` VALUES ('28', '19', 'http://conferences-formations.com/index.php/accessories/show_element/rules', 'conferences-formations.com/prestashop/', '', '2010-07-03 19:46:34');
INSERT INTO `presshop_connections_source` VALUES ('29', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-03 21:20:00');
INSERT INTO `presshop_connections_source` VALUES ('30', '21', 'http://conferences-formations.com/index.php/home/play/100014', 'conferences-formations.com/prestashop/product.php?id_product=5&lang=2', '', '2010-07-03 21:22:05');
INSERT INTO `presshop_connections_source` VALUES ('31', '24', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 01:28:42');
INSERT INTO `presshop_connections_source` VALUES ('32', '25', 'http://conferences-formations.com/index.php/conference_office/index/', 'conferences-formations.com/prestashop/', '', '2010-07-04 03:47:58');
INSERT INTO `presshop_connections_source` VALUES ('33', '26', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=6', '', '2010-07-04 09:51:27');
INSERT INTO `presshop_connections_source` VALUES ('34', '26', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=6', '', '2010-07-04 09:51:32');
INSERT INTO `presshop_connections_source` VALUES ('35', '26', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=6', '', '2010-07-04 10:00:21');
INSERT INTO `presshop_connections_source` VALUES ('36', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 10:01:02');
INSERT INTO `presshop_connections_source` VALUES ('37', '27', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=2&lang=2', '', '2010-07-04 10:07:46');
INSERT INTO `presshop_connections_source` VALUES ('38', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 10:09:23');
INSERT INTO `presshop_connections_source` VALUES ('39', '28', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=2', '', '2010-07-04 10:19:52');
INSERT INTO `presshop_connections_source` VALUES ('40', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 10:31:56');
INSERT INTO `presshop_connections_source` VALUES ('41', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 10:41:09');
INSERT INTO `presshop_connections_source` VALUES ('42', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 10:41:14');
INSERT INTO `presshop_connections_source` VALUES ('43', '19', 'http://conferences-formations.com/index.php/accessories/show_element/about', 'conferences-formations.com/prestashop/product.php?id_product=6', '', '2010-07-04 10:44:09');
INSERT INTO `presshop_connections_source` VALUES ('44', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:26');
INSERT INTO `presshop_connections_source` VALUES ('45', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:31');
INSERT INTO `presshop_connections_source` VALUES ('46', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:36');
INSERT INTO `presshop_connections_source` VALUES ('47', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:36');
INSERT INTO `presshop_connections_source` VALUES ('48', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:36');
INSERT INTO `presshop_connections_source` VALUES ('49', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:36');
INSERT INTO `presshop_connections_source` VALUES ('50', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:37');
INSERT INTO `presshop_connections_source` VALUES ('51', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:37');
INSERT INTO `presshop_connections_source` VALUES ('52', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:37');
INSERT INTO `presshop_connections_source` VALUES ('53', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:37');
INSERT INTO `presshop_connections_source` VALUES ('54', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:38');
INSERT INTO `presshop_connections_source` VALUES ('55', '10', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:38');
INSERT INTO `presshop_connections_source` VALUES ('56', '9', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:04:46');
INSERT INTO `presshop_connections_source` VALUES ('57', '9', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:05:00');
INSERT INTO `presshop_connections_source` VALUES ('58', '11', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-04 11:33:45');
INSERT INTO `presshop_connections_source` VALUES ('59', '30', 'http://conferences-formations.com/index.php/', 'conferences-formations.com/prestashop/product.php?id_product=5', '', '2010-07-05 03:52:36');
INSERT INTO `presshop_connections_source` VALUES ('60', '31', 'http://conferences-formations.com/index.php/', 'conferences-formations.com/prestashop/product.php?id_product=5', '', '2010-07-05 03:52:39');
INSERT INTO `presshop_connections_source` VALUES ('61', '32', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-05 04:09:30');
INSERT INTO `presshop_connections_source` VALUES ('62', '32', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-05 04:11:34');
INSERT INTO `presshop_connections_source` VALUES ('63', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-05 07:58:37');
INSERT INTO `presshop_connections_source` VALUES ('64', '33', 'http://conferences-formations.com/index.php/category/get_category/1/5', 'conferences-formations.com/prestashop/', '', '2010-07-05 10:37:09');
INSERT INTO `presshop_connections_source` VALUES ('65', '34', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-05 13:33:14');
INSERT INTO `presshop_connections_source` VALUES ('66', '34', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-05 15:21:44');
INSERT INTO `presshop_connections_source` VALUES ('67', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-06 02:05:20');
INSERT INTO `presshop_connections_source` VALUES ('68', '18', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 02:57:15');
INSERT INTO `presshop_connections_source` VALUES ('69', '34', 'http://conferences-formations.com/index.php/', 'conferences-formations.com/prestashop/', '', '2010-07-06 08:30:51');
INSERT INTO `presshop_connections_source` VALUES ('70', '34', 'http://conferences-formations.com/index.php/contact', 'conferences-formations.com/prestashop/', '', '2010-07-06 08:40:09');
INSERT INTO `presshop_connections_source` VALUES ('71', '34', 'http://conferences-formations.com/index.php/accessories/show_element/training', 'conferences-formations.com/prestashop/product.php?id_product=2&lang=2', '', '2010-07-06 08:44:12');
INSERT INTO `presshop_connections_source` VALUES ('72', '34', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=7&lang=2', '', '2010-07-06 08:46:32');
INSERT INTO `presshop_connections_source` VALUES ('73', '35', 'http://conferences-formations.com/index.php/video/speaker/1/5', 'conferences-formations.com/prestashop/', '', '2010-07-06 13:29:18');
INSERT INTO `presshop_connections_source` VALUES ('74', '36', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-06 22:09:26');
INSERT INTO `presshop_connections_source` VALUES ('75', '35', 'http://conferences-formations.com/index.php/category/get_category/8/5', 'conferences-formations.com/prestashop/', '', '2010-07-06 22:10:08');
INSERT INTO `presshop_connections_source` VALUES ('76', '35', 'http://conferences-formations.com/index.php/category/get_category/8/5', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-06 22:18:52');
INSERT INTO `presshop_connections_source` VALUES ('77', '37', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=10', '', '2010-07-06 22:21:13');
INSERT INTO `presshop_connections_source` VALUES ('78', '35', 'http://conferences-formations.com/index.php/category/get_category/8/5', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-06 22:22:03');
INSERT INTO `presshop_connections_source` VALUES ('79', '36', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 22:22:32');
INSERT INTO `presshop_connections_source` VALUES ('80', '36', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 22:32:12');
INSERT INTO `presshop_connections_source` VALUES ('81', '36', 'http://conferences-formations.com/index.php/home/play/100037', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-06 23:08:03');
INSERT INTO `presshop_connections_source` VALUES ('82', '35', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-06 23:19:27');
INSERT INTO `presshop_connections_source` VALUES ('83', '35', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-06 23:30:54');
INSERT INTO `presshop_connections_source` VALUES ('84', '35', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 23:31:18');
INSERT INTO `presshop_connections_source` VALUES ('85', '38', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 23:38:11');
INSERT INTO `presshop_connections_source` VALUES ('86', '38', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-06 23:38:46');
INSERT INTO `presshop_connections_source` VALUES ('87', '35', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-07 00:02:29');
INSERT INTO `presshop_connections_source` VALUES ('88', '19', 'http://conferences-formations.com/index.php/category/get_category/9/5', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-07 00:04:11');
INSERT INTO `presshop_connections_source` VALUES ('89', '35', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-07 00:16:38');
INSERT INTO `presshop_connections_source` VALUES ('90', '39', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-07 00:34:26');
INSERT INTO `presshop_connections_source` VALUES ('91', '39', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-07 00:59:32');
INSERT INTO `presshop_connections_source` VALUES ('92', '35', '', 'conferences-formations.com/prestashop/', '', '2010-07-07 01:15:32');
INSERT INTO `presshop_connections_source` VALUES ('93', '19', 'http://conferences-formations.com/index.php/home/play/100028', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-07 01:54:34');
INSERT INTO `presshop_connections_source` VALUES ('94', '18', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-07 03:27:58');
INSERT INTO `presshop_connections_source` VALUES ('95', '44', 'http://conferences-formations.com/index.php/home/play/100010', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-07 09:31:10');
INSERT INTO `presshop_connections_source` VALUES ('96', '44', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-07 10:09:57');
INSERT INTO `presshop_connections_source` VALUES ('97', '44', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=13&lang=2', '', '2010-07-07 10:16:08');
INSERT INTO `presshop_connections_source` VALUES ('98', '44', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=13&lang=2', '', '2010-07-07 10:18:09');
INSERT INTO `presshop_connections_source` VALUES ('99', '44', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=13&lang=2', '', '2010-07-07 10:19:11');
INSERT INTO `presshop_connections_source` VALUES ('100', '45', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-07 11:37:13');
INSERT INTO `presshop_connections_source` VALUES ('101', '45', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-07 11:38:42');
INSERT INTO `presshop_connections_source` VALUES ('102', '27', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-07 13:01:05');
INSERT INTO `presshop_connections_source` VALUES ('103', '46', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-07 13:40:57');
INSERT INTO `presshop_connections_source` VALUES ('104', '47', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-07 14:48:21');
INSERT INTO `presshop_connections_source` VALUES ('105', '48', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-07 15:41:10');
INSERT INTO `presshop_connections_source` VALUES ('106', '48', 'http://conferences-formations.com/index.php/blog/blog_content_admin/admin/Extrait%20du%20livre%20de%20Mme%20Nicole%20Dumont', 'conferences-formations.com/prestashop/', '', '2010-07-07 15:57:47');
INSERT INTO `presshop_connections_source` VALUES ('107', '49', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-07 21:22:42');
INSERT INTO `presshop_connections_source` VALUES ('108', '46', 'http://conferences-formations.com/index.php/accessories/show_element/training', 'conferences-formations.com/prestashop/', '', '2010-07-07 22:13:16');
INSERT INTO `presshop_connections_source` VALUES ('109', '24', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-07 23:53:07');
INSERT INTO `presshop_connections_source` VALUES ('110', '32', 'http://conferences-formations.com/index.php/event/search_keyword_admin/asd/5', 'conferences-formations.com/prestashop/product.php?id_product=10', '', '2010-07-08 03:44:58');
INSERT INTO `presshop_connections_source` VALUES ('111', '24', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-08 04:54:13');

-- ----------------------------
-- Table structure for `presshop_contact`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_contact`;
CREATE TABLE `presshop_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_contact
-- ----------------------------
INSERT INTO `presshop_contact` VALUES ('1', 'admin@conferences-formations.com', '0');
INSERT INTO `presshop_contact` VALUES ('2', 'admin@conferences-formations.com', '0');

-- ----------------------------
-- Table structure for `presshop_contact_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_contact_lang`;
CREATE TABLE `presshop_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  UNIQUE KEY `contact_lang_index` (`id_contact`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_contact_lang
-- ----------------------------
INSERT INTO `presshop_contact_lang` VALUES ('1', '1', 'Webmaster', 'If a technical problem occurs on this website');
INSERT INTO `presshop_contact_lang` VALUES ('1', '2', 'Webmaster', 'Si un problème technique survient sur le site');
INSERT INTO `presshop_contact_lang` VALUES ('2', '1', 'Customer service', 'For any question about a product, an order');
INSERT INTO `presshop_contact_lang` VALUES ('2', '2', 'Service client', 'Pour toute question ou réclamation sur une commande');

-- ----------------------------
-- Table structure for `presshop_country`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_country`;
CREATE TABLE `presshop_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `iso_code` varchar(3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_country
-- ----------------------------
INSERT INTO `presshop_country` VALUES ('1', '1', 'DE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('2', '1', 'AT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('3', '1', 'BE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('4', '2', 'CA', '1', '1', '0');
INSERT INTO `presshop_country` VALUES ('5', '3', 'CN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('6', '1', 'ES', '1', '0', '1');
INSERT INTO `presshop_country` VALUES ('7', '1', 'FI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('8', '1', 'FR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('9', '1', 'GR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('10', '1', 'IT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('11', '3', 'JP', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('12', '1', 'LU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('13', '1', 'NL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('14', '1', 'PL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('15', '1', 'PT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('16', '1', 'CZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('17', '1', 'GB', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('18', '1', 'SE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('19', '1', 'CH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('20', '1', 'DK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('21', '2', 'US', '1', '1', '0');
INSERT INTO `presshop_country` VALUES ('22', '3', 'HK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('23', '1', 'NO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('24', '5', 'AU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('25', '3', 'SG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('26', '1', 'IE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('27', '5', 'NZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('28', '3', 'KR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('29', '3', 'IL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('30', '4', 'ZA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('31', '4', 'NG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('32', '4', 'CI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('33', '4', 'TG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('34', '2', 'BO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('35', '4', 'MU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('36', '1', 'RO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('37', '1', 'SK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('38', '4', 'DZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('39', '2', 'AS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('40', '1', 'AD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('41', '4', 'AO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('42', '2', 'AI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('43', '2', 'AG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('44', '2', 'AR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('45', '3', 'AM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('46', '2', 'AW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('47', '3', 'AZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('48', '2', 'BS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('49', '3', 'BH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('50', '3', 'BD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('51', '2', 'BB', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('52', '1', 'BY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('53', '2', 'BZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('54', '4', 'BJ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('55', '2', 'BM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('56', '3', 'BT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('57', '4', 'BW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('58', '2', 'BR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('59', '3', 'BN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('60', '4', 'BF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('61', '3', 'MM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('62', '4', 'BI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('63', '3', 'KH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('64', '4', 'CM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('65', '4', 'CV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('66', '4', 'CF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('67', '4', 'TD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('68', '2', 'CL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('69', '2', 'CO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('70', '4', 'KM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('71', '4', 'CD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('72', '4', 'CG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('73', '2', 'CR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('74', '1', 'HR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('75', '2', 'CU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('76', '1', 'CY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('77', '4', 'DJ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('78', '2', 'DM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('79', '2', 'DO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('80', '3', 'TL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('81', '2', 'EC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('82', '4', 'EG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('83', '2', 'SV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('84', '4', 'GQ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('85', '4', 'ER', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('86', '1', 'EE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('87', '4', 'ET', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('88', '2', 'FK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('89', '1', 'FO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('90', '5', 'FJ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('91', '4', 'GA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('92', '4', 'GM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('93', '3', 'GE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('94', '4', 'GH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('95', '2', 'GD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('96', '1', 'GL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('97', '1', 'GI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('98', '2', 'GP', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('99', '2', 'GU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('100', '2', 'GT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('101', '1', 'GG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('102', '4', 'GN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('103', '4', 'GW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('104', '2', 'GY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('105', '2', 'HT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('106', '5', 'HM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('107', '1', 'VA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('108', '2', 'HN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('109', '1', 'IS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('110', '3', 'IN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('111', '3', 'ID', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('112', '3', 'IR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('113', '3', 'IQ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('114', '1', 'IM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('115', '2', 'JM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('116', '1', 'JE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('117', '3', 'JO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('118', '3', 'KZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('119', '4', 'KE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('120', '1', 'KI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('121', '3', 'KP', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('122', '3', 'KW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('123', '3', 'KG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('124', '3', 'LA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('125', '1', 'LV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('126', '3', 'LB', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('127', '4', 'LS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('128', '4', 'LR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('129', '4', 'LY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('130', '1', 'LI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('131', '1', 'LT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('132', '3', 'MO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('133', '1', 'MK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('134', '4', 'MG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('135', '4', 'MW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('136', '3', 'MY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('137', '3', 'MV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('138', '4', 'ML', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('139', '1', 'MT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('140', '5', 'MH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('141', '2', 'MQ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('142', '4', 'MR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('143', '1', 'HU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('144', '4', 'YT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('145', '2', 'MX', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('146', '5', 'FM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('147', '1', 'MD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('148', '1', 'MC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('149', '3', 'MN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('150', '1', 'ME', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('151', '2', 'MS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('152', '4', 'MA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('153', '4', 'MZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('154', '4', 'NA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('155', '5', 'NR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('156', '3', 'NP', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('157', '2', 'AN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('158', '5', 'NC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('159', '2', 'NI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('160', '4', 'NE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('161', '5', 'NU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('162', '5', 'NF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('163', '5', 'MP', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('164', '3', 'OM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('165', '3', 'PK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('166', '5', 'PW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('167', '3', 'PS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('168', '2', 'PA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('169', '5', 'PG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('170', '2', 'PY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('171', '2', 'PE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('172', '3', 'PH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('173', '5', 'PN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('174', '2', 'PR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('175', '3', 'QA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('176', '4', 'RE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('177', '1', 'RU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('178', '4', 'RW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('179', '2', 'BL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('180', '2', 'KN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('181', '2', 'LC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('182', '2', 'MF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('183', '2', 'PM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('184', '2', 'VC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('185', '5', 'WS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('186', '1', 'SM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('187', '4', 'ST', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('188', '3', 'SA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('189', '4', 'SN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('190', '1', 'RS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('191', '4', 'SC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('192', '4', 'SL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('193', '1', 'SI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('194', '5', 'SB', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('195', '4', 'SO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('196', '2', 'GS', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('197', '3', 'LK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('198', '4', 'SD', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('199', '2', 'SR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('200', '1', 'SJ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('201', '4', 'SZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('202', '3', 'SY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('203', '3', 'TW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('204', '3', 'TJ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('205', '4', 'TZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('206', '3', 'TH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('207', '5', 'TK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('208', '5', 'TO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('209', '2', 'TT', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('210', '4', 'TN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('211', '1', 'TR', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('212', '3', 'TM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('213', '2', 'TC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('214', '5', 'TV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('215', '4', 'UG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('216', '1', 'UA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('217', '3', 'AE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('218', '2', 'UY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('219', '3', 'UZ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('220', '5', 'VU', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('221', '2', 'VE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('222', '3', 'VN', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('223', '2', 'VG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('224', '2', 'VI', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('225', '5', 'WF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('226', '4', 'EH', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('227', '3', 'YE', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('228', '4', 'ZM', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('229', '4', 'ZW', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('230', '1', 'AL', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('231', '3', 'AF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('232', '5', 'AQ', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('233', '1', 'BA', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('234', '5', 'BV', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('235', '5', 'IO', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('236', '1', 'BG', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('237', '2', 'KY', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('238', '3', 'CX', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('239', '3', 'CC', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('240', '5', 'CK', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('241', '2', 'GF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('242', '5', 'PF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('243', '5', 'TF', '1', '0', '0');
INSERT INTO `presshop_country` VALUES ('244', '1', 'AX', '1', '0', '0');

-- ----------------------------
-- Table structure for `presshop_country_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_country_lang`;
CREATE TABLE `presshop_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `country_lang_index` (`id_country`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_country_lang
-- ----------------------------
INSERT INTO `presshop_country_lang` VALUES ('1', '1', 'Germany');
INSERT INTO `presshop_country_lang` VALUES ('1', '2', 'Allemagne');
INSERT INTO `presshop_country_lang` VALUES ('2', '1', 'Austria');
INSERT INTO `presshop_country_lang` VALUES ('2', '2', 'Autriche');
INSERT INTO `presshop_country_lang` VALUES ('3', '1', 'Belgium');
INSERT INTO `presshop_country_lang` VALUES ('3', '2', 'Belgique');
INSERT INTO `presshop_country_lang` VALUES ('4', '1', 'Canada');
INSERT INTO `presshop_country_lang` VALUES ('4', '2', 'Canada');
INSERT INTO `presshop_country_lang` VALUES ('5', '1', 'China');
INSERT INTO `presshop_country_lang` VALUES ('5', '2', 'Chine');
INSERT INTO `presshop_country_lang` VALUES ('6', '1', 'Spain');
INSERT INTO `presshop_country_lang` VALUES ('6', '2', 'Espagne');
INSERT INTO `presshop_country_lang` VALUES ('7', '1', 'Finland');
INSERT INTO `presshop_country_lang` VALUES ('7', '2', 'Finlande');
INSERT INTO `presshop_country_lang` VALUES ('8', '1', 'France');
INSERT INTO `presshop_country_lang` VALUES ('8', '2', 'France');
INSERT INTO `presshop_country_lang` VALUES ('9', '1', 'Greece');
INSERT INTO `presshop_country_lang` VALUES ('9', '2', 'Grèce');
INSERT INTO `presshop_country_lang` VALUES ('10', '1', 'Italy');
INSERT INTO `presshop_country_lang` VALUES ('10', '2', 'Italie');
INSERT INTO `presshop_country_lang` VALUES ('11', '1', 'Japan');
INSERT INTO `presshop_country_lang` VALUES ('11', '2', 'Japon');
INSERT INTO `presshop_country_lang` VALUES ('12', '1', 'Luxemburg');
INSERT INTO `presshop_country_lang` VALUES ('12', '2', 'Luxembourg');
INSERT INTO `presshop_country_lang` VALUES ('13', '1', 'Netherlands');
INSERT INTO `presshop_country_lang` VALUES ('13', '2', 'Pays-bas');
INSERT INTO `presshop_country_lang` VALUES ('14', '1', 'Poland');
INSERT INTO `presshop_country_lang` VALUES ('14', '2', 'Pologne');
INSERT INTO `presshop_country_lang` VALUES ('15', '1', 'Portugal');
INSERT INTO `presshop_country_lang` VALUES ('15', '2', 'Portugal');
INSERT INTO `presshop_country_lang` VALUES ('16', '1', 'Czech Republic');
INSERT INTO `presshop_country_lang` VALUES ('16', '2', 'République Tchèque');
INSERT INTO `presshop_country_lang` VALUES ('17', '1', 'United Kingdom');
INSERT INTO `presshop_country_lang` VALUES ('17', '2', 'Royaume-Uni');
INSERT INTO `presshop_country_lang` VALUES ('18', '1', 'Sweden');
INSERT INTO `presshop_country_lang` VALUES ('18', '2', 'Suède');
INSERT INTO `presshop_country_lang` VALUES ('19', '1', 'Switzerland');
INSERT INTO `presshop_country_lang` VALUES ('19', '2', 'Suisse');
INSERT INTO `presshop_country_lang` VALUES ('20', '1', 'Denmark');
INSERT INTO `presshop_country_lang` VALUES ('20', '2', 'Danemark');
INSERT INTO `presshop_country_lang` VALUES ('21', '1', 'USA');
INSERT INTO `presshop_country_lang` VALUES ('21', '2', 'USA');
INSERT INTO `presshop_country_lang` VALUES ('22', '1', 'HongKong');
INSERT INTO `presshop_country_lang` VALUES ('22', '2', 'Hong-Kong');
INSERT INTO `presshop_country_lang` VALUES ('23', '1', 'Norway');
INSERT INTO `presshop_country_lang` VALUES ('23', '2', 'Norvège');
INSERT INTO `presshop_country_lang` VALUES ('24', '1', 'Australia');
INSERT INTO `presshop_country_lang` VALUES ('24', '2', 'Australie');
INSERT INTO `presshop_country_lang` VALUES ('25', '1', 'Singapore');
INSERT INTO `presshop_country_lang` VALUES ('25', '2', 'Singapour');
INSERT INTO `presshop_country_lang` VALUES ('26', '1', 'Ireland');
INSERT INTO `presshop_country_lang` VALUES ('26', '2', 'Eire');
INSERT INTO `presshop_country_lang` VALUES ('27', '1', 'New Zealand');
INSERT INTO `presshop_country_lang` VALUES ('27', '2', 'Nouvelle-Zélande');
INSERT INTO `presshop_country_lang` VALUES ('28', '1', 'South Korea');
INSERT INTO `presshop_country_lang` VALUES ('28', '2', 'Corée du Sud');
INSERT INTO `presshop_country_lang` VALUES ('29', '1', 'Israel');
INSERT INTO `presshop_country_lang` VALUES ('29', '2', 'Israël');
INSERT INTO `presshop_country_lang` VALUES ('30', '1', 'South Africa');
INSERT INTO `presshop_country_lang` VALUES ('30', '2', 'Afrique du Sud');
INSERT INTO `presshop_country_lang` VALUES ('31', '1', 'Nigeria');
INSERT INTO `presshop_country_lang` VALUES ('31', '2', 'Nigeria');
INSERT INTO `presshop_country_lang` VALUES ('32', '1', 'Ivory Coast');
INSERT INTO `presshop_country_lang` VALUES ('32', '2', 'Côte d\'Ivoire');
INSERT INTO `presshop_country_lang` VALUES ('33', '1', 'Togo');
INSERT INTO `presshop_country_lang` VALUES ('33', '2', 'Togo');
INSERT INTO `presshop_country_lang` VALUES ('34', '1', 'Bolivia');
INSERT INTO `presshop_country_lang` VALUES ('34', '2', 'Bolivie');
INSERT INTO `presshop_country_lang` VALUES ('35', '1', 'Mauritius');
INSERT INTO `presshop_country_lang` VALUES ('35', '2', 'Ile Maurice');
INSERT INTO `presshop_country_lang` VALUES ('143', '1', 'Hungary');
INSERT INTO `presshop_country_lang` VALUES ('143', '2', 'Hongrie');
INSERT INTO `presshop_country_lang` VALUES ('36', '1', 'Romania');
INSERT INTO `presshop_country_lang` VALUES ('36', '2', 'Roumanie');
INSERT INTO `presshop_country_lang` VALUES ('37', '1', 'Slovakia');
INSERT INTO `presshop_country_lang` VALUES ('37', '2', 'Slovaquie');
INSERT INTO `presshop_country_lang` VALUES ('38', '1', 'Algeria');
INSERT INTO `presshop_country_lang` VALUES ('38', '2', 'Algérie');
INSERT INTO `presshop_country_lang` VALUES ('39', '1', 'American Samoa');
INSERT INTO `presshop_country_lang` VALUES ('39', '2', 'Samoa Américaines');
INSERT INTO `presshop_country_lang` VALUES ('40', '1', 'Andorra');
INSERT INTO `presshop_country_lang` VALUES ('40', '2', 'Andorre');
INSERT INTO `presshop_country_lang` VALUES ('41', '1', 'Angola');
INSERT INTO `presshop_country_lang` VALUES ('41', '2', 'Angola');
INSERT INTO `presshop_country_lang` VALUES ('42', '1', 'Anguilla');
INSERT INTO `presshop_country_lang` VALUES ('42', '2', 'Anguilla');
INSERT INTO `presshop_country_lang` VALUES ('43', '1', 'Antigua and Barbuda');
INSERT INTO `presshop_country_lang` VALUES ('43', '2', 'Antigua et Barbuda');
INSERT INTO `presshop_country_lang` VALUES ('44', '1', 'Argentina');
INSERT INTO `presshop_country_lang` VALUES ('44', '2', 'Argentine');
INSERT INTO `presshop_country_lang` VALUES ('45', '1', 'Armenia');
INSERT INTO `presshop_country_lang` VALUES ('45', '2', 'Arménie');
INSERT INTO `presshop_country_lang` VALUES ('46', '1', 'Aruba');
INSERT INTO `presshop_country_lang` VALUES ('46', '2', 'Aruba');
INSERT INTO `presshop_country_lang` VALUES ('47', '1', 'Azerbaijan');
INSERT INTO `presshop_country_lang` VALUES ('47', '2', 'Azerbaïdjan');
INSERT INTO `presshop_country_lang` VALUES ('48', '1', 'Bahamas');
INSERT INTO `presshop_country_lang` VALUES ('48', '2', 'Bahamas');
INSERT INTO `presshop_country_lang` VALUES ('49', '1', 'Bahrain');
INSERT INTO `presshop_country_lang` VALUES ('49', '2', 'Bahreïn');
INSERT INTO `presshop_country_lang` VALUES ('50', '1', 'Bangladesh');
INSERT INTO `presshop_country_lang` VALUES ('50', '2', 'Bangladesh');
INSERT INTO `presshop_country_lang` VALUES ('51', '1', 'Barbados');
INSERT INTO `presshop_country_lang` VALUES ('51', '2', 'Barbade');
INSERT INTO `presshop_country_lang` VALUES ('52', '1', 'Belarus');
INSERT INTO `presshop_country_lang` VALUES ('52', '2', 'Bélarus');
INSERT INTO `presshop_country_lang` VALUES ('53', '1', 'Belize');
INSERT INTO `presshop_country_lang` VALUES ('53', '2', 'Belize');
INSERT INTO `presshop_country_lang` VALUES ('54', '1', 'Benin');
INSERT INTO `presshop_country_lang` VALUES ('54', '2', 'Bénin');
INSERT INTO `presshop_country_lang` VALUES ('55', '1', 'Bermuda');
INSERT INTO `presshop_country_lang` VALUES ('55', '2', 'Bermudes');
INSERT INTO `presshop_country_lang` VALUES ('56', '1', 'Bhutan');
INSERT INTO `presshop_country_lang` VALUES ('56', '2', 'Bhoutan');
INSERT INTO `presshop_country_lang` VALUES ('57', '1', 'Botswana');
INSERT INTO `presshop_country_lang` VALUES ('57', '2', 'Botswana');
INSERT INTO `presshop_country_lang` VALUES ('58', '1', 'Brazil');
INSERT INTO `presshop_country_lang` VALUES ('58', '2', 'Brésil');
INSERT INTO `presshop_country_lang` VALUES ('59', '1', 'Brunei');
INSERT INTO `presshop_country_lang` VALUES ('59', '2', 'Brunéi Darussalam');
INSERT INTO `presshop_country_lang` VALUES ('60', '1', 'Burkina Faso');
INSERT INTO `presshop_country_lang` VALUES ('60', '2', 'Burkina Faso');
INSERT INTO `presshop_country_lang` VALUES ('61', '1', 'Burma (Myanmar)');
INSERT INTO `presshop_country_lang` VALUES ('61', '2', 'Burma (Myanmar)');
INSERT INTO `presshop_country_lang` VALUES ('62', '1', 'Burundi');
INSERT INTO `presshop_country_lang` VALUES ('62', '2', 'Burundi');
INSERT INTO `presshop_country_lang` VALUES ('63', '1', 'Cambodia');
INSERT INTO `presshop_country_lang` VALUES ('63', '2', 'Cambodge');
INSERT INTO `presshop_country_lang` VALUES ('64', '1', 'Cameroon');
INSERT INTO `presshop_country_lang` VALUES ('64', '2', 'Cameroun');
INSERT INTO `presshop_country_lang` VALUES ('65', '1', 'Cape Verde');
INSERT INTO `presshop_country_lang` VALUES ('65', '2', 'Cap-Vert');
INSERT INTO `presshop_country_lang` VALUES ('66', '1', 'Central African Republic');
INSERT INTO `presshop_country_lang` VALUES ('66', '2', 'Centrafricaine, République');
INSERT INTO `presshop_country_lang` VALUES ('67', '1', 'Chad');
INSERT INTO `presshop_country_lang` VALUES ('67', '2', 'Tchad');
INSERT INTO `presshop_country_lang` VALUES ('68', '1', 'Chile');
INSERT INTO `presshop_country_lang` VALUES ('68', '2', 'Chili');
INSERT INTO `presshop_country_lang` VALUES ('69', '1', 'Colombia');
INSERT INTO `presshop_country_lang` VALUES ('69', '2', 'Colombie');
INSERT INTO `presshop_country_lang` VALUES ('70', '1', 'Comoros');
INSERT INTO `presshop_country_lang` VALUES ('70', '2', 'Comores');
INSERT INTO `presshop_country_lang` VALUES ('71', '1', 'Congo, Dem. Republic');
INSERT INTO `presshop_country_lang` VALUES ('71', '2', 'Congo, Rép. Dém.');
INSERT INTO `presshop_country_lang` VALUES ('72', '1', 'Congo, Republic');
INSERT INTO `presshop_country_lang` VALUES ('72', '2', 'Congo, Rép.');
INSERT INTO `presshop_country_lang` VALUES ('73', '1', 'Costa Rica');
INSERT INTO `presshop_country_lang` VALUES ('73', '2', 'Costa Rica');
INSERT INTO `presshop_country_lang` VALUES ('74', '1', 'Croatia');
INSERT INTO `presshop_country_lang` VALUES ('74', '2', 'Croatie');
INSERT INTO `presshop_country_lang` VALUES ('75', '1', 'Cuba');
INSERT INTO `presshop_country_lang` VALUES ('75', '2', 'Cuba');
INSERT INTO `presshop_country_lang` VALUES ('76', '1', 'Cyprus');
INSERT INTO `presshop_country_lang` VALUES ('76', '2', 'Chypre');
INSERT INTO `presshop_country_lang` VALUES ('77', '1', 'Djibouti');
INSERT INTO `presshop_country_lang` VALUES ('77', '2', 'Djibouti');
INSERT INTO `presshop_country_lang` VALUES ('78', '1', 'Dominica');
INSERT INTO `presshop_country_lang` VALUES ('78', '2', 'Dominica');
INSERT INTO `presshop_country_lang` VALUES ('79', '1', 'Dominican Republic');
INSERT INTO `presshop_country_lang` VALUES ('79', '2', 'République Dominicaine');
INSERT INTO `presshop_country_lang` VALUES ('80', '1', 'East Timor');
INSERT INTO `presshop_country_lang` VALUES ('80', '2', 'Timor oriental');
INSERT INTO `presshop_country_lang` VALUES ('81', '1', 'Ecuador');
INSERT INTO `presshop_country_lang` VALUES ('81', '2', 'Équateur');
INSERT INTO `presshop_country_lang` VALUES ('82', '1', 'Egypt');
INSERT INTO `presshop_country_lang` VALUES ('82', '2', 'Égypte');
INSERT INTO `presshop_country_lang` VALUES ('83', '1', 'El Salvador');
INSERT INTO `presshop_country_lang` VALUES ('83', '2', 'El Salvador');
INSERT INTO `presshop_country_lang` VALUES ('84', '1', 'Equatorial Guinea');
INSERT INTO `presshop_country_lang` VALUES ('84', '2', 'Guinée Équatoriale');
INSERT INTO `presshop_country_lang` VALUES ('85', '1', 'Eritrea');
INSERT INTO `presshop_country_lang` VALUES ('85', '2', 'Érythrée');
INSERT INTO `presshop_country_lang` VALUES ('86', '1', 'Estonia');
INSERT INTO `presshop_country_lang` VALUES ('86', '2', 'Estonie');
INSERT INTO `presshop_country_lang` VALUES ('87', '1', 'Ethiopia');
INSERT INTO `presshop_country_lang` VALUES ('87', '2', 'Éthiopie');
INSERT INTO `presshop_country_lang` VALUES ('88', '1', 'Falkland Islands');
INSERT INTO `presshop_country_lang` VALUES ('88', '2', 'Falkland, Îles');
INSERT INTO `presshop_country_lang` VALUES ('89', '1', 'Faroe Islands');
INSERT INTO `presshop_country_lang` VALUES ('89', '2', 'Féroé, Îles');
INSERT INTO `presshop_country_lang` VALUES ('90', '1', 'Fiji');
INSERT INTO `presshop_country_lang` VALUES ('90', '2', 'Fidji');
INSERT INTO `presshop_country_lang` VALUES ('91', '1', 'Gabon');
INSERT INTO `presshop_country_lang` VALUES ('91', '2', 'Gabon');
INSERT INTO `presshop_country_lang` VALUES ('92', '1', 'Gambia');
INSERT INTO `presshop_country_lang` VALUES ('92', '2', 'Gambie');
INSERT INTO `presshop_country_lang` VALUES ('93', '1', 'Georgia');
INSERT INTO `presshop_country_lang` VALUES ('93', '2', 'Géorgie');
INSERT INTO `presshop_country_lang` VALUES ('94', '1', 'Ghana');
INSERT INTO `presshop_country_lang` VALUES ('94', '2', 'Ghana');
INSERT INTO `presshop_country_lang` VALUES ('95', '1', 'Grenada');
INSERT INTO `presshop_country_lang` VALUES ('95', '2', 'Grenade');
INSERT INTO `presshop_country_lang` VALUES ('96', '1', 'Greenland');
INSERT INTO `presshop_country_lang` VALUES ('96', '2', 'Groenland');
INSERT INTO `presshop_country_lang` VALUES ('97', '1', 'Gibraltar');
INSERT INTO `presshop_country_lang` VALUES ('97', '2', 'Gibraltar');
INSERT INTO `presshop_country_lang` VALUES ('98', '1', 'Guadeloupe');
INSERT INTO `presshop_country_lang` VALUES ('98', '2', 'Guadeloupe');
INSERT INTO `presshop_country_lang` VALUES ('99', '1', 'Guam');
INSERT INTO `presshop_country_lang` VALUES ('99', '2', 'Guam');
INSERT INTO `presshop_country_lang` VALUES ('100', '1', 'Guatemala');
INSERT INTO `presshop_country_lang` VALUES ('100', '2', 'Guatemala');
INSERT INTO `presshop_country_lang` VALUES ('101', '1', 'Guernsey');
INSERT INTO `presshop_country_lang` VALUES ('101', '2', 'Guernesey');
INSERT INTO `presshop_country_lang` VALUES ('102', '1', 'Guinea');
INSERT INTO `presshop_country_lang` VALUES ('102', '2', 'Guinée');
INSERT INTO `presshop_country_lang` VALUES ('103', '1', 'Guinea-Bissau');
INSERT INTO `presshop_country_lang` VALUES ('103', '2', 'Guinée-Bissau');
INSERT INTO `presshop_country_lang` VALUES ('104', '1', 'Guyana');
INSERT INTO `presshop_country_lang` VALUES ('104', '2', 'Guyana');
INSERT INTO `presshop_country_lang` VALUES ('105', '1', 'Haiti');
INSERT INTO `presshop_country_lang` VALUES ('105', '2', 'Haîti');
INSERT INTO `presshop_country_lang` VALUES ('106', '1', 'Heard Island and McDonald Islands');
INSERT INTO `presshop_country_lang` VALUES ('106', '2', 'Heard, Île et Mcdonald, Îles');
INSERT INTO `presshop_country_lang` VALUES ('107', '1', 'Vatican City State');
INSERT INTO `presshop_country_lang` VALUES ('107', '2', 'Saint-Siege (État de la Cité du Vatican)');
INSERT INTO `presshop_country_lang` VALUES ('108', '1', 'Honduras');
INSERT INTO `presshop_country_lang` VALUES ('108', '2', 'Honduras');
INSERT INTO `presshop_country_lang` VALUES ('109', '1', 'Iceland');
INSERT INTO `presshop_country_lang` VALUES ('109', '2', 'Islande');
INSERT INTO `presshop_country_lang` VALUES ('110', '1', 'India');
INSERT INTO `presshop_country_lang` VALUES ('110', '2', 'Indie');
INSERT INTO `presshop_country_lang` VALUES ('111', '1', 'Indonesia');
INSERT INTO `presshop_country_lang` VALUES ('111', '2', 'Indonésie');
INSERT INTO `presshop_country_lang` VALUES ('112', '1', 'Iran');
INSERT INTO `presshop_country_lang` VALUES ('112', '2', 'Iran');
INSERT INTO `presshop_country_lang` VALUES ('113', '1', 'Iraq');
INSERT INTO `presshop_country_lang` VALUES ('113', '2', 'Iraq');
INSERT INTO `presshop_country_lang` VALUES ('114', '1', 'Isle of Man');
INSERT INTO `presshop_country_lang` VALUES ('114', '2', 'Île de Man');
INSERT INTO `presshop_country_lang` VALUES ('115', '1', 'Jamaica');
INSERT INTO `presshop_country_lang` VALUES ('115', '2', 'Jamaique');
INSERT INTO `presshop_country_lang` VALUES ('116', '1', 'Jersey');
INSERT INTO `presshop_country_lang` VALUES ('116', '2', 'Jersey');
INSERT INTO `presshop_country_lang` VALUES ('117', '1', 'Jordan');
INSERT INTO `presshop_country_lang` VALUES ('117', '2', 'Jordanie');
INSERT INTO `presshop_country_lang` VALUES ('118', '1', 'Kazakhstan');
INSERT INTO `presshop_country_lang` VALUES ('118', '2', 'Kazakhstan');
INSERT INTO `presshop_country_lang` VALUES ('119', '1', 'Kenya');
INSERT INTO `presshop_country_lang` VALUES ('119', '2', 'Kenya');
INSERT INTO `presshop_country_lang` VALUES ('120', '1', 'Kiribati');
INSERT INTO `presshop_country_lang` VALUES ('120', '2', 'Kiribati');
INSERT INTO `presshop_country_lang` VALUES ('121', '1', 'Korea, Dem. Republic of');
INSERT INTO `presshop_country_lang` VALUES ('121', '2', 'Corée, Rép. Populaire Dém. de');
INSERT INTO `presshop_country_lang` VALUES ('122', '1', 'Kuwait');
INSERT INTO `presshop_country_lang` VALUES ('122', '2', 'Koweït');
INSERT INTO `presshop_country_lang` VALUES ('123', '1', 'Kyrgyzstan');
INSERT INTO `presshop_country_lang` VALUES ('123', '2', 'Kirghizistan');
INSERT INTO `presshop_country_lang` VALUES ('124', '1', 'Laos');
INSERT INTO `presshop_country_lang` VALUES ('124', '2', 'Laos');
INSERT INTO `presshop_country_lang` VALUES ('125', '1', 'Latvia');
INSERT INTO `presshop_country_lang` VALUES ('125', '2', 'Lettonie');
INSERT INTO `presshop_country_lang` VALUES ('126', '1', 'Lebanon');
INSERT INTO `presshop_country_lang` VALUES ('126', '2', 'Liban');
INSERT INTO `presshop_country_lang` VALUES ('127', '1', 'Lesotho');
INSERT INTO `presshop_country_lang` VALUES ('127', '2', 'Lesotho');
INSERT INTO `presshop_country_lang` VALUES ('128', '1', 'Liberia');
INSERT INTO `presshop_country_lang` VALUES ('128', '2', 'Libéria');
INSERT INTO `presshop_country_lang` VALUES ('129', '1', 'Libya');
INSERT INTO `presshop_country_lang` VALUES ('129', '2', 'Libyenne, Jamahiriya Arabe');
INSERT INTO `presshop_country_lang` VALUES ('130', '1', 'Liechtenstein');
INSERT INTO `presshop_country_lang` VALUES ('130', '2', 'Liechtenstein');
INSERT INTO `presshop_country_lang` VALUES ('131', '1', 'Lithuania');
INSERT INTO `presshop_country_lang` VALUES ('131', '2', 'Lituanie');
INSERT INTO `presshop_country_lang` VALUES ('132', '1', 'Macau');
INSERT INTO `presshop_country_lang` VALUES ('132', '2', 'Macao');
INSERT INTO `presshop_country_lang` VALUES ('133', '1', 'Macedonia');
INSERT INTO `presshop_country_lang` VALUES ('133', '2', 'Macédoine');
INSERT INTO `presshop_country_lang` VALUES ('134', '1', 'Madagascar');
INSERT INTO `presshop_country_lang` VALUES ('134', '2', 'Madagascar');
INSERT INTO `presshop_country_lang` VALUES ('135', '1', 'Malawi');
INSERT INTO `presshop_country_lang` VALUES ('135', '2', 'Malawi');
INSERT INTO `presshop_country_lang` VALUES ('136', '1', 'Malaysia');
INSERT INTO `presshop_country_lang` VALUES ('136', '2', 'Malaisie');
INSERT INTO `presshop_country_lang` VALUES ('137', '1', 'Maldives');
INSERT INTO `presshop_country_lang` VALUES ('137', '2', 'Maldives');
INSERT INTO `presshop_country_lang` VALUES ('138', '1', 'Mali');
INSERT INTO `presshop_country_lang` VALUES ('138', '2', 'Mali');
INSERT INTO `presshop_country_lang` VALUES ('139', '1', 'Malta');
INSERT INTO `presshop_country_lang` VALUES ('139', '2', 'Malte');
INSERT INTO `presshop_country_lang` VALUES ('140', '1', 'Marshall Islands');
INSERT INTO `presshop_country_lang` VALUES ('140', '2', 'Marshall, Îles');
INSERT INTO `presshop_country_lang` VALUES ('141', '1', 'Martinique');
INSERT INTO `presshop_country_lang` VALUES ('141', '2', 'Martinique');
INSERT INTO `presshop_country_lang` VALUES ('142', '1', 'Mauritania');
INSERT INTO `presshop_country_lang` VALUES ('142', '2', 'Mauritanie');
INSERT INTO `presshop_country_lang` VALUES ('144', '1', 'Mayotte');
INSERT INTO `presshop_country_lang` VALUES ('144', '2', 'Mayotte');
INSERT INTO `presshop_country_lang` VALUES ('145', '1', 'Mexico');
INSERT INTO `presshop_country_lang` VALUES ('145', '2', 'Mexique');
INSERT INTO `presshop_country_lang` VALUES ('146', '1', 'Micronesia');
INSERT INTO `presshop_country_lang` VALUES ('146', '2', 'Micronésie');
INSERT INTO `presshop_country_lang` VALUES ('147', '1', 'Moldova');
INSERT INTO `presshop_country_lang` VALUES ('147', '2', 'Moldova');
INSERT INTO `presshop_country_lang` VALUES ('148', '1', 'Monaco');
INSERT INTO `presshop_country_lang` VALUES ('148', '2', 'Monaco');
INSERT INTO `presshop_country_lang` VALUES ('149', '1', 'Mongolia');
INSERT INTO `presshop_country_lang` VALUES ('149', '2', 'Mongolie');
INSERT INTO `presshop_country_lang` VALUES ('150', '1', 'Montenegro');
INSERT INTO `presshop_country_lang` VALUES ('150', '2', 'Monténégro');
INSERT INTO `presshop_country_lang` VALUES ('151', '1', 'Montserrat');
INSERT INTO `presshop_country_lang` VALUES ('151', '2', 'Montserrat');
INSERT INTO `presshop_country_lang` VALUES ('152', '1', 'Morocco');
INSERT INTO `presshop_country_lang` VALUES ('152', '2', 'Maroc');
INSERT INTO `presshop_country_lang` VALUES ('153', '1', 'Mozambique');
INSERT INTO `presshop_country_lang` VALUES ('153', '2', 'Mozambique');
INSERT INTO `presshop_country_lang` VALUES ('154', '1', 'Namibia');
INSERT INTO `presshop_country_lang` VALUES ('154', '2', 'Namibie');
INSERT INTO `presshop_country_lang` VALUES ('155', '1', 'Nauru');
INSERT INTO `presshop_country_lang` VALUES ('155', '2', 'Nauru');
INSERT INTO `presshop_country_lang` VALUES ('156', '1', 'Nepal');
INSERT INTO `presshop_country_lang` VALUES ('156', '2', 'Népal');
INSERT INTO `presshop_country_lang` VALUES ('157', '1', 'Netherlands Antilles');
INSERT INTO `presshop_country_lang` VALUES ('157', '2', 'Antilles Néerlandaises');
INSERT INTO `presshop_country_lang` VALUES ('158', '1', 'New Caledonia');
INSERT INTO `presshop_country_lang` VALUES ('158', '2', 'Nouvelle-Calédonie');
INSERT INTO `presshop_country_lang` VALUES ('159', '1', 'Nicaragua');
INSERT INTO `presshop_country_lang` VALUES ('159', '2', 'Nicaragua');
INSERT INTO `presshop_country_lang` VALUES ('160', '1', 'Niger');
INSERT INTO `presshop_country_lang` VALUES ('160', '2', 'Niger');
INSERT INTO `presshop_country_lang` VALUES ('161', '1', 'Niue');
INSERT INTO `presshop_country_lang` VALUES ('161', '2', 'Niué');
INSERT INTO `presshop_country_lang` VALUES ('162', '1', 'Norfolk Island');
INSERT INTO `presshop_country_lang` VALUES ('162', '2', 'Norfolk, Île');
INSERT INTO `presshop_country_lang` VALUES ('163', '1', 'Northern Mariana Islands');
INSERT INTO `presshop_country_lang` VALUES ('163', '2', 'Mariannes du Nord, Îles');
INSERT INTO `presshop_country_lang` VALUES ('164', '1', 'Oman');
INSERT INTO `presshop_country_lang` VALUES ('164', '2', 'Oman');
INSERT INTO `presshop_country_lang` VALUES ('165', '1', 'Pakistan');
INSERT INTO `presshop_country_lang` VALUES ('165', '2', 'Pakistan');
INSERT INTO `presshop_country_lang` VALUES ('166', '1', 'Palau');
INSERT INTO `presshop_country_lang` VALUES ('166', '2', 'Palaos');
INSERT INTO `presshop_country_lang` VALUES ('167', '1', 'Palestinian Territories');
INSERT INTO `presshop_country_lang` VALUES ('167', '2', 'Palestinien Occupé, Territoire');
INSERT INTO `presshop_country_lang` VALUES ('168', '1', 'Panama');
INSERT INTO `presshop_country_lang` VALUES ('168', '2', 'Panama');
INSERT INTO `presshop_country_lang` VALUES ('169', '1', 'Papua New Guinea');
INSERT INTO `presshop_country_lang` VALUES ('169', '2', 'Papouasie-Nouvelle-Guinée');
INSERT INTO `presshop_country_lang` VALUES ('170', '1', 'Paraguay');
INSERT INTO `presshop_country_lang` VALUES ('170', '2', 'Paraguay');
INSERT INTO `presshop_country_lang` VALUES ('171', '1', 'Peru');
INSERT INTO `presshop_country_lang` VALUES ('171', '2', 'Pérou');
INSERT INTO `presshop_country_lang` VALUES ('172', '1', 'Philippines');
INSERT INTO `presshop_country_lang` VALUES ('172', '2', 'Philippines');
INSERT INTO `presshop_country_lang` VALUES ('173', '1', 'Pitcairn');
INSERT INTO `presshop_country_lang` VALUES ('173', '2', 'Pitcairn');
INSERT INTO `presshop_country_lang` VALUES ('174', '1', 'Puerto Rico');
INSERT INTO `presshop_country_lang` VALUES ('174', '2', 'Porto Rico');
INSERT INTO `presshop_country_lang` VALUES ('175', '1', 'Qatar');
INSERT INTO `presshop_country_lang` VALUES ('175', '2', 'Qatar');
INSERT INTO `presshop_country_lang` VALUES ('176', '1', 'Réunion');
INSERT INTO `presshop_country_lang` VALUES ('176', '2', 'Réunion');
INSERT INTO `presshop_country_lang` VALUES ('177', '1', 'Russian Federation');
INSERT INTO `presshop_country_lang` VALUES ('177', '2', 'Russie, Fédération de');
INSERT INTO `presshop_country_lang` VALUES ('178', '1', 'Rwanda');
INSERT INTO `presshop_country_lang` VALUES ('178', '2', 'Rwanda');
INSERT INTO `presshop_country_lang` VALUES ('179', '1', 'Saint Barthélemy');
INSERT INTO `presshop_country_lang` VALUES ('179', '2', 'Saint-Barthélemy');
INSERT INTO `presshop_country_lang` VALUES ('180', '1', 'Saint Kitts and Nevis');
INSERT INTO `presshop_country_lang` VALUES ('180', '2', 'Saint-Kitts-et-Nevis');
INSERT INTO `presshop_country_lang` VALUES ('181', '1', 'Saint Lucia');
INSERT INTO `presshop_country_lang` VALUES ('181', '2', 'Sainte-Lucie');
INSERT INTO `presshop_country_lang` VALUES ('182', '1', 'Saint Martin');
INSERT INTO `presshop_country_lang` VALUES ('182', '2', 'Saint-Martin');
INSERT INTO `presshop_country_lang` VALUES ('183', '1', 'Saint Pierre and Miquelon');
INSERT INTO `presshop_country_lang` VALUES ('183', '2', 'Saint-Pierre-et-Miquelon');
INSERT INTO `presshop_country_lang` VALUES ('184', '1', 'Saint Vincent and the Grenadines');
INSERT INTO `presshop_country_lang` VALUES ('184', '2', 'Saint-Vincent-et-Les Grenadines');
INSERT INTO `presshop_country_lang` VALUES ('185', '1', 'Samoa');
INSERT INTO `presshop_country_lang` VALUES ('185', '2', 'Samoa');
INSERT INTO `presshop_country_lang` VALUES ('186', '1', 'San Marino');
INSERT INTO `presshop_country_lang` VALUES ('186', '2', 'Saint-Marin');
INSERT INTO `presshop_country_lang` VALUES ('187', '1', 'São Tomé and Príncipe');
INSERT INTO `presshop_country_lang` VALUES ('187', '2', 'Sao Tomé-et-Principe');
INSERT INTO `presshop_country_lang` VALUES ('188', '1', 'Saudi Arabia');
INSERT INTO `presshop_country_lang` VALUES ('188', '2', 'Arabie Saoudite');
INSERT INTO `presshop_country_lang` VALUES ('189', '1', 'Senegal');
INSERT INTO `presshop_country_lang` VALUES ('189', '2', 'Sénégal');
INSERT INTO `presshop_country_lang` VALUES ('190', '1', 'Serbia');
INSERT INTO `presshop_country_lang` VALUES ('190', '2', 'Serbie');
INSERT INTO `presshop_country_lang` VALUES ('191', '1', 'Seychelles');
INSERT INTO `presshop_country_lang` VALUES ('191', '2', 'Seychelles');
INSERT INTO `presshop_country_lang` VALUES ('192', '1', 'Sierra Leone');
INSERT INTO `presshop_country_lang` VALUES ('192', '2', 'Sierra Leone');
INSERT INTO `presshop_country_lang` VALUES ('193', '1', 'Slovenia');
INSERT INTO `presshop_country_lang` VALUES ('193', '2', 'Slovénie');
INSERT INTO `presshop_country_lang` VALUES ('194', '1', 'Solomon Islands');
INSERT INTO `presshop_country_lang` VALUES ('194', '2', 'Salomon, Îles');
INSERT INTO `presshop_country_lang` VALUES ('195', '1', 'Somalia');
INSERT INTO `presshop_country_lang` VALUES ('195', '2', 'Somalie');
INSERT INTO `presshop_country_lang` VALUES ('196', '1', 'South Georgia and the South Sandwich Islands');
INSERT INTO `presshop_country_lang` VALUES ('196', '2', 'Géorgie du Sud et les Îles Sandwich du Sud');
INSERT INTO `presshop_country_lang` VALUES ('197', '1', 'Sri Lanka');
INSERT INTO `presshop_country_lang` VALUES ('197', '2', 'Sri Lanka');
INSERT INTO `presshop_country_lang` VALUES ('198', '1', 'Sudan');
INSERT INTO `presshop_country_lang` VALUES ('198', '2', 'Soudan');
INSERT INTO `presshop_country_lang` VALUES ('199', '1', 'Suriname');
INSERT INTO `presshop_country_lang` VALUES ('199', '2', 'Suriname');
INSERT INTO `presshop_country_lang` VALUES ('200', '1', 'Svalbard and Jan Mayen');
INSERT INTO `presshop_country_lang` VALUES ('200', '2', 'Svalbard et Île Jan Mayen');
INSERT INTO `presshop_country_lang` VALUES ('201', '1', 'Swaziland');
INSERT INTO `presshop_country_lang` VALUES ('201', '2', 'Swaziland');
INSERT INTO `presshop_country_lang` VALUES ('202', '1', 'Syria');
INSERT INTO `presshop_country_lang` VALUES ('202', '2', 'Syrienne');
INSERT INTO `presshop_country_lang` VALUES ('203', '1', 'Taiwan');
INSERT INTO `presshop_country_lang` VALUES ('203', '2', 'Taïwan');
INSERT INTO `presshop_country_lang` VALUES ('204', '1', 'Tajikistan');
INSERT INTO `presshop_country_lang` VALUES ('204', '2', 'Tadjikistan');
INSERT INTO `presshop_country_lang` VALUES ('205', '1', 'Tanzania');
INSERT INTO `presshop_country_lang` VALUES ('205', '2', 'Tanzanie');
INSERT INTO `presshop_country_lang` VALUES ('206', '1', 'Thailand');
INSERT INTO `presshop_country_lang` VALUES ('206', '2', 'Thaïlande');
INSERT INTO `presshop_country_lang` VALUES ('207', '1', 'Tokelau');
INSERT INTO `presshop_country_lang` VALUES ('207', '2', 'Tokelau');
INSERT INTO `presshop_country_lang` VALUES ('208', '1', 'Tonga');
INSERT INTO `presshop_country_lang` VALUES ('208', '2', 'Tonga');
INSERT INTO `presshop_country_lang` VALUES ('209', '1', 'Trinidad and Tobago');
INSERT INTO `presshop_country_lang` VALUES ('209', '2', 'Trinité-et-Tobago');
INSERT INTO `presshop_country_lang` VALUES ('210', '1', 'Tunisia');
INSERT INTO `presshop_country_lang` VALUES ('210', '2', 'Tunisie');
INSERT INTO `presshop_country_lang` VALUES ('211', '1', 'Turkey');
INSERT INTO `presshop_country_lang` VALUES ('211', '2', 'Turquie');
INSERT INTO `presshop_country_lang` VALUES ('212', '1', 'Turkmenistan');
INSERT INTO `presshop_country_lang` VALUES ('212', '2', 'Turkménistan');
INSERT INTO `presshop_country_lang` VALUES ('213', '1', 'Turks and Caicos Islands');
INSERT INTO `presshop_country_lang` VALUES ('213', '2', 'Turks et Caiques, Îles');
INSERT INTO `presshop_country_lang` VALUES ('214', '1', 'Tuvalu');
INSERT INTO `presshop_country_lang` VALUES ('214', '2', 'Tuvalu');
INSERT INTO `presshop_country_lang` VALUES ('215', '1', 'Uganda');
INSERT INTO `presshop_country_lang` VALUES ('215', '2', 'Ouganda');
INSERT INTO `presshop_country_lang` VALUES ('216', '1', 'Ukraine');
INSERT INTO `presshop_country_lang` VALUES ('216', '2', 'Ukraine');
INSERT INTO `presshop_country_lang` VALUES ('217', '1', 'United Arab Emirates');
INSERT INTO `presshop_country_lang` VALUES ('217', '2', 'Émirats Arabes Unis');
INSERT INTO `presshop_country_lang` VALUES ('218', '1', 'Uruguay');
INSERT INTO `presshop_country_lang` VALUES ('218', '2', 'Uruguay');
INSERT INTO `presshop_country_lang` VALUES ('219', '1', 'Uzbekistan');
INSERT INTO `presshop_country_lang` VALUES ('219', '2', 'Ouzbékistan');
INSERT INTO `presshop_country_lang` VALUES ('220', '1', 'Vanuatu');
INSERT INTO `presshop_country_lang` VALUES ('220', '2', 'Vanuatu');
INSERT INTO `presshop_country_lang` VALUES ('221', '1', 'Venezuela');
INSERT INTO `presshop_country_lang` VALUES ('221', '2', 'Venezuela');
INSERT INTO `presshop_country_lang` VALUES ('222', '1', 'Vietnam');
INSERT INTO `presshop_country_lang` VALUES ('222', '2', 'Vietnam');
INSERT INTO `presshop_country_lang` VALUES ('223', '1', 'Virgin Islands (British)');
INSERT INTO `presshop_country_lang` VALUES ('223', '2', 'Îles Vierges Britanniques');
INSERT INTO `presshop_country_lang` VALUES ('224', '1', 'Virgin Islands (U.S.)');
INSERT INTO `presshop_country_lang` VALUES ('224', '2', 'Îles Vierges des États-Unis');
INSERT INTO `presshop_country_lang` VALUES ('225', '1', 'Wallis and Futuna');
INSERT INTO `presshop_country_lang` VALUES ('225', '2', 'Wallis et Futuna');
INSERT INTO `presshop_country_lang` VALUES ('226', '1', 'Western Sahara');
INSERT INTO `presshop_country_lang` VALUES ('226', '2', 'Sahara Occidental');
INSERT INTO `presshop_country_lang` VALUES ('227', '1', 'Yemen');
INSERT INTO `presshop_country_lang` VALUES ('227', '2', 'Yémen');
INSERT INTO `presshop_country_lang` VALUES ('228', '1', 'Zambia');
INSERT INTO `presshop_country_lang` VALUES ('228', '2', 'Zambie');
INSERT INTO `presshop_country_lang` VALUES ('229', '1', 'Zimbabwe');
INSERT INTO `presshop_country_lang` VALUES ('229', '2', 'Zimbabwe');
INSERT INTO `presshop_country_lang` VALUES ('230', '1', 'Albania');
INSERT INTO `presshop_country_lang` VALUES ('230', '2', 'Albanie');
INSERT INTO `presshop_country_lang` VALUES ('231', '1', 'Afghanistan');
INSERT INTO `presshop_country_lang` VALUES ('231', '2', 'Afghanistan');
INSERT INTO `presshop_country_lang` VALUES ('232', '1', 'Antarctica');
INSERT INTO `presshop_country_lang` VALUES ('232', '2', 'Antarctique');
INSERT INTO `presshop_country_lang` VALUES ('233', '1', 'Bosnia and Herzegovina');
INSERT INTO `presshop_country_lang` VALUES ('233', '2', 'Bosnie-Herzégovine');
INSERT INTO `presshop_country_lang` VALUES ('234', '1', 'Bouvet Island');
INSERT INTO `presshop_country_lang` VALUES ('234', '2', 'Bouvet, Île');
INSERT INTO `presshop_country_lang` VALUES ('235', '1', 'British Indian Ocean Territory');
INSERT INTO `presshop_country_lang` VALUES ('235', '2', 'Océan Indien, Territoire Britannique de L\'');
INSERT INTO `presshop_country_lang` VALUES ('236', '1', 'Bulgaria');
INSERT INTO `presshop_country_lang` VALUES ('236', '2', 'Bulgarie');
INSERT INTO `presshop_country_lang` VALUES ('237', '1', 'Cayman Islands');
INSERT INTO `presshop_country_lang` VALUES ('237', '2', 'Caïmans, Îles');
INSERT INTO `presshop_country_lang` VALUES ('238', '1', 'Christmas Island');
INSERT INTO `presshop_country_lang` VALUES ('238', '2', 'Christmas, Île');
INSERT INTO `presshop_country_lang` VALUES ('239', '1', 'Cocos (Keeling) Islands');
INSERT INTO `presshop_country_lang` VALUES ('239', '2', 'Cocos (Keeling), Îles');
INSERT INTO `presshop_country_lang` VALUES ('240', '1', 'Cook Islands');
INSERT INTO `presshop_country_lang` VALUES ('240', '2', 'Cook, Îles');
INSERT INTO `presshop_country_lang` VALUES ('241', '1', 'French Guiana');
INSERT INTO `presshop_country_lang` VALUES ('241', '2', 'Guyane Française');
INSERT INTO `presshop_country_lang` VALUES ('242', '1', 'French Polynesia');
INSERT INTO `presshop_country_lang` VALUES ('242', '2', 'Polynésie Française');
INSERT INTO `presshop_country_lang` VALUES ('243', '1', 'French Southern Territories');
INSERT INTO `presshop_country_lang` VALUES ('243', '2', 'Terres Australes Françaises');
INSERT INTO `presshop_country_lang` VALUES ('244', '1', 'Åland Islands');
INSERT INTO `presshop_country_lang` VALUES ('244', '2', 'Åland, Îles');

-- ----------------------------
-- Table structure for `presshop_currency`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_currency`;
CREATE TABLE `presshop_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_currency`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_currency
-- ----------------------------
INSERT INTO `presshop_currency` VALUES ('1', 'Euro', 'EUR', '€', '1', '2', '1', '1.000000', '1');
INSERT INTO `presshop_currency` VALUES ('2', 'Canada Dollar', 'CAD', '$', '0', '3', '1', '1.000000', '0');
INSERT INTO `presshop_currency` VALUES ('3', 'Pound', 'GBP', '£', '0', '1', '1', '0.800000', '1');

-- ----------------------------
-- Table structure for `presshop_customer`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customer`;
CREATE TABLE `presshop_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customer
-- ----------------------------
INSERT INTO `presshop_customer` VALUES ('1', '1', '1', '47ce86627c1f3c792a80773c5d2deaf8', 'pub@prestashop.com', 'ad807bdf0426766c05c64041124d30ce', '2010-06-30 10:43:53', '1970-01-15', 'DOE', '1', null, null, '1', 'John', null, '1', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_customer` VALUES ('2', '1', '1', '0837f0ccb139160eb26b651c2119cd70', 'huunam09@gmail.com', '049a32d5d6e50193119cf2fc2d6c8b84', '2010-07-02 21:40:43', '1989-01-01', 'nam', '1', '183.81.36.107', '2010-07-03 03:40:43', '0', 'nam', null, '1', '0', '2010-07-03 03:40:43', '2010-07-03 03:40:43');
INSERT INTO `presshop_customer` VALUES ('3', '1', '1', '487796638fe57854f37e0eb2843e43f6', 'mayman@live.ca', '9b30e29c4764da1636879826d89b10b0', '2010-07-06 16:35:14', '1966-05-31', 'May Webber', '0', null, null, '0', 'Michael', null, '1', '0', '2010-07-06 22:35:14', '2010-07-06 22:35:14');
INSERT INTO `presshop_customer` VALUES ('4', '2', '1', '7ec1968e1b96f3ff96bc3f23e48fb58b', 'tham212001@yahoo.com', 'f53ce83b594ef838ac7f720439bf705c', '2010-07-06 19:46:25', '1983-01-02', 'le', '0', null, null, '0', 'tham', null, '1', '0', '2010-07-07 01:46:25', '2010-07-07 01:46:25');

-- ----------------------------
-- Table structure for `presshop_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customer_group`;
CREATE TABLE `presshop_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customer_group
-- ----------------------------
INSERT INTO `presshop_customer_group` VALUES ('1', '1');
INSERT INTO `presshop_customer_group` VALUES ('2', '1');
INSERT INTO `presshop_customer_group` VALUES ('3', '1');
INSERT INTO `presshop_customer_group` VALUES ('4', '1');

-- ----------------------------
-- Table structure for `presshop_customization`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customization`;
CREATE TABLE `presshop_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customization
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_customization_field`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customization_field`;
CREATE TABLE `presshop_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customization_field
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_customization_field_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customization_field_lang`;
CREATE TABLE `presshop_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customization_field_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_customized_data`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_customized_data`;
CREATE TABLE `presshop_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_customized_data
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_date_range`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_date_range`;
CREATE TABLE `presshop_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_date_range
-- ----------------------------
INSERT INTO `presshop_date_range` VALUES ('1', '2010-06-30 00:00:00', '2010-06-30 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('2', '2010-07-01 00:00:00', '2010-07-01 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('3', '2010-07-02 00:00:00', '2010-07-02 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('4', '2010-07-03 00:00:00', '2010-07-03 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('5', '2010-07-04 00:00:00', '2010-07-04 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('6', '2010-07-05 00:00:00', '2010-07-05 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('7', '2010-07-06 00:00:00', '2010-07-06 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('8', '2010-07-07 00:00:00', '2010-07-07 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('9', '2010-07-08 00:00:00', '2010-07-08 23:59:59');

-- ----------------------------
-- Table structure for `presshop_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_delivery`;
CREATE TABLE `presshop_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_delivery
-- ----------------------------
INSERT INTO `presshop_delivery` VALUES ('1', '2', null, '1', '1', '5.00');
INSERT INTO `presshop_delivery` VALUES ('2', '2', null, '1', '2', '5.00');
INSERT INTO `presshop_delivery` VALUES ('7', '2', '1', null, '2', '5.00');
INSERT INTO `presshop_delivery` VALUES ('6', '2', '1', null, '1', '5.00');

-- ----------------------------
-- Table structure for `presshop_discount`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount`;
CREATE TABLE `presshop_discount` (
  `id_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '1',
  `cumulable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cumulable_reduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `minimal` decimal(17,2) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_discount`),
  KEY `discount_name` (`name`),
  KEY `discount_customer` (`id_customer`),
  KEY `id_discount_type` (`id_discount_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_discount_category`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount_category`;
CREATE TABLE `presshop_discount_category` (
  `id_category` int(11) unsigned NOT NULL,
  `id_discount` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_discount`),
  KEY `discount` (`id_discount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount_category
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_discount_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount_lang`;
CREATE TABLE `presshop_discount_lang` (
  `id_discount` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id_discount`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_discount_quantity`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount_quantity`;
CREATE TABLE `presshop_discount_quantity` (
  `id_discount_quantity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `value` decimal(17,2) unsigned NOT NULL,
  PRIMARY KEY (`id_discount_quantity`),
  KEY `id_discount_type` (`id_discount_type`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_discount_type`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount_type`;
CREATE TABLE `presshop_discount_type` (
  `id_discount_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_discount_type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount_type
-- ----------------------------
INSERT INTO `presshop_discount_type` VALUES ('1');
INSERT INTO `presshop_discount_type` VALUES ('2');
INSERT INTO `presshop_discount_type` VALUES ('3');

-- ----------------------------
-- Table structure for `presshop_discount_type_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_discount_type_lang`;
CREATE TABLE `presshop_discount_type_lang` (
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_discount_type`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_discount_type_lang
-- ----------------------------
INSERT INTO `presshop_discount_type_lang` VALUES ('1', '1', 'Discount on order (%)');
INSERT INTO `presshop_discount_type_lang` VALUES ('2', '1', 'Discount on order (amount)');
INSERT INTO `presshop_discount_type_lang` VALUES ('3', '1', 'Free shipping');
INSERT INTO `presshop_discount_type_lang` VALUES ('1', '2', 'Réduction sur la commande (%)');
INSERT INTO `presshop_discount_type_lang` VALUES ('2', '2', 'Réduction sur la commande (montant)');
INSERT INTO `presshop_discount_type_lang` VALUES ('3', '2', 'Frais de port gratuits');

-- ----------------------------
-- Table structure for `presshop_employee`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_employee`;
CREATE TABLE `presshop_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_employee
-- ----------------------------
INSERT INTO `presshop_employee` VALUES ('1', '1', 'LE', 'Tham', 'admin@conferences-formations.com', '9e293890d0ed2b54a87c21be02eef1b0', '2010-06-30 10:47:18', '2010-01-01', '2010-12-31', '1');

-- ----------------------------
-- Table structure for `presshop_feature`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_feature`;
CREATE TABLE `presshop_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_feature`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_feature
-- ----------------------------
INSERT INTO `presshop_feature` VALUES ('1');
INSERT INTO `presshop_feature` VALUES ('2');
INSERT INTO `presshop_feature` VALUES ('3');
INSERT INTO `presshop_feature` VALUES ('4');
INSERT INTO `presshop_feature` VALUES ('5');

-- ----------------------------
-- Table structure for `presshop_feature_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_feature_lang`;
CREATE TABLE `presshop_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_feature_lang
-- ----------------------------
INSERT INTO `presshop_feature_lang` VALUES ('1', '1', 'Height');
INSERT INTO `presshop_feature_lang` VALUES ('1', '2', 'Hauteur');
INSERT INTO `presshop_feature_lang` VALUES ('2', '1', 'Width');
INSERT INTO `presshop_feature_lang` VALUES ('2', '2', 'Largeur');
INSERT INTO `presshop_feature_lang` VALUES ('3', '1', 'Depth');
INSERT INTO `presshop_feature_lang` VALUES ('3', '2', 'Profondeur');
INSERT INTO `presshop_feature_lang` VALUES ('4', '1', 'Weight');
INSERT INTO `presshop_feature_lang` VALUES ('4', '2', 'Poids');
INSERT INTO `presshop_feature_lang` VALUES ('5', '1', 'Headphone');
INSERT INTO `presshop_feature_lang` VALUES ('5', '2', 'Prise casque');

-- ----------------------------
-- Table structure for `presshop_feature_product`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_feature_product`;
CREATE TABLE `presshop_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_feature_product
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_feature_value`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_feature_value`;
CREATE TABLE `presshop_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_feature_value
-- ----------------------------
INSERT INTO `presshop_feature_value` VALUES ('9', '5', null);
INSERT INTO `presshop_feature_value` VALUES ('10', '5', null);

-- ----------------------------
-- Table structure for `presshop_feature_value_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_feature_value_lang`;
CREATE TABLE `presshop_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_feature_value_lang
-- ----------------------------
INSERT INTO `presshop_feature_value_lang` VALUES ('9', '1', 'Jack stereo');
INSERT INTO `presshop_feature_value_lang` VALUES ('9', '2', 'Jack stéréo');
INSERT INTO `presshop_feature_value_lang` VALUES ('10', '1', 'Mini-jack stereo');
INSERT INTO `presshop_feature_value_lang` VALUES ('10', '2', 'Mini-jack stéréo');

-- ----------------------------
-- Table structure for `presshop_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_group`;
CREATE TABLE `presshop_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_group
-- ----------------------------
INSERT INTO `presshop_group` VALUES ('1', '0.00', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_group_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_group_lang`;
CREATE TABLE `presshop_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `attribute_lang_index` (`id_group`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_group_lang
-- ----------------------------
INSERT INTO `presshop_group_lang` VALUES ('1', '1', 'Default');
INSERT INTO `presshop_group_lang` VALUES ('1', '2', 'Défaut');

-- ----------------------------
-- Table structure for `presshop_guest`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_guest`;
CREATE TABLE `presshop_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_guest
-- ----------------------------
INSERT INTO `presshop_guest` VALUES ('1', '1', '3', '1', '1', '1680', '1050', '32', '1', '1', '0', '1', '1', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('2', '1', '3', '0', '1', '1280', '800', '24', '1', '1', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('3', '1', '8', '0', '1', '1280', '1024', '32', '0', '1', '0', '1', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('4', '1', '7', '0', '1', '1280', '800', '32', '0', '1', '0', '0', '0', '1', 'fr');
INSERT INTO `presshop_guest` VALUES ('5', '1', '3', '2', '1', '1280', '800', '24', '0', '1', '1', '0', '0', '1', 'en-us');
INSERT INTO `presshop_guest` VALUES ('6', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('7', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('8', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('9', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('10', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('11', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('12', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('13', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('14', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('15', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('16', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('17', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('18', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('19', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('20', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('21', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('22', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('23', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('24', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('25', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('26', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('27', '1', '8', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('28', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('29', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-gb');
INSERT INTO `presshop_guest` VALUES ('30', '1', '7', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('31', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ja');
INSERT INTO `presshop_guest` VALUES ('32', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ja');
INSERT INTO `presshop_guest` VALUES ('33', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('34', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('35', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('36', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('37', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('38', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');

-- ----------------------------
-- Table structure for `presshop_hook`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_hook`;
CREATE TABLE `presshop_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_hook
-- ----------------------------
INSERT INTO `presshop_hook` VALUES ('1', 'payment', 'Payment', null, '1');
INSERT INTO `presshop_hook` VALUES ('2', 'newOrder', 'New orders', null, '0');
INSERT INTO `presshop_hook` VALUES ('3', 'paymentConfirm', 'Payment confirmation', null, '0');
INSERT INTO `presshop_hook` VALUES ('4', 'paymentReturn', 'Payment return', null, '0');
INSERT INTO `presshop_hook` VALUES ('5', 'updateQuantity', 'Quantity update', 'Quantity is updated only when the customer effectively <b>place</b> his order.', '0');
INSERT INTO `presshop_hook` VALUES ('6', 'rightColumn', 'Right column blocks', null, '1');
INSERT INTO `presshop_hook` VALUES ('7', 'leftColumn', 'Left column blocks', null, '1');
INSERT INTO `presshop_hook` VALUES ('8', 'home', 'Homepage content', null, '1');
INSERT INTO `presshop_hook` VALUES ('9', 'header', 'Header of pages', 'A hook which allow you to do things in the header of each pages', '1');
INSERT INTO `presshop_hook` VALUES ('10', 'cart', 'Cart creation and update', null, '0');
INSERT INTO `presshop_hook` VALUES ('11', 'authentication', 'Successful customer authentication', null, '0');
INSERT INTO `presshop_hook` VALUES ('12', 'addproduct', 'Product creation', null, '0');
INSERT INTO `presshop_hook` VALUES ('13', 'updateproduct', 'Product Update', null, '0');
INSERT INTO `presshop_hook` VALUES ('14', 'top', 'Top of pages', 'A hook which allow you to do things a the top of each pages.', '1');
INSERT INTO `presshop_hook` VALUES ('15', 'extraRight', 'Extra actions on the product page (right column).', null, '0');
INSERT INTO `presshop_hook` VALUES ('16', 'deleteproduct', 'Product deletion', 'This hook is called when a product is deleted', '0');
INSERT INTO `presshop_hook` VALUES ('17', 'productfooter', 'Product footer', 'Add new blocks under the product description', '1');
INSERT INTO `presshop_hook` VALUES ('18', 'invoice', 'Invoice', 'Add blocks to invoice (order)', '1');
INSERT INTO `presshop_hook` VALUES ('19', 'updateOrderStatus', 'Order\'s status update event', 'Launch modules when the order\'s status of an order change.', '0');
INSERT INTO `presshop_hook` VALUES ('20', 'adminOrder', 'Display in Back-Office, tab AdminOrder', 'Launch modules when the tab AdminOrder is displayed on back-office.', '0');
INSERT INTO `presshop_hook` VALUES ('21', 'footer', 'Footer', 'Add block in footer', '1');
INSERT INTO `presshop_hook` VALUES ('22', 'PDFInvoice', 'PDF Invoice', 'Allow the display of extra informations into the PDF invoice', '0');
INSERT INTO `presshop_hook` VALUES ('23', 'adminCustomers', 'Display in Back-Office, tab AdminCustomers', 'Launch modules when the tab AdminCustomers is displayed on back-office.', '0');
INSERT INTO `presshop_hook` VALUES ('24', 'orderConfirmation', 'Order confirmation page', 'Called on order confirmation page', '0');
INSERT INTO `presshop_hook` VALUES ('25', 'createAccount', 'Successful customer create account', 'Called when new customer create account successfuled', '0');
INSERT INTO `presshop_hook` VALUES ('26', 'customerAccount', 'Customer account page display in front office', 'Display on page account of the customer', '1');
INSERT INTO `presshop_hook` VALUES ('27', 'orderSlip', 'Called when a order slip is created', 'Called when a quantity of one product change in an order.', '0');
INSERT INTO `presshop_hook` VALUES ('28', 'productTab', 'Tabs on product page', 'Called on order product page tabs', '0');
INSERT INTO `presshop_hook` VALUES ('29', 'productTabContent', 'Content of tabs on product page', 'Called on order product page tabs', '0');
INSERT INTO `presshop_hook` VALUES ('30', 'shoppingCart', 'Shopping cart footer', 'Display some specific informations on the shopping cart page', '0');
INSERT INTO `presshop_hook` VALUES ('31', 'createAccountForm', 'Customer account creation form', 'Display some information on the form to create a customer account', '1');
INSERT INTO `presshop_hook` VALUES ('32', 'AdminStatsModules', 'Stats - Modules', null, '1');
INSERT INTO `presshop_hook` VALUES ('33', 'GraphEngine', 'Graph Engines', null, '0');
INSERT INTO `presshop_hook` VALUES ('34', 'orderReturn', 'Product returned', null, '0');
INSERT INTO `presshop_hook` VALUES ('35', 'productActions', 'Product actions', 'Put new action buttons on product page', '1');
INSERT INTO `presshop_hook` VALUES ('36', 'backOfficeHome', 'Administration panel homepage', null, '1');
INSERT INTO `presshop_hook` VALUES ('37', 'GridEngine', 'Grid Engines', null, '0');
INSERT INTO `presshop_hook` VALUES ('38', 'watermark', 'Watermark', null, '0');
INSERT INTO `presshop_hook` VALUES ('39', 'cancelProduct', 'Product cancelled', 'This hook is called when you cancel a product in an order', '0');
INSERT INTO `presshop_hook` VALUES ('40', 'extraLeft', 'Extra actions on the product page (left column).', null, '0');
INSERT INTO `presshop_hook` VALUES ('41', 'productOutOfStock', 'Product out of stock', 'Make action while product is out of stock', '1');
INSERT INTO `presshop_hook` VALUES ('42', 'updateProductAttribute', 'Product attribute update', null, '0');
INSERT INTO `presshop_hook` VALUES ('43', 'extraCarrier', 'Extra carrier (module mode)', null, '0');
INSERT INTO `presshop_hook` VALUES ('44', 'shoppingCartExtra', 'Shopping cart extra button', 'Display some specific informations', '1');
INSERT INTO `presshop_hook` VALUES ('45', 'search', 'Search', null, '0');
INSERT INTO `presshop_hook` VALUES ('46', 'backBeforePayment', 'Redirect in order process', 'Redirect user to the module instead of displaying payment modules', '0');
INSERT INTO `presshop_hook` VALUES ('47', 'updateCarrier', 'Carrier Update', 'This hook is called when a carrier is updated', '0');
INSERT INTO `presshop_hook` VALUES ('48', 'postUpdateOrderStatus', 'Post update of order status', null, '0');
INSERT INTO `presshop_hook` VALUES ('49', 'createAccountTop', 'Block above the form for create an account', null, '1');
INSERT INTO `presshop_hook` VALUES ('50', 'backOfficeHeader', 'Administration panel header', null, '0');
INSERT INTO `presshop_hook` VALUES ('51', 'backOfficeTop', 'Administration panel hover the tabs', null, '1');
INSERT INTO `presshop_hook` VALUES ('52', 'backOfficeFooter', 'Administration panel footer', null, '1');
INSERT INTO `presshop_hook` VALUES ('53', 'myAccountBlock', 'My account block', 'Display extra informations inside the \"my account\" block', '1');

-- ----------------------------
-- Table structure for `presshop_hook_module`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_hook_module`;
CREATE TABLE `presshop_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_hook_module
-- ----------------------------
INSERT INTO `presshop_hook_module` VALUES ('3', '1', '1');
INSERT INTO `presshop_hook_module` VALUES ('6', '1', '2');
INSERT INTO `presshop_hook_module` VALUES ('4', '1', '3');
INSERT INTO `presshop_hook_module` VALUES ('8', '2', '1');
INSERT INTO `presshop_hook_module` VALUES ('3', '4', '1');
INSERT INTO `presshop_hook_module` VALUES ('6', '4', '2');
INSERT INTO `presshop_hook_module` VALUES ('9', '6', '1');
INSERT INTO `presshop_hook_module` VALUES ('16', '6', '2');
INSERT INTO `presshop_hook_module` VALUES ('8', '6', '3');
INSERT INTO `presshop_hook_module` VALUES ('20', '6', '4');
INSERT INTO `presshop_hook_module` VALUES ('15', '7', '1');
INSERT INTO `presshop_hook_module` VALUES ('21', '7', '2');
INSERT INTO `presshop_hook_module` VALUES ('10', '7', '3');
INSERT INTO `presshop_hook_module` VALUES ('24', '7', '4');
INSERT INTO `presshop_hook_module` VALUES ('14', '7', '5');
INSERT INTO `presshop_hook_module` VALUES ('12', '7', '6');
INSERT INTO `presshop_hook_module` VALUES ('7', '7', '7');
INSERT INTO `presshop_hook_module` VALUES ('17', '7', '8');
INSERT INTO `presshop_hook_module` VALUES ('5', '8', '1');
INSERT INTO `presshop_hook_module` VALUES ('1', '8', '2');
INSERT INTO `presshop_hook_module` VALUES ('19', '9', '1');
INSERT INTO `presshop_hook_module` VALUES ('11', '14', '1');
INSERT INTO `presshop_hook_module` VALUES ('13', '14', '2');
INSERT INTO `presshop_hook_module` VALUES ('18', '14', '3');
INSERT INTO `presshop_hook_module` VALUES ('19', '14', '4');
INSERT INTO `presshop_hook_module` VALUES ('22', '14', '5');
INSERT INTO `presshop_hook_module` VALUES ('8', '19', '1');
INSERT INTO `presshop_hook_module` VALUES ('23', '21', '1');
INSERT INTO `presshop_hook_module` VALUES ('25', '11', '1');
INSERT INTO `presshop_hook_module` VALUES ('25', '21', '2');
INSERT INTO `presshop_hook_module` VALUES ('26', '32', '1');
INSERT INTO `presshop_hook_module` VALUES ('27', '32', '2');
INSERT INTO `presshop_hook_module` VALUES ('28', '32', '3');
INSERT INTO `presshop_hook_module` VALUES ('30', '32', '4');
INSERT INTO `presshop_hook_module` VALUES ('31', '32', '5');
INSERT INTO `presshop_hook_module` VALUES ('32', '32', '6');
INSERT INTO `presshop_hook_module` VALUES ('33', '32', '7');
INSERT INTO `presshop_hook_module` VALUES ('34', '33', '1');
INSERT INTO `presshop_hook_module` VALUES ('35', '33', '2');
INSERT INTO `presshop_hook_module` VALUES ('36', '33', '3');
INSERT INTO `presshop_hook_module` VALUES ('37', '33', '4');
INSERT INTO `presshop_hook_module` VALUES ('38', '36', '1');
INSERT INTO `presshop_hook_module` VALUES ('39', '37', '1');
INSERT INTO `presshop_hook_module` VALUES ('40', '32', '8');
INSERT INTO `presshop_hook_module` VALUES ('41', '32', '9');
INSERT INTO `presshop_hook_module` VALUES ('42', '32', '10');
INSERT INTO `presshop_hook_module` VALUES ('43', '32', '11');
INSERT INTO `presshop_hook_module` VALUES ('42', '14', '6');
INSERT INTO `presshop_hook_module` VALUES ('43', '14', '7');
INSERT INTO `presshop_hook_module` VALUES ('44', '32', '12');
INSERT INTO `presshop_hook_module` VALUES ('45', '32', '13');
INSERT INTO `presshop_hook_module` VALUES ('46', '32', '15');
INSERT INTO `presshop_hook_module` VALUES ('47', '32', '14');
INSERT INTO `presshop_hook_module` VALUES ('48', '32', '16');
INSERT INTO `presshop_hook_module` VALUES ('49', '32', '17');
INSERT INTO `presshop_hook_module` VALUES ('50', '32', '18');
INSERT INTO `presshop_hook_module` VALUES ('51', '32', '19');
INSERT INTO `presshop_hook_module` VALUES ('51', '45', '1');
INSERT INTO `presshop_hook_module` VALUES ('25', '25', '1');
INSERT INTO `presshop_hook_module` VALUES ('41', '20', '2');
INSERT INTO `presshop_hook_module` VALUES ('52', '32', '20');

-- ----------------------------
-- Table structure for `presshop_hook_module_exceptions`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_hook_module_exceptions`;
CREATE TABLE `presshop_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_hook_module_exceptions
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_image`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_image`;
CREATE TABLE `presshop_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  KEY `image_product` (`id_product`),
  KEY `product_position` (`id_product`,`position`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_image
-- ----------------------------
INSERT INTO `presshop_image` VALUES ('52', '10', '1', '1');
INSERT INTO `presshop_image` VALUES ('53', '11', '1', '1');
INSERT INTO `presshop_image` VALUES ('54', '12', '1', '1');
INSERT INTO `presshop_image` VALUES ('55', '13', '1', '1');
INSERT INTO `presshop_image` VALUES ('56', '14', '1', '1');

-- ----------------------------
-- Table structure for `presshop_image_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_image_lang`;
CREATE TABLE `presshop_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  UNIQUE KEY `image_lang_index` (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_image_lang
-- ----------------------------
INSERT INTO `presshop_image_lang` VALUES ('10', '1', 'luxury-cover-for-ipod-video');
INSERT INTO `presshop_image_lang` VALUES ('10', '2', 'housse-luxe-pour-ipod-video');
INSERT INTO `presshop_image_lang` VALUES ('11', '1', 'cover');
INSERT INTO `presshop_image_lang` VALUES ('11', '2', 'housse');
INSERT INTO `presshop_image_lang` VALUES ('12', '1', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('12', '2', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('13', '1', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('13', '2', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('14', '1', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('14', '2', 'myglove-ipod-nano');
INSERT INTO `presshop_image_lang` VALUES ('53', '2', 'Robert piché aux commandes du destin');
INSERT INTO `presshop_image_lang` VALUES ('54', '1', 'Le grand dictionnaire des malaises et des maladies');
INSERT INTO `presshop_image_lang` VALUES ('54', '2', 'Le grand dictionnaire des malaises et des maladies');
INSERT INTO `presshop_image_lang` VALUES ('55', '1', 'Ô Miroirs, Dites-Moi');
INSERT INTO `presshop_image_lang` VALUES ('55', '2', 'Ô Miroirs, Dites-Moi');
INSERT INTO `presshop_image_lang` VALUES ('56', '1', 'Dire adieu aux illusions');
INSERT INTO `presshop_image_lang` VALUES ('56', '2', 'Dire adieu aux illusions');
INSERT INTO `presshop_image_lang` VALUES ('53', '1', 'Robert piché aux commandes du destin');
INSERT INTO `presshop_image_lang` VALUES ('52', '1', 'Fear of flying');
INSERT INTO `presshop_image_lang` VALUES ('52', '2', 'Vaincre la peur et l\'inconfort en avion');

-- ----------------------------
-- Table structure for `presshop_image_type`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_image_type`;
CREATE TABLE `presshop_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `scenes` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_image_type
-- ----------------------------
INSERT INTO `presshop_image_type` VALUES ('1', 'small', '45', '45', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('2', 'medium', '80', '80', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('3', 'large', '300', '300', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('4', 'thickbox', '600', '600', '1', '0', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('5', 'category', '500', '150', '0', '1', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('6', 'home', '129', '129', '1', '0', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('7', 'large_scene', '556', '200', '0', '0', '0', '0', '1');
INSERT INTO `presshop_image_type` VALUES ('8', 'thumb_scene', '161', '58', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `presshop_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_lang`;
CREATE TABLE `presshop_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_lang
-- ----------------------------
INSERT INTO `presshop_lang` VALUES ('1', 'English (English)', '1', 'en');
INSERT INTO `presshop_lang` VALUES ('2', 'Français (French)', '1', 'fr');

-- ----------------------------
-- Table structure for `presshop_manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_manufacturer`;
CREATE TABLE `presshop_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_manufacturer
-- ----------------------------
INSERT INTO `presshop_manufacturer` VALUES ('1', 'Apple Computer, Inc', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_manufacturer` VALUES ('2', 'Shure Incorporated', '2010-06-30 10:43:53', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_manufacturer_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_manufacturer_lang`;
CREATE TABLE `presshop_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` varchar(254) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_manufacturer_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_message`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_message`;
CREATE TABLE `presshop_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_message
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_message_readed`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_message_readed`;
CREATE TABLE `presshop_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_message_readed
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_meta`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_meta`;
CREATE TABLE `presshop_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `meta_name` (`page`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_meta
-- ----------------------------
INSERT INTO `presshop_meta` VALUES ('1', '404');
INSERT INTO `presshop_meta` VALUES ('2', 'best-sales');
INSERT INTO `presshop_meta` VALUES ('3', 'contact-form');
INSERT INTO `presshop_meta` VALUES ('4', 'index');
INSERT INTO `presshop_meta` VALUES ('5', 'manufacturer');
INSERT INTO `presshop_meta` VALUES ('6', 'new-products');
INSERT INTO `presshop_meta` VALUES ('7', 'password');
INSERT INTO `presshop_meta` VALUES ('8', 'prices-drop');
INSERT INTO `presshop_meta` VALUES ('9', 'sitemap');
INSERT INTO `presshop_meta` VALUES ('10', 'supplier');

-- ----------------------------
-- Table structure for `presshop_meta_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_meta_lang`;
CREATE TABLE `presshop_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_meta`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_meta_lang
-- ----------------------------
INSERT INTO `presshop_meta_lang` VALUES ('1', '1', '404 error', 'This page cannot be found', 'error, 404, not found');
INSERT INTO `presshop_meta_lang` VALUES ('1', '2', 'Erreur 404', 'Cette page est introuvable', 'erreur, 404, introuvable');
INSERT INTO `presshop_meta_lang` VALUES ('2', '1', 'Best sales', 'Our best sales', 'best sales');
INSERT INTO `presshop_meta_lang` VALUES ('2', '2', 'Meilleures ventes', 'Liste de nos produits les mieux vendus', 'meilleures ventes');
INSERT INTO `presshop_meta_lang` VALUES ('3', '1', 'Contact us', 'Use our form to contact us', 'contact, form, e-mail');
INSERT INTO `presshop_meta_lang` VALUES ('3', '2', 'Contactez-nous', 'Utilisez notre formulaire pour nous contacter', 'contact, formulaire, e-mail');
INSERT INTO `presshop_meta_lang` VALUES ('4', '1', '', 'Shop powered by PrestaShop', 'shop, prestashop');
INSERT INTO `presshop_meta_lang` VALUES ('4', '2', '', 'Boutique propulsée par PrestaShop', 'boutique, prestashop');
INSERT INTO `presshop_meta_lang` VALUES ('5', '1', 'Manufacturers', 'Manufacturers list', 'manufacturer');
INSERT INTO `presshop_meta_lang` VALUES ('5', '2', 'Fabricants', 'Liste de nos fabricants', 'fabricants');
INSERT INTO `presshop_meta_lang` VALUES ('6', '1', 'New products', 'Our new products', 'new, products');
INSERT INTO `presshop_meta_lang` VALUES ('6', '2', 'Nouveaux produits', 'Liste de nos nouveaux produits', 'nouveau, produit');
INSERT INTO `presshop_meta_lang` VALUES ('7', '1', 'Forgot your password', 'Enter your e-mail address used to register in goal to get e-mail with your new password', 'forgot, password, e-mail, new, reset');
INSERT INTO `presshop_meta_lang` VALUES ('7', '2', 'Mot de passe oublié', 'Renseignez votre adresse e-mail afin de recevoir votre nouveau mot de passe.', 'mot de passe, oublié, e-mail, nouveau, regénération');
INSERT INTO `presshop_meta_lang` VALUES ('8', '1', 'Specials', 'Our special products', 'special, prices drop');
INSERT INTO `presshop_meta_lang` VALUES ('8', '2', 'Promotions', 'Nos produits en promotion', 'promotion, réduction');
INSERT INTO `presshop_meta_lang` VALUES ('9', '1', 'Sitemap', 'Lost ? Find what your are looking for', 'sitemap');
INSERT INTO `presshop_meta_lang` VALUES ('9', '2', 'Plan du site', 'Perdu ? Trouvez ce que vous cherchez', 'plan, site');
INSERT INTO `presshop_meta_lang` VALUES ('10', '1', 'Suppliers', 'Suppliers list', 'supplier');
INSERT INTO `presshop_meta_lang` VALUES ('10', '2', 'Fournisseurs', 'Liste de nos fournisseurs', 'fournisseurs');

-- ----------------------------
-- Table structure for `presshop_module`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_module`;
CREATE TABLE `presshop_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_module
-- ----------------------------
INSERT INTO `presshop_module` VALUES ('1', 'homefeatured', '1');
INSERT INTO `presshop_module` VALUES ('2', 'gsitemap', '1');
INSERT INTO `presshop_module` VALUES ('3', 'cheque', '1');
INSERT INTO `presshop_module` VALUES ('4', 'paypal', '1');
INSERT INTO `presshop_module` VALUES ('5', 'editorial', '1');
INSERT INTO `presshop_module` VALUES ('6', 'bankwire', '1');
INSERT INTO `presshop_module` VALUES ('7', 'blockadvertising', '1');
INSERT INTO `presshop_module` VALUES ('8', 'blockbestsellers', '1');
INSERT INTO `presshop_module` VALUES ('9', 'blockcart', '1');
INSERT INTO `presshop_module` VALUES ('10', 'blockcategories', '1');
INSERT INTO `presshop_module` VALUES ('11', 'blockcurrencies', '1');
INSERT INTO `presshop_module` VALUES ('12', 'blockinfos', '1');
INSERT INTO `presshop_module` VALUES ('13', 'blocklanguages', '1');
INSERT INTO `presshop_module` VALUES ('14', 'blockmanufacturer', '1');
INSERT INTO `presshop_module` VALUES ('15', 'blockmyaccount', '1');
INSERT INTO `presshop_module` VALUES ('16', 'blocknewproducts', '1');
INSERT INTO `presshop_module` VALUES ('17', 'blockpaymentlogo', '1');
INSERT INTO `presshop_module` VALUES ('18', 'blockpermanentlinks', '1');
INSERT INTO `presshop_module` VALUES ('19', 'blocksearch', '1');
INSERT INTO `presshop_module` VALUES ('20', 'blockspecials', '1');
INSERT INTO `presshop_module` VALUES ('21', 'blocktags', '1');
INSERT INTO `presshop_module` VALUES ('22', 'blockuserinfo', '1');
INSERT INTO `presshop_module` VALUES ('23', 'blockvariouslinks', '1');
INSERT INTO `presshop_module` VALUES ('24', 'blockviewed', '1');
INSERT INTO `presshop_module` VALUES ('25', 'statsdata', '1');
INSERT INTO `presshop_module` VALUES ('26', 'statsvisits', '1');
INSERT INTO `presshop_module` VALUES ('27', 'statssales', '1');
INSERT INTO `presshop_module` VALUES ('28', 'statsregistrations', '1');
INSERT INTO `presshop_module` VALUES ('30', 'statspersonalinfos', '1');
INSERT INTO `presshop_module` VALUES ('31', 'statslive', '1');
INSERT INTO `presshop_module` VALUES ('32', 'statsequipment', '1');
INSERT INTO `presshop_module` VALUES ('33', 'statscatalog', '1');
INSERT INTO `presshop_module` VALUES ('34', 'graphvisifire', '1');
INSERT INTO `presshop_module` VALUES ('35', 'graphxmlswfcharts', '1');
INSERT INTO `presshop_module` VALUES ('36', 'graphgooglechart', '1');
INSERT INTO `presshop_module` VALUES ('37', 'graphartichow', '1');
INSERT INTO `presshop_module` VALUES ('38', 'statshome', '1');
INSERT INTO `presshop_module` VALUES ('39', 'gridextjs', '1');
INSERT INTO `presshop_module` VALUES ('40', 'statsbestcustomers', '1');
INSERT INTO `presshop_module` VALUES ('41', 'statsorigin', '1');
INSERT INTO `presshop_module` VALUES ('42', 'pagesnotfound', '1');
INSERT INTO `presshop_module` VALUES ('43', 'sekeywords', '1');
INSERT INTO `presshop_module` VALUES ('44', 'statsproduct', '1');
INSERT INTO `presshop_module` VALUES ('45', 'statsbestproducts', '1');
INSERT INTO `presshop_module` VALUES ('46', 'statsbestcategories', '1');
INSERT INTO `presshop_module` VALUES ('47', 'statsbestvouchers', '1');
INSERT INTO `presshop_module` VALUES ('48', 'statsbestsuppliers', '1');
INSERT INTO `presshop_module` VALUES ('49', 'statscarrier', '1');
INSERT INTO `presshop_module` VALUES ('50', 'statsnewsletter', '1');
INSERT INTO `presshop_module` VALUES ('51', 'statssearch', '1');
INSERT INTO `presshop_module` VALUES ('52', 'statscheckup', '1');

-- ----------------------------
-- Table structure for `presshop_module_country`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_module_country`;
CREATE TABLE `presshop_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_country`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_module_country
-- ----------------------------
INSERT INTO `presshop_module_country` VALUES ('3', '1');
INSERT INTO `presshop_module_country` VALUES ('3', '2');
INSERT INTO `presshop_module_country` VALUES ('3', '3');
INSERT INTO `presshop_module_country` VALUES ('3', '4');
INSERT INTO `presshop_module_country` VALUES ('3', '5');
INSERT INTO `presshop_module_country` VALUES ('3', '6');
INSERT INTO `presshop_module_country` VALUES ('3', '7');
INSERT INTO `presshop_module_country` VALUES ('3', '8');
INSERT INTO `presshop_module_country` VALUES ('3', '9');
INSERT INTO `presshop_module_country` VALUES ('3', '10');
INSERT INTO `presshop_module_country` VALUES ('3', '11');
INSERT INTO `presshop_module_country` VALUES ('3', '12');
INSERT INTO `presshop_module_country` VALUES ('3', '13');
INSERT INTO `presshop_module_country` VALUES ('3', '14');
INSERT INTO `presshop_module_country` VALUES ('3', '15');
INSERT INTO `presshop_module_country` VALUES ('3', '16');
INSERT INTO `presshop_module_country` VALUES ('3', '17');
INSERT INTO `presshop_module_country` VALUES ('3', '18');
INSERT INTO `presshop_module_country` VALUES ('3', '19');
INSERT INTO `presshop_module_country` VALUES ('3', '20');
INSERT INTO `presshop_module_country` VALUES ('3', '21');
INSERT INTO `presshop_module_country` VALUES ('3', '22');
INSERT INTO `presshop_module_country` VALUES ('3', '23');
INSERT INTO `presshop_module_country` VALUES ('3', '24');
INSERT INTO `presshop_module_country` VALUES ('3', '25');
INSERT INTO `presshop_module_country` VALUES ('3', '26');
INSERT INTO `presshop_module_country` VALUES ('3', '27');
INSERT INTO `presshop_module_country` VALUES ('3', '28');
INSERT INTO `presshop_module_country` VALUES ('3', '29');
INSERT INTO `presshop_module_country` VALUES ('3', '30');
INSERT INTO `presshop_module_country` VALUES ('3', '31');
INSERT INTO `presshop_module_country` VALUES ('3', '32');
INSERT INTO `presshop_module_country` VALUES ('3', '33');
INSERT INTO `presshop_module_country` VALUES ('3', '34');
INSERT INTO `presshop_module_country` VALUES ('4', '1');
INSERT INTO `presshop_module_country` VALUES ('4', '2');
INSERT INTO `presshop_module_country` VALUES ('4', '3');
INSERT INTO `presshop_module_country` VALUES ('4', '4');
INSERT INTO `presshop_module_country` VALUES ('4', '5');
INSERT INTO `presshop_module_country` VALUES ('4', '6');
INSERT INTO `presshop_module_country` VALUES ('4', '7');
INSERT INTO `presshop_module_country` VALUES ('4', '8');
INSERT INTO `presshop_module_country` VALUES ('4', '9');
INSERT INTO `presshop_module_country` VALUES ('4', '10');
INSERT INTO `presshop_module_country` VALUES ('4', '11');
INSERT INTO `presshop_module_country` VALUES ('4', '12');
INSERT INTO `presshop_module_country` VALUES ('4', '13');
INSERT INTO `presshop_module_country` VALUES ('4', '14');
INSERT INTO `presshop_module_country` VALUES ('4', '15');
INSERT INTO `presshop_module_country` VALUES ('4', '16');
INSERT INTO `presshop_module_country` VALUES ('4', '17');
INSERT INTO `presshop_module_country` VALUES ('4', '18');
INSERT INTO `presshop_module_country` VALUES ('4', '19');
INSERT INTO `presshop_module_country` VALUES ('4', '20');
INSERT INTO `presshop_module_country` VALUES ('4', '21');
INSERT INTO `presshop_module_country` VALUES ('4', '22');
INSERT INTO `presshop_module_country` VALUES ('4', '23');
INSERT INTO `presshop_module_country` VALUES ('4', '24');
INSERT INTO `presshop_module_country` VALUES ('4', '25');
INSERT INTO `presshop_module_country` VALUES ('4', '26');
INSERT INTO `presshop_module_country` VALUES ('4', '27');
INSERT INTO `presshop_module_country` VALUES ('4', '28');
INSERT INTO `presshop_module_country` VALUES ('4', '29');
INSERT INTO `presshop_module_country` VALUES ('4', '30');
INSERT INTO `presshop_module_country` VALUES ('4', '31');
INSERT INTO `presshop_module_country` VALUES ('4', '32');
INSERT INTO `presshop_module_country` VALUES ('4', '33');
INSERT INTO `presshop_module_country` VALUES ('4', '34');
INSERT INTO `presshop_module_country` VALUES ('6', '1');
INSERT INTO `presshop_module_country` VALUES ('6', '2');
INSERT INTO `presshop_module_country` VALUES ('6', '3');
INSERT INTO `presshop_module_country` VALUES ('6', '4');
INSERT INTO `presshop_module_country` VALUES ('6', '5');
INSERT INTO `presshop_module_country` VALUES ('6', '6');
INSERT INTO `presshop_module_country` VALUES ('6', '7');
INSERT INTO `presshop_module_country` VALUES ('6', '8');
INSERT INTO `presshop_module_country` VALUES ('6', '9');
INSERT INTO `presshop_module_country` VALUES ('6', '10');
INSERT INTO `presshop_module_country` VALUES ('6', '11');
INSERT INTO `presshop_module_country` VALUES ('6', '12');
INSERT INTO `presshop_module_country` VALUES ('6', '13');
INSERT INTO `presshop_module_country` VALUES ('6', '14');
INSERT INTO `presshop_module_country` VALUES ('6', '15');
INSERT INTO `presshop_module_country` VALUES ('6', '16');
INSERT INTO `presshop_module_country` VALUES ('6', '17');
INSERT INTO `presshop_module_country` VALUES ('6', '18');
INSERT INTO `presshop_module_country` VALUES ('6', '19');
INSERT INTO `presshop_module_country` VALUES ('6', '20');
INSERT INTO `presshop_module_country` VALUES ('6', '21');
INSERT INTO `presshop_module_country` VALUES ('6', '22');
INSERT INTO `presshop_module_country` VALUES ('6', '23');
INSERT INTO `presshop_module_country` VALUES ('6', '24');
INSERT INTO `presshop_module_country` VALUES ('6', '25');
INSERT INTO `presshop_module_country` VALUES ('6', '26');
INSERT INTO `presshop_module_country` VALUES ('6', '27');
INSERT INTO `presshop_module_country` VALUES ('6', '28');
INSERT INTO `presshop_module_country` VALUES ('6', '29');
INSERT INTO `presshop_module_country` VALUES ('6', '30');
INSERT INTO `presshop_module_country` VALUES ('6', '31');
INSERT INTO `presshop_module_country` VALUES ('6', '32');
INSERT INTO `presshop_module_country` VALUES ('6', '33');
INSERT INTO `presshop_module_country` VALUES ('6', '34');

-- ----------------------------
-- Table structure for `presshop_module_currency`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_module_currency`;
CREATE TABLE `presshop_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_module_currency
-- ----------------------------
INSERT INTO `presshop_module_currency` VALUES ('3', '2');
INSERT INTO `presshop_module_currency` VALUES ('4', '2');
INSERT INTO `presshop_module_currency` VALUES ('6', '2');

-- ----------------------------
-- Table structure for `presshop_module_group`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_module_group`;
CREATE TABLE `presshop_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_module_group
-- ----------------------------
INSERT INTO `presshop_module_group` VALUES ('3', '1');
INSERT INTO `presshop_module_group` VALUES ('4', '1');
INSERT INTO `presshop_module_group` VALUES ('6', '1');

-- ----------------------------
-- Table structure for `presshop_operating_system`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_operating_system`;
CREATE TABLE `presshop_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_operating_system
-- ----------------------------
INSERT INTO `presshop_operating_system` VALUES ('1', 'Windows XP');
INSERT INTO `presshop_operating_system` VALUES ('2', 'Windows Vista');
INSERT INTO `presshop_operating_system` VALUES ('3', 'MacOsX');
INSERT INTO `presshop_operating_system` VALUES ('4', 'Linux');

-- ----------------------------
-- Table structure for `presshop_orders`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_orders`;
CREATE TABLE `presshop_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `shipping_number` varchar(32) DEFAULT NULL,
  `total_discounts` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_real` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_wrapping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_orders
-- ----------------------------
INSERT INTO `presshop_orders` VALUES ('1', '2', '2', '1', '1', '1', '2', '2', '47ce86627c1f3c792a80773c5d2deaf8', 'Chèque', 'cheque', '1', '0', '', '', '0.00', '625.98', '625.98', '516.72', '618.00', '7.98', '0.00', '1', '0', '2008-09-10 15:30:44', '0000-00-00 00:00:00', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_detail`;
CREATE TABLE `presshop_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` float NOT NULL,
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(17,2) NOT NULL DEFAULT '0.00',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_detail
-- ----------------------------
INSERT INTO `presshop_order_detail` VALUES ('1', '1', '7', '23', 'iPod touch - Capacité: 32Go', '1', '0', '0', '0', '0', '392.140500', '0.000000', null, null, null, '0', 'TVA 19.6%', '19.600', '0.00', '0', '', '0', '0000-00-00 00:00:00');
INSERT INTO `presshop_order_detail` VALUES ('2', '1', '9', '0', 'Écouteurs à isolation sonore Shure SE210', '1', '0', '0', '0', '0', '124.581900', '0.000000', null, null, null, '0', 'TVA 19.6%', '19.600', '0.00', '0', '', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `presshop_order_discount`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_discount`;
CREATE TABLE `presshop_order_discount` (
  `id_order_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_order_discount`),
  KEY `order_discount_order` (`id_order`),
  KEY `id_discount` (`id_discount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_order_history`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_history`;
CREATE TABLE `presshop_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_history
-- ----------------------------
INSERT INTO `presshop_order_history` VALUES ('1', '0', '1', '1', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_order_message`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_message`;
CREATE TABLE `presshop_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_message
-- ----------------------------
INSERT INTO `presshop_order_message` VALUES ('1', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_order_message_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_message_lang`;
CREATE TABLE `presshop_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_message_lang
-- ----------------------------
INSERT INTO `presshop_order_message_lang` VALUES ('1', '1', 'Delay', 'Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,');
INSERT INTO `presshop_order_message_lang` VALUES ('1', '2', 'Délai', 'Bonjour,\n\nUn des éléments de votre commande est actuellement en réapprovisionnement, ce qui peut légèrement retarder son envoi.\n\nMerci de votre compréhension.\n\nCordialement,');

-- ----------------------------
-- Table structure for `presshop_order_return`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_return`;
CREATE TABLE `presshop_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_return
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_order_return_detail`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_return_detail`;
CREATE TABLE `presshop_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_return_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_order_return_state`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_return_state`;
CREATE TABLE `presshop_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_return_state
-- ----------------------------
INSERT INTO `presshop_order_return_state` VALUES ('1', '#ADD8E6');
INSERT INTO `presshop_order_return_state` VALUES ('2', '#EEDDFF');
INSERT INTO `presshop_order_return_state` VALUES ('3', '#DDFFAA');
INSERT INTO `presshop_order_return_state` VALUES ('4', '#FFD3D3');
INSERT INTO `presshop_order_return_state` VALUES ('5', '#FFFFBB');

-- ----------------------------
-- Table structure for `presshop_order_return_state_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_return_state_lang`;
CREATE TABLE `presshop_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_return_state`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_return_state_lang
-- ----------------------------
INSERT INTO `presshop_order_return_state_lang` VALUES ('1', '1', 'Waiting for confirmation');
INSERT INTO `presshop_order_return_state_lang` VALUES ('2', '1', 'Waiting for package');
INSERT INTO `presshop_order_return_state_lang` VALUES ('3', '1', 'Package received');
INSERT INTO `presshop_order_return_state_lang` VALUES ('4', '1', 'Return denied');
INSERT INTO `presshop_order_return_state_lang` VALUES ('5', '1', 'Return completed');
INSERT INTO `presshop_order_return_state_lang` VALUES ('1', '2', 'En attente de confirmation');
INSERT INTO `presshop_order_return_state_lang` VALUES ('2', '2', 'En attente du colis');
INSERT INTO `presshop_order_return_state_lang` VALUES ('3', '2', 'Colis reçu');
INSERT INTO `presshop_order_return_state_lang` VALUES ('4', '2', 'Retour refusé');
INSERT INTO `presshop_order_return_state_lang` VALUES ('5', '2', 'Retour terminé');

-- ----------------------------
-- Table structure for `presshop_order_slip`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_slip`;
CREATE TABLE `presshop_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_slip
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_order_slip_detail`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_slip_detail`;
CREATE TABLE `presshop_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_slip_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_order_state`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_state`;
CREATE TABLE `presshop_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_state
-- ----------------------------
INSERT INTO `presshop_order_state` VALUES ('1', '0', '1', 'lightblue', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('2', '1', '1', '#DDEEFF', '1', '0', '1', '0');
INSERT INTO `presshop_order_state` VALUES ('3', '1', '1', '#FFDD99', '1', '0', '1', '1');
INSERT INTO `presshop_order_state` VALUES ('4', '1', '1', '#EEDDFF', '1', '0', '1', '1');
INSERT INTO `presshop_order_state` VALUES ('5', '1', '0', '#DDFFAA', '1', '0', '1', '1');
INSERT INTO `presshop_order_state` VALUES ('6', '0', '1', '#DADADA', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('7', '1', '1', '#FFFFBB', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('8', '0', '1', '#FFDFDF', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('9', '1', '1', '#FFD3D3', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('10', '0', '1', 'lightblue', '1', '0', '0', '0');
INSERT INTO `presshop_order_state` VALUES ('11', '0', '0', 'lightblue', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `presshop_order_state_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_order_state_lang`;
CREATE TABLE `presshop_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_state`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_order_state_lang
-- ----------------------------
INSERT INTO `presshop_order_state_lang` VALUES ('1', '1', 'Awaiting cheque payment', 'cheque');
INSERT INTO `presshop_order_state_lang` VALUES ('2', '1', 'Payment accepted', 'payment');
INSERT INTO `presshop_order_state_lang` VALUES ('3', '1', 'Preparation in progress', 'preparation');
INSERT INTO `presshop_order_state_lang` VALUES ('4', '1', 'Shipped', 'shipped');
INSERT INTO `presshop_order_state_lang` VALUES ('5', '1', 'Delivered', '');
INSERT INTO `presshop_order_state_lang` VALUES ('6', '1', 'Canceled', 'order_canceled');
INSERT INTO `presshop_order_state_lang` VALUES ('7', '1', 'Refund', 'refund');
INSERT INTO `presshop_order_state_lang` VALUES ('8', '1', 'Payment error', 'payment_error');
INSERT INTO `presshop_order_state_lang` VALUES ('9', '1', 'On backorder', 'outofstock');
INSERT INTO `presshop_order_state_lang` VALUES ('10', '1', 'Awaiting bank wire payment', 'bankwire');
INSERT INTO `presshop_order_state_lang` VALUES ('11', '1', 'Awaiting PayPal payment', '');
INSERT INTO `presshop_order_state_lang` VALUES ('1', '2', 'En attente du paiement par chèque', 'cheque');
INSERT INTO `presshop_order_state_lang` VALUES ('2', '2', 'Paiement accepté', 'payment');
INSERT INTO `presshop_order_state_lang` VALUES ('3', '2', 'Préparation en cours', 'preparation');
INSERT INTO `presshop_order_state_lang` VALUES ('4', '2', 'En cours de livraison', 'shipped');
INSERT INTO `presshop_order_state_lang` VALUES ('5', '2', 'Livré', '');
INSERT INTO `presshop_order_state_lang` VALUES ('6', '2', 'Annulé', 'order_canceled');
INSERT INTO `presshop_order_state_lang` VALUES ('7', '2', 'Remboursé', 'refund');
INSERT INTO `presshop_order_state_lang` VALUES ('8', '2', 'Erreur de paiement', 'payment_error');
INSERT INTO `presshop_order_state_lang` VALUES ('9', '2', 'En attente de réapprovisionnement', 'outofstock');
INSERT INTO `presshop_order_state_lang` VALUES ('10', '2', 'En attente du paiement par virement bancaire', 'bankwire');
INSERT INTO `presshop_order_state_lang` VALUES ('11', '2', 'En attente du paiement par PayPal', '');

-- ----------------------------
-- Table structure for `presshop_pack`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_pack`;
CREATE TABLE `presshop_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_pack
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_page`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_page`;
CREATE TABLE `presshop_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_page
-- ----------------------------
INSERT INTO `presshop_page` VALUES ('1', '5', null);
INSERT INTO `presshop_page` VALUES ('2', '6', null);
INSERT INTO `presshop_page` VALUES ('3', '7', null);
INSERT INTO `presshop_page` VALUES ('4', '8', null);
INSERT INTO `presshop_page` VALUES ('5', '1', '7');
INSERT INTO `presshop_page` VALUES ('6', '4', '2');
INSERT INTO `presshop_page` VALUES ('7', '9', null);
INSERT INTO `presshop_page` VALUES ('8', '1', '2');
INSERT INTO `presshop_page` VALUES ('9', '3', '0');
INSERT INTO `presshop_page` VALUES ('10', '1', '1');
INSERT INTO `presshop_page` VALUES ('11', '1', '5');
INSERT INTO `presshop_page` VALUES ('12', '2', '3');
INSERT INTO `presshop_page` VALUES ('13', '2', '2');
INSERT INTO `presshop_page` VALUES ('14', '10', null);
INSERT INTO `presshop_page` VALUES ('15', '1', '9');
INSERT INTO `presshop_page` VALUES ('16', '1', '6');
INSERT INTO `presshop_page` VALUES ('17', '1', '8');
INSERT INTO `presshop_page` VALUES ('18', '11', null);
INSERT INTO `presshop_page` VALUES ('19', '12', null);
INSERT INTO `presshop_page` VALUES ('20', '13', null);
INSERT INTO `presshop_page` VALUES ('21', '3', '1');
INSERT INTO `presshop_page` VALUES ('22', '3', '2');
INSERT INTO `presshop_page` VALUES ('23', '3', '3');
INSERT INTO `presshop_page` VALUES ('24', '14', null);
INSERT INTO `presshop_page` VALUES ('25', '15', null);
INSERT INTO `presshop_page` VALUES ('26', '16', null);
INSERT INTO `presshop_page` VALUES ('27', '2', '7');
INSERT INTO `presshop_page` VALUES ('28', '1', '10');
INSERT INTO `presshop_page` VALUES ('29', '2', '6');
INSERT INTO `presshop_page` VALUES ('30', '2', '5');
INSERT INTO `presshop_page` VALUES ('31', '1', '11');
INSERT INTO `presshop_page` VALUES ('32', '1', '12');
INSERT INTO `presshop_page` VALUES ('33', '17', null);
INSERT INTO `presshop_page` VALUES ('34', '18', null);
INSERT INTO `presshop_page` VALUES ('35', '2', '0');
INSERT INTO `presshop_page` VALUES ('36', '1', '13');
INSERT INTO `presshop_page` VALUES ('37', '1', '14');

-- ----------------------------
-- Table structure for `presshop_pagenotfound`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_pagenotfound`;
CREATE TABLE `presshop_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_pagenotfound
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_page_type`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_page_type`;
CREATE TABLE `presshop_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_page_type
-- ----------------------------
INSERT INTO `presshop_page_type` VALUES ('1', 'product.php');
INSERT INTO `presshop_page_type` VALUES ('2', 'category.php');
INSERT INTO `presshop_page_type` VALUES ('3', 'order.php');
INSERT INTO `presshop_page_type` VALUES ('4', 'manufacturer.php');
INSERT INTO `presshop_page_type` VALUES ('5', 'index.php');
INSERT INTO `presshop_page_type` VALUES ('6', 'cms.php');
INSERT INTO `presshop_page_type` VALUES ('7', 'authentication.php');
INSERT INTO `presshop_page_type` VALUES ('8', 'contact-form.php');
INSERT INTO `presshop_page_type` VALUES ('9', 'sitemap.php');
INSERT INTO `presshop_page_type` VALUES ('10', 'cart.php');
INSERT INTO `presshop_page_type` VALUES ('11', 'prices-drop.php');
INSERT INTO `presshop_page_type` VALUES ('12', 'search.php');
INSERT INTO `presshop_page_type` VALUES ('13', 'my-account.php');
INSERT INTO `presshop_page_type` VALUES ('14', 'history.php');
INSERT INTO `presshop_page_type` VALUES ('15', 'order-slip.php');
INSERT INTO `presshop_page_type` VALUES ('16', 'discount.php');
INSERT INTO `presshop_page_type` VALUES ('17', 'new-products.php');
INSERT INTO `presshop_page_type` VALUES ('18', 'identity.php');

-- ----------------------------
-- Table structure for `presshop_page_viewed`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_page_viewed`;
CREATE TABLE `presshop_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_page_viewed
-- ----------------------------
INSERT INTO `presshop_page_viewed` VALUES ('1', '1', '17');
INSERT INTO `presshop_page_viewed` VALUES ('2', '1', '1');
INSERT INTO `presshop_page_viewed` VALUES ('3', '1', '8');
INSERT INTO `presshop_page_viewed` VALUES ('4', '1', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '2', '41');
INSERT INTO `presshop_page_viewed` VALUES ('5', '2', '1');
INSERT INTO `presshop_page_viewed` VALUES ('6', '2', '2');
INSERT INTO `presshop_page_viewed` VALUES ('4', '2', '2');
INSERT INTO `presshop_page_viewed` VALUES ('7', '2', '1');
INSERT INTO `presshop_page_viewed` VALUES ('8', '2', '6');
INSERT INTO `presshop_page_viewed` VALUES ('9', '2', '2');
INSERT INTO `presshop_page_viewed` VALUES ('10', '2', '1');
INSERT INTO `presshop_page_viewed` VALUES ('10', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '3', '14');
INSERT INTO `presshop_page_viewed` VALUES ('5', '3', '4');
INSERT INTO `presshop_page_viewed` VALUES ('11', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('7', '3', '2');
INSERT INTO `presshop_page_viewed` VALUES ('12', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('13', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('9', '3', '2');
INSERT INTO `presshop_page_viewed` VALUES ('14', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('3', '3', '3');
INSERT INTO `presshop_page_viewed` VALUES ('8', '3', '3');
INSERT INTO `presshop_page_viewed` VALUES ('15', '3', '4');
INSERT INTO `presshop_page_viewed` VALUES ('16', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('17', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('18', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('19', '3', '1');
INSERT INTO `presshop_page_viewed` VALUES ('15', '4', '5');
INSERT INTO `presshop_page_viewed` VALUES ('5', '4', '4');
INSERT INTO `presshop_page_viewed` VALUES ('4', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('11', '4', '2');
INSERT INTO `presshop_page_viewed` VALUES ('9', '4', '6');
INSERT INTO `presshop_page_viewed` VALUES ('3', '4', '4');
INSERT INTO `presshop_page_viewed` VALUES ('20', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('21', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('22', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('23', '4', '2');
INSERT INTO `presshop_page_viewed` VALUES ('1', '4', '11');
INSERT INTO `presshop_page_viewed` VALUES ('24', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('25', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('26', '4', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '5', '32');
INSERT INTO `presshop_page_viewed` VALUES ('16', '5', '5');
INSERT INTO `presshop_page_viewed` VALUES ('9', '5', '1');
INSERT INTO `presshop_page_viewed` VALUES ('8', '5', '7');
INSERT INTO `presshop_page_viewed` VALUES ('5', '5', '1');
INSERT INTO `presshop_page_viewed` VALUES ('11', '6', '2');
INSERT INTO `presshop_page_viewed` VALUES ('1', '6', '7');
INSERT INTO `presshop_page_viewed` VALUES ('10', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('16', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('17', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('15', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('7', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('8', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('12', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('4', '6', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '7', '15');
INSERT INTO `presshop_page_viewed` VALUES ('7', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('4', '7', '2');
INSERT INTO `presshop_page_viewed` VALUES ('8', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('5', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('27', '7', '7');
INSERT INTO `presshop_page_viewed` VALUES ('28', '7', '17');
INSERT INTO `presshop_page_viewed` VALUES ('9', '7', '10');
INSERT INTO `presshop_page_viewed` VALUES ('3', '7', '3');
INSERT INTO `presshop_page_viewed` VALUES ('21', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('29', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('30', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('2', '7', '4');
INSERT INTO `presshop_page_viewed` VALUES ('31', '7', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '8', '26');
INSERT INTO `presshop_page_viewed` VALUES ('29', '8', '39');
INSERT INTO `presshop_page_viewed` VALUES ('31', '8', '24');
INSERT INTO `presshop_page_viewed` VALUES ('32', '8', '5');
INSERT INTO `presshop_page_viewed` VALUES ('3', '8', '4');
INSERT INTO `presshop_page_viewed` VALUES ('21', '8', '2');
INSERT INTO `presshop_page_viewed` VALUES ('33', '8', '2');
INSERT INTO `presshop_page_viewed` VALUES ('30', '8', '2');
INSERT INTO `presshop_page_viewed` VALUES ('34', '8', '1');
INSERT INTO `presshop_page_viewed` VALUES ('20', '8', '1');
INSERT INTO `presshop_page_viewed` VALUES ('27', '8', '5');
INSERT INTO `presshop_page_viewed` VALUES ('35', '8', '1');
INSERT INTO `presshop_page_viewed` VALUES ('9', '8', '2');
INSERT INTO `presshop_page_viewed` VALUES ('28', '8', '4');
INSERT INTO `presshop_page_viewed` VALUES ('36', '8', '11');
INSERT INTO `presshop_page_viewed` VALUES ('37', '8', '2');
INSERT INTO `presshop_page_viewed` VALUES ('8', '8', '1');
INSERT INTO `presshop_page_viewed` VALUES ('6', '8', '1');
INSERT INTO `presshop_page_viewed` VALUES ('28', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('37', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('36', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('33', '9', '2');
INSERT INTO `presshop_page_viewed` VALUES ('32', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('31', '9', '2');
INSERT INTO `presshop_page_viewed` VALUES ('9', '9', '4');
INSERT INTO `presshop_page_viewed` VALUES ('14', '9', '7');

-- ----------------------------
-- Table structure for `presshop_product`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product`;
CREATE TABLE `presshop_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_tax` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_color_default` int(10) unsigned DEFAULT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `ecotax` decimal(17,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_price` decimal(17,2) DEFAULT NULL,
  `reduction_percent` float DEFAULT NULL,
  `reduction_from` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `reduction_to` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `weight` float NOT NULL DEFAULT '0',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`),
  KEY `id_tax` (`id_tax`),
  KEY `id_category_default` (`id_category_default`),
  KEY `id_color_default` (`id_color_default`),
  KEY `date_add` (`date_add`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product
-- ----------------------------
INSERT INTO `presshop_product` VALUES ('10', '0', '0', '4', '7', '0', '0', '', '0.00', '20', '15.950000', '0.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0.5', '2', '0', '0', '0', '0', '1', '1', '2010-07-06 22:06:50', '2010-07-06 22:34:48');
INSERT INTO `presshop_product` VALUES ('11', '0', '0', '4', '6', '0', '1', '', '0.00', '10', '24.950000', '20.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0', '0', '0', '0', '0', '0', '1', '1', '2010-07-06 23:38:47', '2010-07-07 08:27:07');
INSERT INTO `presshop_product` VALUES ('12', '0', '0', '4', '6', '0', '0', '', '0.00', '1', '34.950000', '0.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 00:16:10', '2010-07-07 14:33:54');
INSERT INTO `presshop_product` VALUES ('13', '0', '0', '4', '6', '0', '0', '', '0.00', '1', '26.580000', '19.500000', '0.00', '0', '2010-07-07 00:00:00', '2010-07-07 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 10:09:00', '2010-07-07 10:19:06');
INSERT INTO `presshop_product` VALUES ('14', '0', '0', '4', '6', '0', '0', '', '0.00', '7', '29.950000', '19.500000', '0.00', '0', '2010-07-07 00:00:00', '2010-07-07 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 14:47:16', '2010-07-07 14:50:18');

-- ----------------------------
-- Table structure for `presshop_product_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_attachment`;
CREATE TABLE `presshop_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_attribute`;
CREATE TABLE `presshop_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(17,2) NOT NULL DEFAULT '0.00',
  `ecotax` decimal(17,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_product_attribute`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `product_default` (`id_product`,`default_on`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_product_attribute_combination`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_attribute_combination`;
CREATE TABLE `presshop_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_attribute_combination
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_product_attribute_image`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_attribute_image`;
CREATE TABLE `presshop_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_attribute_image
-- ----------------------------
INSERT INTO `presshop_product_attribute_image` VALUES ('7', '46');
INSERT INTO `presshop_product_attribute_image` VALUES ('8', '47');
INSERT INTO `presshop_product_attribute_image` VALUES ('9', '49');
INSERT INTO `presshop_product_attribute_image` VALUES ('10', '48');
INSERT INTO `presshop_product_attribute_image` VALUES ('12', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('13', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('14', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('15', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('19', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('22', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('23', '0');
INSERT INTO `presshop_product_attribute_image` VALUES ('25', '38');
INSERT INTO `presshop_product_attribute_image` VALUES ('26', '38');
INSERT INTO `presshop_product_attribute_image` VALUES ('27', '45');
INSERT INTO `presshop_product_attribute_image` VALUES ('28', '45');
INSERT INTO `presshop_product_attribute_image` VALUES ('29', '44');
INSERT INTO `presshop_product_attribute_image` VALUES ('30', '44');
INSERT INTO `presshop_product_attribute_image` VALUES ('31', '37');
INSERT INTO `presshop_product_attribute_image` VALUES ('32', '37');
INSERT INTO `presshop_product_attribute_image` VALUES ('33', '40');
INSERT INTO `presshop_product_attribute_image` VALUES ('34', '40');
INSERT INTO `presshop_product_attribute_image` VALUES ('35', '41');
INSERT INTO `presshop_product_attribute_image` VALUES ('36', '41');
INSERT INTO `presshop_product_attribute_image` VALUES ('39', '39');
INSERT INTO `presshop_product_attribute_image` VALUES ('40', '39');
INSERT INTO `presshop_product_attribute_image` VALUES ('41', '42');
INSERT INTO `presshop_product_attribute_image` VALUES ('42', '42');

-- ----------------------------
-- Table structure for `presshop_product_download`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_download`;
CREATE TABLE `presshop_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `physically_filename` varchar(255) DEFAULT NULL,
  `date_deposit` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_download`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_download
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_product_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_lang`;
CREATE TABLE `presshop_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  UNIQUE KEY `product_lang_index` (`id_product`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_lang
-- ----------------------------
INSERT INTO `presshop_product_lang` VALUES ('10', '1', '<p>Fear of flying</p>', '<p>Fear of flying</p>', 'fear-of-flying', '', '', '', 'Fear of flying', '', '');
INSERT INTO `presshop_product_lang` VALUES ('10', '2', '<p>L&rsquo;&eacute;coute de ce CD vous apportera un mieux-&ecirc;tre physique, &eacute;motionnel et mental. Il a &eacute;t&eacute; cr&eacute;&eacute; sp&eacute;cifiquement pour d&eacute;mystifier la peur et d&eacute;couvrir des outils &agrave; la fois simples et efficaces pour att&eacute;nuer les sympt&ocirc;mes occasionn&eacute;s par elle.</p>\r\n<p>&Agrave; l&rsquo;aide de votre respiration et de votre conscience, vous serez en mesure de plonger &agrave; l&rsquo;int&eacute;rieur de vous-m&ecirc;me pour vous lib&eacute;rer des &eacute;motions, telles que peurs, angoisses et frustrations cristallis&eacute;es dans vos m&eacute;moires corporelles et cellulaires.</p>\r\n<p>George Wright anime la partie &laquo; psychoth&eacute;rapie &raquo; des ateliers sur la peur du vol en avion depuis 2000. Son taux de r&eacute;ussite atteint presque 95 %.</p>\r\n<h3>Pistes</h3>\r\n<ol>\r\n<li>Explication sur l&rsquo;origine et la symbolique de la peur face &agrave; l&rsquo;avion. Directives sur l&rsquo;utilisation de ces d&eacute;tentes guid&eacute;es </li>\r\n<li>Relaxation et lib&eacute;ration </li>\r\n<li>Simulation d&rsquo;un vol</li>\r\n</ol>\r\n<h4>Commentaires sur la d&eacute;tente dirig&eacute;e</h4>\r\n<p><em>&laquo; Les moments de d&eacute;tente dirig&eacute;e m\'ont permis d\'apprivoiser cette peur qui m\'&eacute;tranglait, de lui parler et de lui montrer le chemin de la sortie. L\'angoisse a c&eacute;d&eacute; la place &agrave; une belle qui&eacute;tude. Et &ccedil;a dure !&raquo;</em></p>\r\n<p><strong>Louise Cofsky</strong></p>', '<p>CD pour vous aider &agrave; surmonter votre peur&nbsp;en avion</p>', 'vaincre-la-peur-en-avion', '', '', '', 'Vaincre la peur et l\'inconfort en avion', '', '');
INSERT INTO `presshop_product_lang` VALUES ('11', '1', '', '<p>Robert pich&eacute; aux commandes du destin</p>', 'robert-piche-aux-commandes-du-destin', '', '', '', 'Robert piché aux commandes du destin', '', '');
INSERT INTO `presshop_product_lang` VALUES ('11', '2', '<p style=\"padding: 0px 0px 16px; float: none; clear: both; width: 740px; margin: 0px;\">Ce livre a inspir&eacute; le film Pich&eacute; : entre ciel et terre, qui sortira en salles le 7 juillet 2010. Pourvu d&rsquo;un budget de 7 millions de dollars et r&eacute;alis&eacute; par Sylvain Archambault, le long m&eacute;trage mettra en vedette Michel C&ocirc;t&eacute;, dont la ressemblance avec Robert Pich&eacute; est ind&eacute;niable.</p>\r\n<p style=\"padding: 0px 0px 16px; float: none; clear: both; width: 740px; margin: 0px;\">Robert Pich&eacute; aux commandes du destin, publi&eacute; pour la premi&egrave;re fois en 2002, raconte le parcours peu banal du c&eacute;l&egrave;bre commandant devenu h&eacute;ros national le jour o&ugrave; il a fait atterrir aux A&ccedil;ores son appareil Airbus A330 d&rsquo;Air Transat, sauvant ainsi la vie de 304 personnes &agrave; l&rsquo;&eacute;t&eacute; 2001. L&rsquo;&eacute;v&eacute;nement &ndash; fortement m&eacute;diatis&eacute; &ndash; l&rsquo;a beaucoup affect&eacute;, et les vieux souvenirs, dont celui de son incarc&eacute;ration aux &Eacute;tats-Unis, sont remont&eacute;s &agrave; la surface. Des passages douloureux, difficiles &agrave; oublier. Le r&eacute;cit que nous offre le journaliste Pierre Cayouette prend vite les allures d&rsquo;une aventure. Enrichi d&rsquo;une mise &agrave; jour &eacute;crite par Robert Pich&eacute; sur l&rsquo;apr&egrave;s-24 ao&ucirc;t 2001, ce t&eacute;moignage est &agrave; lire et &agrave; relire pour qui croit que tout est termin&eacute;.</p>', '<p>Ce livre a inspir&eacute; le film Pich&eacute; : Entre ciel et terre</p>', 'robert-piche-aux-commandes-du-destin', 'Robert piché aux commandes du destin', 'Robert piché aux commandes du destin, livre commandant', 'Robert piché aux commandes du destin', 'Robert piché aux commandes du destin', 'Disponible', 'Non disponible');
INSERT INTO `presshop_product_lang` VALUES ('13', '1', '<p>Avez-vous l\'impression que votre vie vous &eacute;chappe, qu\'elle manque d\'harmonie malgr&eacute; vous ?</p>\r\n<p><br />Cherchez-vous un moyen simple et efficace de vous d&eacute;gager de vos conditionnements et de vous lib&eacute;rer de vos souffrances ?</p>\r\n<p><br />Nicole Dumont, l\'auteure de cet ouvrage a aid&eacute; des centaines de personnes &agrave; utiliser le miroir comme outil de r&eacute;flexion et de compr&eacute;hension de soi.</p>\r\n<p>&nbsp;<br />Les miroirs,reflets de nos &eacute;tats int&eacute;rieurs nous interpellent ici dans un langage imag&eacute;, agr&eacute;ment&eacute; de phrases-cl&eacute;s, d\'exercices et d\'exemples qui nous toucheront, pour nous inviter &agrave; reconqu&eacute;rir du pouvoir sur nos vies et transformer nos propres r&eacute;actions.<br />En effet, nous cr&eacute;ons notre r&eacute;alit&eacute; et tout ce qui nous touche trouve une r&eacute;sonance en nous.<br />C\'est une approche r&eacute;solument holistique et simple que nous propose Nicole Dumont qui travaille dans le domaine de la croissance personnelle depuis de nombreuses ann&eacute;es.</p>\r\n<p><br />Un outil de &laquo; r&eacute;flexion &raquo; aux multiples facettes, visant &agrave; int&eacute;grer la notion de responsabilisation.</p>\r\n<p>&nbsp;</p>\r\n<p>Titre : &Ocirc; Miroirs, Dites-Moi<br />Sous-titre: <br />Auteur: Nicole Dumont<br />Collection : <br />Maison d\'&eacute;dition : Editions des 3 Monts<br />Maison de diffusion : ADL<br />Section (th&eacute;matique) : Psychologie<br />Nombre de pages : 393<br />Date de publication : &nbsp;03&nbsp;2008<br />ISBN : 978-2-35436-019-1</p>', '<p>Cherchez-vous un moyen simple et efficace de vous d&eacute;gager de vos conditionnements et de vous lib&eacute;rer de vos souffrances ?</p>', 'o-miroirs-dites-moi', 'Cherchez-vous un moyen simple et efficace de vous dégager de vos conditionnements et de vous libérer de vos souffrances ?', 'Nicole Dumont livre conference', 'Ô Miroirs, Dites-Moi', 'Ô Miroirs, Dites-Moi', '', '');
INSERT INTO `presshop_product_lang` VALUES ('12', '1', '<p>Voici le plus Grand Dictionnaire des Malaises et des Maladies reli&eacute;es aux conflits engendr&eacute;s par les pens&eacute;es, les sentiments et les &eacute;motions qui sont &agrave; l\'origine de la maladie.</p>\r\n<p>Vous avez trouv&eacute; int&eacute;ressante la premi&egrave;re &eacute;dition et avez travaill&eacute; et r&eacute;solu des conflits avec elle? Alors vous trouverez celle-ci tout &agrave; fait exceptionnelle!!! Plus de 75% plus d\'informations ajout&eacute;es aux 800 malaises, maladies et parties du corps de la premi&egrave;re &eacute;dition. Plus de 80 malaises et maladies ont aussi &eacute;t&eacute; ajout&eacute;s. Dans les ajouts, on y retrouve &laquo; le langage des oiseaux &raquo; ainsi que &laquo; les mots gu&eacute;risseurs &raquo; et plus encore, qui sont reli&eacute;s &agrave; une compr&eacute;hension symbolique faite par le cerveau et qui aident &agrave; activer la prise de conscience du conflit qui est &agrave; l\'origine de la maladie pour permettre une meilleure int&eacute;gration et acceptation, conditions souvent pr&eacute;alables et n&eacute;cessaires &agrave; la gu&eacute;rison.</p>\r\n<p>Un outil des plus captivant et essentiel, une aide pr&eacute;cieuse pour toute d&eacute;marche personnelle, familiale ou professionnelle du point de vue holistique (global) ou allopathique (m&eacute;dical).</p>', '<p>Ce Grand Dictionnaire reli&eacute;es aux conflits engendr&eacute;s par les pens&eacute;es, les sentiments et les &eacute;motions qui sont &agrave; l\'origine de la maladie..</p>', 'le-grand-dictionnaire-des-malaises-et-des-maladies', 'Best seller', 'jacques martel, conference, book, Best seller', 'Le grand dictionnaire des malaises et des maladies', 'Le grand dictionnaire des malaises et des maladies', '', '');
INSERT INTO `presshop_product_lang` VALUES ('12', '2', '<p>Voici le plus Grand Dictionnaire des Malaises et des Maladies reli&eacute;es aux conflits engendr&eacute;s par les pens&eacute;es, les sentiments et les &eacute;motions qui sont &agrave; l\'origine de la maladie.</p>\r\n<p>Vous avez trouv&eacute; int&eacute;ressante la premi&egrave;re &eacute;dition et avez travaill&eacute; et r&eacute;solu des conflits avec elle? Alors vous trouverez celle-ci tout &agrave; fait exceptionnelle!!! Plus de 75% plus d\'informations ajout&eacute;es aux 800 malaises, maladies et parties du corps de la premi&egrave;re &eacute;dition. Plus de 80 malaises et maladies ont aussi &eacute;t&eacute; ajout&eacute;s. Dans les ajouts, on y retrouve &laquo; le langage des oiseaux &raquo; ainsi que &laquo; les mots gu&eacute;risseurs &raquo; et plus encore, qui sont reli&eacute;s &agrave; une compr&eacute;hension symbolique faite par le cerveau et qui aident &agrave; activer la prise de conscience du conflit qui est &agrave; l\'origine de la maladie pour permettre une meilleure int&eacute;gration et acceptation, conditions souvent pr&eacute;alables et n&eacute;cessaires &agrave; la gu&eacute;rison.</p>\r\n<p>Un outil des plus captivant et essentiel, une aide pr&eacute;cieuse pour toute d&eacute;marche personnelle, familiale ou professionnelle du point de vue holistique (global) ou allopathique (m&eacute;dical).</p>', '<p>Il vous aide &agrave; comprendre l\'origine de la maladie.</p>', 'le-grand-dictionnaire-des-malaises-et-des-maladies', 'Best seller', 'jacques martel, dictionnaire maladie malaise, conférencier, livre, Best seller', 'Le grand dictionnaire des malaises et des maladies', 'Le grand dictionnaire des malaises et des maladies', '', '');
INSERT INTO `presshop_product_lang` VALUES ('14', '1', '<p>Nicole Dumont&nbsp;explique ici, de mani&egrave;re magistrale, de quelle fa&ccedil;on les nombreuses illusions cultiv&eacute;es par l\'ego peuvent priver l\'&ecirc;tre de libert&eacute; int&eacute;rieure et d\'une vie heureuse. Pr&eacute;sent&eacute; sous forme de r&eacute;flexion et d\'exemples de vie, cet ouvrage a le m&eacute;rite de faire comprendre au lecteur quelles sont les attitudes qui entretiennent la souffrance et celles qui peuvent y mettre fin. Vous y trouverez aussi des exercices qui facilitent l\'int&eacute;gration de nouvelles croyances en plus de courts textes inspir&eacute;s...</p>', '<p>Quelle fa&ccedil;on les nombreuses illusions cultiv&eacute;es par l\'ego peuvent priver l\'&ecirc;tre.</p>', 'dire-adieu-aux-illusions', 'Nicole Dumont explique de quelle façon les nombreuses illusions cultivées par l\'ego peuvent priver l\'être.', 'Nicole Dumont conference auteure', 'Dire adieu aux illusions', 'Dire adieu aux illusions', '', '');
INSERT INTO `presshop_product_lang` VALUES ('13', '2', '<p>Avez-vous l\'impression que votre vie vous &eacute;chappe, qu\'elle manque d\'harmonie malgr&eacute; vous ?</p>\r\n<p><br />Cherchez-vous un moyen simple et efficace de vous d&eacute;gager de vos conditionnements et de vous lib&eacute;rer de vos souffrances ?</p>\r\n<p><br />Nicole Dumont, l\'auteure de cet ouvrage a aid&eacute; des centaines de personnes &agrave; utiliser le miroir comme outil de r&eacute;flexion et de compr&eacute;hension de soi.</p>\r\n<p>&nbsp;<br />Les miroirs,reflets de nos &eacute;tats int&eacute;rieurs nous interpellent ici dans un langage imag&eacute;, agr&eacute;ment&eacute; de phrases-cl&eacute;s, d\'exercices et d\'exemples qui nous toucheront, pour nous inviter &agrave; reconqu&eacute;rir du pouvoir sur nos vies et transformer nos propres r&eacute;actions.<br />En effet, nous cr&eacute;ons notre r&eacute;alit&eacute; et tout ce qui nous touche trouve une r&eacute;sonance en nous.<br />C\'est une approche r&eacute;solument holistique et simple que nous propose Nicole Dumont qui travaille dans le domaine de la croissance personnelle depuis de nombreuses ann&eacute;es.</p>\r\n<p><br />Un outil de &laquo; r&eacute;flexion &raquo; aux multiples facettes, visant &agrave; int&eacute;grer la notion de responsabilisation.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Titre : &Ocirc; Miroirs, Dites-Moi<br />Sous-titre: <br />Auteur: Nicole Dumont<br />Collection : <br />Maison d\'&eacute;dition : Editions des 3 Monts<br />Maison de diffusion : ADL<br />Section (th&eacute;matique) : Psychologie<br />Nombre de pages : 393<br />Date de publication : &nbsp;03&nbsp;2008<br />ISBN : 978-2-35436-019-1</strong></p>', '<p>Cherchez-vous un moyen simple et efficace de vous d&eacute;gager de vos conditionnements et de vous lib&eacute;rer de vos souffrances ?</p>', 'o-miroirs-dites-moi', 'Cherchez-vous un moyen simple et efficace de vous dégager de vos conditionnements et de vous libérer de vos souffrances ?', 'Nicole Dumont livre conférencière', 'Ô Miroirs, Dites-Moi', 'Ô Miroirs, Dites-Moi', '', '');
INSERT INTO `presshop_product_lang` VALUES ('14', '2', '<p>Nicole Dumont&nbsp;explique ici, de mani&egrave;re magistrale, de quelle fa&ccedil;on les nombreuses illusions cultiv&eacute;es par l\'ego peuvent priver l\'&ecirc;tre de libert&eacute; int&eacute;rieure et d\'une vie heureuse. Pr&eacute;sent&eacute; sous forme de r&eacute;flexion et d\'exemples de vie, cet ouvrage a le m&eacute;rite de faire comprendre au lecteur quelles sont les attitudes qui entretiennent la souffrance et celles qui peuvent y mettre fin. Vous y trouverez aussi des exercices qui facilitent l\'int&eacute;gration de nouvelles croyances en plus de courts textes inspir&eacute;s...</p>', '<p>Quelle fa&ccedil;on les nombreuses illusions cultiv&eacute;es par l\'ego peuvent priver l\'&ecirc;tre.</p>', 'dire-adieu-aux-illusions', 'Nicole Dumont explique de quelle façon les nombreuses illusions cultivées par l\'ego peuvent priver l\'être.', 'Nicole Dumont conférencière auteure', 'Dire adieu aux illusions', 'Dire adieu aux illusions', '', '');

-- ----------------------------
-- Table structure for `presshop_product_sale`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_sale`;
CREATE TABLE `presshop_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_sale
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_product_tag`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_product_tag`;
CREATE TABLE `presshop_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_product_tag
-- ----------------------------
INSERT INTO `presshop_product_tag` VALUES ('10', '38');
INSERT INTO `presshop_product_tag` VALUES ('10', '39');
INSERT INTO `presshop_product_tag` VALUES ('11', '40');
INSERT INTO `presshop_product_tag` VALUES ('11', '41');
INSERT INTO `presshop_product_tag` VALUES ('11', '42');
INSERT INTO `presshop_product_tag` VALUES ('11', '43');
INSERT INTO `presshop_product_tag` VALUES ('12', '40');
INSERT INTO `presshop_product_tag` VALUES ('12', '44');
INSERT INTO `presshop_product_tag` VALUES ('12', '45');
INSERT INTO `presshop_product_tag` VALUES ('12', '46');
INSERT INTO `presshop_product_tag` VALUES ('12', '47');
INSERT INTO `presshop_product_tag` VALUES ('12', '48');
INSERT INTO `presshop_product_tag` VALUES ('12', '49');
INSERT INTO `presshop_product_tag` VALUES ('13', '50');
INSERT INTO `presshop_product_tag` VALUES ('13', '51');
INSERT INTO `presshop_product_tag` VALUES ('14', '54');
INSERT INTO `presshop_product_tag` VALUES ('14', '55');

-- ----------------------------
-- Table structure for `presshop_profile`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_profile`;
CREATE TABLE `presshop_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_profile
-- ----------------------------
INSERT INTO `presshop_profile` VALUES ('1');

-- ----------------------------
-- Table structure for `presshop_profile_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_profile_lang`;
CREATE TABLE `presshop_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_profile_lang
-- ----------------------------
INSERT INTO `presshop_profile_lang` VALUES ('1', '1', 'Administrator');
INSERT INTO `presshop_profile_lang` VALUES ('2', '1', 'Administrateur');

-- ----------------------------
-- Table structure for `presshop_quick_access`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_quick_access`;
CREATE TABLE `presshop_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_quick_access
-- ----------------------------
INSERT INTO `presshop_quick_access` VALUES ('1', '0', 'index.php');
INSERT INTO `presshop_quick_access` VALUES ('2', '1', '../');
INSERT INTO `presshop_quick_access` VALUES ('3', '0', 'index.php?tab=AdminCatalog&addcategory');
INSERT INTO `presshop_quick_access` VALUES ('4', '0', 'index.php?tab=AdminCatalog&addproduct');
INSERT INTO `presshop_quick_access` VALUES ('5', '0', 'index.php?tab=AdminDiscounts&adddiscount');

-- ----------------------------
-- Table structure for `presshop_quick_access_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_quick_access_lang`;
CREATE TABLE `presshop_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_quick_access_lang
-- ----------------------------
INSERT INTO `presshop_quick_access_lang` VALUES ('1', '1', 'Home');
INSERT INTO `presshop_quick_access_lang` VALUES ('1', '2', 'Accueil');
INSERT INTO `presshop_quick_access_lang` VALUES ('2', '1', 'My Shop');
INSERT INTO `presshop_quick_access_lang` VALUES ('2', '2', 'Ma boutique');
INSERT INTO `presshop_quick_access_lang` VALUES ('3', '1', 'New category');
INSERT INTO `presshop_quick_access_lang` VALUES ('3', '2', 'Nouvelle catégorie');
INSERT INTO `presshop_quick_access_lang` VALUES ('4', '1', 'New product');
INSERT INTO `presshop_quick_access_lang` VALUES ('4', '2', 'Nouveau produit');
INSERT INTO `presshop_quick_access_lang` VALUES ('5', '1', 'New voucher');
INSERT INTO `presshop_quick_access_lang` VALUES ('5', '2', 'Nouveau bon de réduction');

-- ----------------------------
-- Table structure for `presshop_range_price`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_range_price`;
CREATE TABLE `presshop_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_range_price
-- ----------------------------
INSERT INTO `presshop_range_price` VALUES ('1', '2', '0.000000', '10000.000000');

-- ----------------------------
-- Table structure for `presshop_range_weight`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_range_weight`;
CREATE TABLE `presshop_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_range_weight
-- ----------------------------
INSERT INTO `presshop_range_weight` VALUES ('1', '2', '0.000000', '10000.000000');

-- ----------------------------
-- Table structure for `presshop_referrer`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_referrer`;
CREATE TABLE `presshop_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_referrer
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_referrer_cache`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_referrer_cache`;
CREATE TABLE `presshop_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_referrer_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_scene`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_scene`;
CREATE TABLE `presshop_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_scene
-- ----------------------------
INSERT INTO `presshop_scene` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `presshop_scene_category`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_scene_category`;
CREATE TABLE `presshop_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_scene_category
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_scene_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_scene_lang`;
CREATE TABLE `presshop_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_scene_lang
-- ----------------------------
INSERT INTO `presshop_scene_lang` VALUES ('2', '1', 'The Shop Confor.ca');
INSERT INTO `presshop_scene_lang` VALUES ('2', '2', 'La Boutique Confor.ca');

-- ----------------------------
-- Table structure for `presshop_scene_products`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_scene_products`;
CREATE TABLE `presshop_scene_products` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_scene_products
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_search_engine`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_search_engine`;
CREATE TABLE `presshop_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_search_engine
-- ----------------------------
INSERT INTO `presshop_search_engine` VALUES ('1', 'google', 'q');
INSERT INTO `presshop_search_engine` VALUES ('2', 'aol', 'q');
INSERT INTO `presshop_search_engine` VALUES ('3', 'yandex', 'text');
INSERT INTO `presshop_search_engine` VALUES ('4', 'ask.com', 'q');
INSERT INTO `presshop_search_engine` VALUES ('5', 'nhl.com', 'q');
INSERT INTO `presshop_search_engine` VALUES ('6', 'yahoo', 'p');
INSERT INTO `presshop_search_engine` VALUES ('7', 'baidu', 'wd');
INSERT INTO `presshop_search_engine` VALUES ('8', 'lycos', 'query');
INSERT INTO `presshop_search_engine` VALUES ('9', 'exalead', 'q');
INSERT INTO `presshop_search_engine` VALUES ('10', 'search.live', 'q');
INSERT INTO `presshop_search_engine` VALUES ('11', 'voila', 'rdata');
INSERT INTO `presshop_search_engine` VALUES ('12', 'altavista', 'q');
INSERT INTO `presshop_search_engine` VALUES ('13', 'bing', 'q');
INSERT INTO `presshop_search_engine` VALUES ('14', 'daum', 'q');
INSERT INTO `presshop_search_engine` VALUES ('15', 'eniro', 'search_word');
INSERT INTO `presshop_search_engine` VALUES ('16', 'naver', 'query');
INSERT INTO `presshop_search_engine` VALUES ('17', 'msn', 'q');
INSERT INTO `presshop_search_engine` VALUES ('18', 'netscape', 'query');
INSERT INTO `presshop_search_engine` VALUES ('19', 'cnn', 'query');
INSERT INTO `presshop_search_engine` VALUES ('20', 'about', 'terms');
INSERT INTO `presshop_search_engine` VALUES ('21', 'mamma', 'query');
INSERT INTO `presshop_search_engine` VALUES ('22', 'alltheweb', 'q');
INSERT INTO `presshop_search_engine` VALUES ('23', 'virgilio', 'qs');
INSERT INTO `presshop_search_engine` VALUES ('24', 'alice', 'qs');
INSERT INTO `presshop_search_engine` VALUES ('25', 'najdi', 'q');
INSERT INTO `presshop_search_engine` VALUES ('26', 'mama', 'query');
INSERT INTO `presshop_search_engine` VALUES ('27', 'seznam', 'q');
INSERT INTO `presshop_search_engine` VALUES ('28', 'onet', 'qt');
INSERT INTO `presshop_search_engine` VALUES ('29', 'szukacz', 'q');
INSERT INTO `presshop_search_engine` VALUES ('30', 'yam', 'k');
INSERT INTO `presshop_search_engine` VALUES ('31', 'pchome', 'q');
INSERT INTO `presshop_search_engine` VALUES ('32', 'kvasir', 'q');
INSERT INTO `presshop_search_engine` VALUES ('33', 'sesam', 'q');
INSERT INTO `presshop_search_engine` VALUES ('34', 'ozu', 'q');
INSERT INTO `presshop_search_engine` VALUES ('35', 'terra', 'query');
INSERT INTO `presshop_search_engine` VALUES ('36', 'mynet', 'q');
INSERT INTO `presshop_search_engine` VALUES ('37', 'ekolay', 'q');
INSERT INTO `presshop_search_engine` VALUES ('38', 'rambler', 'words');

-- ----------------------------
-- Table structure for `presshop_search_index`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_search_index`;
CREATE TABLE `presshop_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_search_index
-- ----------------------------
INSERT INTO `presshop_search_index` VALUES ('12', '1927', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1926', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1925', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1669', '7');
INSERT INTO `presshop_search_index` VALUES ('12', '1924', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1923', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1922', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1921', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1920', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1919', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1918', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1917', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1916', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1915', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1914', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1913', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1912', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1911', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1910', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1909', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1908', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1907', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1906', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1905', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1904', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1903', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1902', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1901', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1559', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1695', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1900', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1586', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1899', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1898', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1897', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1896', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1895', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1623', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1894', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1893', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1892', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1891', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1890', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1595', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1718', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1889', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1888', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1887', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1886', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1600', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1885', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1570', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1884', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1637', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1883', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1882', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1881', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1880', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1879', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1878', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1709', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1759', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1877', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1876', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1875', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1583', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1694', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1874', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1873', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1872', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1698', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1871', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1870', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1869', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1733', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1641', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1593', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1867', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1866', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1582', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1865', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1864', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1666', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1863', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1862', '6');
INSERT INTO `presshop_search_index` VALUES ('12', '1861', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1868', '7');
INSERT INTO `presshop_search_index` VALUES ('12', '1622', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '2100', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1584', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1560', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1860', '9');
INSERT INTO `presshop_search_index` VALUES ('12', '1859', '9');
INSERT INTO `presshop_search_index` VALUES ('12', '1858', '11');
INSERT INTO `presshop_search_index` VALUES ('12', '1857', '7');
INSERT INTO `presshop_search_index` VALUES ('12', '1856', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1855', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1854', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1853', '4');
INSERT INTO `presshop_search_index` VALUES ('12', '1664', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1852', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1851', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1850', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1849', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1848', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1847', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1846', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1845', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1844', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1843', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1842', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1841', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1840', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1839', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1838', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1837', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1836', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1835', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1760', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1759', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1758', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1757', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1756', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1755', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1754', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1753', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1611', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1752', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1751', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1750', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1749', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1748', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1747', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1746', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1745', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1744', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1743', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1742', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1741', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1595', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1740', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1739', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1738', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1737', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1736', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1735', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1734', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1733', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1732', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1731', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1730', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1729', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1728', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1727', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1726', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1725', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1724', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1723', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1722', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1570', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1721', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1720', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1719', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1718', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1717', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1716', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1715', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1714', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1713', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1712', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1615', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1711', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1710', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1709', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1708', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1707', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1706', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1705', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1656', '5');
INSERT INTO `presshop_search_index` VALUES ('11', '1704', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1703', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1702', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1701', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1700', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1699', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1576', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1698', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1559', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1697', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1696', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1695', '3');
INSERT INTO `presshop_search_index` VALUES ('11', '1694', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1693', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1692', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1691', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1690', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1689', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1688', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1687', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1686', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1685', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1684', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1582', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1683', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1682', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1681', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1680', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1679', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1678', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1677', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1676', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1675', '1');
INSERT INTO `presshop_search_index` VALUES ('11', '1641', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1674', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1673', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1672', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1671', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1670', '2');
INSERT INTO `presshop_search_index` VALUES ('11', '1669', '9');
INSERT INTO `presshop_search_index` VALUES ('11', '1668', '7');
INSERT INTO `presshop_search_index` VALUES ('11', '1667', '11');
INSERT INTO `presshop_search_index` VALUES ('11', '1666', '13');
INSERT INTO `presshop_search_index` VALUES ('11', '1665', '19');
INSERT INTO `presshop_search_index` VALUES ('11', '1657', '17');
INSERT INTO `presshop_search_index` VALUES ('11', '1664', '3');
INSERT INTO `presshop_search_index` VALUES ('11', '1663', '7');
INSERT INTO `presshop_search_index` VALUES ('11', '1662', '7');
INSERT INTO `presshop_search_index` VALUES ('11', '1661', '7');
INSERT INTO `presshop_search_index` VALUES ('11', '1660', '7');
INSERT INTO `presshop_search_index` VALUES ('11', '1659', '7');
INSERT INTO `presshop_search_index` VALUES ('10', '1658', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1657', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1656', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1655', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1654', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1653', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1652', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1651', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1650', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1649', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1648', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1647', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1646', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1645', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1644', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1643', '2');
INSERT INTO `presshop_search_index` VALUES ('10', '1642', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1641', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1640', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1639', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1638', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1637', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1636', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1635', '2');
INSERT INTO `presshop_search_index` VALUES ('10', '1634', '2');
INSERT INTO `presshop_search_index` VALUES ('10', '1633', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1632', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1631', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1630', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1629', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1628', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1627', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1626', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1625', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1624', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1623', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1622', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1621', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1620', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1619', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1618', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1617', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1616', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1615', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1614', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1613', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1612', '2');
INSERT INTO `presshop_search_index` VALUES ('10', '1611', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1610', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1609', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1608', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1607', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1606', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1605', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1604', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1603', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1602', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1601', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1600', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1599', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1598', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1597', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1596', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1595', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1594', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1593', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1592', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1591', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1590', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1589', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1588', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1587', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1586', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1585', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1584', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1583', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1582', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1581', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1580', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1579', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1578', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1577', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1576', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1575', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1574', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1573', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1572', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1571', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1570', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1569', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1568', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1567', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1566', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1565', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1564', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1563', '3');
INSERT INTO `presshop_search_index` VALUES ('10', '1562', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1561', '1');
INSERT INTO `presshop_search_index` VALUES ('10', '1560', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1559', '4');
INSERT INTO `presshop_search_index` VALUES ('10', '1558', '13');
INSERT INTO `presshop_search_index` VALUES ('10', '1557', '6');
INSERT INTO `presshop_search_index` VALUES ('10', '1556', '15');
INSERT INTO `presshop_search_index` VALUES ('10', '1555', '6');
INSERT INTO `presshop_search_index` VALUES ('10', '1554', '12');
INSERT INTO `presshop_search_index` VALUES ('10', '1553', '12');
INSERT INTO `presshop_search_index` VALUES ('13', '2067', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '2066', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '1669', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '2099', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2098', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2097', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2096', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2095', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2094', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2093', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2092', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2091', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2090', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2089', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1872', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2088', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2087', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2086', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2085', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2084', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1834', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1833', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1832', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1831', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1830', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1829', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1828', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1827', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1826', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1825', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1824', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1823', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1822', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1821', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1820', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1819', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1818', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1817', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1816', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1815', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1814', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1813', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1812', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1811', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1810', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1809', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1808', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1807', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1806', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1805', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1804', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1803', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1802', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1801', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1800', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1799', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1798', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1797', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1796', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1795', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1794', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1793', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1792', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1791', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1790', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1789', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1788', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1787', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1786', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1785', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1784', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1783', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1782', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1781', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1780', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1767', '6');
INSERT INTO `presshop_search_index` VALUES ('12', '1766', '1');
INSERT INTO `presshop_search_index` VALUES ('12', '1779', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1778', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1777', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1776', '5');
INSERT INTO `presshop_search_index` VALUES ('12', '1775', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1774', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1773', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1772', '8');
INSERT INTO `presshop_search_index` VALUES ('12', '1771', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1770', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1769', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1661', '3');
INSERT INTO `presshop_search_index` VALUES ('12', '1768', '2');
INSERT INTO `presshop_search_index` VALUES ('12', '1765', '9');
INSERT INTO `presshop_search_index` VALUES ('12', '1764', '9');
INSERT INTO `presshop_search_index` VALUES ('12', '1763', '17');
INSERT INTO `presshop_search_index` VALUES ('12', '1762', '8');
INSERT INTO `presshop_search_index` VALUES ('12', '1761', '8');
INSERT INTO `presshop_search_index` VALUES ('14', '2172', '4');
INSERT INTO `presshop_search_index` VALUES ('14', '2066', '4');
INSERT INTO `presshop_search_index` VALUES ('14', '1669', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2171', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2170', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2169', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1862', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2168', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2167', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1903', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2166', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2037', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1884', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1876', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1560', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2165', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2164', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2163', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2162', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2161', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1641', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2160', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1733', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2159', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2158', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2100', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2157', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2156', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2021', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2020', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2038', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2026', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2155', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2154', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2153', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2152', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1719', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2151', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2150', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2149', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2148', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2033', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2140', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2018', '5');
INSERT INTO `presshop_search_index` VALUES ('14', '2017', '5');
INSERT INTO `presshop_search_index` VALUES ('14', '2147', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2146', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2145', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2144', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '1582', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2143', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2058', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2142', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2141', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2139', '8');
INSERT INTO `presshop_search_index` VALUES ('14', '1666', '6');
INSERT INTO `presshop_search_index` VALUES ('14', '2138', '6');
INSERT INTO `presshop_search_index` VALUES ('14', '2137', '6');
INSERT INTO `presshop_search_index` VALUES ('14', '1855', '4');
INSERT INTO `presshop_search_index` VALUES ('14', '1664', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2136', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2135', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2134', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1767', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2133', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2132', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1830', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2131', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1970', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1763', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1802', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1791', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1780', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2130', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2129', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2128', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2127', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2126', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1776', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2125', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1777', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2124', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2123', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2122', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2121', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2120', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1952', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1951', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1971', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1958', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2119', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2118', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2117', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2116', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1943', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '1816', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2115', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2114', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2113', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2112', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1966', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '2104', '1');
INSERT INTO `presshop_search_index` VALUES ('14', '1949', '5');
INSERT INTO `presshop_search_index` VALUES ('14', '1948', '5');
INSERT INTO `presshop_search_index` VALUES ('14', '2111', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2110', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2109', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2108', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '1771', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2107', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '1993', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '1772', '3');
INSERT INTO `presshop_search_index` VALUES ('14', '2106', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2105', '2');
INSERT INTO `presshop_search_index` VALUES ('14', '2103', '8');
INSERT INTO `presshop_search_index` VALUES ('14', '1661', '6');
INSERT INTO `presshop_search_index` VALUES ('14', '2102', '6');
INSERT INTO `presshop_search_index` VALUES ('14', '2101', '6');
INSERT INTO `presshop_search_index` VALUES ('12', '1928', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '2065', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2064', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2063', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2062', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2061', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2060', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1666', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2059', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2058', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1613', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1916', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2057', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2056', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1873', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2055', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1921', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2054', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2053', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1695', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2052', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1870', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2051', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1759', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2050', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2049', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2048', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2047', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2046', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2045', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2044', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2043', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1611', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2042', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2041', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2040', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1559', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2039', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1641', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '2038', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2037', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2036', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2035', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2034', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1888', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1600', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2033', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2032', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1741', '7');
INSERT INTO `presshop_search_index` VALUES ('13', '2031', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2030', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2029', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '2028', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2027', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1894', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2026', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1910', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2025', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2024', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2023', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1721', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2022', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1584', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2021', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2020', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2019', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2018', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '2017', '7');
INSERT INTO `presshop_search_index` VALUES ('13', '2016', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2015', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2014', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1583', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2013', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1719', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1563', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1595', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2012', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2011', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2010', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1592', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2009', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1601', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '2008', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1560', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '2007', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2006', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '2005', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2004', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '2003', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '2002', '8');
INSERT INTO `presshop_search_index` VALUES ('13', '2001', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '1855', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '1664', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '2083', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2082', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2081', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2080', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2079', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2078', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2077', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2076', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2075', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2074', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2073', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1785', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2072', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2071', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2070', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2069', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2068', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '2000', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1999', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1998', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1997', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1996', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1995', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1661', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1994', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1993', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1992', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1844', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1991', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1990', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1786', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1989', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1849', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1988', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1987', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1826', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1986', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1816', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1782', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1985', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1793', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1984', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1983', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1982', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1981', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1980', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1979', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1978', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1977', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1976', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1975', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1974', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1973', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1827', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1972', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1776', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '1971', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1970', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1969', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1968', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1967', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1808', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1805', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1966', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1965', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1964', '7');
INSERT INTO `presshop_search_index` VALUES ('13', '1963', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1962', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1961', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '1960', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1772', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1959', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1817', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1958', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1837', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1957', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1956', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1955', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1954', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1953', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1763', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1840', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1952', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1951', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1950', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1949', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '1948', '7');
INSERT INTO `presshop_search_index` VALUES ('13', '1947', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1946', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1945', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1789', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1944', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1943', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1942', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1811', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1941', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1940', '1');
INSERT INTO `presshop_search_index` VALUES ('13', '1939', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1938', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1937', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1936', '4');
INSERT INTO `presshop_search_index` VALUES ('13', '1935', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1780', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '1934', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1933', '3');
INSERT INTO `presshop_search_index` VALUES ('13', '1932', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1931', '2');
INSERT INTO `presshop_search_index` VALUES ('13', '1930', '6');
INSERT INTO `presshop_search_index` VALUES ('13', '1929', '8');

-- ----------------------------
-- Table structure for `presshop_search_word`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_search_word`;
CREATE TABLE `presshop_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`word`)
) ENGINE=MyISAM AUTO_INCREMENT=2173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_search_word
-- ----------------------------
INSERT INTO `presshop_search_word` VALUES ('1777', '1', 'sont');
INSERT INTO `presshop_search_word` VALUES ('1776', '1', 'qui');
INSERT INTO `presshop_search_word` VALUES ('1738', '2', 'difficiles');
INSERT INTO `presshop_search_word` VALUES ('2094', '2', 'psychologienomb');
INSERT INTO `presshop_search_word` VALUES ('2093', '2', 'thématique');
INSERT INTO `presshop_search_word` VALUES ('2092', '2', 'adlsection');
INSERT INTO `presshop_search_word` VALUES ('2091', '2', 'diffusion');
INSERT INTO `presshop_search_word` VALUES ('2090', '2', 'montsmaison');
INSERT INTO `presshop_search_word` VALUES ('2089', '2', 'editions');
INSERT INTO `presshop_search_word` VALUES ('2088', '2', 'maison');
INSERT INTO `presshop_search_word` VALUES ('2025', '2', 'comme');
INSERT INTO `presshop_search_word` VALUES ('2024', '2', 'miroir');
INSERT INTO `presshop_search_word` VALUES ('2087', '2', 'dumontcollectio');
INSERT INTO `presshop_search_word` VALUES ('2086', '2', 'auteur');
INSERT INTO `presshop_search_word` VALUES ('2085', '2', 'ditesmoisoustit');
INSERT INTO `presshop_search_word` VALUES ('2084', '2', 'titre');
INSERT INTO `presshop_search_word` VALUES ('2083', '1', '9782354360191');
INSERT INTO `presshop_search_word` VALUES ('2082', '1', '2008isbn');
INSERT INTO `presshop_search_word` VALUES ('2081', '1', 'publication');
INSERT INTO `presshop_search_word` VALUES ('2080', '1', '393date');
INSERT INTO `presshop_search_word` VALUES ('1737', '2', 'douloureux');
INSERT INTO `presshop_search_word` VALUES ('2079', '1', 'pages');
INSERT INTO `presshop_search_word` VALUES ('2078', '1', 'psychologienomb');
INSERT INTO `presshop_search_word` VALUES ('2077', '1', 'thématique');
INSERT INTO `presshop_search_word` VALUES ('1736', '2', 'passages');
INSERT INTO `presshop_search_word` VALUES ('2076', '1', 'adlsection');
INSERT INTO `presshop_search_word` VALUES ('1735', '2', 'surface');
INSERT INTO `presshop_search_word` VALUES ('2075', '1', 'diffusion');
INSERT INTO `presshop_search_word` VALUES ('2074', '1', 'montsmaison');
INSERT INTO `presshop_search_word` VALUES ('2073', '1', 'editions');
INSERT INTO `presshop_search_word` VALUES ('2072', '1', 'maison');
INSERT INTO `presshop_search_word` VALUES ('2071', '1', 'dumontcollectio');
INSERT INTO `presshop_search_word` VALUES ('2070', '1', 'auteur');
INSERT INTO `presshop_search_word` VALUES ('2069', '1', 'ditesmoisoustit');
INSERT INTO `presshop_search_word` VALUES ('1734', '2', 'remontés');
INSERT INTO `presshop_search_word` VALUES ('2068', '1', 'titre');
INSERT INTO `presshop_search_word` VALUES ('1733', '2', 'sont');
INSERT INTO `presshop_search_word` VALUES ('1732', '2', 'étatsunis');
INSERT INTO `presshop_search_word` VALUES ('1731', '2', 'incarcération');
INSERT INTO `presshop_search_word` VALUES ('2067', '2', 'livr');
INSERT INTO `presshop_search_word` VALUES ('2066', '2', 'conférencière');
INSERT INTO `presshop_search_word` VALUES ('2065', '2', 'responsabilisat');
INSERT INTO `presshop_search_word` VALUES ('2064', '2', 'notion');
INSERT INTO `presshop_search_word` VALUES ('2023', '2', 'utiliser');
INSERT INTO `presshop_search_word` VALUES ('1775', '1', 'émotions');
INSERT INTO `presshop_search_word` VALUES ('2063', '2', 'intégrer');
INSERT INTO `presshop_search_word` VALUES ('1730', '2', 'celui');
INSERT INTO `presshop_search_word` VALUES ('2062', '2', 'visant');
INSERT INTO `presshop_search_word` VALUES ('1729', '2', 'souvenirs');
INSERT INTO `presshop_search_word` VALUES ('1728', '2', 'vieux');
INSERT INTO `presshop_search_word` VALUES ('2061', '2', 'facettes');
INSERT INTO `presshop_search_word` VALUES ('2060', '2', 'multiples');
INSERT INTO `presshop_search_word` VALUES ('1727', '2', 'affecté');
INSERT INTO `presshop_search_word` VALUES ('2059', '2', 'années');
INSERT INTO `presshop_search_word` VALUES ('2058', '2', 'nombreuses');
INSERT INTO `presshop_search_word` VALUES ('2057', '2', 'croissance');
INSERT INTO `presshop_search_word` VALUES ('2056', '2', 'domaine');
INSERT INTO `presshop_search_word` VALUES ('1726', '2', 'beaucoup');
INSERT INTO `presshop_search_word` VALUES ('2055', '2', 'propose');
INSERT INTO `presshop_search_word` VALUES ('2054', '2', 'résolument');
INSERT INTO `presshop_search_word` VALUES ('2053', '2', 'approche');
INSERT INTO `presshop_search_word` VALUES ('1725', '2', 'médiatisé');
INSERT INTO `presshop_search_word` VALUES ('2052', '2', 'résonance');
INSERT INTO `presshop_search_word` VALUES ('2051', '2', 'touche');
INSERT INTO `presshop_search_word` VALUES ('2050', '2', 'réalité');
INSERT INTO `presshop_search_word` VALUES ('1724', '2', 'fortement');
INSERT INTO `presshop_search_word` VALUES ('2049', '2', 'notre');
INSERT INTO `presshop_search_word` VALUES ('2048', '2', 'créons');
INSERT INTO `presshop_search_word` VALUES ('1723', '2', 'événement');
INSERT INTO `presshop_search_word` VALUES ('2047', '2', 'effet');
INSERT INTO `presshop_search_word` VALUES ('2046', '2', 'réactions');
INSERT INTO `presshop_search_word` VALUES ('2045', '2', 'propres');
INSERT INTO `presshop_search_word` VALUES ('1722', '2', '2001');
INSERT INTO `presshop_search_word` VALUES ('2044', '2', 'transformer');
INSERT INTO `presshop_search_word` VALUES ('2043', '2', 'vies');
INSERT INTO `presshop_search_word` VALUES ('2042', '2', 'pouvoir');
INSERT INTO `presshop_search_word` VALUES ('2041', '2', 'reconquérir');
INSERT INTO `presshop_search_word` VALUES ('1721', '2', 'personnes');
INSERT INTO `presshop_search_word` VALUES ('2040', '2', 'inviter');
INSERT INTO `presshop_search_word` VALUES ('2039', '2', 'toucheront');
INSERT INTO `presshop_search_word` VALUES ('2038', '2', 'exemples');
INSERT INTO `presshop_search_word` VALUES ('2022', '2', 'centaines');
INSERT INTO `presshop_search_word` VALUES ('2037', '2', 'exercices');
INSERT INTO `presshop_search_word` VALUES ('2036', '2', 'phrasesclés');
INSERT INTO `presshop_search_word` VALUES ('2035', '2', 'agrémenté');
INSERT INTO `presshop_search_word` VALUES ('2034', '2', 'imagé');
INSERT INTO `presshop_search_word` VALUES ('2033', '2', 'ici');
INSERT INTO `presshop_search_word` VALUES ('2032', '2', 'interpellent');
INSERT INTO `presshop_search_word` VALUES ('1720', '2', '304');
INSERT INTO `presshop_search_word` VALUES ('1719', '2', 'vie');
INSERT INTO `presshop_search_word` VALUES ('1718', '2', 'ainsi');
INSERT INTO `presshop_search_word` VALUES ('2031', '2', 'intérieurs');
INSERT INTO `presshop_search_word` VALUES ('1774', '1', 'sentiments');
INSERT INTO `presshop_search_word` VALUES ('2030', '2', 'états');
INSERT INTO `presshop_search_word` VALUES ('2029', '2', 'nos');
INSERT INTO `presshop_search_word` VALUES ('2028', '2', 'reflets');
INSERT INTO `presshop_search_word` VALUES ('2027', '2', 'soi');
INSERT INTO `presshop_search_word` VALUES ('2026', '2', 'réflexion');
INSERT INTO `presshop_search_word` VALUES ('2021', '2', 'ouvrage');
INSERT INTO `presshop_search_word` VALUES ('1717', '2', 'sauvant');
INSERT INTO `presshop_search_word` VALUES ('2162', '2', 'souffrance');
INSERT INTO `presshop_search_word` VALUES ('2161', '2', 'entretiennent');
INSERT INTO `presshop_search_word` VALUES ('2160', '2', 'attitudes');
INSERT INTO `presshop_search_word` VALUES ('2159', '2', 'quelles');
INSERT INTO `presshop_search_word` VALUES ('2158', '2', 'lecteur');
INSERT INTO `presshop_search_word` VALUES ('2157', '2', 'faire');
INSERT INTO `presshop_search_word` VALUES ('2156', '2', 'mérite');
INSERT INTO `presshop_search_word` VALUES ('2155', '2', 'forme');
INSERT INTO `presshop_search_word` VALUES ('2154', '2', 'sous');
INSERT INTO `presshop_search_word` VALUES ('2153', '2', 'présenté');
INSERT INTO `presshop_search_word` VALUES ('2152', '2', 'heureuse');
INSERT INTO `presshop_search_word` VALUES ('2151', '2', 'intérieure');
INSERT INTO `presshop_search_word` VALUES ('2150', '2', 'liberté');
INSERT INTO `presshop_search_word` VALUES ('2149', '2', 'magistrale');
INSERT INTO `presshop_search_word` VALUES ('2148', '2', 'manière');
INSERT INTO `presshop_search_word` VALUES ('2147', '2', 'être');
INSERT INTO `presshop_search_word` VALUES ('2146', '2', 'priver');
INSERT INTO `presshop_search_word` VALUES ('2145', '2', 'peuvent');
INSERT INTO `presshop_search_word` VALUES ('2144', '2', 'ego');
INSERT INTO `presshop_search_word` VALUES ('2143', '2', 'cultivées');
INSERT INTO `presshop_search_word` VALUES ('2142', '2', 'façon');
INSERT INTO `presshop_search_word` VALUES ('2141', '2', 'quelle');
INSERT INTO `presshop_search_word` VALUES ('2140', '2', 'explique');
INSERT INTO `presshop_search_word` VALUES ('2139', '2', 'illusions');
INSERT INTO `presshop_search_word` VALUES ('2138', '2', 'adieu');
INSERT INTO `presshop_search_word` VALUES ('2137', '2', 'dire');
INSERT INTO `presshop_search_word` VALUES ('2136', '1', 'inspirés');
INSERT INTO `presshop_search_word` VALUES ('2135', '1', 'textes');
INSERT INTO `presshop_search_word` VALUES ('2134', '1', 'courts');
INSERT INTO `presshop_search_word` VALUES ('2133', '1', 'croyances');
INSERT INTO `presshop_search_word` VALUES ('2132', '1', 'nouvelles');
INSERT INTO `presshop_search_word` VALUES ('2131', '1', 'facilitent');
INSERT INTO `presshop_search_word` VALUES ('2130', '1', 'fin');
INSERT INTO `presshop_search_word` VALUES ('2129', '1', 'mettre');
INSERT INTO `presshop_search_word` VALUES ('1716', '2', 'transat');
INSERT INTO `presshop_search_word` VALUES ('2128', '1', 'celles');
INSERT INTO `presshop_search_word` VALUES ('2127', '1', 'souffrance');
INSERT INTO `presshop_search_word` VALUES ('2126', '1', 'entretiennent');
INSERT INTO `presshop_search_word` VALUES ('2125', '1', 'attitudes');
INSERT INTO `presshop_search_word` VALUES ('2124', '1', 'quelles');
INSERT INTO `presshop_search_word` VALUES ('2123', '1', 'lecteur');
INSERT INTO `presshop_search_word` VALUES ('2122', '1', 'comprendre');
INSERT INTO `presshop_search_word` VALUES ('2121', '1', 'faire');
INSERT INTO `presshop_search_word` VALUES ('2120', '1', 'mérite');
INSERT INTO `presshop_search_word` VALUES ('2119', '1', 'forme');
INSERT INTO `presshop_search_word` VALUES ('2118', '1', 'sous');
INSERT INTO `presshop_search_word` VALUES ('2020', '2', 'cet');
INSERT INTO `presshop_search_word` VALUES ('2117', '1', 'présenté');
INSERT INTO `presshop_search_word` VALUES ('2116', '1', 'heureuse');
INSERT INTO `presshop_search_word` VALUES ('2115', '1', 'intérieure');
INSERT INTO `presshop_search_word` VALUES ('2114', '1', 'liberté');
INSERT INTO `presshop_search_word` VALUES ('2113', '1', 'magistrale');
INSERT INTO `presshop_search_word` VALUES ('2112', '1', 'manière');
INSERT INTO `presshop_search_word` VALUES ('2111', '1', 'être');
INSERT INTO `presshop_search_word` VALUES ('2110', '1', 'priver');
INSERT INTO `presshop_search_word` VALUES ('2109', '1', 'peuvent');
INSERT INTO `presshop_search_word` VALUES ('2108', '1', 'ego');
INSERT INTO `presshop_search_word` VALUES ('2107', '1', 'cultivées');
INSERT INTO `presshop_search_word` VALUES ('2106', '1', 'façon');
INSERT INTO `presshop_search_word` VALUES ('2105', '1', 'quelle');
INSERT INTO `presshop_search_word` VALUES ('2019', '2', 'auteure');
INSERT INTO `presshop_search_word` VALUES ('2104', '1', 'explique');
INSERT INTO `presshop_search_word` VALUES ('2103', '1', 'illusions');
INSERT INTO `presshop_search_word` VALUES ('2102', '1', 'adieu');
INSERT INTO `presshop_search_word` VALUES ('2101', '1', 'dire');
INSERT INTO `presshop_search_word` VALUES ('2100', '2', 'comprendre');
INSERT INTO `presshop_search_word` VALUES ('2099', '2', '9782354360191');
INSERT INTO `presshop_search_word` VALUES ('2018', '2', 'dumont');
INSERT INTO `presshop_search_word` VALUES ('2098', '2', '2008isbn');
INSERT INTO `presshop_search_word` VALUES ('2097', '2', 'publication');
INSERT INTO `presshop_search_word` VALUES ('2096', '2', '393date');
INSERT INTO `presshop_search_word` VALUES ('2095', '2', 'pages');
INSERT INTO `presshop_search_word` VALUES ('1715', '2', 'air');
INSERT INTO `presshop_search_word` VALUES ('1714', '2', 'a330');
INSERT INTO `presshop_search_word` VALUES ('1713', '2', 'airbus');
INSERT INTO `presshop_search_word` VALUES ('1712', '2', 'appareil');
INSERT INTO `presshop_search_word` VALUES ('1711', '2', 'açores');
INSERT INTO `presshop_search_word` VALUES ('1710', '2', 'atterrir');
INSERT INTO `presshop_search_word` VALUES ('1709', '2', 'fait');
INSERT INTO `presshop_search_word` VALUES ('1708', '2', 'jour');
INSERT INTO `presshop_search_word` VALUES ('1707', '2', 'national');
INSERT INTO `presshop_search_word` VALUES ('1706', '2', 'héros');
INSERT INTO `presshop_search_word` VALUES ('1705', '2', 'devenu');
INSERT INTO `presshop_search_word` VALUES ('1704', '2', 'célèbre');
INSERT INTO `presshop_search_word` VALUES ('1703', '2', 'banal');
INSERT INTO `presshop_search_word` VALUES ('1702', '2', 'peu');
INSERT INTO `presshop_search_word` VALUES ('1701', '2', 'parcours');
INSERT INTO `presshop_search_word` VALUES ('1700', '2', 'raconte');
INSERT INTO `presshop_search_word` VALUES ('1699', '2', '2002');
INSERT INTO `presshop_search_word` VALUES ('1698', '2', 'première');
INSERT INTO `presshop_search_word` VALUES ('1697', '2', 'publié');
INSERT INTO `presshop_search_word` VALUES ('1696', '2', 'indéniable');
INSERT INTO `presshop_search_word` VALUES ('1695', '2', 'est');
INSERT INTO `presshop_search_word` VALUES ('1694', '2', 'avec');
INSERT INTO `presshop_search_word` VALUES ('1693', '2', 'ressemblance');
INSERT INTO `presshop_search_word` VALUES ('1692', '2', 'dont');
INSERT INTO `presshop_search_word` VALUES ('1691', '2', 'côté');
INSERT INTO `presshop_search_word` VALUES ('1690', '2', 'michel');
INSERT INTO `presshop_search_word` VALUES ('1689', '2', 'vedette');
INSERT INTO `presshop_search_word` VALUES ('1688', '2', 'mettra');
INSERT INTO `presshop_search_word` VALUES ('1687', '2', 'métrage');
INSERT INTO `presshop_search_word` VALUES ('1686', '2', 'long');
INSERT INTO `presshop_search_word` VALUES ('1685', '2', 'archambault');
INSERT INTO `presshop_search_word` VALUES ('1684', '2', 'sylvain');
INSERT INTO `presshop_search_word` VALUES ('1683', '2', 'réalisé');
INSERT INTO `presshop_search_word` VALUES ('1682', '2', 'dollars');
INSERT INTO `presshop_search_word` VALUES ('1681', '2', 'millions');
INSERT INTO `presshop_search_word` VALUES ('1680', '2', 'budget');
INSERT INTO `presshop_search_word` VALUES ('1679', '2', 'pourvu');
INSERT INTO `presshop_search_word` VALUES ('1678', '2', '2010');
INSERT INTO `presshop_search_word` VALUES ('1677', '2', 'juillet');
INSERT INTO `presshop_search_word` VALUES ('1676', '2', 'salles');
INSERT INTO `presshop_search_word` VALUES ('1675', '2', 'sortira');
INSERT INTO `presshop_search_word` VALUES ('1674', '2', 'terre');
INSERT INTO `presshop_search_word` VALUES ('1673', '2', 'ciel');
INSERT INTO `presshop_search_word` VALUES ('1672', '2', 'entre');
INSERT INTO `presshop_search_word` VALUES ('1671', '2', 'film');
INSERT INTO `presshop_search_word` VALUES ('1670', '2', 'inspiré');
INSERT INTO `presshop_search_word` VALUES ('1669', '2', 'livre');
INSERT INTO `presshop_search_word` VALUES ('1668', '2', 'destin');
INSERT INTO `presshop_search_word` VALUES ('1667', '2', 'commandes');
INSERT INTO `presshop_search_word` VALUES ('1666', '2', 'aux');
INSERT INTO `presshop_search_word` VALUES ('1665', '2', 'piché');
INSERT INTO `presshop_search_word` VALUES ('1664', '1', 'books');
INSERT INTO `presshop_search_word` VALUES ('1663', '1', 'destin');
INSERT INTO `presshop_search_word` VALUES ('1662', '1', 'commandes');
INSERT INTO `presshop_search_word` VALUES ('1661', '1', 'aux');
INSERT INTO `presshop_search_word` VALUES ('1660', '1', 'piché');
INSERT INTO `presshop_search_word` VALUES ('1659', '1', 'robert');
INSERT INTO `presshop_search_word` VALUES ('1658', '2', 'pic');
INSERT INTO `presshop_search_word` VALUES ('1657', '2', 'robert');
INSERT INTO `presshop_search_word` VALUES ('1656', '2', 'commandant');
INSERT INTO `presshop_search_word` VALUES ('1655', '2', 'cofsky');
INSERT INTO `presshop_search_word` VALUES ('1654', '2', 'louise');
INSERT INTO `presshop_search_word` VALUES ('1653', '2', 'dure');
INSERT INTO `presshop_search_word` VALUES ('1652', '2', 'quiétude');
INSERT INTO `presshop_search_word` VALUES ('1651', '2', 'belle');
INSERT INTO `presshop_search_word` VALUES ('1650', '2', 'place');
INSERT INTO `presshop_search_word` VALUES ('1649', '2', 'cédé');
INSERT INTO `presshop_search_word` VALUES ('1648', '2', 'angoisse');
INSERT INTO `presshop_search_word` VALUES ('1647', '2', 'sortie');
INSERT INTO `presshop_search_word` VALUES ('1646', '2', 'chemin');
INSERT INTO `presshop_search_word` VALUES ('1645', '2', 'montrer');
INSERT INTO `presshop_search_word` VALUES ('1644', '2', 'parler');
INSERT INTO `presshop_search_word` VALUES ('1643', '2', 'lui');
INSERT INTO `presshop_search_word` VALUES ('1642', '2', 'étranglait');
INSERT INTO `presshop_search_word` VALUES ('1641', '2', 'qui');
INSERT INTO `presshop_search_word` VALUES ('1640', '2', 'cette');
INSERT INTO `presshop_search_word` VALUES ('1639', '2', 'apprivoiser');
INSERT INTO `presshop_search_word` VALUES ('1638', '2', 'permis');
INSERT INTO `presshop_search_word` VALUES ('1637', '2', 'ont');
INSERT INTO `presshop_search_word` VALUES ('1636', '2', 'moments');
INSERT INTO `presshop_search_word` VALUES ('1635', '2', 'dirigée');
INSERT INTO `presshop_search_word` VALUES ('1634', '2', 'détente');
INSERT INTO `presshop_search_word` VALUES ('1633', '2', 'commentaires');
INSERT INTO `presshop_search_word` VALUES ('1632', '2', 'simulation');
INSERT INTO `presshop_search_word` VALUES ('1631', '2', 'libération');
INSERT INTO `presshop_search_word` VALUES ('1630', '2', 'relaxation');
INSERT INTO `presshop_search_word` VALUES ('1629', '2', 'guidées');
INSERT INTO `presshop_search_word` VALUES ('1628', '2', 'détentes');
INSERT INTO `presshop_search_word` VALUES ('1627', '2', 'ces');
INSERT INTO `presshop_search_word` VALUES ('1626', '2', 'utilisation');
INSERT INTO `presshop_search_word` VALUES ('1625', '2', 'directives');
INSERT INTO `presshop_search_word` VALUES ('1624', '2', 'face');
INSERT INTO `presshop_search_word` VALUES ('1623', '2', 'symbolique');
INSERT INTO `presshop_search_word` VALUES ('1622', '2', 'origine');
INSERT INTO `presshop_search_word` VALUES ('1621', '2', 'explication');
INSERT INTO `presshop_search_word` VALUES ('1620', '2', 'pistes');
INSERT INTO `presshop_search_word` VALUES ('1619', '2', 'presque');
INSERT INTO `presshop_search_word` VALUES ('1618', '2', 'atteint');
INSERT INTO `presshop_search_word` VALUES ('1617', '2', 'réussite');
INSERT INTO `presshop_search_word` VALUES ('1616', '2', 'taux');
INSERT INTO `presshop_search_word` VALUES ('1615', '2', 'son');
INSERT INTO `presshop_search_word` VALUES ('1614', '2', '2000');
INSERT INTO `presshop_search_word` VALUES ('1613', '2', 'depuis');
INSERT INTO `presshop_search_word` VALUES ('1612', '2', 'vol');
INSERT INTO `presshop_search_word` VALUES ('1611', '2', 'sur');
INSERT INTO `presshop_search_word` VALUES ('1610', '2', 'ateliers');
INSERT INTO `presshop_search_word` VALUES ('1609', '2', 'psychothérapie');
INSERT INTO `presshop_search_word` VALUES ('1608', '2', 'partie');
INSERT INTO `presshop_search_word` VALUES ('1607', '2', 'anime');
INSERT INTO `presshop_search_word` VALUES ('1606', '2', 'wright');
INSERT INTO `presshop_search_word` VALUES ('1605', '2', 'george');
INSERT INTO `presshop_search_word` VALUES ('1604', '2', 'cellulaires');
INSERT INTO `presshop_search_word` VALUES ('1603', '2', 'corporelles');
INSERT INTO `presshop_search_word` VALUES ('1602', '2', 'mémoires');
INSERT INTO `presshop_search_word` VALUES ('1601', '2', 'vos');
INSERT INTO `presshop_search_word` VALUES ('1600', '2', 'dans');
INSERT INTO `presshop_search_word` VALUES ('1599', '2', 'cristallisées');
INSERT INTO `presshop_search_word` VALUES ('1598', '2', 'frustrations');
INSERT INTO `presshop_search_word` VALUES ('1597', '2', 'angoisses');
INSERT INTO `presshop_search_word` VALUES ('1596', '2', 'peurs');
INSERT INTO `presshop_search_word` VALUES ('1595', '2', 'que');
INSERT INTO `presshop_search_word` VALUES ('1594', '2', 'telles');
INSERT INTO `presshop_search_word` VALUES ('1593', '2', 'émotions');
INSERT INTO `presshop_search_word` VALUES ('1592', '2', 'libérer');
INSERT INTO `presshop_search_word` VALUES ('1591', '2', 'vousmême');
INSERT INTO `presshop_search_word` VALUES ('1590', '2', 'intérieur');
INSERT INTO `presshop_search_word` VALUES ('1589', '2', 'plonger');
INSERT INTO `presshop_search_word` VALUES ('1588', '2', 'mesure');
INSERT INTO `presshop_search_word` VALUES ('1587', '2', 'serez');
INSERT INTO `presshop_search_word` VALUES ('1586', '2', 'conscience');
INSERT INTO `presshop_search_word` VALUES ('1585', '2', 'respiration');
INSERT INTO `presshop_search_word` VALUES ('1584', '2', 'aide');
INSERT INTO `presshop_search_word` VALUES ('1583', '2', 'elle');
INSERT INTO `presshop_search_word` VALUES ('1582', '2', 'par');
INSERT INTO `presshop_search_word` VALUES ('1581', '2', 'occasionnés');
INSERT INTO `presshop_search_word` VALUES ('1580', '2', 'symptômes');
INSERT INTO `presshop_search_word` VALUES ('1579', '2', 'atténuer');
INSERT INTO `presshop_search_word` VALUES ('1578', '2', 'efficaces');
INSERT INTO `presshop_search_word` VALUES ('1577', '2', 'simples');
INSERT INTO `presshop_search_word` VALUES ('1576', '2', 'fois');
INSERT INTO `presshop_search_word` VALUES ('1575', '2', 'outils');
INSERT INTO `presshop_search_word` VALUES ('1574', '2', 'découvrir');
INSERT INTO `presshop_search_word` VALUES ('1573', '2', 'démystifier');
INSERT INTO `presshop_search_word` VALUES ('1572', '2', 'spécifiquement');
INSERT INTO `presshop_search_word` VALUES ('1571', '2', 'créé');
INSERT INTO `presshop_search_word` VALUES ('1570', '2', 'été');
INSERT INTO `presshop_search_word` VALUES ('1569', '2', 'mental');
INSERT INTO `presshop_search_word` VALUES ('1568', '2', 'émotionnel');
INSERT INTO `presshop_search_word` VALUES ('1567', '2', 'physique');
INSERT INTO `presshop_search_word` VALUES ('1566', '2', 'mieuxêtre');
INSERT INTO `presshop_search_word` VALUES ('1565', '2', 'apportera');
INSERT INTO `presshop_search_word` VALUES ('1564', '2', 'écoute');
INSERT INTO `presshop_search_word` VALUES ('1563', '2', 'votre');
INSERT INTO `presshop_search_word` VALUES ('1562', '2', 'surmonter');
INSERT INTO `presshop_search_word` VALUES ('1561', '2', 'aider');
INSERT INTO `presshop_search_word` VALUES ('1560', '2', 'vous');
INSERT INTO `presshop_search_word` VALUES ('1559', '2', 'pour');
INSERT INTO `presshop_search_word` VALUES ('1558', '2', 'avion');
INSERT INTO `presshop_search_word` VALUES ('1557', '2', 'inconfort');
INSERT INTO `presshop_search_word` VALUES ('1556', '2', 'peur');
INSERT INTO `presshop_search_word` VALUES ('1555', '2', 'vaincre');
INSERT INTO `presshop_search_word` VALUES ('1554', '1', 'flying');
INSERT INTO `presshop_search_word` VALUES ('1553', '1', 'fear');
INSERT INTO `presshop_search_word` VALUES ('1773', '1', 'pensées');
INSERT INTO `presshop_search_word` VALUES ('2172', '2', 'aute');
INSERT INTO `presshop_search_word` VALUES ('2171', '2', 'inspirés');
INSERT INTO `presshop_search_word` VALUES ('2170', '2', 'textes');
INSERT INTO `presshop_search_word` VALUES ('2169', '2', 'courts');
INSERT INTO `presshop_search_word` VALUES ('2168', '2', 'croyances');
INSERT INTO `presshop_search_word` VALUES ('2167', '2', 'nouvelles');
INSERT INTO `presshop_search_word` VALUES ('2166', '2', 'facilitent');
INSERT INTO `presshop_search_word` VALUES ('2165', '2', 'fin');
INSERT INTO `presshop_search_word` VALUES ('2164', '2', 'mettre');
INSERT INTO `presshop_search_word` VALUES ('2163', '2', 'celles');
INSERT INTO `presshop_search_word` VALUES ('2017', '2', 'nicole');
INSERT INTO `presshop_search_word` VALUES ('2016', '2', 'malgré');
INSERT INTO `presshop_search_word` VALUES ('2015', '2', 'harmonie');
INSERT INTO `presshop_search_word` VALUES ('2014', '2', 'manque');
INSERT INTO `presshop_search_word` VALUES ('2013', '2', 'échappe');
INSERT INTO `presshop_search_word` VALUES ('2012', '2', 'impression');
INSERT INTO `presshop_search_word` VALUES ('1772', '1', 'les');
INSERT INTO `presshop_search_word` VALUES ('2011', '2', 'avezvous');
INSERT INTO `presshop_search_word` VALUES ('2010', '2', 'souffrances');
INSERT INTO `presshop_search_word` VALUES ('2009', '2', 'conditionnement');
INSERT INTO `presshop_search_word` VALUES ('1771', '1', 'par');
INSERT INTO `presshop_search_word` VALUES ('2008', '2', 'dégager');
INSERT INTO `presshop_search_word` VALUES ('2007', '2', 'efficace');
INSERT INTO `presshop_search_word` VALUES ('2006', '2', 'simple');
INSERT INTO `presshop_search_word` VALUES ('2005', '2', 'moyen');
INSERT INTO `presshop_search_word` VALUES ('1770', '1', 'engendrés');
INSERT INTO `presshop_search_word` VALUES ('1769', '1', 'conflits');
INSERT INTO `presshop_search_word` VALUES ('1768', '1', 'reliées');
INSERT INTO `presshop_search_word` VALUES ('1767', '1', 'plus');
INSERT INTO `presshop_search_word` VALUES ('1766', '1', 'voici');
INSERT INTO `presshop_search_word` VALUES ('1765', '1', 'maladies');
INSERT INTO `presshop_search_word` VALUES ('1764', '1', 'malaises');
INSERT INTO `presshop_search_word` VALUES ('1763', '1', 'des');
INSERT INTO `presshop_search_word` VALUES ('1762', '1', 'dictionnaire');
INSERT INTO `presshop_search_word` VALUES ('1761', '1', 'grand');
INSERT INTO `presshop_search_word` VALUES ('1760', '2', 'terminé');
INSERT INTO `presshop_search_word` VALUES ('1759', '2', 'tout');
INSERT INTO `presshop_search_word` VALUES ('1758', '2', 'croit');
INSERT INTO `presshop_search_word` VALUES ('1757', '2', 'relire');
INSERT INTO `presshop_search_word` VALUES ('1756', '2', 'lire');
INSERT INTO `presshop_search_word` VALUES ('1755', '2', 'témoignage');
INSERT INTO `presshop_search_word` VALUES ('1754', '2', 'août');
INSERT INTO `presshop_search_word` VALUES ('1753', '2', 'après24');
INSERT INTO `presshop_search_word` VALUES ('1752', '2', 'écrite');
INSERT INTO `presshop_search_word` VALUES ('1751', '2', 'mise');
INSERT INTO `presshop_search_word` VALUES ('1750', '2', 'enrichi');
INSERT INTO `presshop_search_word` VALUES ('1749', '2', 'aventure');
INSERT INTO `presshop_search_word` VALUES ('1748', '2', 'allures');
INSERT INTO `presshop_search_word` VALUES ('1747', '2', 'vite');
INSERT INTO `presshop_search_word` VALUES ('1746', '2', 'prend');
INSERT INTO `presshop_search_word` VALUES ('1745', '2', 'cayouette');
INSERT INTO `presshop_search_word` VALUES ('1744', '2', 'pierre');
INSERT INTO `presshop_search_word` VALUES ('1743', '2', 'journaliste');
INSERT INTO `presshop_search_word` VALUES ('1742', '2', 'offre');
INSERT INTO `presshop_search_word` VALUES ('1741', '2', 'nous');
INSERT INTO `presshop_search_word` VALUES ('1740', '2', 'récit');
INSERT INTO `presshop_search_word` VALUES ('1739', '2', 'oublier');
INSERT INTO `presshop_search_word` VALUES ('2004', '2', 'cherchezvous');
INSERT INTO `presshop_search_word` VALUES ('2003', '2', 'ditesmoi');
INSERT INTO `presshop_search_word` VALUES ('2002', '2', 'miroirs');
INSERT INTO `presshop_search_word` VALUES ('2001', '1', 'livre');
INSERT INTO `presshop_search_word` VALUES ('2000', '1', 'responsabilisat');
INSERT INTO `presshop_search_word` VALUES ('1999', '1', 'notion');
INSERT INTO `presshop_search_word` VALUES ('1998', '1', 'intégrer');
INSERT INTO `presshop_search_word` VALUES ('1997', '1', 'visant');
INSERT INTO `presshop_search_word` VALUES ('1996', '1', 'facettes');
INSERT INTO `presshop_search_word` VALUES ('1995', '1', 'multiples');
INSERT INTO `presshop_search_word` VALUES ('1994', '1', 'années');
INSERT INTO `presshop_search_word` VALUES ('1993', '1', 'nombreuses');
INSERT INTO `presshop_search_word` VALUES ('1992', '1', 'depuis');
INSERT INTO `presshop_search_word` VALUES ('1991', '1', 'croissance');
INSERT INTO `presshop_search_word` VALUES ('1990', '1', 'domaine');
INSERT INTO `presshop_search_word` VALUES ('1989', '1', 'propose');
INSERT INTO `presshop_search_word` VALUES ('1988', '1', 'résolument');
INSERT INTO `presshop_search_word` VALUES ('1987', '1', 'approche');
INSERT INTO `presshop_search_word` VALUES ('1986', '1', 'résonance');
INSERT INTO `presshop_search_word` VALUES ('1985', '1', 'touche');
INSERT INTO `presshop_search_word` VALUES ('1984', '1', 'réalité');
INSERT INTO `presshop_search_word` VALUES ('1983', '1', 'notre');
INSERT INTO `presshop_search_word` VALUES ('1982', '1', 'créons');
INSERT INTO `presshop_search_word` VALUES ('1981', '1', 'effet');
INSERT INTO `presshop_search_word` VALUES ('1980', '1', 'réactions');
INSERT INTO `presshop_search_word` VALUES ('1979', '1', 'propres');
INSERT INTO `presshop_search_word` VALUES ('1978', '1', 'transformer');
INSERT INTO `presshop_search_word` VALUES ('1977', '1', 'vies');
INSERT INTO `presshop_search_word` VALUES ('1976', '1', 'sur');
INSERT INTO `presshop_search_word` VALUES ('1975', '1', 'pouvoir');
INSERT INTO `presshop_search_word` VALUES ('1974', '1', 'reconquérir');
INSERT INTO `presshop_search_word` VALUES ('1973', '1', 'inviter');
INSERT INTO `presshop_search_word` VALUES ('1972', '1', 'toucheront');
INSERT INTO `presshop_search_word` VALUES ('1971', '1', 'exemples');
INSERT INTO `presshop_search_word` VALUES ('1970', '1', 'exercices');
INSERT INTO `presshop_search_word` VALUES ('1969', '1', 'phrasesclés');
INSERT INTO `presshop_search_word` VALUES ('1968', '1', 'agrémenté');
INSERT INTO `presshop_search_word` VALUES ('1967', '1', 'imagé');
INSERT INTO `presshop_search_word` VALUES ('1966', '1', 'ici');
INSERT INTO `presshop_search_word` VALUES ('1965', '1', 'interpellent');
INSERT INTO `presshop_search_word` VALUES ('1964', '1', 'nous');
INSERT INTO `presshop_search_word` VALUES ('1963', '1', 'intérieurs');
INSERT INTO `presshop_search_word` VALUES ('1962', '1', 'états');
INSERT INTO `presshop_search_word` VALUES ('1961', '1', 'nos');
INSERT INTO `presshop_search_word` VALUES ('1960', '1', 'reflets');
INSERT INTO `presshop_search_word` VALUES ('1959', '1', 'soi');
INSERT INTO `presshop_search_word` VALUES ('1958', '1', 'réflexion');
INSERT INTO `presshop_search_word` VALUES ('1957', '1', 'comme');
INSERT INTO `presshop_search_word` VALUES ('1956', '1', 'miroir');
INSERT INTO `presshop_search_word` VALUES ('1955', '1', 'utiliser');
INSERT INTO `presshop_search_word` VALUES ('1954', '1', 'personnes');
INSERT INTO `presshop_search_word` VALUES ('1953', '1', 'centaines');
INSERT INTO `presshop_search_word` VALUES ('1952', '1', 'ouvrage');
INSERT INTO `presshop_search_word` VALUES ('1951', '1', 'cet');
INSERT INTO `presshop_search_word` VALUES ('1950', '1', 'auteure');
INSERT INTO `presshop_search_word` VALUES ('1949', '1', 'dumont');
INSERT INTO `presshop_search_word` VALUES ('1948', '1', 'nicole');
INSERT INTO `presshop_search_word` VALUES ('1947', '1', 'malgré');
INSERT INTO `presshop_search_word` VALUES ('1946', '1', 'harmonie');
INSERT INTO `presshop_search_word` VALUES ('1945', '1', 'manque');
INSERT INTO `presshop_search_word` VALUES ('1944', '1', 'échappe');
INSERT INTO `presshop_search_word` VALUES ('1943', '1', 'vie');
INSERT INTO `presshop_search_word` VALUES ('1942', '1', 'votre');
INSERT INTO `presshop_search_word` VALUES ('1941', '1', 'impression');
INSERT INTO `presshop_search_word` VALUES ('1940', '1', 'avezvous');
INSERT INTO `presshop_search_word` VALUES ('1939', '1', 'souffrances');
INSERT INTO `presshop_search_word` VALUES ('1938', '1', 'libérer');
INSERT INTO `presshop_search_word` VALUES ('1937', '1', 'conditionnement');
INSERT INTO `presshop_search_word` VALUES ('1936', '1', 'vos');
INSERT INTO `presshop_search_word` VALUES ('1935', '1', 'dégager');
INSERT INTO `presshop_search_word` VALUES ('1934', '1', 'efficace');
INSERT INTO `presshop_search_word` VALUES ('1933', '1', 'simple');
INSERT INTO `presshop_search_word` VALUES ('1932', '1', 'moyen');
INSERT INTO `presshop_search_word` VALUES ('1931', '1', 'cherchezvous');
INSERT INTO `presshop_search_word` VALUES ('1930', '1', 'ditesmoi');
INSERT INTO `presshop_search_word` VALUES ('1929', '1', 'miroirs');
INSERT INTO `presshop_search_word` VALUES ('1928', '2', 'conférencier');
INSERT INTO `presshop_search_word` VALUES ('1927', '2', 'malaise');
INSERT INTO `presshop_search_word` VALUES ('1926', '2', 'martel');
INSERT INTO `presshop_search_word` VALUES ('1925', '2', 'jacques');
INSERT INTO `presshop_search_word` VALUES ('1924', '2', 'médical');
INSERT INTO `presshop_search_word` VALUES ('1923', '2', 'allopathique');
INSERT INTO `presshop_search_word` VALUES ('1922', '2', 'global');
INSERT INTO `presshop_search_word` VALUES ('1921', '2', 'holistique');
INSERT INTO `presshop_search_word` VALUES ('1920', '2', 'vue');
INSERT INTO `presshop_search_word` VALUES ('1919', '2', 'point');
INSERT INTO `presshop_search_word` VALUES ('1918', '2', 'professionnelle');
INSERT INTO `presshop_search_word` VALUES ('1917', '2', 'familiale');
INSERT INTO `presshop_search_word` VALUES ('1916', '2', 'personnelle');
INSERT INTO `presshop_search_word` VALUES ('1915', '2', 'démarche');
INSERT INTO `presshop_search_word` VALUES ('1914', '2', 'toute');
INSERT INTO `presshop_search_word` VALUES ('1913', '2', 'précieuse');
INSERT INTO `presshop_search_word` VALUES ('1912', '2', 'essentiel');
INSERT INTO `presshop_search_word` VALUES ('1911', '2', 'captivant');
INSERT INTO `presshop_search_word` VALUES ('1910', '2', 'outil');
INSERT INTO `presshop_search_word` VALUES ('1909', '2', 'guérison');
INSERT INTO `presshop_search_word` VALUES ('1908', '2', 'nécessaires');
INSERT INTO `presshop_search_word` VALUES ('1907', '2', 'préalables');
INSERT INTO `presshop_search_word` VALUES ('1906', '2', 'souvent');
INSERT INTO `presshop_search_word` VALUES ('1905', '2', 'conditions');
INSERT INTO `presshop_search_word` VALUES ('1904', '2', 'acceptation');
INSERT INTO `presshop_search_word` VALUES ('1903', '2', 'intégration');
INSERT INTO `presshop_search_word` VALUES ('1902', '2', 'meilleure');
INSERT INTO `presshop_search_word` VALUES ('1901', '2', 'permettre');
INSERT INTO `presshop_search_word` VALUES ('1900', '2', 'conflit');
INSERT INTO `presshop_search_word` VALUES ('1899', '2', 'prise');
INSERT INTO `presshop_search_word` VALUES ('1898', '2', 'activer');
INSERT INTO `presshop_search_word` VALUES ('1897', '2', 'aident');
INSERT INTO `presshop_search_word` VALUES ('1896', '2', 'cerveau');
INSERT INTO `presshop_search_word` VALUES ('1895', '2', 'faite');
INSERT INTO `presshop_search_word` VALUES ('1894', '2', 'compréhension');
INSERT INTO `presshop_search_word` VALUES ('1893', '2', 'reliés');
INSERT INTO `presshop_search_word` VALUES ('1892', '2', 'encore');
INSERT INTO `presshop_search_word` VALUES ('1891', '2', 'guérisseurs');
INSERT INTO `presshop_search_word` VALUES ('1890', '2', 'mots');
INSERT INTO `presshop_search_word` VALUES ('1889', '2', 'oiseaux');
INSERT INTO `presshop_search_word` VALUES ('1888', '2', 'langage');
INSERT INTO `presshop_search_word` VALUES ('1887', '2', 'retrouve');
INSERT INTO `presshop_search_word` VALUES ('1886', '2', 'ajouts');
INSERT INTO `presshop_search_word` VALUES ('1885', '2', 'ajoutés');
INSERT INTO `presshop_search_word` VALUES ('1884', '2', 'aussi');
INSERT INTO `presshop_search_word` VALUES ('1883', '2', 'corps');
INSERT INTO `presshop_search_word` VALUES ('1882', '2', 'parties');
INSERT INTO `presshop_search_word` VALUES ('1881', '2', '800');
INSERT INTO `presshop_search_word` VALUES ('1880', '2', 'ajoutées');
INSERT INTO `presshop_search_word` VALUES ('1879', '2', 'informations');
INSERT INTO `presshop_search_word` VALUES ('1878', '2', 'exceptionnelle');
INSERT INTO `presshop_search_word` VALUES ('1877', '2', 'celleci');
INSERT INTO `presshop_search_word` VALUES ('1876', '2', 'trouverez');
INSERT INTO `presshop_search_word` VALUES ('1875', '2', 'alors');
INSERT INTO `presshop_search_word` VALUES ('1874', '2', 'résolu');
INSERT INTO `presshop_search_word` VALUES ('1873', '2', 'travaillé');
INSERT INTO `presshop_search_word` VALUES ('1872', '2', 'édition');
INSERT INTO `presshop_search_word` VALUES ('1871', '2', 'intéressante');
INSERT INTO `presshop_search_word` VALUES ('1870', '2', 'trouvé');
INSERT INTO `presshop_search_word` VALUES ('1869', '2', 'avez');
INSERT INTO `presshop_search_word` VALUES ('1868', '2', 'maladie');
INSERT INTO `presshop_search_word` VALUES ('1867', '2', 'sentiments');
INSERT INTO `presshop_search_word` VALUES ('1866', '2', 'pensées');
INSERT INTO `presshop_search_word` VALUES ('1865', '2', 'engendrés');
INSERT INTO `presshop_search_word` VALUES ('1864', '2', 'conflits');
INSERT INTO `presshop_search_word` VALUES ('1863', '2', 'reliées');
INSERT INTO `presshop_search_word` VALUES ('1862', '2', 'plus');
INSERT INTO `presshop_search_word` VALUES ('1861', '2', 'voici');
INSERT INTO `presshop_search_word` VALUES ('1860', '2', 'maladies');
INSERT INTO `presshop_search_word` VALUES ('1859', '2', 'malaises');
INSERT INTO `presshop_search_word` VALUES ('1858', '2', 'dictionnaire');
INSERT INTO `presshop_search_word` VALUES ('1857', '2', 'grand');
INSERT INTO `presshop_search_word` VALUES ('1856', '1', 'book');
INSERT INTO `presshop_search_word` VALUES ('1855', '1', 'conference');
INSERT INTO `presshop_search_word` VALUES ('1854', '1', 'martel');
INSERT INTO `presshop_search_word` VALUES ('1853', '1', 'jacques');
INSERT INTO `presshop_search_word` VALUES ('1852', '1', 'médical');
INSERT INTO `presshop_search_word` VALUES ('1851', '1', 'allopathique');
INSERT INTO `presshop_search_word` VALUES ('1850', '1', 'global');
INSERT INTO `presshop_search_word` VALUES ('1849', '1', 'holistique');
INSERT INTO `presshop_search_word` VALUES ('1848', '1', 'vue');
INSERT INTO `presshop_search_word` VALUES ('1847', '1', 'point');
INSERT INTO `presshop_search_word` VALUES ('1846', '1', 'professionnelle');
INSERT INTO `presshop_search_word` VALUES ('1845', '1', 'familiale');
INSERT INTO `presshop_search_word` VALUES ('1844', '1', 'personnelle');
INSERT INTO `presshop_search_word` VALUES ('1843', '1', 'démarche');
INSERT INTO `presshop_search_word` VALUES ('1842', '1', 'toute');
INSERT INTO `presshop_search_word` VALUES ('1841', '1', 'précieuse');
INSERT INTO `presshop_search_word` VALUES ('1840', '1', 'aide');
INSERT INTO `presshop_search_word` VALUES ('1839', '1', 'essentiel');
INSERT INTO `presshop_search_word` VALUES ('1838', '1', 'captivant');
INSERT INTO `presshop_search_word` VALUES ('1837', '1', 'outil');
INSERT INTO `presshop_search_word` VALUES ('1836', '1', 'guérison');
INSERT INTO `presshop_search_word` VALUES ('1835', '1', 'nécessaires');
INSERT INTO `presshop_search_word` VALUES ('1834', '1', 'préalables');
INSERT INTO `presshop_search_word` VALUES ('1833', '1', 'souvent');
INSERT INTO `presshop_search_word` VALUES ('1832', '1', 'conditions');
INSERT INTO `presshop_search_word` VALUES ('1831', '1', 'acceptation');
INSERT INTO `presshop_search_word` VALUES ('1830', '1', 'intégration');
INSERT INTO `presshop_search_word` VALUES ('1829', '1', 'meilleure');
INSERT INTO `presshop_search_word` VALUES ('1828', '1', 'permettre');
INSERT INTO `presshop_search_word` VALUES ('1827', '1', 'pour');
INSERT INTO `presshop_search_word` VALUES ('1826', '1', 'est');
INSERT INTO `presshop_search_word` VALUES ('1825', '1', 'conflit');
INSERT INTO `presshop_search_word` VALUES ('1824', '1', 'conscience');
INSERT INTO `presshop_search_word` VALUES ('1823', '1', 'prise');
INSERT INTO `presshop_search_word` VALUES ('1822', '1', 'activer');
INSERT INTO `presshop_search_word` VALUES ('1821', '1', 'aident');
INSERT INTO `presshop_search_word` VALUES ('1820', '1', 'cerveau');
INSERT INTO `presshop_search_word` VALUES ('1819', '1', 'faite');
INSERT INTO `presshop_search_word` VALUES ('1818', '1', 'symbolique');
INSERT INTO `presshop_search_word` VALUES ('1817', '1', 'compréhension');
INSERT INTO `presshop_search_word` VALUES ('1816', '1', 'une');
INSERT INTO `presshop_search_word` VALUES ('1815', '1', 'reliés');
INSERT INTO `presshop_search_word` VALUES ('1814', '1', 'encore');
INSERT INTO `presshop_search_word` VALUES ('1813', '1', 'guérisseurs');
INSERT INTO `presshop_search_word` VALUES ('1812', '1', 'mots');
INSERT INTO `presshop_search_word` VALUES ('1811', '1', 'que');
INSERT INTO `presshop_search_word` VALUES ('1810', '1', 'ainsi');
INSERT INTO `presshop_search_word` VALUES ('1809', '1', 'oiseaux');
INSERT INTO `presshop_search_word` VALUES ('1808', '1', 'langage');
INSERT INTO `presshop_search_word` VALUES ('1807', '1', 'retrouve');
INSERT INTO `presshop_search_word` VALUES ('1806', '1', 'ajouts');
INSERT INTO `presshop_search_word` VALUES ('1805', '1', 'dans');
INSERT INTO `presshop_search_word` VALUES ('1804', '1', 'ajoutés');
INSERT INTO `presshop_search_word` VALUES ('1803', '1', 'été');
INSERT INTO `presshop_search_word` VALUES ('1802', '1', 'aussi');
INSERT INTO `presshop_search_word` VALUES ('1801', '1', 'ont');
INSERT INTO `presshop_search_word` VALUES ('1800', '1', 'corps');
INSERT INTO `presshop_search_word` VALUES ('1799', '1', 'parties');
INSERT INTO `presshop_search_word` VALUES ('1798', '1', '800');
INSERT INTO `presshop_search_word` VALUES ('1797', '1', 'ajoutées');
INSERT INTO `presshop_search_word` VALUES ('1796', '1', 'informations');
INSERT INTO `presshop_search_word` VALUES ('1795', '1', 'exceptionnelle');
INSERT INTO `presshop_search_word` VALUES ('1794', '1', 'fait');
INSERT INTO `presshop_search_word` VALUES ('1793', '1', 'tout');
INSERT INTO `presshop_search_word` VALUES ('1792', '1', 'celleci');
INSERT INTO `presshop_search_word` VALUES ('1791', '1', 'trouverez');
INSERT INTO `presshop_search_word` VALUES ('1790', '1', 'alors');
INSERT INTO `presshop_search_word` VALUES ('1789', '1', 'elle');
INSERT INTO `presshop_search_word` VALUES ('1788', '1', 'avec');
INSERT INTO `presshop_search_word` VALUES ('1787', '1', 'résolu');
INSERT INTO `presshop_search_word` VALUES ('1786', '1', 'travaillé');
INSERT INTO `presshop_search_word` VALUES ('1785', '1', 'édition');
INSERT INTO `presshop_search_word` VALUES ('1784', '1', 'première');
INSERT INTO `presshop_search_word` VALUES ('1783', '1', 'intéressante');
INSERT INTO `presshop_search_word` VALUES ('1782', '1', 'trouvé');
INSERT INTO `presshop_search_word` VALUES ('1781', '1', 'avez');
INSERT INTO `presshop_search_word` VALUES ('1780', '1', 'vous');
INSERT INTO `presshop_search_word` VALUES ('1779', '1', 'maladie');
INSERT INTO `presshop_search_word` VALUES ('1778', '1', 'origine');

-- ----------------------------
-- Table structure for `presshop_sekeyword`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_sekeyword`;
CREATE TABLE `presshop_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_sekeyword
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_state`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_state`;
CREATE TABLE `presshop_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` char(4) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `id_zone` (`id_zone`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_state
-- ----------------------------
INSERT INTO `presshop_state` VALUES ('1', '21', '2', 'Alabama', 'AL', '0', '1');
INSERT INTO `presshop_state` VALUES ('2', '21', '2', 'Alaska', 'AK', '0', '1');
INSERT INTO `presshop_state` VALUES ('3', '21', '2', 'Arizona', 'AZ', '0', '1');
INSERT INTO `presshop_state` VALUES ('4', '21', '2', 'Arkansas', 'AR', '0', '1');
INSERT INTO `presshop_state` VALUES ('5', '21', '2', 'California', 'CA', '0', '1');
INSERT INTO `presshop_state` VALUES ('6', '21', '2', 'Colorado', 'CO', '0', '1');
INSERT INTO `presshop_state` VALUES ('7', '21', '2', 'Connecticut', 'CT', '0', '1');
INSERT INTO `presshop_state` VALUES ('8', '21', '2', 'Delaware', 'DE', '0', '1');
INSERT INTO `presshop_state` VALUES ('9', '21', '2', 'Florida', 'FL', '0', '1');
INSERT INTO `presshop_state` VALUES ('10', '21', '2', 'Georgia', 'GA', '0', '1');
INSERT INTO `presshop_state` VALUES ('11', '21', '2', 'Hawaii', 'HI', '0', '1');
INSERT INTO `presshop_state` VALUES ('12', '21', '2', 'Idaho', 'ID', '0', '1');
INSERT INTO `presshop_state` VALUES ('13', '21', '2', 'Illinois', 'IL', '0', '1');
INSERT INTO `presshop_state` VALUES ('14', '21', '2', 'Indiana', 'IN', '0', '1');
INSERT INTO `presshop_state` VALUES ('15', '21', '2', 'Iowa', 'IA', '0', '1');
INSERT INTO `presshop_state` VALUES ('16', '21', '2', 'Kansas', 'KS', '0', '1');
INSERT INTO `presshop_state` VALUES ('17', '21', '2', 'Kentucky', 'KY', '0', '1');
INSERT INTO `presshop_state` VALUES ('18', '21', '2', 'Louisiana', 'LA', '0', '1');
INSERT INTO `presshop_state` VALUES ('19', '21', '2', 'Maine', 'ME', '0', '1');
INSERT INTO `presshop_state` VALUES ('20', '21', '2', 'Maryland', 'MD', '0', '1');
INSERT INTO `presshop_state` VALUES ('21', '21', '2', 'Massachusetts', 'MA', '0', '1');
INSERT INTO `presshop_state` VALUES ('22', '21', '2', 'Michigan', 'MI', '0', '1');
INSERT INTO `presshop_state` VALUES ('23', '21', '2', 'Minnesota', 'MN', '0', '1');
INSERT INTO `presshop_state` VALUES ('24', '21', '2', 'Mississippi', 'MS', '0', '1');
INSERT INTO `presshop_state` VALUES ('25', '21', '2', 'Missouri', 'MO', '0', '1');
INSERT INTO `presshop_state` VALUES ('26', '21', '2', 'Montana', 'MT', '0', '1');
INSERT INTO `presshop_state` VALUES ('27', '21', '2', 'Nebraska', 'NE', '0', '1');
INSERT INTO `presshop_state` VALUES ('28', '21', '2', 'Nevada', 'NV', '0', '1');
INSERT INTO `presshop_state` VALUES ('29', '21', '2', 'New Hampshire', 'NH', '0', '1');
INSERT INTO `presshop_state` VALUES ('30', '21', '2', 'New Jersey', 'NJ', '0', '1');
INSERT INTO `presshop_state` VALUES ('31', '21', '2', 'New Mexico', 'NM', '0', '1');
INSERT INTO `presshop_state` VALUES ('32', '21', '2', 'New York', 'NY', '0', '1');
INSERT INTO `presshop_state` VALUES ('33', '21', '2', 'North Carolina', 'NC', '0', '1');
INSERT INTO `presshop_state` VALUES ('34', '21', '2', 'North Dakota', 'ND', '0', '1');
INSERT INTO `presshop_state` VALUES ('35', '21', '2', 'Ohio', 'OH', '0', '1');
INSERT INTO `presshop_state` VALUES ('36', '21', '2', 'Oklahoma', 'OK', '0', '1');
INSERT INTO `presshop_state` VALUES ('37', '21', '2', 'Oregon', 'OR', '0', '1');
INSERT INTO `presshop_state` VALUES ('38', '21', '2', 'Pennsylvania', 'PA', '0', '1');
INSERT INTO `presshop_state` VALUES ('39', '21', '2', 'Rhode Island', 'RI', '0', '1');
INSERT INTO `presshop_state` VALUES ('40', '21', '2', 'South Carolina', 'SC', '0', '1');
INSERT INTO `presshop_state` VALUES ('41', '21', '2', 'South Dakota', 'SD', '0', '1');
INSERT INTO `presshop_state` VALUES ('42', '21', '2', 'Tennessee', 'TN', '0', '1');
INSERT INTO `presshop_state` VALUES ('43', '21', '2', 'Texas', 'TX', '0', '1');
INSERT INTO `presshop_state` VALUES ('44', '21', '2', 'Utah', 'UT', '0', '1');
INSERT INTO `presshop_state` VALUES ('45', '21', '2', 'Vermont', 'VT', '0', '1');
INSERT INTO `presshop_state` VALUES ('46', '21', '2', 'Virginia', 'VA', '0', '1');
INSERT INTO `presshop_state` VALUES ('47', '21', '2', 'Washington', 'WA', '0', '1');
INSERT INTO `presshop_state` VALUES ('48', '21', '2', 'West Virginia', 'WV', '0', '1');
INSERT INTO `presshop_state` VALUES ('49', '21', '2', 'Wisconsin', 'WI', '0', '1');
INSERT INTO `presshop_state` VALUES ('50', '21', '2', 'Wyoming', 'WY', '0', '1');
INSERT INTO `presshop_state` VALUES ('51', '21', '2', 'Puerto Rico', 'PR', '0', '1');
INSERT INTO `presshop_state` VALUES ('52', '21', '2', 'US Virgin Islands', 'VI', '0', '1');
INSERT INTO `presshop_state` VALUES ('53', '4', '2', 'Ontario', 'ON', '0', '1');
INSERT INTO `presshop_state` VALUES ('54', '4', '2', 'Quebec', 'QC', '0', '1');
INSERT INTO `presshop_state` VALUES ('55', '4', '2', 'British Columbia', 'BC', '0', '1');
INSERT INTO `presshop_state` VALUES ('56', '4', '2', 'Alberta', 'AB', '0', '1');
INSERT INTO `presshop_state` VALUES ('57', '4', '2', 'Manitoba', 'MB', '0', '1');
INSERT INTO `presshop_state` VALUES ('58', '4', '2', 'Saskatchewan', 'SK', '0', '1');
INSERT INTO `presshop_state` VALUES ('59', '4', '2', 'Nova Scotia', 'NS', '0', '1');
INSERT INTO `presshop_state` VALUES ('60', '4', '2', 'New Brunswick', 'NB', '0', '1');
INSERT INTO `presshop_state` VALUES ('61', '4', '2', 'Newfoundland and Labrador', 'NL', '0', '1');
INSERT INTO `presshop_state` VALUES ('62', '4', '2', 'Prince Edward Island', 'PE', '0', '1');
INSERT INTO `presshop_state` VALUES ('63', '4', '2', 'Northwest Territories', 'NT', '0', '1');
INSERT INTO `presshop_state` VALUES ('64', '4', '2', 'Yukon', 'YT', '0', '1');
INSERT INTO `presshop_state` VALUES ('65', '4', '2', 'Nunavut', 'NU', '0', '1');

-- ----------------------------
-- Table structure for `presshop_statssearch`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_statssearch`;
CREATE TABLE `presshop_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_statssearch
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_subdomain`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_subdomain`;
CREATE TABLE `presshop_subdomain` (
  `id_subdomain` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id_subdomain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_subdomain
-- ----------------------------
INSERT INTO `presshop_subdomain` VALUES ('1', 'www');

-- ----------------------------
-- Table structure for `presshop_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_supplier`;
CREATE TABLE `presshop_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_supplier
-- ----------------------------
INSERT INTO `presshop_supplier` VALUES ('1', 'AppleStore', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_supplier` VALUES ('2', 'Shure Online Store', '2010-06-30 10:43:53', '2010-06-30 10:43:53');

-- ----------------------------
-- Table structure for `presshop_supplier_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_supplier_lang`;
CREATE TABLE `presshop_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_supplier_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `presshop_tab`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tab`;
CREATE TABLE `presshop_tab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tab`),
  KEY `class_name` (`class_name`),
  KEY `id_parent` (`id_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tab
-- ----------------------------
INSERT INTO `presshop_tab` VALUES ('1', '0', 'AdminCatalog', null, '1');
INSERT INTO `presshop_tab` VALUES ('2', '0', 'AdminCustomers', null, '2');
INSERT INTO `presshop_tab` VALUES ('3', '0', 'AdminOrders', null, '3');
INSERT INTO `presshop_tab` VALUES ('4', '0', 'AdminPayment', null, '4');
INSERT INTO `presshop_tab` VALUES ('5', '0', 'AdminShipping', null, '5');
INSERT INTO `presshop_tab` VALUES ('6', '0', 'AdminStats', null, '6');
INSERT INTO `presshop_tab` VALUES ('7', '0', 'AdminModules', null, '7');
INSERT INTO `presshop_tab` VALUES ('29', '0', 'AdminEmployees', null, '8');
INSERT INTO `presshop_tab` VALUES ('8', '0', 'AdminPreferences', null, '9');
INSERT INTO `presshop_tab` VALUES ('9', '0', 'AdminTools', null, '10');
INSERT INTO `presshop_tab` VALUES ('60', '1', 'AdminTracking', null, '1');
INSERT INTO `presshop_tab` VALUES ('10', '1', 'AdminManufacturers', null, '2');
INSERT INTO `presshop_tab` VALUES ('34', '1', 'AdminSuppliers', null, '3');
INSERT INTO `presshop_tab` VALUES ('11', '1', 'AdminAttributesGroups', null, '4');
INSERT INTO `presshop_tab` VALUES ('36', '1', 'AdminFeatures', null, '5');
INSERT INTO `presshop_tab` VALUES ('58', '1', 'AdminScenes', null, '6');
INSERT INTO `presshop_tab` VALUES ('66', '1', 'AdminTags', null, '7');
INSERT INTO `presshop_tab` VALUES ('68', '1', 'AdminAttachments', null, '7');
INSERT INTO `presshop_tab` VALUES ('12', '2', 'AdminAddresses', null, '1');
INSERT INTO `presshop_tab` VALUES ('63', '2', 'AdminGroups', null, '2');
INSERT INTO `presshop_tab` VALUES ('65', '2', 'AdminCarts', null, '3');
INSERT INTO `presshop_tab` VALUES ('42', '3', 'AdminInvoices', null, '1');
INSERT INTO `presshop_tab` VALUES ('55', '3', 'AdminDeliverySlip', null, '2');
INSERT INTO `presshop_tab` VALUES ('47', '3', 'AdminReturn', null, '3');
INSERT INTO `presshop_tab` VALUES ('49', '3', 'AdminSlip', null, '4');
INSERT INTO `presshop_tab` VALUES ('59', '3', 'AdminMessages', null, '5');
INSERT INTO `presshop_tab` VALUES ('13', '3', 'AdminStatuses', null, '6');
INSERT INTO `presshop_tab` VALUES ('54', '3', 'AdminOrderMessage', null, '7');
INSERT INTO `presshop_tab` VALUES ('14', '4', 'AdminDiscounts', null, '3');
INSERT INTO `presshop_tab` VALUES ('15', '4', 'AdminCurrencies', null, '1');
INSERT INTO `presshop_tab` VALUES ('16', '4', 'AdminTaxes', null, '2');
INSERT INTO `presshop_tab` VALUES ('17', '5', 'AdminCarriers', null, '1');
INSERT INTO `presshop_tab` VALUES ('46', '5', 'AdminStates', null, '2');
INSERT INTO `presshop_tab` VALUES ('18', '5', 'AdminCountries', null, '3');
INSERT INTO `presshop_tab` VALUES ('19', '5', 'AdminZones', null, '4');
INSERT INTO `presshop_tab` VALUES ('20', '5', 'AdminRangePrice', null, '5');
INSERT INTO `presshop_tab` VALUES ('21', '5', 'AdminRangeWeight', null, '6');
INSERT INTO `presshop_tab` VALUES ('50', '6', 'AdminStatsModules', null, '1');
INSERT INTO `presshop_tab` VALUES ('51', '6', 'AdminStatsConf', null, '2');
INSERT INTO `presshop_tab` VALUES ('61', '6', 'AdminSearchEngines', null, '3');
INSERT INTO `presshop_tab` VALUES ('62', '6', 'AdminReferrers', null, '4');
INSERT INTO `presshop_tab` VALUES ('22', '7', 'AdminModulesPositions', null, '1');
INSERT INTO `presshop_tab` VALUES ('30', '29', 'AdminProfiles', null, '1');
INSERT INTO `presshop_tab` VALUES ('31', '29', 'AdminAccess', null, '2');
INSERT INTO `presshop_tab` VALUES ('28', '29', 'AdminContacts', null, '3');
INSERT INTO `presshop_tab` VALUES ('39', '8', 'AdminContact', null, '1');
INSERT INTO `presshop_tab` VALUES ('38', '8', 'AdminAppearance', null, '2');
INSERT INTO `presshop_tab` VALUES ('56', '8', 'AdminMeta', null, '3');
INSERT INTO `presshop_tab` VALUES ('27', '8', 'AdminPPreferences', null, '4');
INSERT INTO `presshop_tab` VALUES ('24', '8', 'AdminEmails', null, '5');
INSERT INTO `presshop_tab` VALUES ('26', '8', 'AdminImages', null, '6');
INSERT INTO `presshop_tab` VALUES ('23', '8', 'AdminDb', null, '7');
INSERT INTO `presshop_tab` VALUES ('48', '8', 'AdminPDF', null, '8');
INSERT INTO `presshop_tab` VALUES ('44', '8', 'AdminLocalization', null, '9');
INSERT INTO `presshop_tab` VALUES ('67', '8', 'AdminSearchConf', null, '10');
INSERT INTO `presshop_tab` VALUES ('32', '9', 'AdminLanguages', null, '1');
INSERT INTO `presshop_tab` VALUES ('33', '9', 'AdminTranslations', null, '2');
INSERT INTO `presshop_tab` VALUES ('35', '9', 'AdminTabs', null, '3');
INSERT INTO `presshop_tab` VALUES ('37', '9', 'AdminQuickAccesses', null, '4');
INSERT INTO `presshop_tab` VALUES ('40', '9', 'AdminAliases', null, '5');
INSERT INTO `presshop_tab` VALUES ('41', '9', 'AdminImport', null, '6');
INSERT INTO `presshop_tab` VALUES ('52', '9', 'AdminSubDomains', null, '7');
INSERT INTO `presshop_tab` VALUES ('53', '9', 'AdminBackup', null, '8');
INSERT INTO `presshop_tab` VALUES ('57', '9', 'AdminCMS', null, '9');
INSERT INTO `presshop_tab` VALUES ('64', '9', 'AdminGenerator', null, '10');
INSERT INTO `presshop_tab` VALUES ('43', '-1', 'AdminSearch', null, '0');

-- ----------------------------
-- Table structure for `presshop_tab_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tab_lang`;
CREATE TABLE `presshop_tab_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tab_lang
-- ----------------------------
INSERT INTO `presshop_tab_lang` VALUES ('1', '1', 'Catalog');
INSERT INTO `presshop_tab_lang` VALUES ('1', '2', 'Customers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '3', 'Orders');
INSERT INTO `presshop_tab_lang` VALUES ('1', '4', 'Payment');
INSERT INTO `presshop_tab_lang` VALUES ('1', '5', 'Shipping');
INSERT INTO `presshop_tab_lang` VALUES ('1', '6', 'Stats');
INSERT INTO `presshop_tab_lang` VALUES ('1', '7', 'Modules');
INSERT INTO `presshop_tab_lang` VALUES ('1', '8', 'Preferences');
INSERT INTO `presshop_tab_lang` VALUES ('1', '9', 'Tools');
INSERT INTO `presshop_tab_lang` VALUES ('1', '10', 'Manufacturers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '11', 'Attributes and groups');
INSERT INTO `presshop_tab_lang` VALUES ('1', '12', 'Addresses');
INSERT INTO `presshop_tab_lang` VALUES ('1', '13', 'Statuses');
INSERT INTO `presshop_tab_lang` VALUES ('1', '14', 'Vouchers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '15', 'Currencies');
INSERT INTO `presshop_tab_lang` VALUES ('1', '16', 'Taxes');
INSERT INTO `presshop_tab_lang` VALUES ('1', '17', 'Carriers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '18', 'Countries');
INSERT INTO `presshop_tab_lang` VALUES ('1', '19', 'Zones');
INSERT INTO `presshop_tab_lang` VALUES ('1', '20', 'Price ranges');
INSERT INTO `presshop_tab_lang` VALUES ('1', '21', 'Weight ranges');
INSERT INTO `presshop_tab_lang` VALUES ('1', '22', 'Positions');
INSERT INTO `presshop_tab_lang` VALUES ('1', '23', 'Database');
INSERT INTO `presshop_tab_lang` VALUES ('1', '24', 'Email');
INSERT INTO `presshop_tab_lang` VALUES ('1', '26', 'Image');
INSERT INTO `presshop_tab_lang` VALUES ('1', '27', 'Products');
INSERT INTO `presshop_tab_lang` VALUES ('1', '28', 'Contacts');
INSERT INTO `presshop_tab_lang` VALUES ('1', '29', 'Employees');
INSERT INTO `presshop_tab_lang` VALUES ('1', '30', 'Profiles');
INSERT INTO `presshop_tab_lang` VALUES ('1', '31', 'Permissions');
INSERT INTO `presshop_tab_lang` VALUES ('1', '32', 'Languages');
INSERT INTO `presshop_tab_lang` VALUES ('1', '33', 'Translations');
INSERT INTO `presshop_tab_lang` VALUES ('1', '34', 'Suppliers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '35', 'Tabs');
INSERT INTO `presshop_tab_lang` VALUES ('1', '36', 'Features');
INSERT INTO `presshop_tab_lang` VALUES ('1', '37', 'Quick Accesses');
INSERT INTO `presshop_tab_lang` VALUES ('1', '38', 'Appearance');
INSERT INTO `presshop_tab_lang` VALUES ('1', '39', 'Contact');
INSERT INTO `presshop_tab_lang` VALUES ('1', '40', 'Aliases');
INSERT INTO `presshop_tab_lang` VALUES ('1', '41', 'Import');
INSERT INTO `presshop_tab_lang` VALUES ('1', '42', 'Invoices');
INSERT INTO `presshop_tab_lang` VALUES ('1', '43', 'Search');
INSERT INTO `presshop_tab_lang` VALUES ('1', '44', 'Localization');
INSERT INTO `presshop_tab_lang` VALUES ('1', '46', 'States');
INSERT INTO `presshop_tab_lang` VALUES ('1', '47', 'Merchandise return');
INSERT INTO `presshop_tab_lang` VALUES ('1', '48', 'PDF');
INSERT INTO `presshop_tab_lang` VALUES ('1', '49', 'Credit slips');
INSERT INTO `presshop_tab_lang` VALUES ('1', '50', 'Modules');
INSERT INTO `presshop_tab_lang` VALUES ('1', '51', 'Settings');
INSERT INTO `presshop_tab_lang` VALUES ('1', '52', 'Subdomains');
INSERT INTO `presshop_tab_lang` VALUES ('1', '53', 'DB backup');
INSERT INTO `presshop_tab_lang` VALUES ('1', '54', 'Order Messages');
INSERT INTO `presshop_tab_lang` VALUES ('1', '55', 'Delivery slips');
INSERT INTO `presshop_tab_lang` VALUES ('1', '56', 'Meta-Tags');
INSERT INTO `presshop_tab_lang` VALUES ('1', '57', 'CMS');
INSERT INTO `presshop_tab_lang` VALUES ('1', '58', 'Image mapping');
INSERT INTO `presshop_tab_lang` VALUES ('1', '59', 'Customer messages');
INSERT INTO `presshop_tab_lang` VALUES ('1', '60', 'Tracking');
INSERT INTO `presshop_tab_lang` VALUES ('1', '61', 'Search engines');
INSERT INTO `presshop_tab_lang` VALUES ('1', '62', 'Referrers');
INSERT INTO `presshop_tab_lang` VALUES ('1', '63', 'Groups');
INSERT INTO `presshop_tab_lang` VALUES ('1', '64', 'Generators');
INSERT INTO `presshop_tab_lang` VALUES ('1', '65', 'Carts');
INSERT INTO `presshop_tab_lang` VALUES ('1', '66', 'Tags');
INSERT INTO `presshop_tab_lang` VALUES ('1', '67', 'Search');
INSERT INTO `presshop_tab_lang` VALUES ('1', '68', 'Attachments');
INSERT INTO `presshop_tab_lang` VALUES ('2', '1', 'Catalogue');
INSERT INTO `presshop_tab_lang` VALUES ('2', '2', 'Clients');
INSERT INTO `presshop_tab_lang` VALUES ('2', '3', 'Commandes');
INSERT INTO `presshop_tab_lang` VALUES ('2', '4', 'Paiement');
INSERT INTO `presshop_tab_lang` VALUES ('2', '5', 'Transport');
INSERT INTO `presshop_tab_lang` VALUES ('2', '6', 'Stats');
INSERT INTO `presshop_tab_lang` VALUES ('2', '7', 'Modules');
INSERT INTO `presshop_tab_lang` VALUES ('2', '8', 'Préférences');
INSERT INTO `presshop_tab_lang` VALUES ('2', '9', 'Outils');
INSERT INTO `presshop_tab_lang` VALUES ('2', '10', 'Fabricants');
INSERT INTO `presshop_tab_lang` VALUES ('2', '11', 'Attributs et groupes');
INSERT INTO `presshop_tab_lang` VALUES ('2', '12', 'Adresses');
INSERT INTO `presshop_tab_lang` VALUES ('2', '13', 'Statuts');
INSERT INTO `presshop_tab_lang` VALUES ('2', '14', 'Bons de réduction');
INSERT INTO `presshop_tab_lang` VALUES ('2', '15', 'Devises');
INSERT INTO `presshop_tab_lang` VALUES ('2', '16', 'Taxes');
INSERT INTO `presshop_tab_lang` VALUES ('2', '17', 'Transporteurs');
INSERT INTO `presshop_tab_lang` VALUES ('2', '18', 'Pays');
INSERT INTO `presshop_tab_lang` VALUES ('2', '19', 'Zones');
INSERT INTO `presshop_tab_lang` VALUES ('2', '20', 'Tranches de prix');
INSERT INTO `presshop_tab_lang` VALUES ('2', '21', 'Tranches de poids');
INSERT INTO `presshop_tab_lang` VALUES ('2', '22', 'Positions');
INSERT INTO `presshop_tab_lang` VALUES ('2', '23', 'Base de données');
INSERT INTO `presshop_tab_lang` VALUES ('2', '24', 'Emails');
INSERT INTO `presshop_tab_lang` VALUES ('2', '26', 'Images');
INSERT INTO `presshop_tab_lang` VALUES ('2', '27', 'Produits');
INSERT INTO `presshop_tab_lang` VALUES ('2', '28', 'Contacts');
INSERT INTO `presshop_tab_lang` VALUES ('2', '29', 'Employés');
INSERT INTO `presshop_tab_lang` VALUES ('2', '30', 'Profils');
INSERT INTO `presshop_tab_lang` VALUES ('2', '31', 'Permissions');
INSERT INTO `presshop_tab_lang` VALUES ('2', '32', 'Langues');
INSERT INTO `presshop_tab_lang` VALUES ('2', '33', 'Traductions');
INSERT INTO `presshop_tab_lang` VALUES ('2', '34', 'Fournisseurs');
INSERT INTO `presshop_tab_lang` VALUES ('2', '35', 'Onglets');
INSERT INTO `presshop_tab_lang` VALUES ('2', '36', 'Caractéristiques');
INSERT INTO `presshop_tab_lang` VALUES ('2', '37', 'Accès rapide');
INSERT INTO `presshop_tab_lang` VALUES ('2', '38', 'Apparence');
INSERT INTO `presshop_tab_lang` VALUES ('2', '39', 'Coordonnées');
INSERT INTO `presshop_tab_lang` VALUES ('2', '40', 'Alias');
INSERT INTO `presshop_tab_lang` VALUES ('2', '41', 'Import');
INSERT INTO `presshop_tab_lang` VALUES ('2', '42', 'Factures');
INSERT INTO `presshop_tab_lang` VALUES ('2', '43', 'Recherche');
INSERT INTO `presshop_tab_lang` VALUES ('2', '44', 'Localisation');
INSERT INTO `presshop_tab_lang` VALUES ('2', '46', 'Etats');
INSERT INTO `presshop_tab_lang` VALUES ('2', '47', 'Retours produits');
INSERT INTO `presshop_tab_lang` VALUES ('2', '48', 'PDF');
INSERT INTO `presshop_tab_lang` VALUES ('2', '49', 'Avoirs');
INSERT INTO `presshop_tab_lang` VALUES ('2', '50', 'Modules');
INSERT INTO `presshop_tab_lang` VALUES ('2', '51', 'Configuration');
INSERT INTO `presshop_tab_lang` VALUES ('2', '52', 'Sous domaines');
INSERT INTO `presshop_tab_lang` VALUES ('2', '53', 'Sauvegarde BDD');
INSERT INTO `presshop_tab_lang` VALUES ('2', '54', 'Messages prédéfinis');
INSERT INTO `presshop_tab_lang` VALUES ('2', '55', 'Bons de livraison');
INSERT INTO `presshop_tab_lang` VALUES ('2', '56', 'Méta-Tags');
INSERT INTO `presshop_tab_lang` VALUES ('2', '57', 'CMS');
INSERT INTO `presshop_tab_lang` VALUES ('2', '58', 'Scènes');
INSERT INTO `presshop_tab_lang` VALUES ('2', '59', 'Messages clients');
INSERT INTO `presshop_tab_lang` VALUES ('2', '60', 'Suivi');
INSERT INTO `presshop_tab_lang` VALUES ('2', '61', 'Moteurs de recherche');
INSERT INTO `presshop_tab_lang` VALUES ('2', '62', 'Sites affluents');
INSERT INTO `presshop_tab_lang` VALUES ('2', '63', 'Groupes');
INSERT INTO `presshop_tab_lang` VALUES ('2', '64', 'Générateurs');
INSERT INTO `presshop_tab_lang` VALUES ('2', '65', 'Paniers');
INSERT INTO `presshop_tab_lang` VALUES ('2', '66', 'Tags');
INSERT INTO `presshop_tab_lang` VALUES ('2', '67', 'Recherche');
INSERT INTO `presshop_tab_lang` VALUES ('2', '68', 'Documents joints');

-- ----------------------------
-- Table structure for `presshop_tag`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tag`;
CREATE TABLE `presshop_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tag
-- ----------------------------
INSERT INTO `presshop_tag` VALUES ('39', '1', 'fear flying');
INSERT INTO `presshop_tag` VALUES ('38', '2', 'peur avion commandant Robert Pic');
INSERT INTO `presshop_tag` VALUES ('41', '2', 'Robert Piché');
INSERT INTO `presshop_tag` VALUES ('40', '2', 'livre');
INSERT INTO `presshop_tag` VALUES ('43', '2', 'Robert piché aux commandes du de');
INSERT INTO `presshop_tag` VALUES ('42', '2', 'commandant');
INSERT INTO `presshop_tag` VALUES ('44', '1', 'jacques martel');
INSERT INTO `presshop_tag` VALUES ('45', '1', 'conference');
INSERT INTO `presshop_tag` VALUES ('46', '1', 'book');
INSERT INTO `presshop_tag` VALUES ('47', '2', 'jacques martel');
INSERT INTO `presshop_tag` VALUES ('48', '2', 'dictionnaire maladie malaise');
INSERT INTO `presshop_tag` VALUES ('49', '2', 'conférencier');
INSERT INTO `presshop_tag` VALUES ('50', '1', 'Nicole Dumont conference livre a');
INSERT INTO `presshop_tag` VALUES ('51', '2', 'Nicole Dumont conférencière livr');
INSERT INTO `presshop_tag` VALUES ('52', '1', 'Nicole Dumont conference livre a');
INSERT INTO `presshop_tag` VALUES ('53', '2', 'Nicole Dumont conférencière livr');
INSERT INTO `presshop_tag` VALUES ('54', '1', 'Nicole Dumont conference');
INSERT INTO `presshop_tag` VALUES ('55', '2', 'Nicole Dumont conférencière aute');

-- ----------------------------
-- Table structure for `presshop_tax`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tax`;
CREATE TABLE `presshop_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_tax`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tax
-- ----------------------------
INSERT INTO `presshop_tax` VALUES ('5', '5.000');
INSERT INTO `presshop_tax` VALUES ('4', '12.870');

-- ----------------------------
-- Table structure for `presshop_tax_lang`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tax_lang`;
CREATE TABLE `presshop_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `tax_lang_index` (`id_tax`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tax_lang
-- ----------------------------
INSERT INTO `presshop_tax_lang` VALUES ('5', '2', 'Ontario');
INSERT INTO `presshop_tax_lang` VALUES ('5', '1', 'Ontario');
INSERT INTO `presshop_tax_lang` VALUES ('4', '1', 'GST/TSQ combined');
INSERT INTO `presshop_tax_lang` VALUES ('4', '2', 'TPS/TVQ combinée');

-- ----------------------------
-- Table structure for `presshop_tax_state`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tax_state`;
CREATE TABLE `presshop_tax_state` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned NOT NULL,
  KEY `tax_state_index` (`id_tax`,`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tax_state
-- ----------------------------
INSERT INTO `presshop_tax_state` VALUES ('4', '54');
INSERT INTO `presshop_tax_state` VALUES ('5', '53');

-- ----------------------------
-- Table structure for `presshop_tax_zone`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_tax_zone`;
CREATE TABLE `presshop_tax_zone` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  KEY `tax_zone_index` (`id_tax`,`id_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_tax_zone
-- ----------------------------
INSERT INTO `presshop_tax_zone` VALUES ('1', '1');
INSERT INTO `presshop_tax_zone` VALUES ('2', '1');
INSERT INTO `presshop_tax_zone` VALUES ('4', '1');
INSERT INTO `presshop_tax_zone` VALUES ('4', '2');
INSERT INTO `presshop_tax_zone` VALUES ('4', '5');

-- ----------------------------
-- Table structure for `presshop_timezone`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_timezone`;
CREATE TABLE `presshop_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_timezone
-- ----------------------------
INSERT INTO `presshop_timezone` VALUES ('1', 'Africa/Abidjan');
INSERT INTO `presshop_timezone` VALUES ('2', 'Africa/Accra');
INSERT INTO `presshop_timezone` VALUES ('3', 'Africa/Addis_Ababa');
INSERT INTO `presshop_timezone` VALUES ('4', 'Africa/Algiers');
INSERT INTO `presshop_timezone` VALUES ('5', 'Africa/Asmara');
INSERT INTO `presshop_timezone` VALUES ('6', 'Africa/Asmera');
INSERT INTO `presshop_timezone` VALUES ('7', 'Africa/Bamako');
INSERT INTO `presshop_timezone` VALUES ('8', 'Africa/Bangui');
INSERT INTO `presshop_timezone` VALUES ('9', 'Africa/Banjul');
INSERT INTO `presshop_timezone` VALUES ('10', 'Africa/Bissau');
INSERT INTO `presshop_timezone` VALUES ('11', 'Africa/Blantyre');
INSERT INTO `presshop_timezone` VALUES ('12', 'Africa/Brazzaville');
INSERT INTO `presshop_timezone` VALUES ('13', 'Africa/Bujumbura');
INSERT INTO `presshop_timezone` VALUES ('14', 'Africa/Cairo');
INSERT INTO `presshop_timezone` VALUES ('15', 'Africa/Casablanca');
INSERT INTO `presshop_timezone` VALUES ('16', 'Africa/Ceuta');
INSERT INTO `presshop_timezone` VALUES ('17', 'Africa/Conakry');
INSERT INTO `presshop_timezone` VALUES ('18', 'Africa/Dakar');
INSERT INTO `presshop_timezone` VALUES ('19', 'Africa/Dar_es_Salaam');
INSERT INTO `presshop_timezone` VALUES ('20', 'Africa/Djibouti');
INSERT INTO `presshop_timezone` VALUES ('21', 'Africa/Douala');
INSERT INTO `presshop_timezone` VALUES ('22', 'Africa/El_Aaiun');
INSERT INTO `presshop_timezone` VALUES ('23', 'Africa/Freetown');
INSERT INTO `presshop_timezone` VALUES ('24', 'Africa/Gaborone');
INSERT INTO `presshop_timezone` VALUES ('25', 'Africa/Harare');
INSERT INTO `presshop_timezone` VALUES ('26', 'Africa/Johannesburg');
INSERT INTO `presshop_timezone` VALUES ('27', 'Africa/Kampala');
INSERT INTO `presshop_timezone` VALUES ('28', 'Africa/Khartoum');
INSERT INTO `presshop_timezone` VALUES ('29', 'Africa/Kigali');
INSERT INTO `presshop_timezone` VALUES ('30', 'Africa/Kinshasa');
INSERT INTO `presshop_timezone` VALUES ('31', 'Africa/Lagos');
INSERT INTO `presshop_timezone` VALUES ('32', 'Africa/Libreville');
INSERT INTO `presshop_timezone` VALUES ('33', 'Africa/Lome');
INSERT INTO `presshop_timezone` VALUES ('34', 'Africa/Luanda');
INSERT INTO `presshop_timezone` VALUES ('35', 'Africa/Lubumbashi');
INSERT INTO `presshop_timezone` VALUES ('36', 'Africa/Lusaka');
INSERT INTO `presshop_timezone` VALUES ('37', 'Africa/Malabo');
INSERT INTO `presshop_timezone` VALUES ('38', 'Africa/Maputo');
INSERT INTO `presshop_timezone` VALUES ('39', 'Africa/Maseru');
INSERT INTO `presshop_timezone` VALUES ('40', 'Africa/Mbabane');
INSERT INTO `presshop_timezone` VALUES ('41', 'Africa/Mogadishu');
INSERT INTO `presshop_timezone` VALUES ('42', 'Africa/Monrovia');
INSERT INTO `presshop_timezone` VALUES ('43', 'Africa/Nairobi');
INSERT INTO `presshop_timezone` VALUES ('44', 'Africa/Ndjamena');
INSERT INTO `presshop_timezone` VALUES ('45', 'Africa/Niamey');
INSERT INTO `presshop_timezone` VALUES ('46', 'Africa/Nouakchott');
INSERT INTO `presshop_timezone` VALUES ('47', 'Africa/Ouagadougou');
INSERT INTO `presshop_timezone` VALUES ('48', 'Africa/Porto-Novo');
INSERT INTO `presshop_timezone` VALUES ('49', 'Africa/Sao_Tome');
INSERT INTO `presshop_timezone` VALUES ('50', 'Africa/Timbuktu');
INSERT INTO `presshop_timezone` VALUES ('51', 'Africa/Tripoli');
INSERT INTO `presshop_timezone` VALUES ('52', 'Africa/Tunis');
INSERT INTO `presshop_timezone` VALUES ('53', 'Africa/Windhoek');
INSERT INTO `presshop_timezone` VALUES ('54', 'America/Adak');
INSERT INTO `presshop_timezone` VALUES ('55', 'America/Anchorage ');
INSERT INTO `presshop_timezone` VALUES ('56', 'America/Anguilla');
INSERT INTO `presshop_timezone` VALUES ('57', 'America/Antigua');
INSERT INTO `presshop_timezone` VALUES ('58', 'America/Araguaina');
INSERT INTO `presshop_timezone` VALUES ('59', 'America/Argentina/Buenos_Aires');
INSERT INTO `presshop_timezone` VALUES ('60', 'America/Argentina/Catamarca');
INSERT INTO `presshop_timezone` VALUES ('61', 'America/Argentina/ComodRivadavia');
INSERT INTO `presshop_timezone` VALUES ('62', 'America/Argentina/Cordoba');
INSERT INTO `presshop_timezone` VALUES ('63', 'America/Argentina/Jujuy');
INSERT INTO `presshop_timezone` VALUES ('64', 'America/Argentina/La_Rioja');
INSERT INTO `presshop_timezone` VALUES ('65', 'America/Argentina/Mendoza');
INSERT INTO `presshop_timezone` VALUES ('66', 'America/Argentina/Rio_Gallegos');
INSERT INTO `presshop_timezone` VALUES ('67', 'America/Argentina/Salta');
INSERT INTO `presshop_timezone` VALUES ('68', 'America/Argentina/San_Juan');
INSERT INTO `presshop_timezone` VALUES ('69', 'America/Argentina/San_Luis');
INSERT INTO `presshop_timezone` VALUES ('70', 'America/Argentina/Tucuman');
INSERT INTO `presshop_timezone` VALUES ('71', 'America/Argentina/Ushuaia');
INSERT INTO `presshop_timezone` VALUES ('72', 'America/Aruba');
INSERT INTO `presshop_timezone` VALUES ('73', 'America/Asuncion');
INSERT INTO `presshop_timezone` VALUES ('74', 'America/Atikokan');
INSERT INTO `presshop_timezone` VALUES ('75', 'America/Atka');
INSERT INTO `presshop_timezone` VALUES ('76', 'America/Bahia');
INSERT INTO `presshop_timezone` VALUES ('77', 'America/Barbados');
INSERT INTO `presshop_timezone` VALUES ('78', 'America/Belem');
INSERT INTO `presshop_timezone` VALUES ('79', 'America/Belize');
INSERT INTO `presshop_timezone` VALUES ('80', 'America/Blanc-Sablon');
INSERT INTO `presshop_timezone` VALUES ('81', 'America/Boa_Vista');
INSERT INTO `presshop_timezone` VALUES ('82', 'America/Bogota');
INSERT INTO `presshop_timezone` VALUES ('83', 'America/Boise');
INSERT INTO `presshop_timezone` VALUES ('84', 'America/Buenos_Aires');
INSERT INTO `presshop_timezone` VALUES ('85', 'America/Cambridge_Bay');
INSERT INTO `presshop_timezone` VALUES ('86', 'America/Campo_Grande');
INSERT INTO `presshop_timezone` VALUES ('87', 'America/Cancun');
INSERT INTO `presshop_timezone` VALUES ('88', 'America/Caracas');
INSERT INTO `presshop_timezone` VALUES ('89', 'America/Catamarca');
INSERT INTO `presshop_timezone` VALUES ('90', 'America/Cayenne');
INSERT INTO `presshop_timezone` VALUES ('91', 'America/Cayman');
INSERT INTO `presshop_timezone` VALUES ('92', 'America/Chicago');
INSERT INTO `presshop_timezone` VALUES ('93', 'America/Chihuahua');
INSERT INTO `presshop_timezone` VALUES ('94', 'America/Coral_Harbour');
INSERT INTO `presshop_timezone` VALUES ('95', 'America/Cordoba');
INSERT INTO `presshop_timezone` VALUES ('96', 'America/Costa_Rica');
INSERT INTO `presshop_timezone` VALUES ('97', 'America/Cuiaba');
INSERT INTO `presshop_timezone` VALUES ('98', 'America/Curacao');
INSERT INTO `presshop_timezone` VALUES ('99', 'America/Danmarkshavn');
INSERT INTO `presshop_timezone` VALUES ('100', 'America/Dawson');
INSERT INTO `presshop_timezone` VALUES ('101', 'America/Dawson_Creek');
INSERT INTO `presshop_timezone` VALUES ('102', 'America/Denver');
INSERT INTO `presshop_timezone` VALUES ('103', 'America/Detroit');
INSERT INTO `presshop_timezone` VALUES ('104', 'America/Dominica');
INSERT INTO `presshop_timezone` VALUES ('105', 'America/Edmonton');
INSERT INTO `presshop_timezone` VALUES ('106', 'America/Eirunepe');
INSERT INTO `presshop_timezone` VALUES ('107', 'America/El_Salvador');
INSERT INTO `presshop_timezone` VALUES ('108', 'America/Ensenada');
INSERT INTO `presshop_timezone` VALUES ('109', 'America/Fort_Wayne');
INSERT INTO `presshop_timezone` VALUES ('110', 'America/Fortaleza');
INSERT INTO `presshop_timezone` VALUES ('111', 'America/Glace_Bay');
INSERT INTO `presshop_timezone` VALUES ('112', 'America/Godthab');
INSERT INTO `presshop_timezone` VALUES ('113', 'America/Goose_Bay');
INSERT INTO `presshop_timezone` VALUES ('114', 'America/Grand_Turk');
INSERT INTO `presshop_timezone` VALUES ('115', 'America/Grenada');
INSERT INTO `presshop_timezone` VALUES ('116', 'America/Guadeloupe');
INSERT INTO `presshop_timezone` VALUES ('117', 'America/Guatemala');
INSERT INTO `presshop_timezone` VALUES ('118', 'America/Guayaquil');
INSERT INTO `presshop_timezone` VALUES ('119', 'America/Guyana');
INSERT INTO `presshop_timezone` VALUES ('120', 'America/Halifax');
INSERT INTO `presshop_timezone` VALUES ('121', 'America/Havana');
INSERT INTO `presshop_timezone` VALUES ('122', 'America/Hermosillo');
INSERT INTO `presshop_timezone` VALUES ('123', 'America/Indiana/Indianapolis');
INSERT INTO `presshop_timezone` VALUES ('124', 'America/Indiana/Knox');
INSERT INTO `presshop_timezone` VALUES ('125', 'America/Indiana/Marengo');
INSERT INTO `presshop_timezone` VALUES ('126', 'America/Indiana/Petersburg');
INSERT INTO `presshop_timezone` VALUES ('127', 'America/Indiana/Tell_City');
INSERT INTO `presshop_timezone` VALUES ('128', 'America/Indiana/Vevay');
INSERT INTO `presshop_timezone` VALUES ('129', 'America/Indiana/Vincennes');
INSERT INTO `presshop_timezone` VALUES ('130', 'America/Indiana/Winamac');
INSERT INTO `presshop_timezone` VALUES ('131', 'America/Indianapolis');
INSERT INTO `presshop_timezone` VALUES ('132', 'America/Inuvik');
INSERT INTO `presshop_timezone` VALUES ('133', 'America/Iqaluit');
INSERT INTO `presshop_timezone` VALUES ('134', 'America/Jamaica');
INSERT INTO `presshop_timezone` VALUES ('135', 'America/Jujuy');
INSERT INTO `presshop_timezone` VALUES ('136', 'America/Juneau');
INSERT INTO `presshop_timezone` VALUES ('137', 'America/Kentucky/Louisville');
INSERT INTO `presshop_timezone` VALUES ('138', 'America/Kentucky/Monticello');
INSERT INTO `presshop_timezone` VALUES ('139', 'America/Knox_IN');
INSERT INTO `presshop_timezone` VALUES ('140', 'America/La_Paz');
INSERT INTO `presshop_timezone` VALUES ('141', 'America/Lima');
INSERT INTO `presshop_timezone` VALUES ('142', 'America/Los_Angeles');
INSERT INTO `presshop_timezone` VALUES ('143', 'America/Louisville');
INSERT INTO `presshop_timezone` VALUES ('144', 'America/Maceio');
INSERT INTO `presshop_timezone` VALUES ('145', 'America/Managua');
INSERT INTO `presshop_timezone` VALUES ('146', 'America/Manaus');
INSERT INTO `presshop_timezone` VALUES ('147', 'America/Marigot');
INSERT INTO `presshop_timezone` VALUES ('148', 'America/Martinique');
INSERT INTO `presshop_timezone` VALUES ('149', 'America/Mazatlan');
INSERT INTO `presshop_timezone` VALUES ('150', 'America/Mendoza');
INSERT INTO `presshop_timezone` VALUES ('151', 'America/Menominee');
INSERT INTO `presshop_timezone` VALUES ('152', 'America/Merida');
INSERT INTO `presshop_timezone` VALUES ('153', 'America/Mexico_City');
INSERT INTO `presshop_timezone` VALUES ('154', 'America/Miquelon');
INSERT INTO `presshop_timezone` VALUES ('155', 'America/Moncton');
INSERT INTO `presshop_timezone` VALUES ('156', 'America/Monterrey');
INSERT INTO `presshop_timezone` VALUES ('157', 'America/Montevideo');
INSERT INTO `presshop_timezone` VALUES ('158', 'America/Montreal');
INSERT INTO `presshop_timezone` VALUES ('159', 'America/Montserrat');
INSERT INTO `presshop_timezone` VALUES ('160', 'America/Nassau');
INSERT INTO `presshop_timezone` VALUES ('161', 'America/New_York');
INSERT INTO `presshop_timezone` VALUES ('162', 'America/Nipigon');
INSERT INTO `presshop_timezone` VALUES ('163', 'America/Nome');
INSERT INTO `presshop_timezone` VALUES ('164', 'America/Noronha');
INSERT INTO `presshop_timezone` VALUES ('165', 'America/North_Dakota/Center');
INSERT INTO `presshop_timezone` VALUES ('166', 'America/North_Dakota/New_Salem');
INSERT INTO `presshop_timezone` VALUES ('167', 'America/Panama');
INSERT INTO `presshop_timezone` VALUES ('168', 'America/Pangnirtung');
INSERT INTO `presshop_timezone` VALUES ('169', 'America/Paramaribo');
INSERT INTO `presshop_timezone` VALUES ('170', 'America/Phoenix');
INSERT INTO `presshop_timezone` VALUES ('171', 'America/Port-au-Prince');
INSERT INTO `presshop_timezone` VALUES ('172', 'America/Port_of_Spain');
INSERT INTO `presshop_timezone` VALUES ('173', 'America/Porto_Acre');
INSERT INTO `presshop_timezone` VALUES ('174', 'America/Porto_Velho');
INSERT INTO `presshop_timezone` VALUES ('175', 'America/Puerto_Rico');
INSERT INTO `presshop_timezone` VALUES ('176', 'America/Rainy_River');
INSERT INTO `presshop_timezone` VALUES ('177', 'America/Rankin_Inlet');
INSERT INTO `presshop_timezone` VALUES ('178', 'America/Recife');
INSERT INTO `presshop_timezone` VALUES ('179', 'America/Regina');
INSERT INTO `presshop_timezone` VALUES ('180', 'America/Resolute');
INSERT INTO `presshop_timezone` VALUES ('181', 'America/Rio_Branco');
INSERT INTO `presshop_timezone` VALUES ('182', 'America/Rosario');
INSERT INTO `presshop_timezone` VALUES ('183', 'America/Santarem');
INSERT INTO `presshop_timezone` VALUES ('184', 'America/Santiago');
INSERT INTO `presshop_timezone` VALUES ('185', 'America/Santo_Domingo');
INSERT INTO `presshop_timezone` VALUES ('186', 'America/Sao_Paulo');
INSERT INTO `presshop_timezone` VALUES ('187', 'America/Scoresbysund');
INSERT INTO `presshop_timezone` VALUES ('188', 'America/Shiprock');
INSERT INTO `presshop_timezone` VALUES ('189', 'America/St_Barthelemy');
INSERT INTO `presshop_timezone` VALUES ('190', 'America/St_Johns');
INSERT INTO `presshop_timezone` VALUES ('191', 'America/St_Kitts');
INSERT INTO `presshop_timezone` VALUES ('192', 'America/St_Lucia');
INSERT INTO `presshop_timezone` VALUES ('193', 'America/St_Thomas');
INSERT INTO `presshop_timezone` VALUES ('194', 'America/St_Vincent');
INSERT INTO `presshop_timezone` VALUES ('195', 'America/Swift_Current');
INSERT INTO `presshop_timezone` VALUES ('196', 'America/Tegucigalpa');
INSERT INTO `presshop_timezone` VALUES ('197', 'America/Thule');
INSERT INTO `presshop_timezone` VALUES ('198', 'America/Thunder_Bay');
INSERT INTO `presshop_timezone` VALUES ('199', 'America/Tijuana');
INSERT INTO `presshop_timezone` VALUES ('200', 'America/Toronto');
INSERT INTO `presshop_timezone` VALUES ('201', 'America/Tortola');
INSERT INTO `presshop_timezone` VALUES ('202', 'America/Vancouver');
INSERT INTO `presshop_timezone` VALUES ('203', 'America/Virgin');
INSERT INTO `presshop_timezone` VALUES ('204', 'America/Whitehorse');
INSERT INTO `presshop_timezone` VALUES ('205', 'America/Winnipeg');
INSERT INTO `presshop_timezone` VALUES ('206', 'America/Yakutat');
INSERT INTO `presshop_timezone` VALUES ('207', 'America/Yellowknife');
INSERT INTO `presshop_timezone` VALUES ('208', 'Antarctica/Casey');
INSERT INTO `presshop_timezone` VALUES ('209', 'Antarctica/Davis');
INSERT INTO `presshop_timezone` VALUES ('210', 'Antarctica/DumontDUrville');
INSERT INTO `presshop_timezone` VALUES ('211', 'Antarctica/Mawson');
INSERT INTO `presshop_timezone` VALUES ('212', 'Antarctica/McMurdo');
INSERT INTO `presshop_timezone` VALUES ('213', 'Antarctica/Palmer');
INSERT INTO `presshop_timezone` VALUES ('214', 'Antarctica/Rothera');
INSERT INTO `presshop_timezone` VALUES ('215', 'Antarctica/South_Pole');
INSERT INTO `presshop_timezone` VALUES ('216', 'Antarctica/Syowa');
INSERT INTO `presshop_timezone` VALUES ('217', 'Antarctica/Vostok');
INSERT INTO `presshop_timezone` VALUES ('218', 'Arctic/Longyearbyen');
INSERT INTO `presshop_timezone` VALUES ('219', 'Asia/Aden');
INSERT INTO `presshop_timezone` VALUES ('220', 'Asia/Almaty');
INSERT INTO `presshop_timezone` VALUES ('221', 'Asia/Amman');
INSERT INTO `presshop_timezone` VALUES ('222', 'Asia/Anadyr');
INSERT INTO `presshop_timezone` VALUES ('223', 'Asia/Aqtau');
INSERT INTO `presshop_timezone` VALUES ('224', 'Asia/Aqtobe');
INSERT INTO `presshop_timezone` VALUES ('225', 'Asia/Ashgabat');
INSERT INTO `presshop_timezone` VALUES ('226', 'Asia/Ashkhabad');
INSERT INTO `presshop_timezone` VALUES ('227', 'Asia/Baghdad');
INSERT INTO `presshop_timezone` VALUES ('228', 'Asia/Bahrain');
INSERT INTO `presshop_timezone` VALUES ('229', 'Asia/Baku');
INSERT INTO `presshop_timezone` VALUES ('230', 'Asia/Bangkok');
INSERT INTO `presshop_timezone` VALUES ('231', 'Asia/Beirut');
INSERT INTO `presshop_timezone` VALUES ('232', 'Asia/Bishkek');
INSERT INTO `presshop_timezone` VALUES ('233', 'Asia/Brunei');
INSERT INTO `presshop_timezone` VALUES ('234', 'Asia/Calcutta');
INSERT INTO `presshop_timezone` VALUES ('235', 'Asia/Choibalsan');
INSERT INTO `presshop_timezone` VALUES ('236', 'Asia/Chongqing');
INSERT INTO `presshop_timezone` VALUES ('237', 'Asia/Chungking');
INSERT INTO `presshop_timezone` VALUES ('238', 'Asia/Colombo');
INSERT INTO `presshop_timezone` VALUES ('239', 'Asia/Dacca');
INSERT INTO `presshop_timezone` VALUES ('240', 'Asia/Damascus');
INSERT INTO `presshop_timezone` VALUES ('241', 'Asia/Dhaka');
INSERT INTO `presshop_timezone` VALUES ('242', 'Asia/Dili');
INSERT INTO `presshop_timezone` VALUES ('243', 'Asia/Dubai');
INSERT INTO `presshop_timezone` VALUES ('244', 'Asia/Dushanbe');
INSERT INTO `presshop_timezone` VALUES ('245', 'Asia/Gaza');
INSERT INTO `presshop_timezone` VALUES ('246', 'Asia/Harbin');
INSERT INTO `presshop_timezone` VALUES ('247', 'Asia/Ho_Chi_Minh');
INSERT INTO `presshop_timezone` VALUES ('248', 'Asia/Hong_Kong');
INSERT INTO `presshop_timezone` VALUES ('249', 'Asia/Hovd');
INSERT INTO `presshop_timezone` VALUES ('250', 'Asia/Irkutsk');
INSERT INTO `presshop_timezone` VALUES ('251', 'Asia/Istanbul');
INSERT INTO `presshop_timezone` VALUES ('252', 'Asia/Jakarta');
INSERT INTO `presshop_timezone` VALUES ('253', 'Asia/Jayapura');
INSERT INTO `presshop_timezone` VALUES ('254', 'Asia/Jerusalem');
INSERT INTO `presshop_timezone` VALUES ('255', 'Asia/Kabul');
INSERT INTO `presshop_timezone` VALUES ('256', 'Asia/Kamchatka');
INSERT INTO `presshop_timezone` VALUES ('257', 'Asia/Karachi');
INSERT INTO `presshop_timezone` VALUES ('258', 'Asia/Kashgar');
INSERT INTO `presshop_timezone` VALUES ('259', 'Asia/Kathmandu');
INSERT INTO `presshop_timezone` VALUES ('260', 'Asia/Katmandu');
INSERT INTO `presshop_timezone` VALUES ('261', 'Asia/Kolkata');
INSERT INTO `presshop_timezone` VALUES ('262', 'Asia/Krasnoyarsk');
INSERT INTO `presshop_timezone` VALUES ('263', 'Asia/Kuala_Lumpur');
INSERT INTO `presshop_timezone` VALUES ('264', 'Asia/Kuching');
INSERT INTO `presshop_timezone` VALUES ('265', 'Asia/Kuwait');
INSERT INTO `presshop_timezone` VALUES ('266', 'Asia/Macao');
INSERT INTO `presshop_timezone` VALUES ('267', 'Asia/Macau');
INSERT INTO `presshop_timezone` VALUES ('268', 'Asia/Magadan');
INSERT INTO `presshop_timezone` VALUES ('269', 'Asia/Makassar');
INSERT INTO `presshop_timezone` VALUES ('270', 'Asia/Manila');
INSERT INTO `presshop_timezone` VALUES ('271', 'Asia/Muscat');
INSERT INTO `presshop_timezone` VALUES ('272', 'Asia/Nicosia');
INSERT INTO `presshop_timezone` VALUES ('273', 'Asia/Novosibirsk');
INSERT INTO `presshop_timezone` VALUES ('274', 'Asia/Omsk');
INSERT INTO `presshop_timezone` VALUES ('275', 'Asia/Oral');
INSERT INTO `presshop_timezone` VALUES ('276', 'Asia/Phnom_Penh');
INSERT INTO `presshop_timezone` VALUES ('277', 'Asia/Pontianak');
INSERT INTO `presshop_timezone` VALUES ('278', 'Asia/Pyongyang');
INSERT INTO `presshop_timezone` VALUES ('279', 'Asia/Qatar');
INSERT INTO `presshop_timezone` VALUES ('280', 'Asia/Qyzylorda');
INSERT INTO `presshop_timezone` VALUES ('281', 'Asia/Rangoon');
INSERT INTO `presshop_timezone` VALUES ('282', 'Asia/Riyadh');
INSERT INTO `presshop_timezone` VALUES ('283', 'Asia/Saigon');
INSERT INTO `presshop_timezone` VALUES ('284', 'Asia/Sakhalin');
INSERT INTO `presshop_timezone` VALUES ('285', 'Asia/Samarkand');
INSERT INTO `presshop_timezone` VALUES ('286', 'Asia/Seoul');
INSERT INTO `presshop_timezone` VALUES ('287', 'Asia/Shanghai');
INSERT INTO `presshop_timezone` VALUES ('288', 'Asia/Singapore');
INSERT INTO `presshop_timezone` VALUES ('289', 'Asia/Taipei');
INSERT INTO `presshop_timezone` VALUES ('290', 'Asia/Tashkent');
INSERT INTO `presshop_timezone` VALUES ('291', 'Asia/Tbilisi');
INSERT INTO `presshop_timezone` VALUES ('292', 'Asia/Tehran');
INSERT INTO `presshop_timezone` VALUES ('293', 'Asia/Tel_Aviv');
INSERT INTO `presshop_timezone` VALUES ('294', 'Asia/Thimbu');
INSERT INTO `presshop_timezone` VALUES ('295', 'Asia/Thimphu');
INSERT INTO `presshop_timezone` VALUES ('296', 'Asia/Tokyo');
INSERT INTO `presshop_timezone` VALUES ('297', 'Asia/Ujung_Pandang');
INSERT INTO `presshop_timezone` VALUES ('298', 'Asia/Ulaanbaatar');
INSERT INTO `presshop_timezone` VALUES ('299', 'Asia/Ulan_Bator');
INSERT INTO `presshop_timezone` VALUES ('300', 'Asia/Urumqi');
INSERT INTO `presshop_timezone` VALUES ('301', 'Asia/Vientiane');
INSERT INTO `presshop_timezone` VALUES ('302', 'Asia/Vladivostok');
INSERT INTO `presshop_timezone` VALUES ('303', 'Asia/Yakutsk');
INSERT INTO `presshop_timezone` VALUES ('304', 'Asia/Yekaterinburg');
INSERT INTO `presshop_timezone` VALUES ('305', 'Asia/Yerevan');
INSERT INTO `presshop_timezone` VALUES ('306', 'Atlantic/Azores');
INSERT INTO `presshop_timezone` VALUES ('307', 'Atlantic/Bermuda');
INSERT INTO `presshop_timezone` VALUES ('308', 'Atlantic/Canary');
INSERT INTO `presshop_timezone` VALUES ('309', 'Atlantic/Cape_Verde');
INSERT INTO `presshop_timezone` VALUES ('310', 'Atlantic/Faeroe');
INSERT INTO `presshop_timezone` VALUES ('311', 'Atlantic/Faroe');
INSERT INTO `presshop_timezone` VALUES ('312', 'Atlantic/Jan_Mayen');
INSERT INTO `presshop_timezone` VALUES ('313', 'Atlantic/Madeira');
INSERT INTO `presshop_timezone` VALUES ('314', 'Atlantic/Reykjavik');
INSERT INTO `presshop_timezone` VALUES ('315', 'Atlantic/South_Georgia');
INSERT INTO `presshop_timezone` VALUES ('316', 'Atlantic/St_Helena');
INSERT INTO `presshop_timezone` VALUES ('317', 'Atlantic/Stanley');
INSERT INTO `presshop_timezone` VALUES ('318', 'Australia/ACT');
INSERT INTO `presshop_timezone` VALUES ('319', 'Australia/Adelaide');
INSERT INTO `presshop_timezone` VALUES ('320', 'Australia/Brisbane');
INSERT INTO `presshop_timezone` VALUES ('321', 'Australia/Broken_Hill');
INSERT INTO `presshop_timezone` VALUES ('322', 'Australia/Canberra');
INSERT INTO `presshop_timezone` VALUES ('323', 'Australia/Currie');
INSERT INTO `presshop_timezone` VALUES ('324', 'Australia/Darwin');
INSERT INTO `presshop_timezone` VALUES ('325', 'Australia/Eucla');
INSERT INTO `presshop_timezone` VALUES ('326', 'Australia/Hobart');
INSERT INTO `presshop_timezone` VALUES ('327', 'Australia/LHI');
INSERT INTO `presshop_timezone` VALUES ('328', 'Australia/Lindeman');
INSERT INTO `presshop_timezone` VALUES ('329', 'Australia/Lord_Howe');
INSERT INTO `presshop_timezone` VALUES ('330', 'Australia/Melbourne');
INSERT INTO `presshop_timezone` VALUES ('331', 'Australia/North');
INSERT INTO `presshop_timezone` VALUES ('332', 'Australia/NSW');
INSERT INTO `presshop_timezone` VALUES ('333', 'Australia/Perth');
INSERT INTO `presshop_timezone` VALUES ('334', 'Australia/Queensland');
INSERT INTO `presshop_timezone` VALUES ('335', 'Australia/South');
INSERT INTO `presshop_timezone` VALUES ('336', 'Australia/Sydney');
INSERT INTO `presshop_timezone` VALUES ('337', 'Australia/Tasmania');
INSERT INTO `presshop_timezone` VALUES ('338', 'Australia/Victoria');
INSERT INTO `presshop_timezone` VALUES ('339', 'Australia/West');
INSERT INTO `presshop_timezone` VALUES ('340', 'Australia/Yancowinna');
INSERT INTO `presshop_timezone` VALUES ('341', 'Europe/Amsterdam');
INSERT INTO `presshop_timezone` VALUES ('342', 'Europe/Andorra');
INSERT INTO `presshop_timezone` VALUES ('343', 'Europe/Athens');
INSERT INTO `presshop_timezone` VALUES ('344', 'Europe/Belfast');
INSERT INTO `presshop_timezone` VALUES ('345', 'Europe/Belgrade');
INSERT INTO `presshop_timezone` VALUES ('346', 'Europe/Berlin');
INSERT INTO `presshop_timezone` VALUES ('347', 'Europe/Bratislava');
INSERT INTO `presshop_timezone` VALUES ('348', 'Europe/Brussels');
INSERT INTO `presshop_timezone` VALUES ('349', 'Europe/Bucharest');
INSERT INTO `presshop_timezone` VALUES ('350', 'Europe/Budapest');
INSERT INTO `presshop_timezone` VALUES ('351', 'Europe/Chisinau');
INSERT INTO `presshop_timezone` VALUES ('352', 'Europe/Copenhagen');
INSERT INTO `presshop_timezone` VALUES ('353', 'Europe/Dublin');
INSERT INTO `presshop_timezone` VALUES ('354', 'Europe/Gibraltar');
INSERT INTO `presshop_timezone` VALUES ('355', 'Europe/Guernsey');
INSERT INTO `presshop_timezone` VALUES ('356', 'Europe/Helsinki');
INSERT INTO `presshop_timezone` VALUES ('357', 'Europe/Isle_of_Man');
INSERT INTO `presshop_timezone` VALUES ('358', 'Europe/Istanbul');
INSERT INTO `presshop_timezone` VALUES ('359', 'Europe/Jersey');
INSERT INTO `presshop_timezone` VALUES ('360', 'Europe/Kaliningrad');
INSERT INTO `presshop_timezone` VALUES ('361', 'Europe/Kiev');
INSERT INTO `presshop_timezone` VALUES ('362', 'Europe/Lisbon');
INSERT INTO `presshop_timezone` VALUES ('363', 'Europe/Ljubljana');
INSERT INTO `presshop_timezone` VALUES ('364', 'Europe/London');
INSERT INTO `presshop_timezone` VALUES ('365', 'Europe/Luxembourg');
INSERT INTO `presshop_timezone` VALUES ('366', 'Europe/Madrid');
INSERT INTO `presshop_timezone` VALUES ('367', 'Europe/Malta');
INSERT INTO `presshop_timezone` VALUES ('368', 'Europe/Mariehamn');
INSERT INTO `presshop_timezone` VALUES ('369', 'Europe/Minsk');
INSERT INTO `presshop_timezone` VALUES ('370', 'Europe/Monaco');
INSERT INTO `presshop_timezone` VALUES ('371', 'Europe/Moscow');
INSERT INTO `presshop_timezone` VALUES ('372', 'Europe/Nicosia');
INSERT INTO `presshop_timezone` VALUES ('373', 'Europe/Oslo');
INSERT INTO `presshop_timezone` VALUES ('374', 'Europe/Paris');
INSERT INTO `presshop_timezone` VALUES ('375', 'Europe/Podgorica');
INSERT INTO `presshop_timezone` VALUES ('376', 'Europe/Prague');
INSERT INTO `presshop_timezone` VALUES ('377', 'Europe/Riga');
INSERT INTO `presshop_timezone` VALUES ('378', 'Europe/Rome');
INSERT INTO `presshop_timezone` VALUES ('379', 'Europe/Samara');
INSERT INTO `presshop_timezone` VALUES ('380', 'Europe/San_Marino');
INSERT INTO `presshop_timezone` VALUES ('381', 'Europe/Sarajevo');
INSERT INTO `presshop_timezone` VALUES ('382', 'Europe/Simferopol');
INSERT INTO `presshop_timezone` VALUES ('383', 'Europe/Skopje');
INSERT INTO `presshop_timezone` VALUES ('384', 'Europe/Sofia');
INSERT INTO `presshop_timezone` VALUES ('385', 'Europe/Stockholm');
INSERT INTO `presshop_timezone` VALUES ('386', 'Europe/Tallinn');
INSERT INTO `presshop_timezone` VALUES ('387', 'Europe/Tirane');
INSERT INTO `presshop_timezone` VALUES ('388', 'Europe/Tiraspol');
INSERT INTO `presshop_timezone` VALUES ('389', 'Europe/Uzhgorod');
INSERT INTO `presshop_timezone` VALUES ('390', 'Europe/Vaduz');
INSERT INTO `presshop_timezone` VALUES ('391', 'Europe/Vatican');
INSERT INTO `presshop_timezone` VALUES ('392', 'Europe/Vienna');
INSERT INTO `presshop_timezone` VALUES ('393', 'Europe/Vilnius');
INSERT INTO `presshop_timezone` VALUES ('394', 'Europe/Volgograd');
INSERT INTO `presshop_timezone` VALUES ('395', 'Europe/Warsaw');
INSERT INTO `presshop_timezone` VALUES ('396', 'Europe/Zagreb');
INSERT INTO `presshop_timezone` VALUES ('397', 'Europe/Zaporozhye');
INSERT INTO `presshop_timezone` VALUES ('398', 'Europe/Zurich');
INSERT INTO `presshop_timezone` VALUES ('399', 'Indian/Antananarivo');
INSERT INTO `presshop_timezone` VALUES ('400', 'Indian/Chagos');
INSERT INTO `presshop_timezone` VALUES ('401', 'Indian/Christmas');
INSERT INTO `presshop_timezone` VALUES ('402', 'Indian/Cocos');
INSERT INTO `presshop_timezone` VALUES ('403', 'Indian/Comoro');
INSERT INTO `presshop_timezone` VALUES ('404', 'Indian/Kerguelen');
INSERT INTO `presshop_timezone` VALUES ('405', 'Indian/Mahe');
INSERT INTO `presshop_timezone` VALUES ('406', 'Indian/Maldives');
INSERT INTO `presshop_timezone` VALUES ('407', 'Indian/Mauritius');
INSERT INTO `presshop_timezone` VALUES ('408', 'Indian/Mayotte');
INSERT INTO `presshop_timezone` VALUES ('409', 'Indian/Reunion');
INSERT INTO `presshop_timezone` VALUES ('410', 'Pacific/Apia');
INSERT INTO `presshop_timezone` VALUES ('411', 'Pacific/Auckland');
INSERT INTO `presshop_timezone` VALUES ('412', 'Pacific/Chatham');
INSERT INTO `presshop_timezone` VALUES ('413', 'Pacific/Easter');
INSERT INTO `presshop_timezone` VALUES ('414', 'Pacific/Efate');
INSERT INTO `presshop_timezone` VALUES ('415', 'Pacific/Enderbury');
INSERT INTO `presshop_timezone` VALUES ('416', 'Pacific/Fakaofo');
INSERT INTO `presshop_timezone` VALUES ('417', 'Pacific/Fiji');
INSERT INTO `presshop_timezone` VALUES ('418', 'Pacific/Funafuti');
INSERT INTO `presshop_timezone` VALUES ('419', 'Pacific/Galapagos');
INSERT INTO `presshop_timezone` VALUES ('420', 'Pacific/Gambier');
INSERT INTO `presshop_timezone` VALUES ('421', 'Pacific/Guadalcanal');
INSERT INTO `presshop_timezone` VALUES ('422', 'Pacific/Guam');
INSERT INTO `presshop_timezone` VALUES ('423', 'Pacific/Honolulu');
INSERT INTO `presshop_timezone` VALUES ('424', 'Pacific/Johnston');
INSERT INTO `presshop_timezone` VALUES ('425', 'Pacific/Kiritimati');
INSERT INTO `presshop_timezone` VALUES ('426', 'Pacific/Kosrae');
INSERT INTO `presshop_timezone` VALUES ('427', 'Pacific/Kwajalein');
INSERT INTO `presshop_timezone` VALUES ('428', 'Pacific/Majuro');
INSERT INTO `presshop_timezone` VALUES ('429', 'Pacific/Marquesas');
INSERT INTO `presshop_timezone` VALUES ('430', 'Pacific/Midway');
INSERT INTO `presshop_timezone` VALUES ('431', 'Pacific/Nauru');
INSERT INTO `presshop_timezone` VALUES ('432', 'Pacific/Niue');
INSERT INTO `presshop_timezone` VALUES ('433', 'Pacific/Norfolk');
INSERT INTO `presshop_timezone` VALUES ('434', 'Pacific/Noumea');
INSERT INTO `presshop_timezone` VALUES ('435', 'Pacific/Pago_Pago');
INSERT INTO `presshop_timezone` VALUES ('436', 'Pacific/Palau');
INSERT INTO `presshop_timezone` VALUES ('437', 'Pacific/Pitcairn');
INSERT INTO `presshop_timezone` VALUES ('438', 'Pacific/Ponape');
INSERT INTO `presshop_timezone` VALUES ('439', 'Pacific/Port_Moresby');
INSERT INTO `presshop_timezone` VALUES ('440', 'Pacific/Rarotonga');
INSERT INTO `presshop_timezone` VALUES ('441', 'Pacific/Saipan');
INSERT INTO `presshop_timezone` VALUES ('442', 'Pacific/Samoa');
INSERT INTO `presshop_timezone` VALUES ('443', 'Pacific/Tahiti');
INSERT INTO `presshop_timezone` VALUES ('444', 'Pacific/Tarawa');
INSERT INTO `presshop_timezone` VALUES ('445', 'Pacific/Tongatapu');
INSERT INTO `presshop_timezone` VALUES ('446', 'Pacific/Truk');
INSERT INTO `presshop_timezone` VALUES ('447', 'Pacific/Wake');
INSERT INTO `presshop_timezone` VALUES ('448', 'Pacific/Wallis');
INSERT INTO `presshop_timezone` VALUES ('449', 'Pacific/Yap');
INSERT INTO `presshop_timezone` VALUES ('450', 'Brazil/Acre');
INSERT INTO `presshop_timezone` VALUES ('451', 'Brazil/DeNoronha');
INSERT INTO `presshop_timezone` VALUES ('452', 'Brazil/East');
INSERT INTO `presshop_timezone` VALUES ('453', 'Brazil/West');
INSERT INTO `presshop_timezone` VALUES ('454', 'Canada/Atlantic');
INSERT INTO `presshop_timezone` VALUES ('455', 'Canada/Central');
INSERT INTO `presshop_timezone` VALUES ('456', 'Canada/East-Saskatchewan');
INSERT INTO `presshop_timezone` VALUES ('457', 'Canada/Eastern');
INSERT INTO `presshop_timezone` VALUES ('458', 'Canada/Mountain');
INSERT INTO `presshop_timezone` VALUES ('459', 'Canada/Newfoundland');
INSERT INTO `presshop_timezone` VALUES ('460', 'Canada/Pacific');
INSERT INTO `presshop_timezone` VALUES ('461', 'Canada/Saskatchewan');
INSERT INTO `presshop_timezone` VALUES ('462', 'Canada/Yukon');
INSERT INTO `presshop_timezone` VALUES ('463', 'CET');
INSERT INTO `presshop_timezone` VALUES ('464', 'Chile/Continental');
INSERT INTO `presshop_timezone` VALUES ('465', 'Chile/EasterIsland');
INSERT INTO `presshop_timezone` VALUES ('466', 'CST6CDT');
INSERT INTO `presshop_timezone` VALUES ('467', 'Cuba');
INSERT INTO `presshop_timezone` VALUES ('468', 'EET');
INSERT INTO `presshop_timezone` VALUES ('469', 'Egypt');
INSERT INTO `presshop_timezone` VALUES ('470', 'Eire');
INSERT INTO `presshop_timezone` VALUES ('471', 'EST');
INSERT INTO `presshop_timezone` VALUES ('472', 'EST5EDT');
INSERT INTO `presshop_timezone` VALUES ('473', 'Etc/GMT');
INSERT INTO `presshop_timezone` VALUES ('474', 'Etc/GMT+0');
INSERT INTO `presshop_timezone` VALUES ('475', 'Etc/GMT+1');
INSERT INTO `presshop_timezone` VALUES ('476', 'Etc/GMT+10');
INSERT INTO `presshop_timezone` VALUES ('477', 'Etc/GMT+11');
INSERT INTO `presshop_timezone` VALUES ('478', 'Etc/GMT+12');
INSERT INTO `presshop_timezone` VALUES ('479', 'Etc/GMT+2');
INSERT INTO `presshop_timezone` VALUES ('480', 'Etc/GMT+3');
INSERT INTO `presshop_timezone` VALUES ('481', 'Etc/GMT+4');
INSERT INTO `presshop_timezone` VALUES ('482', 'Etc/GMT+5');
INSERT INTO `presshop_timezone` VALUES ('483', 'Etc/GMT+6');
INSERT INTO `presshop_timezone` VALUES ('484', 'Etc/GMT+7');
INSERT INTO `presshop_timezone` VALUES ('485', 'Etc/GMT+8');
INSERT INTO `presshop_timezone` VALUES ('486', 'Etc/GMT+9');
INSERT INTO `presshop_timezone` VALUES ('487', 'Etc/GMT-0');
INSERT INTO `presshop_timezone` VALUES ('488', 'Etc/GMT-1');
INSERT INTO `presshop_timezone` VALUES ('489', 'Etc/GMT-10');
INSERT INTO `presshop_timezone` VALUES ('490', 'Etc/GMT-11');
INSERT INTO `presshop_timezone` VALUES ('491', 'Etc/GMT-12');
INSERT INTO `presshop_timezone` VALUES ('492', 'Etc/GMT-13');
INSERT INTO `presshop_timezone` VALUES ('493', 'Etc/GMT-14');
INSERT INTO `presshop_timezone` VALUES ('494', 'Etc/GMT-2');
INSERT INTO `presshop_timezone` VALUES ('495', 'Etc/GMT-3');
INSERT INTO `presshop_timezone` VALUES ('496', 'Etc/GMT-4');
INSERT INTO `presshop_timezone` VALUES ('497', 'Etc/GMT-5');
INSERT INTO `presshop_timezone` VALUES ('498', 'Etc/GMT-6');
INSERT INTO `presshop_timezone` VALUES ('499', 'Etc/GMT-7');
INSERT INTO `presshop_timezone` VALUES ('500', 'Etc/GMT-8');
INSERT INTO `presshop_timezone` VALUES ('501', 'Etc/GMT-9');
INSERT INTO `presshop_timezone` VALUES ('502', 'Etc/GMT0');
INSERT INTO `presshop_timezone` VALUES ('503', 'Etc/Greenwich');
INSERT INTO `presshop_timezone` VALUES ('504', 'Etc/UCT');
INSERT INTO `presshop_timezone` VALUES ('505', 'Etc/Universal');
INSERT INTO `presshop_timezone` VALUES ('506', 'Etc/UTC');
INSERT INTO `presshop_timezone` VALUES ('507', 'Etc/Zulu');
INSERT INTO `presshop_timezone` VALUES ('508', 'Factory');
INSERT INTO `presshop_timezone` VALUES ('509', 'GB');
INSERT INTO `presshop_timezone` VALUES ('510', 'GB-Eire');
INSERT INTO `presshop_timezone` VALUES ('511', 'GMT');
INSERT INTO `presshop_timezone` VALUES ('512', 'GMT+0');
INSERT INTO `presshop_timezone` VALUES ('513', 'GMT-0');
INSERT INTO `presshop_timezone` VALUES ('514', 'GMT0');
INSERT INTO `presshop_timezone` VALUES ('515', 'Greenwich');
INSERT INTO `presshop_timezone` VALUES ('516', 'Hongkong');
INSERT INTO `presshop_timezone` VALUES ('517', 'HST');
INSERT INTO `presshop_timezone` VALUES ('518', 'Iceland');
INSERT INTO `presshop_timezone` VALUES ('519', 'Iran');
INSERT INTO `presshop_timezone` VALUES ('520', 'Israel');
INSERT INTO `presshop_timezone` VALUES ('521', 'Jamaica');
INSERT INTO `presshop_timezone` VALUES ('522', 'Japan');
INSERT INTO `presshop_timezone` VALUES ('523', 'Kwajalein');
INSERT INTO `presshop_timezone` VALUES ('524', 'Libya');
INSERT INTO `presshop_timezone` VALUES ('525', 'MET');
INSERT INTO `presshop_timezone` VALUES ('526', 'Mexico/BajaNorte');
INSERT INTO `presshop_timezone` VALUES ('527', 'Mexico/BajaSur');
INSERT INTO `presshop_timezone` VALUES ('528', 'Mexico/General');
INSERT INTO `presshop_timezone` VALUES ('529', 'MST');
INSERT INTO `presshop_timezone` VALUES ('530', 'MST7MDT');
INSERT INTO `presshop_timezone` VALUES ('531', 'Navajo');
INSERT INTO `presshop_timezone` VALUES ('532', 'NZ');
INSERT INTO `presshop_timezone` VALUES ('533', 'NZ-CHAT');
INSERT INTO `presshop_timezone` VALUES ('534', 'Poland');
INSERT INTO `presshop_timezone` VALUES ('535', 'Portugal');
INSERT INTO `presshop_timezone` VALUES ('536', 'PRC');
INSERT INTO `presshop_timezone` VALUES ('537', 'PST8PDT');
INSERT INTO `presshop_timezone` VALUES ('538', 'ROC');
INSERT INTO `presshop_timezone` VALUES ('539', 'ROK');
INSERT INTO `presshop_timezone` VALUES ('540', 'Singapore');
INSERT INTO `presshop_timezone` VALUES ('541', 'Turkey');
INSERT INTO `presshop_timezone` VALUES ('542', 'UCT');
INSERT INTO `presshop_timezone` VALUES ('543', 'Universal');
INSERT INTO `presshop_timezone` VALUES ('544', 'US/Alaska');
INSERT INTO `presshop_timezone` VALUES ('545', 'US/Aleutian');
INSERT INTO `presshop_timezone` VALUES ('546', 'US/Arizona');
INSERT INTO `presshop_timezone` VALUES ('547', 'US/Central');
INSERT INTO `presshop_timezone` VALUES ('548', 'US/East-Indiana');
INSERT INTO `presshop_timezone` VALUES ('549', 'US/Eastern');
INSERT INTO `presshop_timezone` VALUES ('550', 'US/Hawaii');
INSERT INTO `presshop_timezone` VALUES ('551', 'US/Indiana-Starke');
INSERT INTO `presshop_timezone` VALUES ('552', 'US/Michigan');
INSERT INTO `presshop_timezone` VALUES ('553', 'US/Mountain');
INSERT INTO `presshop_timezone` VALUES ('554', 'US/Pacific');
INSERT INTO `presshop_timezone` VALUES ('555', 'US/Pacific-New');
INSERT INTO `presshop_timezone` VALUES ('556', 'US/Samoa');
INSERT INTO `presshop_timezone` VALUES ('557', 'UTC');
INSERT INTO `presshop_timezone` VALUES ('558', 'W-SU');
INSERT INTO `presshop_timezone` VALUES ('559', 'WET');
INSERT INTO `presshop_timezone` VALUES ('560', 'Zulu');

-- ----------------------------
-- Table structure for `presshop_web_browser`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_web_browser`;
CREATE TABLE `presshop_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_web_browser
-- ----------------------------
INSERT INTO `presshop_web_browser` VALUES ('1', 'Safari');
INSERT INTO `presshop_web_browser` VALUES ('2', 'Firefox 2.x');
INSERT INTO `presshop_web_browser` VALUES ('3', 'Firefox 3.x');
INSERT INTO `presshop_web_browser` VALUES ('4', 'Opera');
INSERT INTO `presshop_web_browser` VALUES ('5', 'IE 6.x');
INSERT INTO `presshop_web_browser` VALUES ('6', 'IE 7.x');
INSERT INTO `presshop_web_browser` VALUES ('7', 'IE 8.x');
INSERT INTO `presshop_web_browser` VALUES ('8', 'Google Chrome');

-- ----------------------------
-- Table structure for `presshop_zone`
-- ----------------------------
DROP TABLE IF EXISTS `presshop_zone`;
CREATE TABLE `presshop_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of presshop_zone
-- ----------------------------
INSERT INTO `presshop_zone` VALUES ('1', 'Europe', '1', '1');
INSERT INTO `presshop_zone` VALUES ('2', 'US', '1', '1');
INSERT INTO `presshop_zone` VALUES ('3', 'Asia', '1', '1');
INSERT INTO `presshop_zone` VALUES ('4', 'Africa', '1', '1');
INSERT INTO `presshop_zone` VALUES ('5', 'Oceania', '1', '1');

-- ----------------------------
-- Table structure for `private_access`
-- ----------------------------
DROP TABLE IF EXISTS `private_access`;
CREATE TABLE `private_access` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`type`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of private_access
-- ----------------------------

-- ----------------------------
-- Table structure for `profiles`
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `joined` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `last_visit` bigint(20) unsigned NOT NULL,
  `last_click` bigint(20) unsigned NOT NULL,
  `country` int(10) unsigned NOT NULL,
  `city` varchar(250) NOT NULL,
  `hometown` varchar(250) NOT NULL,
  `zip` varchar(250) NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `birthdate` bigint(20) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `avatar_approved` enum('0','1') NOT NULL DEFAULT '0',
  `website` varchar(250) NOT NULL,
  `about_me` text NOT NULL,
  `d_status` tinyint(4) NOT NULL,
  `occupations` varchar(250) NOT NULL,
  `companies` varchar(250) NOT NULL,
  `schools` varchar(250) NOT NULL,
  `interests` text NOT NULL,
  `movies` text NOT NULL,
  `music` text NOT NULL,
  `books` text NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES ('100000', '1277174436', '1277174690', '1277346762', '1277347137', '90', 'Ha Noi', '', '', '1', '416250059', '', '0', '', '', '0', '', '', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for `rates`
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `amount` varchar(255) NOT NULL,
  `term` bigint(255) NOT NULL,
  `term_c` varchar(1) NOT NULL,
  `automatic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rates
-- ----------------------------
INSERT INTO `rates` VALUES ('1', '2', 'Weekly', 'Weekly access to protected areas', '0.99', '1', 'W', '1');
INSERT INTO `rates` VALUES ('2', '3', 'Monthly', 'Monthly access to protected areas', '1.99', '1', 'M', '1');
INSERT INTO `rates` VALUES ('3', '2', 'Yearly', 'Yearly access to protected areas', '10.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('4', '3', 'Full', 'Unlimited access to protected areas', '19.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('10', '5', 'monthly', 'monthly gold', '50', '30', 'D', '1');
INSERT INTO `rates` VALUES ('11', '4', 'year', 'year bronzes', '500', '1', 'Y', '1');

-- ----------------------------
-- Table structure for `reports`
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `rep_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `report` enum('spam','mature','mis-categorized','copyright') NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `special` varchar(250) NOT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reports
-- ----------------------------

-- ----------------------------
-- Table structure for `sessiondata`
-- ----------------------------
DROP TABLE IF EXISTS `sessiondata`;
CREATE TABLE `sessiondata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `saved` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessiondata
-- ----------------------------
INSERT INTO `sessiondata` VALUES ('1', '100000', 'a%3A17%3A%7Bs%3A11%3A%22response_to%22%3Bs%3A0%3A%22%22%3Bs%3A5%3A%22title%22%3Bs%3A3%3A%22abc%22%3Bs%3A11%3A%22description%22%3Bs%3A4%3A%22xxxx%22%3Bs%3A8%3A%22category%22%3Bs%3A2%3A%2215%22%3Bs%3A4%3A%22tags%22%3Bs%3A4%3A%22aaaa%22%3Bs%3A4%3A%22date%22%3Bi%3A1230742859%3Bs%3A8%3A%22location%22%3Bs%3A2%3A%22ad%22%3Bs%3A7%3A%22country%22%3Bs%3A3%3A%22223%22%3Bs%3A9%3A%22broadcast%22%3Bs%3A1%3A%220%22%3Bs%3A8%3A%22comments%22%3Bs%3A1%3A%221%22%3Bs%3A14%3A%22comment_voting%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22responses%22%3Bs%3A1%3A%221%22%3Bs%3A7%3A%22ratings%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22embedding%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22err_page%22%3Bs%3A6%3A%22videos%22%3Bs%3A11%3A%22err_section%22%3Bs%3A14%3A%22upload_general%22%3Bs%3A6%3A%22source%22%3Bs%3A6%3A%22upload%22%3B%7D', '1277174767');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `site_name` varchar(100) NOT NULL,
  `site_slogan` varchar(100) NOT NULL,
  `site_url` varchar(100) NOT NULL,
  `keywords` text NOT NULL,
  `desc` text NOT NULL,
  `site_email` varchar(100) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `sandbox` tinyint(1) NOT NULL,
  `reg_verify` tinyint(1) NOT NULL DEFAULT '0',
  `reg_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `user_limit` varchar(5) NOT NULL DEFAULT '0',
  `currency` varchar(3) NOT NULL,
  `cur_symbol` varchar(5) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `version` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('Confor.ca', 'Video conference', 'http://conferences-formations.com/pay', 'site keywords,separated,by,coma', 'Meta Description', 'info@confor.ca', 'tham212001@yahoo.com', '0', '1', '1', '0', 'USD', '$', '1', 'v.1.0');

-- ----------------------------
-- Table structure for `social_bookmarking_engines`
-- ----------------------------
DROP TABLE IF EXISTS `social_bookmarking_engines`;
CREATE TABLE `social_bookmarking_engines` (
  `eng_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`eng_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_bookmarking_engines
-- ----------------------------
INSERT INTO `social_bookmarking_engines` VALUES ('1', 'Favorites', 'sbAddtoFavorites(\'|link|\',\'|title|\')', 'star.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('2', 'Del.icio.us', 'http://del.icio.us/post?url=|link|;title=|title|', 'delicious.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('3', 'Digg', 'http://digg.com/submit?phase=2&url=|link|&title=|title|', 'digg.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('4', 'Furl', 'http://www.furl.net/storeIt.jsp?u=|link|&t=|title|', 'furl.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('5', 'Magnolia', 'http://ma.gnolia.com/bookmarklet/add?url=|link|&title=|title|', 'magnolia.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('6', 'StumbleUpon', 'http://www.stumbleupon.com/submit?url=|link|&title=|title|', 'stumbleupon.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('7', 'Google', 'http://www.google.com/bookmarks/mark?op=edit&bkmk=|link|&title=|title|', 'google.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('8', 'Yahoo', 'http://myweb2.search.yahoo.com/myresults/bookmarklet?t=|title|&u=|link|', 'yahoo.png', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('9', 'Technorati', 'http://technorati.com/faves?add=|link|', 'technorati.gif', '1');
INSERT INTO `social_bookmarking_engines` VALUES ('10', 'BlinkList', 'http://www.blinklist.com/index.php?Action=Blink/addblink.php&Url=|link|&Title=|title|', 'blinklist.png', '1');

-- ----------------------------
-- Table structure for `subscriptions`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` enum('channel','playlist') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_id` (`sub_id`,`mem_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `tags_cache`
-- ----------------------------
DROP TABLE IF EXISTS `tags_cache`;
CREATE TABLE `tags_cache` (
  `type` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `weight` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags_cache
-- ----------------------------
INSERT INTO `tags_cache` VALUES ('videos', '', '', '1277346183');

-- ----------------------------
-- Table structure for `tblaccessories`
-- ----------------------------
DROP TABLE IF EXISTS `tblaccessories`;
CREATE TABLE `tblaccessories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ElementName` varchar(50) DEFAULT NULL,
  `ElementContent` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblaccessories
-- ----------------------------
INSERT INTO `tblaccessories` VALUES ('1', 'About', '<p>Hello Confor.ca</p>');
INSERT INTO `tblaccessories` VALUES ('2', 'How', null);
INSERT INTO `tblaccessories` VALUES ('3', 'Rules', '<p>test the rules</p>');
INSERT INTO `tblaccessories` VALUES ('4', 'Training', '<p>test training</p>');
INSERT INTO `tblaccessories` VALUES ('5', 'Office', '<p><span style=\"font-size: small\"><span style=\"font-family: Arial\"><a href=\"http://conferences-formations.com/index.php/blog/blog_content_admin/admin/Conf&eacute;rence%20du%20Commandant%20Pich&eacute;\"><font size=\"5\">Commandant Robert Pich&eacute;</font><font size=\"2\"> </font></a></span></span></p>\n<p><span style=\"font-size: small\"><span style=\"font-family: Arial\">Quand l\'impossible devient r&eacute;alit&eacute;!</span> </span></p>\n<p>&nbsp;</p>\n<p><font size=\"5\"><a href=\"http://conferences-formations.com/index.php/blog/blog_content_admin/admin/Conf&eacute;rence%20George%20Wright#\">George Wright</a></font></p>\n<p><span style=\"font-size: small\"><span style=\"font-family: Arial\">La communication en milieu de travail...</span></span></p>\n<p>&nbsp;</p>');

-- ----------------------------
-- Table structure for `tbladmin`
-- ----------------------------
DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE `tbladmin` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PayPalAccount` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Right` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbladmin
-- ----------------------------
INSERT INTO `tbladmin` VALUES ('9', 'Quyet', 'Dao Van', 'daovanquyet@xemmex.net', 'daovanquyet@paypal.com', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tbladmin` VALUES ('8', 'admin', 'site admin', 'admin@confor.ca', 'admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `tbladmin` VALUES ('10', 'normal_admin', 'normal_admin', 'normal_admin@confor.ca', 'normal_admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '0');

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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbladvertisement
-- ----------------------------

-- ----------------------------
-- Table structure for `tblblog`
-- ----------------------------
DROP TABLE IF EXISTS `tblblog`;
CREATE TABLE `tblblog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Author` int(50) NOT NULL,
  `About` text NOT NULL,
  `Title` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Subject` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Keywords` varchar(200) CHARACTER SET latin1 NOT NULL,
  `Text` text CHARACTER SET latin1 NOT NULL,
  `Link` varchar(200) CHARACTER SET latin1 NOT NULL,
  `CountView` int(11) unsigned DEFAULT NULL,
  `CountComment` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblblog_tbladmin` (`Author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblblog
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcategory`
-- ----------------------------
DROP TABLE IF EXISTS `tblcategory`;
CREATE TABLE `tblcategory` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblcategory
-- ----------------------------
INSERT INTO `tblcategory` VALUES ('1', 'Coaching');
INSERT INTO `tblcategory` VALUES ('2', 'Famille');
INSERT INTO `tblcategory` VALUES ('3', 'Leadership');
INSERT INTO `tblcategory` VALUES ('4', 'Management');
INSERT INTO `tblcategory` VALUES ('5', 'Psychologie');
INSERT INTO `tblcategory` VALUES ('6', 'Sens de la vie');
INSERT INTO `tblcategory` VALUES ('8', 'Peur en avion');
INSERT INTO `tblcategory` VALUES ('9', 'Santé');
INSERT INTO `tblcategory` VALUES ('10', 'Communication');

-- ----------------------------
-- Table structure for `tblcomment`
-- ----------------------------
DROP TABLE IF EXISTS `tblcomment`;
CREATE TABLE `tblcomment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Comment` text NOT NULL,
  `Blog` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Website` varchar(200) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblcomment_tblblog` (`Blog`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `tblevent`
-- ----------------------------
DROP TABLE IF EXISTS `tblevent`;
CREATE TABLE `tblevent` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Speaker` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblevent
-- ----------------------------

-- ----------------------------
-- Table structure for `tblfeedback`
-- ----------------------------
DROP TABLE IF EXISTS `tblfeedback`;
CREATE TABLE `tblfeedback` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Date` text NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Message` text NOT NULL,
  `Ticket` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblfeedback_tbladmin` (`Admin`),
  KEY `FK_tblfeedback_tblticket` (`Ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblfeedback
-- ----------------------------

-- ----------------------------
-- Table structure for `tblremember_me`
-- ----------------------------
DROP TABLE IF EXISTS `tblremember_me`;
CREATE TABLE `tblremember_me` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `usernamehash` varchar(128) DEFAULT NULL,
  `random_string` varchar(128) DEFAULT NULL,
  `origin_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblremember_me
-- ----------------------------

-- ----------------------------
-- Table structure for `tblshowroom`
-- ----------------------------
DROP TABLE IF EXISTS `tblshowroom`;
CREATE TABLE `tblshowroom` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Video` int(11) NOT NULL,
  `SpeakerImages` varchar(50) NOT NULL,
  `Show` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblShowroom_Videos` (`Video`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblshowroom
-- ----------------------------

-- ----------------------------
-- Table structure for `tblticket`
-- ----------------------------
DROP TABLE IF EXISTS `tblticket`;
CREATE TABLE `tblticket` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Message` text NOT NULL,
  `Speaker` int(11) DEFAULT NULL,
  `Is_answered` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblticket_users` (`Speaker`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblticket
-- ----------------------------

-- ----------------------------
-- Table structure for `tips`
-- ----------------------------
DROP TABLE IF EXISTS `tips`;
CREATE TABLE `tips` (
  `page` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tips
-- ----------------------------
INSERT INTO `tips` VALUES ('join_verification', 'You may receive your verification email to your junk mailbox.', 'default');
INSERT INTO `tips` VALUES ('upgrade', 'Upgrade your account to get full access to all categories and videos on this site!', 'default');
INSERT INTO `tips` VALUES ('videos_upload', 'Do not upload any TV shows, music videos, music concerts, or commercials without permission unless they consist entirely of content you created yourself.', 'default');
INSERT INTO `tips` VALUES ('videos_upload_complete', 'It may take up to several minutes before your video will be converted and published.', 'default');
INSERT INTO `tips` VALUES ('videos_upload_general', 'Uploads usually take 1-5 minutes per MB on a high-speed connection, and converting your video takes a few minutes.<br /><br /><strong>Your video is limited to ;module;videos;maxtime; minutes and ;module;videos;maxsize; MB.</strong>', 'default');
INSERT INTO `tips` VALUES ('', '', 'default');

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
  `tempPassword` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'admin', 'y@gmail.com', 'Webmaster', null, null, '1', 'e10adc3949ba59abbe56e057f20f883e', '83c8993d270d8e73844a218480ade6db', '0', '2010-03-03 15:08:38', '210.245.54.82', '0000-00-00 00:00:00', '1', '1', '9', 'en', null, 'pigN5mkKmYioxkxhUiaJ');
INSERT INTO `users` VALUES ('2', '3', 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '90', 'e10adc3949ba59abbe56e057f20f883e', 'b3ef805e9bfcaf5b956594ad4e741a1b', '0', '2010-06-23 14:06:30', '118.69.214.193', '0000-00-00 00:00:00', '0', '1', '1', 'en', '', null);
INSERT INTO `users` VALUES ('3', '1', 'zun3000', 'zun3000@gmail.com', 'meozzz', 'meo', 'XEMMEX', '121', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no info', null);
INSERT INTO `users` VALUES ('4', '1', 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', 'e712a7d0d43c943295ad1a6a082f57c4', '0', '0000-00-00 00:00:00', '183.81.36.107', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'abc e', null);
INSERT INTO `users` VALUES ('5', '1', 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'af', null);
INSERT INTO `users` VALUES ('28', '1', 'thecuong', 'cuongdt90@gmail.com', 'the cuong', 'dang', 'aprotrain-aptech', '90', 'e10adc3949ba59abbe56e057f20f883e', 'eec65034cf8cb571984853c1031ec74c', '0', '0000-00-00 00:00:00', '210.245.54.82', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no infos', null);
INSERT INTO `users` VALUES ('31', '1', 'xemmex', 'michael.webber@xemmex.com', 'May Webber', 'Michael', 'XemmeX', '224', 'fd2a748726310daee26ba75690a5ef8e', '42f8f3a1965af1ce3cd094c842db6b68', '0', '0000-00-00 00:00:00', '24.203.116.87', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'ABC', null);
INSERT INTO `users` VALUES ('32', '1', 'robertpiche', 'rene@confor.ca', 'Piché', 'Robert', 'Confor', '224', '925d51c5a276dc14d7eacf989682609f', '17c0c70e18de1cdcaa16f8e9a401bd77', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Le Commandant Robert Piché va vous expliquer c\'est quoi de la turbulence.', null);
INSERT INTO `users` VALUES ('33', '1', 'georgewright', 'rene@groupe-ace.com', 'Wright', 'George', 'Groupe Confor', '224', '925d51c5a276dc14d7eacf989682609f', '0', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Conférencier, formateur, expert pour la peur en avion', null);
INSERT INTO `users` VALUES ('34', '1', 'linebolduc', 'info@confor.ca', 'Bolduc', 'Line', 'Groupe Confor', '224', '925d51c5a276dc14d7eacf989682609f', '0', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Conférencière, formatrice et auteure', null);

-- ----------------------------
-- Table structure for `users_copy`
-- ----------------------------
DROP TABLE IF EXISTS `users_copy`;
CREATE TABLE `users_copy` (
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
-- Records of users_copy
-- ----------------------------
INSERT INTO `users_copy` VALUES ('1', '1', 'admin', 'yugi3000@gmail.com', 'Webmaster', null, null, '1', 'fcea920f7412b5da7be0cf42b8c93759', 'd73afbe01cc44f65ab776533f86015a8', '0', '2010-03-03 15:08:38', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '9', 'en', null, '7W1Toep46ypnPAtzsmb1');
INSERT INTO `users_copy` VALUES ('24', '1', 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '1', '21232f297a57a5a743894a0e4a801fc3', 'a45e8a7bb02c385c5ae9046aa4971ace', '0', '2010-06-23 14:06:30', '127.0.0.1', '0000-00-00 00:00:00', '0', '1', '1', 'en', null, null);
INSERT INTO `users_copy` VALUES ('25', '1', 'zun3000', 'zun3000@gmail.com', 'Mz MEO', 'meo', 'XEMMEX', '1', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no info', null);
INSERT INTO `users_copy` VALUES ('26', '1', 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', '09bd6b044f68755b69cee95dd985f9d8', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'abc e', null);
INSERT INTO `users_copy` VALUES ('27', '1', 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'af', null);

-- ----------------------------
-- Table structure for `verification`
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification` (
  `val` char(6) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `inv_id` char(40) NOT NULL,
  UNIQUE KEY `val` (`val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verification
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------

-- ----------------------------
-- Table structure for `video_comments`
-- ----------------------------
DROP TABLE IF EXISTS `video_comments`;
CREATE TABLE `video_comments` (
  `com_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `reply_to` bigint(20) unsigned NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `rating` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`com_id`),
  KEY `vid_id` (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `video_comment_votes`
-- ----------------------------
DROP TABLE IF EXISTS `video_comment_votes`;
CREATE TABLE `video_comment_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `com_id` bigint(20) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_comment_votes
-- ----------------------------

-- ----------------------------
-- Table structure for `video_convert`
-- ----------------------------
DROP TABLE IF EXISTS `video_convert`;
CREATE TABLE `video_convert` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `hash` varchar(100) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `tstamp` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_convert
-- ----------------------------
INSERT INTO `video_convert` VALUES ('100000', '87/0b/c7/870bc725b8e76c7', '.mp4', '1277174807');

-- ----------------------------
-- Table structure for `video_responses`
-- ----------------------------
DROP TABLE IF EXISTS `video_responses`;
CREATE TABLE `video_responses` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `response_to` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `posted` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`response_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_responses
-- ----------------------------

-- ----------------------------
-- Table structure for `video_votes`
-- ----------------------------
DROP TABLE IF EXISTS `video_votes`;
CREATE TABLE `video_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `rate` tinyint(3) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_votes
-- ----------------------------

-- ----------------------------
-- Table structure for `video_watch`
-- ----------------------------
DROP TABLE IF EXISTS `video_watch`;
CREATE TABLE `video_watch` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `expire` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_watch
-- ----------------------------

-- ----------------------------
-- Table structure for `viewkeys`
-- ----------------------------
DROP TABLE IF EXISTS `viewkeys`;
CREATE TABLE `viewkeys` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `viewkey` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `viewkey` (`viewkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewkeys
-- ----------------------------
