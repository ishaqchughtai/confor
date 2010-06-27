-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2010 at 11:05 PM
-- Server version: 5.0.90
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `conferen_conferen`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `action` tinyint(3) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `details` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activity`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_mail`
--

CREATE TABLE IF NOT EXISTS `admin_mail` (
  `mes_id` bigint(20) unsigned NOT NULL auto_increment,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `recipients` text NOT NULL,
  PRIMARY KEY  (`mes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `admin_mail`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_session`
--

CREATE TABLE IF NOT EXISTS `admin_session` (
  `ses_id` varchar(250) NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_session`
--

INSERT INTO `admin_session` (`ses_id`, `started`) VALUES
('77447e4cec4ee666a678f04cc8e768e4', 1277346196);

-- --------------------------------------------------------

--
-- Table structure for table `associations`
--

CREATE TABLE IF NOT EXISTS `associations` (
  `assoc_type` enum('auth','form','menu','task') NOT NULL,
  `page` varchar(50) NOT NULL,
  `association` varchar(50) NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `assoc_type` (`assoc_type`,`page`,`association`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `associations`
--

INSERT INTO `associations` (`assoc_type`, `page`, `association`, `theme`) VALUES
('auth', 'account', 'auth_member', 'default'),
('auth', 'billing', 'auth_member', 'default'),
('auth', 'channels', 'auth_member', 'default'),
('auth', 'channels_browse', 'auth_member', 'default'),
('auth', 'channels_edit_design', 'auth_member', 'default'),
('auth', 'channels_edit_favorites', 'auth_member', 'default'),
('auth', 'channels_edit_info', 'auth_member', 'default'),
('auth', 'channels_edit_videos', 'auth_member', 'default'),
('auth', 'channels_share_win', 'auth_member', 'default'),
('auth', 'delete', 'auth_member', 'default'),
('auth', 'favorites', 'auth_member', 'default'),
('auth', 'friends', 'auth_member', 'default'),
('auth', 'friends_favorites', 'auth_member', 'default'),
('auth', 'friends_invitations', 'auth_member', 'default'),
('auth', 'friends_invite', 'auth_member', 'default'),
('auth', 'friends_invite_report', 'auth_member', 'default'),
('auth', 'friends_videos', 'auth_member', 'default'),
('auth', 'groups', 'auth_group_access', 'default'),
('auth', 'groups', 'auth_member', 'default'),
('auth', 'groups_add_videos', 'auth_group_action_access', 'default'),
('auth', 'groups_add_videos', 'auth_member', 'default'),
('auth', 'groups_browse', 'auth_member', 'default'),
('auth', 'groups_create', 'auth_member', 'default'),
('auth', 'groups_discussions', 'auth_group_access', 'default'),
('auth', 'groups_discussions', 'auth_member', 'default'),
('auth', 'groups_edit', 'auth_group_edit_access', 'default'),
('auth', 'groups_edit', 'auth_member', 'default'),
('auth', 'groups_invite', 'auth_group_action_access', 'default'),
('auth', 'groups_invite', 'auth_member', 'default'),
('auth', 'groups_manage', 'auth_member', 'default'),
('auth', 'groups_videos', 'auth_group_access', 'default'),
('auth', 'groups_videos', 'auth_member', 'default'),
('auth', 'groups_view_discussion', 'auth_group_access', 'default'),
('auth', 'groups_view_discussion', 'auth_member', 'default'),
('auth', 'ignores', 'auth_member', 'default'),
('auth', 'join', 'auth_join', 'default'),
('auth', 'join_options', 'auth_member', 'default'),
('auth', 'mailbox', 'auth_member', 'default'),
('auth', 'mailbox_comments', 'auth_member', 'default'),
('auth', 'mailbox_groups', 'auth_member', 'default'),
('auth', 'mailbox_invites', 'auth_member', 'default'),
('auth', 'mailbox_message', 'auth_member', 'default'),
('auth', 'mailbox_responses', 'auth_member', 'default'),
('auth', 'mailbox_sent', 'auth_member', 'default'),
('auth', 'mailbox_shared', 'auth_member', 'default'),
('auth', 'mailbox_view', 'auth_member', 'default'),
('auth', 'mailbox_view', 'auth_view_message', 'default'),
('auth', 'playlists', 'auth_member', 'default'),
('auth', 'playlists_create', 'auth_member', 'default'),
('auth', 'playlists_edit', 'auth_member', 'default'),
('auth', 'playlists_modify', 'auth_member', 'default'),
('auth', 'playlists_modify', 'auth_playlist_edit_access', 'default'),
('auth', 'playlists_share_win', 'auth_member', 'default'),
('auth', 'playlists_view', 'auth_member', 'default'),
('auth', 'playlists_view', 'auth_playlist_access', 'default'),
('auth', 'playlist_edit', 'auth_playlist_edit_access', 'default'),
('auth', 'search', 'auth_member', 'default'),
('auth', 'subscriptions', 'auth_member', 'default'),
('auth', 'upgrade', 'auth_member', 'default'),
('auth', 'videos', 'auth_member', 'default'),
('auth', 'videos_activity', 'auth_member', 'default'),
('auth', 'videos_edit', 'auth_member', 'default'),
('auth', 'videos_edit', 'auth_video_edit_access', 'default'),
('auth', 'videos_manage', 'auth_member', 'default'),
('auth', 'videos_respond', 'auth_member', 'default'),
('auth', 'videos_respond', 'auth_video_access', 'default'),
('auth', 'videos_upload', 'auth_member', 'default'),
('auth', 'videos_upload_complete', 'auth_member', 'default'),
('auth', 'videos_upload_general', 'auth_member', 'default'),
('auth', 'videos_view', 'auth_member', 'default'),
('auth', 'videos_view', 'auth_video_access', 'default'),
('form', 'about', 'search', 'default'),
('form', 'account', 'account_change_email', 'default'),
('form', 'account', 'account_change_password', 'default'),
('form', 'account', 'account_info', 'default'),
('form', 'account', 'account_personal', 'default'),
('form', 'account', 'account_settings', 'default'),
('form', 'account', 'search', 'default'),
('form', 'advertise', 'search', 'default'),
('form', 'billing', 'search', 'default'),
('form', 'channels', 'channel_bulletin', 'default'),
('form', 'channels', 'channel_comment', 'default'),
('form', 'channels', 'search', 'default'),
('form', 'channels_browse', 'search', 'default'),
('form', 'channels_edit_design', 'channel_boxes', 'default'),
('form', 'channels_edit_design', 'channel_style', 'default'),
('form', 'channels_edit_design', 'search', 'default'),
('form', 'channels_edit_favorites', 'channel_favorites', 'default'),
('form', 'channels_edit_favorites', 'search', 'default'),
('form', 'channels_edit_info', 'channel_info', 'default'),
('form', 'channels_edit_info', 'search', 'default'),
('form', 'channels_edit_videos', 'channel_videos', 'default'),
('form', 'channels_edit_videos', 'search', 'default'),
('form', 'channels_share_win', 'search', 'default'),
('form', 'channels_share_win', 'share_channel', 'default'),
('form', 'delete', 'delete', 'default'),
('form', 'delete', 'search', 'default'),
('form', 'favorites', 'search', 'default'),
('form', 'forgot', 'forgot', 'default'),
('form', 'forgot', 'search', 'default'),
('form', 'friends', 'friends', 'default'),
('form', 'friends', 'search', 'default'),
('form', 'friends_favorites', 'search', 'default'),
('form', 'friends_invitations', 'search', 'default'),
('form', 'friends_invite', 'invite', 'default'),
('form', 'friends_invite', 'search', 'default'),
('form', 'friends_invite_report', 'search', 'default'),
('form', 'friends_videos', 'search', 'default'),
('form', 'groups', 'group_topic', 'default'),
('form', 'groups', 'search', 'default'),
('form', 'groups_add_videos', 'group_add_videos', 'default'),
('form', 'groups_add_videos', 'search', 'default'),
('form', 'groups_browse', 'search', 'default'),
('form', 'groups_create', 'group_create', 'default'),
('form', 'groups_create', 'search', 'default'),
('form', 'groups_discussions', 'group_topic', 'default'),
('form', 'groups_discussions', 'search', 'default'),
('form', 'groups_edit', 'group_approve_topics', 'default'),
('form', 'groups_edit', 'group_approve_videos', 'default'),
('form', 'groups_edit', 'group_edit', 'default'),
('form', 'groups_edit', 'group_edit_members', 'default'),
('form', 'groups_edit', 'group_edit_topics', 'default'),
('form', 'groups_edit', 'group_edit_videos', 'default'),
('form', 'groups_edit', 'group_remove', 'default'),
('form', 'groups_edit', 'search', 'default'),
('form', 'groups_invite', 'group_invite', 'default'),
('form', 'groups_invite', 'search', 'default'),
('form', 'groups_manage', 'search', 'default'),
('form', 'groups_videos', 'search', 'default'),
('form', 'groups_view_discussion', 'group_topic', 'default'),
('form', 'groups_view_discussion', 'search', 'default'),
('form', 'help', 'search', 'default'),
('form', 'homepage', 'login', 'default'),
('form', 'homepage', 'search', 'default'),
('form', 'ignores', 'ignores', 'default'),
('form', 'ignores', 'search', 'default'),
('form', 'join', 'join', 'default'),
('form', 'join', 'login', 'default'),
('form', 'join', 'search', 'default'),
('form', 'join_options', 'search', 'default'),
('form', 'join_verification', 'search', 'default'),
('form', 'join_verification', 'verification', 'default'),
('form', 'mailbox', 'messages', 'default'),
('form', 'mailbox', 'search', 'default'),
('form', 'mailbox_comments', 'comments', 'default'),
('form', 'mailbox_comments', 'search', 'default'),
('form', 'mailbox_groups', 'groups', 'default'),
('form', 'mailbox_groups', 'search', 'default'),
('form', 'mailbox_invites', 'invites', 'default'),
('form', 'mailbox_invites', 'search', 'default'),
('form', 'mailbox_message', 'message', 'default'),
('form', 'mailbox_message', 'search', 'default'),
('form', 'mailbox_responses', 'responses', 'default'),
('form', 'mailbox_responses', 'search', 'default'),
('form', 'mailbox_sent', 'messages', 'default'),
('form', 'mailbox_sent', 'search', 'default'),
('form', 'mailbox_shared', 'messages', 'default'),
('form', 'mailbox_shared', 'search', 'default'),
('form', 'mailbox_view', 'message_view', 'default'),
('form', 'mailbox_view', 'search', 'default'),
('form', 'playlists', 'search', 'default'),
('form', 'playlists_create', 'playlist_create', 'default'),
('form', 'playlists_create', 'search', 'default'),
('form', 'playlists_edit', 'playlist_edit', 'default'),
('form', 'playlists_edit', 'search', 'default'),
('form', 'playlists_modify', 'playlist_arrange', 'default'),
('form', 'playlists_modify', 'search', 'default'),
('form', 'playlists_share_win', 'search', 'default'),
('form', 'playlists_share_win', 'share_playlist', 'default'),
('form', 'playlists_view', 'search', 'default'),
('form', 'privacy', 'search', 'default'),
('form', 'rss', 'search', 'default'),
('form', 'search', 'search', 'default'),
('form', 'subscriptions', 'search', 'default'),
('form', 'terms', 'search', 'default'),
('form', 'upgrade', 'search', 'default'),
('form', 'upgrade', 'upgrade', 'default'),
('form', 'videos', 'search', 'default'),
('form', 'videos_edit', 'search', 'default'),
('form', 'videos_edit', 'video_edit', 'default'),
('form', 'videos_manage', 'search', 'default'),
('form', 'videos_respond', 'search', 'default'),
('form', 'videos_respond', 'video_response', 'default'),
('form', 'videos_upload', 'search', 'default'),
('form', 'videos_upload', 'video_upload', 'default'),
('form', 'videos_upload_complete', 'search', 'default'),
('form', 'videos_upload_general', 'search', 'default'),
('form', 'videos_upload_general', 'video_upload_general', 'default'),
('form', 'videos_view', 'comment', 'default'),
('form', 'videos_view', 'comment_embed', 'default'),
('form', 'videos_view', 'search', 'default'),
('menu', 'about', 'main', 'default'),
('menu', 'about', 'top', 'default'),
('menu', 'account', 'main', 'default'),
('menu', 'account', 'subhome', 'default'),
('menu', 'account', 'top', 'default'),
('menu', 'advertise', 'main', 'default'),
('menu', 'advertise', 'top', 'default'),
('menu', 'billing', 'main', 'default'),
('menu', 'billing', 'membership', 'default'),
('menu', 'billing', 'top', 'default'),
('menu', 'channels', 'channel', 'default'),
('menu', 'channels', 'channel_connect', 'default'),
('menu', 'channels', 'main', 'default'),
('menu', 'channels', 'top', 'default'),
('menu', 'channels_browse', 'main', 'default'),
('menu', 'channels_browse', 'subchannels', 'default'),
('menu', 'channels_browse', 'top', 'default'),
('menu', 'channels_edit_design', 'main', 'default'),
('menu', 'channels_edit_design', 'mychannel', 'default'),
('menu', 'channels_edit_design', 'subhome', 'default'),
('menu', 'channels_edit_design', 'top', 'default'),
('menu', 'channels_edit_favorites', 'main', 'default'),
('menu', 'channels_edit_favorites', 'mychannel', 'default'),
('menu', 'channels_edit_favorites', 'subhome', 'default'),
('menu', 'channels_edit_favorites', 'top', 'default'),
('menu', 'channels_edit_info', 'main', 'default'),
('menu', 'channels_edit_info', 'mychannel', 'default'),
('menu', 'channels_edit_info', 'subhome', 'default'),
('menu', 'channels_edit_info', 'top', 'default'),
('menu', 'channels_edit_videos', 'main', 'default'),
('menu', 'channels_edit_videos', 'mychannel', 'default'),
('menu', 'channels_edit_videos', 'subhome', 'default'),
('menu', 'channels_edit_videos', 'top', 'default'),
('menu', 'delete', 'main', 'default'),
('menu', 'delete', 'top', 'default'),
('menu', 'favorites', 'main', 'default'),
('menu', 'favorites', 'subhome', 'default'),
('menu', 'favorites', 'top', 'default'),
('menu', 'forgot', 'main', 'default'),
('menu', 'forgot', 'top', 'default'),
('menu', 'friends', 'main', 'default'),
('menu', 'friends', 'subfriends', 'default'),
('menu', 'friends', 'top', 'default'),
('menu', 'friends_favorites', 'main', 'default'),
('menu', 'friends_favorites', 'subfriends', 'default'),
('menu', 'friends_favorites', 'top', 'default'),
('menu', 'friends_invitations', 'main', 'default'),
('menu', 'friends_invitations', 'subfriends', 'default'),
('menu', 'friends_invitations', 'top', 'default'),
('menu', 'friends_invite', 'main', 'default'),
('menu', 'friends_invite', 'subfriends', 'default'),
('menu', 'friends_invite', 'top', 'default'),
('menu', 'friends_invite_report', 'main', 'default'),
('menu', 'friends_invite_report', 'subfriends', 'default'),
('menu', 'friends_invite_report', 'top', 'default'),
('menu', 'friends_videos', 'main', 'default'),
('menu', 'friends_videos', 'subfriends', 'default'),
('menu', 'friends_videos', 'top', 'default'),
('menu', 'groups', 'main', 'default'),
('menu', 'groups', 'top', 'default'),
('menu', 'groups_add_videos', 'main', 'default'),
('menu', 'groups_add_videos', 'top', 'default'),
('menu', 'groups_browse', 'main', 'default'),
('menu', 'groups_browse', 'subgroups', 'default'),
('menu', 'groups_browse', 'top', 'default'),
('menu', 'groups_create', 'main', 'default'),
('menu', 'groups_create', 'top', 'default'),
('menu', 'groups_discussions', 'main', 'default'),
('menu', 'groups_discussions', 'top', 'default'),
('menu', 'groups_edit', 'groupmanage', 'default'),
('menu', 'groups_edit', 'main', 'default'),
('menu', 'groups_edit', 'top', 'default'),
('menu', 'groups_invite', 'main', 'default'),
('menu', 'groups_invite', 'top', 'default'),
('menu', 'groups_manage', 'main', 'default'),
('menu', 'groups_manage', 'mygroups', 'default'),
('menu', 'groups_manage', 'subhome', 'default'),
('menu', 'groups_manage', 'top', 'default'),
('menu', 'groups_videos', 'main', 'default'),
('menu', 'groups_videos', 'top', 'default'),
('menu', 'groups_view_discussion', 'main', 'default'),
('menu', 'groups_view_discussion', 'top', 'default'),
('menu', 'help', 'main', 'default'),
('menu', 'help', 'top', 'default'),
('menu', 'homepage', 'main', 'default'),
('menu', 'homepage', 'membership', 'default'),
('menu', 'homepage', 'subhome', 'default'),
('menu', 'homepage', 'top', 'default'),
('menu', 'ignores', 'main', 'default'),
('menu', 'ignores', 'subhome', 'default'),
('menu', 'ignores', 'top', 'default'),
('menu', 'join', 'main', 'default'),
('menu', 'join', 'top', 'default'),
('menu', 'join_options', 'main', 'default'),
('menu', 'join_options', 'top', 'default'),
('menu', 'join_verification', 'main', 'default'),
('menu', 'join_verification', 'top', 'default'),
('menu', 'mailbox', 'mailbox', 'default'),
('menu', 'mailbox', 'main', 'default'),
('menu', 'mailbox', 'top', 'default'),
('menu', 'mailbox_comments', 'mailbox', 'default'),
('menu', 'mailbox_comments', 'main', 'default'),
('menu', 'mailbox_comments', 'top', 'default'),
('menu', 'mailbox_groups', 'mailbox', 'default'),
('menu', 'mailbox_groups', 'main', 'default'),
('menu', 'mailbox_groups', 'top', 'default'),
('menu', 'mailbox_invites', 'mailbox', 'default'),
('menu', 'mailbox_invites', 'main', 'default'),
('menu', 'mailbox_invites', 'top', 'default'),
('menu', 'mailbox_message', 'mailbox', 'default'),
('menu', 'mailbox_message', 'main', 'default'),
('menu', 'mailbox_message', 'top', 'default'),
('menu', 'mailbox_responses', 'mailbox', 'default'),
('menu', 'mailbox_responses', 'main', 'default'),
('menu', 'mailbox_responses', 'top', 'default'),
('menu', 'mailbox_sent', 'mailbox', 'default'),
('menu', 'mailbox_sent', 'main', 'default'),
('menu', 'mailbox_sent', 'top', 'default'),
('menu', 'mailbox_shared', 'mailbox', 'default'),
('menu', 'mailbox_shared', 'main', 'default'),
('menu', 'mailbox_shared', 'top', 'default'),
('menu', 'mailbox_view', 'mailbox', 'default'),
('menu', 'mailbox_view', 'main', 'default'),
('menu', 'mailbox_view', 'top', 'default'),
('menu', 'playlists', 'main', 'default'),
('menu', 'playlists', 'subhome', 'default'),
('menu', 'playlists', 'top', 'default'),
('menu', 'playlists_create', 'main', 'default'),
('menu', 'playlists_create', 'subhome', 'default'),
('menu', 'playlists_create', 'top', 'default'),
('menu', 'playlists_edit', 'main', 'default'),
('menu', 'playlists_edit', 'subhome', 'default'),
('menu', 'playlists_edit', 'top', 'default'),
('menu', 'playlists_modify', 'main', 'default'),
('menu', 'playlists_modify', 'subhome', 'default'),
('menu', 'playlists_modify', 'top', 'default'),
('menu', 'playlists_view', 'main', 'default'),
('menu', 'playlists_view', 'top', 'default'),
('menu', 'privacy', 'main', 'default'),
('menu', 'privacy', 'top', 'default'),
('menu', 'rss', 'main', 'default'),
('menu', 'rss', 'top', 'default'),
('menu', 'search', 'main', 'default'),
('menu', 'search', 'top', 'default'),
('menu', 'subscriptions', 'main', 'default'),
('menu', 'subscriptions', 'subhome', 'default'),
('menu', 'subscriptions', 'top', 'default'),
('menu', 'terms', 'main', 'default'),
('menu', 'terms', 'top', 'default'),
('menu', 'upgrade', 'main', 'default'),
('menu', 'upgrade', 'top', 'default'),
('menu', 'videos', 'main', 'default'),
('menu', 'videos', 'subvideos', 'default'),
('menu', 'videos', 'top', 'default'),
('menu', 'videos_activity', 'main', 'default'),
('menu', 'videos_activity', 'subhome', 'default'),
('menu', 'videos_activity', 'top', 'default'),
('menu', 'videos_edit', 'main', 'default'),
('menu', 'videos_edit', 'subhome', 'default'),
('menu', 'videos_edit', 'top', 'default'),
('menu', 'videos_manage', 'main', 'default'),
('menu', 'videos_manage', 'subhome', 'default'),
('menu', 'videos_manage', 'top', 'default'),
('menu', 'videos_respond', 'main', 'default'),
('menu', 'videos_respond', 'top', 'default'),
('menu', 'videos_upload', 'main', 'default'),
('menu', 'videos_upload', 'top', 'default'),
('menu', 'videos_upload_complete', 'main', 'default'),
('menu', 'videos_upload_complete', 'top', 'default'),
('menu', 'videos_upload_general', 'main', 'default'),
('menu', 'videos_upload_general', 'top', 'default'),
('menu', 'videos_view', 'main', 'default'),
('menu', 'videos_view', 'top', 'default'),
('task', 'billing', 'channels|billing', 'default'),
('task', 'channels', 'channels|channel_view', 'default'),
('task', 'channels_browse', 'channels|channels_browse', 'default'),
('task', 'channels_browse', 'channels|channels_browse_data', 'default'),
('task', 'channels_edit_design', 'channels|channel_design', 'default'),
('task', 'channels_edit_favorites', 'channels|channel_favorites', 'default'),
('task', 'channels_edit_favorites', 'channels|channel_my_favorites', 'default'),
('task', 'channels_edit_info', 'channels|channel_info', 'default'),
('task', 'channels_edit_videos', 'channels|channel_my_videos', 'default'),
('task', 'channels_edit_videos', 'channels|channel_videos', 'default'),
('task', 'favorites', 'favorites|my_favorites', 'default'),
('task', 'friends', 'friends|my_friends', 'default'),
('task', 'friends_favorites', 'friends|my_friends_favorites', 'default'),
('task', 'friends_invitations', 'friends|my_invitations', 'default'),
('task', 'friends_videos', 'friends|my_friends_videos', 'default'),
('task', 'groups', 'groups|group_view', 'default'),
('task', 'groups_add_videos', 'groups|groupinfo', 'default'),
('task', 'groups_add_videos', 'groups|group_pro', 'default'),
('task', 'groups_add_videos', 'groups|my_group_favorites', 'default'),
('task', 'groups_add_videos', 'groups|my_group_videos', 'default'),
('task', 'groups_browse', 'groups|groups_browse', 'default'),
('task', 'groups_browse', 'groups|groups_browse_data', 'default'),
('task', 'groups_discussions', 'groups|groupinfo', 'default'),
('task', 'groups_discussions', 'groups|group_discussions', 'default'),
('task', 'groups_edit', 'groups|groupinfo', 'default'),
('task', 'groups_edit', 'groups|group_edit', 'default'),
('task', 'groups_invite', 'groups|groupinfo', 'default'),
('task', 'groups_manage', 'groups|my_groups', 'default'),
('task', 'groups_videos', 'groups|groupinfo', 'default'),
('task', 'groups_videos', 'groups|group_videos', 'default'),
('task', 'groups_view_discussion', 'groups|groupinfo', 'default'),
('task', 'groups_view_discussion', 'groups|group_discussion', 'default'),
('task', 'homepage', 'channels|membership', 'default'),
('task', 'homepage', 'videos|videos_homepage_boxes', 'default'),
('task', 'homepage', 'videos|videos_statistics', 'default'),
('task', 'ignores', 'channels|ignores', 'default'),
('task', 'mailbox', 'mailbox|mailbox_inbox', 'default'),
('task', 'mailbox_comments', 'mailbox|mailbox_comments', 'default'),
('task', 'mailbox_groups', 'mailbox|mailbox_groups', 'default'),
('task', 'mailbox_invites', 'mailbox|mailbox_invites', 'default'),
('task', 'mailbox_message', 'mailbox|mailbox_message', 'default'),
('task', 'mailbox_responses', 'mailbox|mailbox_responses', 'default'),
('task', 'mailbox_sent', 'mailbox|mailbox_sent', 'default'),
('task', 'mailbox_shared', 'mailbox|mailbox_shared', 'default'),
('task', 'mailbox_view', 'mailbox|mailbox_view', 'default'),
('task', 'playlists', 'playlists|my_playlists', 'default'),
('task', 'playlists_modify', 'playlists|playlist_modify', 'default'),
('task', 'playlists_view', 'playlists|playlist_view', 'default'),
('task', 'search', 'videos|videos_browse_data', 'default'),
('task', 'subscriptions', 'subscriptions|my_subscriptions', 'default'),
('task', 'videos', 'videos|videos_browse', 'default'),
('task', 'videos', 'videos|videos_browse_data', 'default'),
('task', 'videos_activity', 'channels|membership', 'default'),
('task', 'videos_activity', 'videos|friend_activity', 'default'),
('task', 'videos_activity', 'videos|videos_homepage_boxes', 'default'),
('task', 'videos_activity', 'videos|videos_statistics', 'default'),
('task', 'videos_edit', 'videos|video_screenshots', 'default'),
('task', 'videos_manage', 'videos|my_videos', 'default'),
('task', 'videos_respond', 'videos|my_videos', 'default'),
('task', 'videos_respond', 'videos|vidinfo', 'default'),
('task', 'videos_upload_complete', 'videos|vidinfo', 'default'),
('task', 'videos_view', 'videos|video_view', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `ban_id` bigint(20) unsigned NOT NULL auto_increment,
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
  PRIMARY KEY  (`ban_id`),
  KEY `cmp_id` (`cmp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `banners`
--


-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE IF NOT EXISTS `billing` (
  `ord_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`ord_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `billing`
--


-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE IF NOT EXISTS `bookmarks` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmarks`
--


-- --------------------------------------------------------

--
-- Table structure for table `bulletins`
--

CREATE TABLE IF NOT EXISTS `bulletins` (
  `bul_id` bigint(20) unsigned NOT NULL auto_increment,
  `from` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`bul_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `bulletins`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `cmp_id` bigint(20) unsigned NOT NULL auto_increment,
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
  PRIMARY KEY  (`cmp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `campaigns`
--


-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL auto_increment,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY  (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
(44, 1277569252, '24.203.116.87', 'QVLWBP'),
(43, 1277569234, '118.71.123.2', 'HRVCZV'),
(39, 1277569006, '118.71.123.2', 'XMYMSG'),
(40, 1277569040, '118.71.123.2', '2YA5QO'),
(41, 1277569173, '24.203.116.87', 'QMNSCJ'),
(42, 1277569203, '118.71.123.2', 'ATFYSY');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `comments` tinyint(4) NOT NULL default '1',
  `comment_allow` tinyint(4) NOT NULL default '1',
  `bulletins` tinyint(4) NOT NULL default '1',
  `featured` varchar(250) NOT NULL,
  `colors` text NOT NULL,
  `bcg` varchar(250) NOT NULL,
  `boxes` varchar(250) NOT NULL,
  `videos` varchar(250) NOT NULL,
  `favorites` varchar(250) NOT NULL,
  `playlists` varchar(250) NOT NULL,
  `views` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`mem_id`, `type`, `title`, `description`, `comments`, `comment_allow`, `bulletins`, `featured`, `colors`, `bcg`, `boxes`, `videos`, `favorites`, `playlists`, `views`) VALUES
(100000, 1, 'admin', '', 1, 1, 1, '', 'grey', '', 'box_featured,box_subscriptions,box_bulletins,box_videos,box_favorites,box_friends,box_comments', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `channel_comments`
--

CREATE TABLE IF NOT EXISTS `channel_comments` (
  `com_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `from` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`com_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `channel_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE IF NOT EXISTS `code` (
  `ip` char(15) NOT NULL,
  `code` char(6) NOT NULL,
  `try` tinyint(3) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`ip`, `code`, `try`, `date`) VALUES
('127.0.0.1', '7245F5', 1, 1277346146);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`) VALUES
(1, 'Registration Email', 'Please verify your email', 'Welcome [USERNAME]! Thanks for registering.\r\n---------------------------------------------------\r\n\r\nHello,\r\n\r\nYou''re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n---------------------------------------------------\r\n\r\nThe administrator of this site has requested all new accounts\r\nto be activated by the users who created them thus your account\r\nis currently inactive. To activate your account,\r\nplease visit this link:\r\n[LINK]\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]'),
(2, 'Forgot Password Email', 'Password Reset', 'New password reset from [SITE_NAME]!\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello, [USERNAME]\r\n\r\nIt seems that you or someone requested a new password for you.\r\n\r\nWe have generated a new password, as requested:\r\n\r\nYour new password: [PASSWORD]\r\n\r\n\r\nTo use the new password you need to activate it. To do this click the link provided below and login with your new password.\r\n[LINK]\r\n\r\nYou can change your password after you sign in.\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nPassword requested from IP: [IP]'),
(3, 'Welcome Mail From Admin', 'You have been registered', 'Welcome [NAME]! Thanks for registering.\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello,\r\n\r\nYou''re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]'),
(4, 'Default Newsletter', 'Newsletter', 'Hello,\r\n[USERNAME]\r\nYou are receiving this email as a part of your newsletter subscription\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHere goes your newsletter content\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n---------------------------------------------------------------------------------------------------------\r\nTo stop receiving future newsletters please login into your account\r\nand uncheck newsletter subscription box.'),
(5, 'Transaction Completed', 'Payment from payPal', 'Hello, Admin\r\n\r\nYou have received new PayPal payment following:\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nUsername: [USERNAME]\r\nItem: [ITEMNAME]\r\nPrice: [PRICE]\r\n\r\nStatus: [STATUS] \r\n\r\n---------------------------------------------------------------------------------------------------------\r\nYou can view this transaction from [URL]'),
(6, 'Transaction Suspicious', 'Suspicious Transaction', 'Hello, Admin\r\n----------------------------------------------------------\r\nThe following transaction has been disabled due to suspicious activity:\r\n\r\nBuyer: [USERNAME]\r\nItem: [ITEM]\r\nPrice: [PRICE]\r\nStatus: [STATUS]\r\n\r\n----------------------------------------------------------\r\nPlease verify this transaction is correct. If it is, please activate it in the transaction section of your site''s \r\nadministration control panel. If not, it appears that someone tried to fraudulently obtain products from your site.');

-- --------------------------------------------------------

--
-- Table structure for table `geo_countries`
--

CREATE TABLE IF NOT EXISTS `geo_countries` (
  `con_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY  (`con_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `geo_countries`
--

INSERT INTO `geo_countries` (`con_id`, `name`) VALUES
(1, 'Antarctica'),
(2, 'Argentina'),
(3, 'Falkland Islands'),
(4, 'Chile'),
(5, 'French Southern Territories'),
(6, 'New Zealand'),
(7, 'Saint Helena'),
(8, 'Uruguay'),
(9, 'South Africa'),
(10, 'Brazil'),
(11, 'Lesotho'),
(12, 'Namibia'),
(13, 'French Polynesia'),
(14, 'Paraguay'),
(15, 'Swaziland'),
(16, 'Smaller Territories of Chile'),
(17, 'Botswana'),
(18, 'Mozambique'),
(19, 'Madagascar'),
(20, 'Smaller Territories of the UK'),
(21, 'Bolivia'),
(22, 'New Caledonia'),
(23, 'Zimbabwe'),
(24, 'Cook Islands'),
(25, 'Reunion'),
(26, 'Tonga'),
(27, 'Mauritius'),
(28, 'Vanuatu'),
(29, 'Fiji Islands'),
(30, 'Peru'),
(31, 'Zambia'),
(32, 'Angola'),
(33, 'Malawi'),
(34, 'American Samoa'),
(35, 'Wallis and Futuna'),
(36, 'Samoa'),
(37, 'Mayotte'),
(38, 'Comoros'),
(39, 'External Territories of Australia'),
(40, 'Congo (Dem. Rep.)'),
(41, 'Solomon Islands'),
(42, 'Tanzania'),
(43, 'Papua New Guinea'),
(44, 'Indonesia'),
(45, 'Tokelau'),
(46, 'Tuvalu'),
(47, 'East Timor'),
(48, 'Congo'),
(49, 'Kenya'),
(50, 'Ecuador'),
(51, 'Colombia'),
(52, 'Burundi'),
(53, 'Gabon'),
(54, 'Kiribati'),
(55, 'Rwanda'),
(56, 'Equatorial Guinea'),
(57, 'Uganda'),
(58, 'Somalia'),
(59, 'Maldives'),
(60, 'Nauru'),
(61, 'São Tomé and Príncipe'),
(62, 'Malaysia'),
(63, 'Cameroon'),
(64, 'Palau'),
(65, 'French Guiana'),
(66, 'Guyana'),
(67, 'Central African Republic'),
(68, 'Ethiopia'),
(69, 'Micronesia'),
(70, 'Sudan'),
(71, 'Nigeria'),
(72, 'Liberia'),
(73, 'Ivory Coast'),
(74, 'Brunei'),
(75, 'Marshall Islands'),
(76, 'Philippines'),
(77, 'Ghana'),
(78, 'Suriname'),
(79, 'Venezuela'),
(80, 'Thailand'),
(81, 'Sri Lanka'),
(82, 'Togo'),
(83, 'Benin'),
(84, 'Sierra Leone'),
(85, 'Panama'),
(86, 'Guinea'),
(87, 'Chad'),
(88, 'India'),
(89, 'Costa Rica'),
(90, 'Vietnam'),
(91, 'Burkina Faso'),
(92, 'Trinidad and Tobago'),
(93, 'Cambodia'),
(94, 'Nicaragua'),
(95, 'Mali'),
(96, 'Djibouti'),
(97, 'Guinea-Bissau'),
(98, 'Niger'),
(99, 'Grenada'),
(100, 'Netherlands Antilles'),
(101, 'Myanmar'),
(102, 'Senegal'),
(103, 'Yemen'),
(104, 'Saint Vincent and The Grenadines'),
(105, 'Eritrea'),
(106, 'Barbados'),
(107, 'Honduras'),
(108, 'Gambia'),
(109, 'El Salvador'),
(110, 'Guam'),
(111, 'Saint Lucia'),
(112, 'Guatemala'),
(113, 'Northern Mariana Islands'),
(114, 'Martinique'),
(115, 'Mexico'),
(116, 'Cape Verde'),
(117, 'Laos'),
(118, 'Mauritania'),
(119, 'Dominica'),
(120, 'Guadeloupe'),
(121, 'Belize'),
(122, 'Saudi Arabia'),
(123, 'Oman'),
(124, 'Antigua and Barbuda'),
(125, 'Saint Kitts and Nevis'),
(126, 'Virgin Islands of the United States'),
(127, 'Jamaica'),
(128, 'Dominican Republic'),
(129, 'Puerto Rico'),
(130, 'Haiti'),
(131, 'China'),
(132, 'British Virgin Islands'),
(133, 'Cayman Islands'),
(134, 'Algeria'),
(135, 'Cuba'),
(136, 'Bangladesh'),
(137, 'Bahamas'),
(138, 'Turks and Caicos Islands'),
(139, 'Taiwan'),
(140, 'Western Sahara'),
(141, 'Egypt'),
(142, 'Pakistan'),
(143, 'Libya'),
(144, 'United Arab Emirates'),
(145, 'Japan'),
(146, 'Qatar'),
(147, 'Iran'),
(148, 'Bahrain'),
(149, 'Nepal'),
(150, 'Bhutan'),
(151, 'Spain'),
(152, 'Morocco'),
(153, 'Kuwait'),
(154, 'Jordan'),
(155, 'Israel'),
(156, 'Iraq'),
(157, 'Afghanistan'),
(158, 'Palestine'),
(159, 'Tunisia'),
(160, 'Bermuda'),
(161, 'Syria'),
(162, 'Portugal'),
(163, 'Lebanon'),
(164, 'Korea (South)'),
(165, 'Cyprus'),
(166, 'Greece'),
(167, 'Malta'),
(168, 'Turkey'),
(169, 'Italy'),
(170, 'Uzbekistan'),
(171, 'Tajikistan'),
(172, 'Turkmenistan'),
(173, 'Korea (North)'),
(174, 'Azerbaijan'),
(175, 'Armenia'),
(176, 'Albania'),
(177, 'Kyrgyzstan'),
(178, 'Kazakhstan'),
(179, 'Macedonia'),
(180, 'Georgia'),
(181, 'Russia'),
(182, 'France'),
(183, 'Bulgaria'),
(184, 'Serbia and Montenegro'),
(185, 'Andorra'),
(186, 'Croatia'),
(187, 'Bosnia and Herzegovina'),
(188, 'Mongolia'),
(189, 'Romania'),
(190, 'Monaco'),
(191, 'San Marino'),
(192, 'Ukraine'),
(193, 'Slovenia'),
(194, 'Moldova'),
(195, 'Hungary'),
(196, 'Switzerland'),
(197, 'Austria'),
(198, 'Saint Pierre and Miquelon'),
(199, 'Liechtenstein'),
(200, 'Germany'),
(201, 'Slovakia'),
(202, 'Czech Republic'),
(203, 'Jersey'),
(204, 'Poland'),
(205, 'Guernsey and Alderney'),
(206, 'Luxembourg'),
(207, 'Belgium'),
(208, 'Netherlands'),
(209, 'Ireland'),
(210, 'Belarus'),
(211, 'Lithuania'),
(212, 'Isle of Man'),
(213, 'Denmark'),
(214, 'Sweden'),
(215, 'Latvia'),
(216, 'Estonia'),
(217, 'Norway'),
(218, 'Finland'),
(219, 'Greenland'),
(220, 'Faroe Islands'),
(221, 'Iceland'),
(222, 'Svalbard and Jan Mayen'),
(223, 'United States'),
(224, 'Canada'),
(225, 'United Kingdom'),
(226, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `grp_id` bigint(20) unsigned NOT NULL auto_increment,
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
  PRIMARY KEY  (`grp_id`),
  UNIQUE KEY `folder` (`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_forum`
--

CREATE TABLE IF NOT EXISTS `group_forum` (
  `pst_id` bigint(20) unsigned NOT NULL auto_increment,
  `reply_to` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`pst_id`),
  KEY `mem_id` (`mem_id`),
  KEY `grp_id` (`grp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `group_forum`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `grp_id` (`grp_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_members`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_videos`
--

CREATE TABLE IF NOT EXISTS `group_videos` (
  `grp_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `added` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  UNIQUE KEY `grp_id` (`grp_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_videos`
--


-- --------------------------------------------------------

--
-- Table structure for table `ignores`
--

CREATE TABLE IF NOT EXISTS `ignores` (
  `ign_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`ign_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ignores`
--


-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `inv_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `email` varchar(250) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `stat` enum('p','j','f') NOT NULL default 'p',
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `pla_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(250) NOT NULL,
  `grp_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `inv_id` (`inv_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invitations`
--


-- --------------------------------------------------------

--
-- Table structure for table `javascripts`
--

CREATE TABLE IF NOT EXISTS `javascripts` (
  `page` varchar(50) NOT NULL,
  `onload` text NOT NULL,
  `code` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `javascripts`
--

INSERT INTO `javascripts` (`page`, `onload`, `code`, `theme`) VALUES
('all', '', '<script src="::URL::/js/CH_ThumbsPreview.js" type="text/javascript"></script>\n<script src="::URL::/js/zxml.js" type="text/javascript"></script>', 'default'),
('channels', '', '<script src="::URL::/js/AC_RunActiveContent.js" type="text/javascript"></script><script src="::URL::/js/AC_ActiveX.js" type="text/javascript"></script>\n<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_ChannelView.js" type="text/javascript"></script>', 'default'),
('channels_browse', '', '<script src="::URL::/js/CH_VideosBrowse.js" type="text/javascript"></script>', 'default'),
('channels_edit_design', '', '<script src="::URL::/js/CH_ChannelDesign.js" type="text/javascript"></script>', 'default'),
('channels_edit_favorites', '', '<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_ChannelEdit.js" type="text/javascript"></script>', 'default'),
('channels_edit_videos', '', '<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_ChannelEdit.js" type="text/javascript"></script>', 'default'),
('groups_edit', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('groups_invite', '', '<script src="::URL::/js/CH_GroupInvite.js" type="text/javascript"></script>', 'default'),
('homepage', '', '<script src="::URL::/js/AC_RunActiveContent.js" type="text/javascript"></script><script src="::URL::/js/AC_ActiveX.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_HomePage.js" type="text/javascript"></script>', 'default'),
('mailbox', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_comments', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_groups', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_invites', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_responses', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_sent', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('mailbox_shared', '', '<script src="::URL::/js/CH_Mailbox.js" type="text/javascript"></script>', 'default'),
('playlists_view', '', '<script src="::URL::/js/CH_PlaylistView.js" type="text/javascript"></script>', 'default'),
('search', '', '<script src="::URL::/js/CH_VideosBrowse.js" type="text/javascript"></script>', 'default'),
('subscriptions', '', '<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Subscriptions.js" type="text/javascript"></script>', 'default'),
('videos', '', '<script src="::URL::/js/CH_VideosBrowse.js" type="text/javascript"></script>', 'default'),
('videos_respond', '', '<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>', 'default'),
('videos_view', '', '<script src="::URL::/js/AC_RunActiveContent.js" type="text/javascript"></script><script src="::URL::/js/AC_ActiveX.js" type="text/javascript"></script>\n<script src="::URL::/js/zxml.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_Ajax.js" type="text/javascript"></script>\n<script src="::URL::/js/CH_VideoView.js" type="text/javascript"></script>', 'default'),
('', '', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `mailbox`
--

CREATE TABLE IF NOT EXISTS `mailbox` (
  `mes_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `per_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `mailbox` enum('inbox','shared','invites','comments','responses','groups','sent') NOT NULL default 'inbox',
  `viewed` enum('0','1') NOT NULL default '0',
  `special` varchar(250) NOT NULL,
  `video` bigint(20) unsigned NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`mes_id`),
  KEY `mem_id` (`mem_id`),
  KEY `per_id` (`per_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `mailbox`
--


-- --------------------------------------------------------

--
-- Table structure for table `mass_mail`
--

CREATE TABLE IF NOT EXISTS `mass_mail` (
  `mail_id` bigint(20) unsigned NOT NULL auto_increment,
  `to` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `headers` varchar(250) NOT NULL,
  PRIMARY KEY  (`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mass_mail`
--


-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `mem_id` bigint(20) unsigned NOT NULL auto_increment,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `verified` enum('0','1') NOT NULL default '0',
  `banned` enum('0','1') NOT NULL default '0',
  `membership` tinyint(4) NOT NULL default '0',
  `access_end` bigint(20) NOT NULL,
  `member_type` enum('a','m','u') NOT NULL default 'u',
  `diskspace` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100001 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`mem_id`, `email`, `username`, `password`, `fname`, `lname`, `verified`, `banned`, `membership`, `access_end`, `member_type`, `diskspace`) VALUES
(100000, '', 'admin', 'ac48ec59d616758e95e63b08a1689240', 'Nguyen', 'Hai Dang', '1', '0', 0, 0, 'a', 0);

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE IF NOT EXISTS `memberships` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `free` tinyint(1) NOT NULL default '0',
  `public` tinyint(1) NOT NULL default '1',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `title`, `desc`, `free`, `public`, `status`) VALUES
(1, 'Bronzes free', 'Bronzes free', 1, 1, 1),
(2, 'Super Membership', 'This is super membership', 1, 1, 1),
(3, 'Silver', 'Silver', 1, 1, 1),
(4, 'Bronze', 'Bronze', 1, 1, 1),
(5, 'Gold', 'Gold', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `members_settings`
--

CREATE TABLE IF NOT EXISTS `members_settings` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `hide_location` enum('0','1') NOT NULL default '0',
  `hide_gender` enum('0','1') NOT NULL default '0',
  `hide_age` enum('0','1') NOT NULL default '0',
  `hide_status` enum('0','1') NOT NULL default '0',
  `notifications` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members_settings`
--

INSERT INTO `members_settings` (`mem_id`, `hide_location`, `hide_gender`, `hide_age`, `hide_status`, `notifications`) VALUES
(100000, '0', '0', '0', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `moderators`
--

CREATE TABLE IF NOT EXISTS `moderators` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `access` text NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderators`
--


-- --------------------------------------------------------

--
-- Table structure for table `mod_session`
--

CREATE TABLE IF NOT EXISTS `mod_session` (
  `ses_id` varchar(250) NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `started` bigint(20) NOT NULL,
  UNIQUE KEY `ses_id` (`ses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `network`
--

CREATE TABLE IF NOT EXISTS `network` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `friends` text NOT NULL,
  `friends_count` bigint(20) unsigned NOT NULL,
  `update` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `network`
--

INSERT INTO `network` (`mem_id`, `friends`, `friends_count`, `update`) VALUES
(100000, ',', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `let_id` bigint(20) unsigned NOT NULL auto_increment,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `forced` enum('0','1') NOT NULL default '0',
  `send_to` bigint(20) unsigned NOT NULL,
  `complete` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`let_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter`
--


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `refunded` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`ord_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL auto_increment,
  `txn_id` varchar(100) default NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate_amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `txn_id`, `membership_id`, `user_id`, `rate_id`, `rate_amount`, `date`, `status`) VALUES
(1, NULL, 2, 24, 2, '0.99', '2010-03-02 12:10:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE IF NOT EXISTS `payment_gateway` (
  `order_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `psystem` tinyint(3) unsigned NOT NULL,
  `order_name` varchar(250) NOT NULL,
  `order_type` enum('membership','blogs','classifieds','events','clubs') NOT NULL,
  `order_object_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL,
  `currency` char(10) default NULL,
  `recurrent` enum('0','1') default NULL,
  `last_paid` bigint(20) unsigned NOT NULL,
  `next_payment` bigint(20) unsigned NOT NULL,
  `period` char(30) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `status` enum('pending','paid') default NULL,
  `now` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`order_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=334456778 ;

--
-- Dumping data for table `payment_gateway`
--


-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
  `pla_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(250) NOT NULL,
  `privacy` tinyint(3) unsigned NOT NULL,
  `embedding` tinyint(3) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`pla_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `playlists`
--


-- --------------------------------------------------------

--
-- Table structure for table `playlist_videos`
--

CREATE TABLE IF NOT EXISTS `playlist_videos` (
  `pla_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `main` enum('0','1') NOT NULL default '0',
  `added` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `pla_id` (`pla_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlist_videos`
--


-- --------------------------------------------------------

--
-- Table structure for table `private_access`
--

CREATE TABLE IF NOT EXISTS `private_access` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`type`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `private_access`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
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
  `avatar_approved` enum('0','1') NOT NULL default '0',
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
  `approved` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`mem_id`, `joined`, `updated`, `last_visit`, `last_click`, `country`, `city`, `hometown`, `zip`, `gender`, `birthdate`, `avatar`, `avatar_approved`, `website`, `about_me`, `d_status`, `occupations`, `companies`, `schools`, `interests`, `movies`, `music`, `books`, `approved`) VALUES
(100000, 1277174436, 1277174690, 1277346762, 1277347137, 90, 'Ha Noi', '', '', 1, 416250059, '', '0', '', '', 0, '', '', '', '', '', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL auto_increment,
  `membership_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `amount` varchar(255) NOT NULL,
  `term` bigint(255) NOT NULL,
  `term_c` varchar(1) NOT NULL,
  `automatic` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `membership_id`, `title`, `desc`, `amount`, `term`, `term_c`, `automatic`) VALUES
(1, 2, 'Weekly', 'Weekly access to protected areas', '0.99', 1, 'W', 1),
(2, 2, 'Monthly', 'Monthly access to protected areas', '1.99', 1, 'M', 1),
(3, 2, 'Yearly', 'Yearly access to protected areas', '10.99', 1, 'Y', 1),
(4, 3, 'Full', 'Unlimited access to protected areas', '19.99', 1, 'Y', 1),
(10, 5, 'monthly', 'monthly gold', '50', 30, 'D', 1),
(11, 4, 'year', 'year bronzes', '500', 1, 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `rep_id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `report` enum('spam','mature','mis-categorized','copyright') NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `special` varchar(250) NOT NULL,
  PRIMARY KEY  (`rep_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100000 ;

--
-- Dumping data for table `reports`
--


-- --------------------------------------------------------

--
-- Table structure for table `sessiondata`
--

CREATE TABLE IF NOT EXISTS `sessiondata` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `mem_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `saved` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sessiondata`
--

INSERT INTO `sessiondata` (`id`, `mem_id`, `data`, `saved`) VALUES
(1, 100000, 'a%3A17%3A%7Bs%3A11%3A%22response_to%22%3Bs%3A0%3A%22%22%3Bs%3A5%3A%22title%22%3Bs%3A3%3A%22abc%22%3Bs%3A11%3A%22description%22%3Bs%3A4%3A%22xxxx%22%3Bs%3A8%3A%22category%22%3Bs%3A2%3A%2215%22%3Bs%3A4%3A%22tags%22%3Bs%3A4%3A%22aaaa%22%3Bs%3A4%3A%22date%22%3Bi%3A1230742859%3Bs%3A8%3A%22location%22%3Bs%3A2%3A%22ad%22%3Bs%3A7%3A%22country%22%3Bs%3A3%3A%22223%22%3Bs%3A9%3A%22broadcast%22%3Bs%3A1%3A%220%22%3Bs%3A8%3A%22comments%22%3Bs%3A1%3A%221%22%3Bs%3A14%3A%22comment_voting%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22responses%22%3Bs%3A1%3A%221%22%3Bs%3A7%3A%22ratings%22%3Bs%3A1%3A%221%22%3Bs%3A9%3A%22embedding%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22err_page%22%3Bs%3A6%3A%22videos%22%3Bs%3A11%3A%22err_section%22%3Bs%3A14%3A%22upload_general%22%3Bs%3A6%3A%22source%22%3Bs%3A6%3A%22upload%22%3B%7D', 1277174767);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `site_name` varchar(100) NOT NULL,
  `site_slogan` varchar(100) NOT NULL,
  `site_url` varchar(100) NOT NULL,
  `keywords` text NOT NULL,
  `desc` text NOT NULL,
  `site_email` varchar(100) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `sandbox` tinyint(1) NOT NULL,
  `reg_verify` tinyint(1) NOT NULL default '0',
  `reg_allowed` tinyint(1) NOT NULL default '1',
  `user_limit` varchar(5) NOT NULL default '0',
  `currency` varchar(3) NOT NULL,
  `cur_symbol` varchar(5) NOT NULL,
  `captcha` tinyint(1) NOT NULL default '1',
  `version` varchar(5) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`site_name`, `site_slogan`, `site_url`, `keywords`, `desc`, `site_email`, `paypal_id`, `sandbox`, `reg_verify`, `reg_allowed`, `user_limit`, `currency`, `cur_symbol`, `captcha`, `version`) VALUES
('Confor.ca', 'Video conference', 'http://localhost/confor', 'site keywords,separated,by,coma', 'Meta Description', 'yoursite@email.com', 'paypal@youremail.com', 1, 1, 1, '0', 'USD', '$', 1, 'v.1.0');

-- --------------------------------------------------------

--
-- Table structure for table `shop_adminnotification_inbox`
--

CREATE TABLE IF NOT EXISTS `shop_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL auto_increment,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `is_remove` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `shop_adminnotification_inbox`
--

INSERT INTO `shop_adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 4, '2008-07-25 01:24:40', 'Magento 1.1 Production Version Now Available', 'We are thrilled to announce the availability of the production release of Magento 1.1. Read more about the release in the Magento Blog.', 'http://www.magentocommerce.com/blog/comments/magento-11-is-here-1/', 0, 1),
(2, 4, '2008-08-02 01:30:16', 'Updated iPhone Theme is now available', 'Updated iPhone theme for Magento 1.1 is now available on Magento Connect and for upgrade through your Magento Connect Manager.', 'http://www.magentocommerce.com/blog/comments/updated-iphone-theme-for-magento-11-is-now-available/', 0, 1),
(3, 3, '2008-08-02 01:40:27', 'Magento version 1.1.2 is now available', 'Magento version 1.1.2 is now available for download and upgrade.', 'http://www.magentocommerce.com/blog/comments/magento-version-112-is-now-available/', 0, 1),
(4, 3, '2008-08-13 17:51:46', 'Magento version 1.1.3 is now available', 'Magento version 1.1.3 is now available', 'http://www.magentocommerce.com/blog/comments/magento-version-113-is-now-available/', 0, 1),
(5, 1, '2008-09-02 21:10:31', 'Magento Version 1.1.4 Security Update Now Available', 'Magento 1.1.4 Security Update Now Available. If you are using Magento version 1.1.x, we highly recommend upgrading to this version as soon as possible.', 'http://www.magentocommerce.com/blog/comments/magento-version-114-security-update/', 0, 1),
(6, 3, '2008-09-15 22:09:54', 'Magento version 1.1.5 Now Available', 'Magento version 1.1.5 Now Available.\n\nThis release includes many bug fixes, a new category manager and a new skin for the default Magento theme.', 'http://www.magentocommerce.com/blog/comments/magento-version-115-now-available/', 0, 1),
(7, 3, '2008-09-17 20:18:35', 'Magento version 1.1.6 Now Available', 'Magento version 1.1.6 Now Available.\n\nThis version includes bug fixes for Magento 1.1.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-116-now-available/', 0, 1),
(8, 4, '2008-11-07 23:46:42', 'Reminder: Change Magento`s default phone numbers and callouts before site launch', 'Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.', '', 0, 1),
(9, 3, '2008-11-20 01:31:12', 'Magento version 1.1.7 Now Available', 'Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option', 'http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/', 0, 1),
(10, 3, '2008-11-26 21:24:50', 'Magento Version 1.1.8 Now Available', 'Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/', 0, 1),
(11, 3, '2008-12-30 07:45:59', 'Magento version 1.2.0 is now available for download and upgrade', 'We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2', 'http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/', 0, 1),
(12, 2, '2008-12-30 21:59:22', 'Magento version 1.2.0.1 now available', 'Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-1201-available/', 0, 1),
(13, 2, '2009-01-12 20:41:49', 'Magento version 1.2.0.2 now available', 'Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/', 0, 1),
(14, 3, '2009-01-24 00:25:56', 'Magento version 1.2.0.3 now available', 'Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/', 0, 1),
(15, 3, '2009-02-02 21:57:00', 'Magento version 1.2.1 is now available for download and upgrade', 'We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/', 0, 1),
(16, 3, '2009-02-24 00:45:47', 'Magento version 1.2.1.1 now available', 'Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/', 0, 1),
(17, 3, '2009-02-27 01:39:24', 'CSRF Attack Prevention', 'We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/', 'http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/', 0, 1),
(18, 2, '2009-03-03 23:03:58', 'Magento version 1.2.1.2 now available', 'Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/', 0, 1),
(19, 3, '2009-03-31 02:22:40', 'Magento version 1.3.0 now available', 'Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/', 0, 1),
(20, 3, '2009-04-18 04:06:02', 'Magento version 1.3.1 now available', 'Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/', 0, 1),
(21, 3, '2009-05-19 22:31:21', 'Magento version 1.3.1.1 now available', 'Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.', 'http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/', 0, 1),
(22, 3, '2009-05-29 22:54:06', 'Magento version 1.3.2 now available', 'This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.', 'http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/', 0, 1),
(23, 3, '2009-06-01 19:32:52', 'Magento version 1.3.2.1 now available', 'Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.', 'http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/', 0, 1),
(24, 3, '2009-07-02 01:21:44', 'Magento version 1.3.2.2 now available', 'Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/', 0, 1),
(25, 3, '2009-07-23 06:48:54', 'Magento version 1.3.2.3 now available', 'Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/', 0, 1),
(26, 4, '2009-08-28 18:26:28', 'PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.', 'If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URL‘s in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes', 'http://www.magentocommerce.com/wiki/paypal_payflow_changes', 0, 1),
(27, 2, '2009-09-23 20:16:49', 'Magento Version 1.3.2.4 Security Update', 'Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.', 'http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/', 0, 1),
(28, 4, '2009-09-25 14:57:54', 'Magento Preview Version 1.4.0.0-alpha2 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/', 0, 1),
(29, 4, '2009-10-07 00:55:40', 'Magento Preview Version 1.4.0.0-alpha3 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/', 0, 1),
(30, 4, '2009-12-08 23:30:36', 'Magento Preview Version 1.4.0.0-beta1 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/', 0, 1),
(31, 4, '2009-12-31 09:22:12', 'Magento Preview Version 1.4.0.0-rc1 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/', 0, 1),
(32, 4, '2010-02-13 03:39:53', 'Magento CE Version 1.4.0.0 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.', 'http://bit.ly/c53rpK', 0, 1),
(33, 3, '2010-02-20 02:39:36', 'Magento CE Version 1.4.0.1 Stable is now available', 'Magento CE 1.4.0.1 Stable is now available for upgrade and download.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/', 0, 1),
(34, 4, '2010-04-23 20:09:03', 'Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure', 'Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.', 'http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/', 0, 1),
(35, 4, '2010-05-31 17:20:21', 'Announcing the Launch of Magento Mobile', 'The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with Magento’s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.', 'http://www.magentocommerce.com/product/mobile', 0, 1),
(36, 4, '2010-06-10 20:08:08', 'Magento CE Version 1.4.1.0 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_admin_assert`
--

CREATE TABLE IF NOT EXISTS `shop_admin_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_admin_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_admin_role`
--

CREATE TABLE IF NOT EXISTS `shop_admin_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ACL Roles' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_admin_role`
--

INSERT INTO `shop_admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, 'Administrators'),
(3, 1, 2, 0, 'U', 1, 'Quy Duong');

-- --------------------------------------------------------

--
-- Table structure for table `shop_admin_rule`
--

CREATE TABLE IF NOT EXISTS `shop_admin_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ACL Rules' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_admin_rule`
--

INSERT INTO `shop_admin_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `assert_id`, `role_type`, `permission`) VALUES
(1, 1, 'all', '', 0, 'G', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `shop_admin_user`
--

CREATE TABLE IF NOT EXISTS `shop_admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `logdate` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  `extra` text,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_admin_user`
--

INSERT INTO `shop_admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`) VALUES
(1, 'Quy Duong', 'Bui', 'buiquyduong@xemmex.net', 'duong', '65768c5d5c29cc4e4a4281322cec15d5:VZ', '2010-06-26 12:04:35', '2010-06-26 12:04:35', '2010-06-26 16:54:54', 2, 0, 1, 'a:1:{s:11:"configState";a:7:{s:14:"design_package";s:1:"0";s:12:"design_theme";s:1:"1";s:11:"design_head";s:1:"1";s:13:"design_header";s:1:"1";s:13:"design_footer";s:1:"0";s:16:"design_watermark";s:1:"0";s:17:"design_pagination";s:1:"0";}}');

-- --------------------------------------------------------

--
-- Table structure for table `shop_api_assert`
--

CREATE TABLE IF NOT EXISTS `shop_api_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_api_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_api_role`
--

CREATE TABLE IF NOT EXISTS `shop_api_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_api_role`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_api_rule`
--

CREATE TABLE IF NOT EXISTS `shop_api_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_api_rule`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_api_session`
--

CREATE TABLE IF NOT EXISTS `shop_api_session` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `logdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `sessid` varchar(40) NOT NULL default '',
  KEY `API_SESSION_USER` (`user_id`),
  KEY `API_SESSION_SESSID` (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';

--
-- Dumping data for table `shop_api_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_api_user`
--

CREATE TABLE IF NOT EXISTS `shop_api_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `api_key` varchar(40) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_api_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_aggregation`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) default NULL,
  `data` mediumtext,
  PRIMARY KEY  (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogindex_aggregation`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_aggregation_tag`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL auto_increment,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogindex_aggregation_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_aggregation_to_tag`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogindex_aggregation_to_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_eav`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogindex_eav`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_minimal_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogindex_minimal_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogindex_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogindex_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_cataloginventory_stock`
--

CREATE TABLE IF NOT EXISTS `shop_cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL auto_increment,
  `stock_name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_cataloginventory_stock`
--

INSERT INTO `shop_cataloginventory_stock` (`stock_id`, `stock_name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `shop_cataloginventory_stock_item`
--

CREATE TABLE IF NOT EXISTS `shop_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `stock_id` smallint(4) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `min_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL default '0',
  `backorders` tinyint(3) unsigned NOT NULL default '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL default '1',
  `min_sale_qty` decimal(12,4) NOT NULL default '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `max_sale_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL default '0',
  `low_stock_date` datetime default NULL,
  `notify_stock_qty` decimal(12,4) default NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL default '1',
  `manage_stock` tinyint(1) unsigned NOT NULL default '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL default '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inventory Stock Item Data' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_cataloginventory_stock_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_cataloginventory_stock_status`
--

CREATE TABLE IF NOT EXISTS `shop_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_cataloginventory_stock_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogrule`
--

CREATE TABLE IF NOT EXISTS `shop_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default NULL,
  `to_date` date default NULL,
  `customer_group_ids` varchar(255) NOT NULL default '',
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogrule_affected_product`
--

CREATE TABLE IF NOT EXISTS `shop_catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogrule_affected_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogrule_group_website`
--

CREATE TABLE IF NOT EXISTS `shop_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rule_id`,`customer_group_id`,`website_id`),
  KEY `rule_id` (`rule_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `shop_catalogrule_group_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogrule_product`
--

CREATE TABLE IF NOT EXISTS `shop_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `from_time` int(10) unsigned NOT NULL default '0',
  `to_time` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL default 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL default '0.0000',
  `action_stop` tinyint(1) NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_product_id`),
  UNIQUE KEY `sort_order` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogrule_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogrule_product_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL auto_increment,
  `rule_date` date NOT NULL default '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `rule_price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date default NULL,
  `earliest_end_date` date default NULL,
  PRIMARY KEY  (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogrule_product_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogsearch_fulltext`
--

CREATE TABLE IF NOT EXISTS `shop_catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogsearch_fulltext`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogsearch_query`
--

CREATE TABLE IF NOT EXISTS `shop_catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL auto_increment,
  `query_text` varchar(255) NOT NULL default '',
  `num_results` int(10) unsigned NOT NULL default '0',
  `popularity` int(10) unsigned NOT NULL default '0',
  `redirect` varchar(255) NOT NULL default '',
  `synonym_for` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `display_in_terms` tinyint(1) NOT NULL default '1',
  `is_active` tinyint(1) default '1',
  `is_processed` tinyint(1) default '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalogsearch_query`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalogsearch_result`
--

CREATE TABLE IF NOT EXISTS `shop_catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalogsearch_result`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Category Entities' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_catalog_category_entity`
--

INSERT INTO `shop_catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, 0, '0000-00-00 00:00:00', '2010-06-26 12:03:08', '1', 0, 0, 1),
(2, 3, 3, 1, '2010-06-26 12:03:08', '2010-06-26 12:03:08', '1/2', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_category_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_category_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_catalog_category_entity_int`
--

INSERT INTO `shop_catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 34, 0, 2, 1),
(2, 3, 34, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shop_catalog_category_entity_text`
--

INSERT INTO `shop_catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 58, 0, 1, ''),
(2, 3, 58, 1, 1, ''),
(3, 3, 58, 0, 2, ''),
(4, 3, 58, 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` USING BTREE (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `shop_catalog_category_entity_varchar`
--

INSERT INTO `shop_catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 33, 0, 1, 'Root Catalog'),
(2, 3, 33, 1, 1, 'Root Catalog'),
(3, 3, 35, 0, 1, 'root-catalog'),
(4, 3, 33, 0, 2, 'Default Category'),
(5, 3, 33, 1, 2, 'Default Category'),
(6, 3, 41, 1, 2, 'PRODUCTS'),
(7, 3, 35, 0, 2, 'default-category');

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_product`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) NOT NULL default '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_category_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_category_product_index`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) NOT NULL default '0',
  `is_parent` tinyint(1) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_category_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_compare_item`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL auto_increment,
  `visitor_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(11) unsigned default NULL,
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_compare_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `frontend_input_renderer` varchar(255) default NULL,
  `is_global` tinyint(1) unsigned NOT NULL default '1',
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `is_searchable` tinyint(1) unsigned NOT NULL default '0',
  `is_filterable` tinyint(1) unsigned NOT NULL default '0',
  `is_comparable` tinyint(1) unsigned NOT NULL default '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `is_html_allowed_on_front` tinyint(1) unsigned NOT NULL default '0',
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL default '0',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL default '0',
  `used_in_product_listing` tinyint(1) unsigned NOT NULL default '0',
  `used_for_sort_by` tinyint(1) unsigned NOT NULL default '0',
  `is_configurable` tinyint(1) unsigned NOT NULL default '1',
  `apply_to` varchar(255) NOT NULL,
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL default '0',
  `position` int(11) NOT NULL,
  `is_wysiwyg_enabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attribute_id`),
  KEY `IDX_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=507 ;

--
-- Dumping data for table `shop_catalog_eav_attribute`
--

INSERT INTO `shop_catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`) VALUES
(33, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(34, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(35, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(36, '', 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, '', 0, 0, 1),
(37, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(38, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(39, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(40, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(41, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(42, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(43, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(44, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(45, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(46, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(47, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(48, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(49, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(50, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(51, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(52, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(53, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(54, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(55, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(56, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(57, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(58, 'adminhtml/catalog_category_helper_sortby_available', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(59, 'adminhtml/catalog_category_helper_sortby_default', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(60, '', 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, '', 1, 0, 0),
(61, '', 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, '', 1, 0, 1),
(62, '', 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, '', 1, 0, 1),
(63, '', 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, '', 1, 0, 0),
(64, '', 2, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0),
(65, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(66, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(67, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(68, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,virtual,downloadable', 0, 0, 0),
(69, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,bundle', 0, 0, 0),
(70, '', 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 'simple', 1, 0, 0),
(71, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(72, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(73, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(74, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(75, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(76, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(77, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(78, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(79, '', 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(80, '', 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 'simple', 1, 0, 0),
(81, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(82, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(83, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(84, '', 2, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(85, '', 2, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0),
(86, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(87, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(88, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(89, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(90, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(91, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(92, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(93, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(94, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(95, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(96, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(97, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(98, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(99, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(100, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(101, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(102, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(103, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(477, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 0, 0, 0),
(497, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(498, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(499, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'bundle', 0, 0, 0),
(500, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(501, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(502, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(503, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(504, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(505, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(506, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'downloadable', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_bundle_option`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL default '0',
  `position` int(10) unsigned NOT NULL default '0',
  `type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Options' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_bundle_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_bundle_option_value`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_bundle_option_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_bundle_price_index`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `min_price` decimal(12,4) NOT NULL,
  `max_price` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_bundle_price_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_bundle_selection`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_value` decimal(12,4) NOT NULL default '0.0000',
  `selection_qty` decimal(12,4) NOT NULL default '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_bundle_selection`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_bundle_stock_index`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `stock_status` tinyint(1) default '0',
  PRIMARY KEY  (`entity_id`,`stock_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_bundle_stock_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_enabled_index`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` smallint(5) unsigned NOT NULL default '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_enabled_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `sku` varchar(64) default NULL,
  `has_options` smallint(1) NOT NULL default '0',
  `required_options` tinyint(1) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Entities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_gallery`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_media_gallery`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_media_gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_media_gallery_value`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `label` varchar(255) default NULL,
  `position` int(11) unsigned default NULL,
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';

--
-- Dumping data for table `shop_catalog_product_entity_media_gallery_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_tier_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `all_groups` tinyint(1) unsigned NOT NULL default '1',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '1.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_TIER_PRICE` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_index_eav`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_index_eav`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_index_eav_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_index_eav_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_index_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `final_price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_index_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_index_tier_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_index_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_index_website`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL,
  `date` date default NULL,
  `rate` float(12,4) unsigned default '1.0000',
  PRIMARY KEY  (`website_id`),
  KEY `IDX_DATE` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_catalog_product_index_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `linked_product_id` int(10) unsigned NOT NULL default '0',
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related products' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL auto_increment,
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  `product_link_attribute_code` varchar(32) NOT NULL default '',
  `data_type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attributes for product link' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `shop_catalog_product_link_attribute`
--

INSERT INTO `shop_catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 2, 'qty', 'decimal'),
(2, 1, 'position', 'int'),
(3, 4, 'position', 'int'),
(4, 5, 'position', 'int'),
(6, 1, 'qty', 'decimal'),
(7, 3, 'position', 'int'),
(8, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link_attribute_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_link_attribute_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link_attribute_int`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_link_attribute_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link_attribute_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL default '0',
  `link_id` int(11) unsigned default NULL,
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_link_attribute_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_link_type`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `shop_catalog_product_link_type`
--

INSERT INTO `shop_catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(2, 'bundle'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `is_require` tinyint(1) NOT NULL default '1',
  `sku` varchar(64) NOT NULL default '',
  `max_characters` int(10) unsigned default NULL,
  `file_extension` varchar(50) default NULL,
  `image_size_x` smallint(5) unsigned NOT NULL,
  `image_size_y` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_price_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option_title`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_title_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option_type_price`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_type_price_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option_type_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option_type_title`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_type_title_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option_type_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_option_type_value`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `sku` varchar(64) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_option_type_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_relation`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`parent_id`,`child_id`),
  KEY `IDX_CHILD` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `shop_catalog_product_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_super_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `position` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`product_super_attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_super_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_super_attribute_label`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `use_default` tinyint(1) unsigned default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_STORE` (`product_super_attribute_id`,`store_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_super_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_super_attribute_pricing`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `value_index` varchar(255) NOT NULL default '',
  `is_percent` tinyint(1) unsigned default '0',
  `pricing_value` decimal(10,4) default NULL,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_super_attribute_pricing`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_super_link`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_super_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_catalog_product_website`
--

CREATE TABLE IF NOT EXISTS `shop_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_catalog_product_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_checkout_agreement`
--

CREATE TABLE IF NOT EXISTS `shop_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `content_height` varchar(25) default NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL default '0',
  `is_html` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_checkout_agreement`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_checkout_agreement_store`
--

CREATE TABLE IF NOT EXISTS `shop_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_checkout_agreement_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_cms_block`
--

CREATE TABLE IF NOT EXISTS `shop_cms_block` (
  `block_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `identifier` varchar(255) NOT NULL default '',
  `content` mediumtext,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Blocks' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `shop_cms_block`
--

INSERT INTO `shop_cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(5, 'Footer Links', 'footer_links', '<ul>\r\n<li><a href="{{store direct_url="about-magento-demo-store"}}">About Us</a></li>\r\n<li class="last"><a href="{{store direct_url="customer-service"}}">Customer Service</a></li>\r\n</ul>', '2010-06-26 08:03:06', '2010-06-26 08:03:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_cms_block_store`
--

CREATE TABLE IF NOT EXISTS `shop_cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';

--
-- Dumping data for table `shop_cms_block_store`
--

INSERT INTO `shop_cms_block_store` (`block_id`, `store_id`) VALUES
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_cms_page`
--

CREATE TABLE IF NOT EXISTS `shop_cms_page` (
  `page_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `root_template` varchar(255) NOT NULL default '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL default '',
  `content_heading` varchar(255) NOT NULL default '',
  `content` mediumtext,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  `sort_order` tinyint(4) NOT NULL default '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) default NULL,
  `custom_root_template` varchar(255) NOT NULL default '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date default NULL,
  `custom_theme_to` date default NULL,
  PRIMARY KEY  (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS pages' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `shop_cms_page`
--

INSERT INTO `shop_cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(1, '404 Not Found 1', 'two_columns_right', 'Page keywords', 'Page description', 'no-route', '', '<div class="page-title"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class="disc">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class="disc">\r\n<li><a href="#" onclick="history.go(-1); return false;">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href="{{store url=""}}">Store Home</a> <span class="separator">|</span> <a href="{{store url="customer/account"}}">My Account</a></li></ul></dd></dl>\r\n', '2007-06-20 18:38:32', '2007-08-26 19:11:13', 1, 0, NULL, NULL, '', NULL, NULL, NULL),
(2, 'Home page', 'two_columns_right', '', '', 'home', '', '<div class="page-title"><h2>Home Page</h2></div>\r\n', '2007-08-23 10:03:25', '2007-09-06 13:26:53', 1, 0, '<!--<reference name="content">\n<block type="catalog/product_new" name="home.catalog.product.new" alias="product_new" template="catalog/product/new.phtml" after="cms_page"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n<block type="reports/product_viewed" name="home.reports.product.viewed" alias="product_viewed" template="reports/home_product_viewed.phtml" after="product_new"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n<block type="reports/product_compared" name="home.reports.product.compared" template="reports/home_product_compared.phtml" after="product_viewed"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n</reference><reference name="right">\n<action method="unsetChild"><alias>right.reports.product.viewed</alias></action>\n<action method="unsetChild"><alias>right.reports.product.compared</alias></action>\n</reference>-->', NULL, '', NULL, NULL, NULL),
(3, 'About  Us', 'one_column', '', '', 'about-magento-demo-store', '', '<div class="page-title">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class="col3-set">\r\n<div class="col-1"><p><a href="http://www.varien.com/"><img src="{{skin url=''images/media/about_us_img.jpg''}}" title="Varien" alt="Varien" /></a></p><p style="line-height:1.2em;"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style="color:#888; font:1.2em/1.4em georgia, serif;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class="col-2">\r\n<p><strong style="color:#de036f;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class="col-3">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style="color:#de036f;">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class="divider"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style="line-height:1.2em;"><strong style="font:italic 2em Georgia, serif;">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>', '2007-08-30 14:01:18', '2007-08-30 14:01:18', 1, 0, NULL, NULL, '', NULL, NULL, NULL),
(4, 'Customer Service', 'three_columns', '', '', 'customer-service', '', '<div class="page-title">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class="disc">\r\n<li><a href="#answer1">Shipping &amp; Delivery</a></li>\r\n<li><a href="#answer2">Privacy &amp; Security</a></li>\r\n<li><a href="#answer3">Returns &amp; Replacements</a></li>\r\n<li><a href="#answer4">Ordering</a></li>\r\n<li><a href="#answer5">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href="#answer6">Viewing Orders</a></li>\r\n<li><a href="#answer7">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id="answer1">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer2">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer3">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer4">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer5">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer6">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer7">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>', '2007-08-30 14:02:20', '2007-08-30 14:03:37', 1, 0, NULL, NULL, '', NULL, NULL, NULL),
(5, 'Enable Cookies', 'one_column', '', '', 'enable-cookies', '', '<div class="std">\r\n    <ul class="messages">\r\n        <li class="notice-msg">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class="page-title">\r\n        <h1><a name="top"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class="subtitle">Enabling Cookies</h2>\r\n    <ul class="disc">\r\n        <li><a href="#ie7">Internet Explorer 7.x</a></li>\r\n        <li><a href="#ie6">Internet Explorer 6.x</a></li>\r\n        <li><a href="#firefox">Mozilla/Firefox</a></li>\r\n        <li><a href="#opera">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name="ie7"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-2.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-3.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-4.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-5.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-6.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="ie6"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src="{{skin url="images/cookies/ie6-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie6-2.gif"}}" alt="" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="firefox"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/firefox.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="opera"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/opera.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n</div>\r\n', '2010-06-26 12:03:06', '2010-06-26 12:03:06', 1, 0, NULL, NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_cms_page_store`
--

CREATE TABLE IF NOT EXISTS `shop_cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';

--
-- Dumping data for table `shop_cms_page_store`
--

INSERT INTO `shop_cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_cache`
--

CREATE TABLE IF NOT EXISTS `shop_core_cache` (
  `id` varchar(255) NOT NULL,
  `data` mediumblob,
  `create_time` int(11) default NULL,
  `update_time` int(11) default NULL,
  `expire_time` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `IDX_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_core_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_cache_option`
--

CREATE TABLE IF NOT EXISTS `shop_core_cache_option` (
  `code` varchar(32) NOT NULL,
  `value` tinyint(3) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_core_cache_option`
--

INSERT INTO `shop_core_cache_option` (`code`, `value`) VALUES
('block_html', 1),
('collections', 1),
('config', 1),
('config_api', 1),
('eav', 1),
('layout', 1),
('translate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_cache_tag`
--

CREATE TABLE IF NOT EXISTS `shop_core_cache_tag` (
  `tag` varchar(255) NOT NULL,
  `cache_id` varchar(255) NOT NULL,
  KEY `IDX_TAG` (`tag`),
  KEY `IDX_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_core_cache_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_config_data`
--

CREATE TABLE IF NOT EXISTS `shop_core_config_data` (
  `config_id` int(10) unsigned NOT NULL auto_increment,
  `scope` enum('default','websites','stores','config') NOT NULL default 'default',
  `scope_id` int(11) NOT NULL default '0',
  `path` varchar(255) NOT NULL default 'general',
  `value` text NOT NULL,
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `shop_core_config_data`
--

INSERT INTO `shop_core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'catalog/category/root_id', '2'),
(2, 'default', 0, 'web/unsecure/base_url', 'http://conferences-formations.com/shop/'),
(3, 'default', 0, 'web/secure/base_url', 'http://conferences-formations.com/shop/'),
(4, 'default', 0, 'general/locale/code', 'en_US'),
(5, 'default', 0, 'general/locale/timezone', 'America/Los_Angeles'),
(6, 'default', 0, 'currency/options/base', 'USD'),
(7, 'default', 0, 'currency/options/default', 'USD'),
(8, 'default', 0, 'currency/options/allow', 'USD'),
(9, 'default', 0, 'design/package/name', 'default'),
(10, 'default', 0, 'design/package/ua_regexp', 'a:0:{}'),
(11, 'default', 0, 'design/theme/locale', 'confor'),
(12, 'default', 0, 'design/theme/template', 'confor'),
(13, 'default', 0, 'design/theme/template_ua_regexp', 'a:0:{}'),
(14, 'default', 0, 'design/theme/skin', 'confor'),
(15, 'default', 0, 'design/theme/skin_ua_regexp', 'a:0:{}'),
(16, 'default', 0, 'design/theme/layout', 'confor'),
(17, 'default', 0, 'design/theme/layout_ua_regexp', 'a:0:{}'),
(18, 'default', 0, 'design/theme/default', 'confor'),
(19, 'default', 0, 'design/theme/default_ua_regexp', 'a:0:{}'),
(20, 'default', 0, 'design/head/default_title', 'Magento Commerce'),
(21, 'default', 0, 'design/head/title_prefix', ''),
(22, 'default', 0, 'design/head/title_suffix', ''),
(23, 'default', 0, 'design/head/default_description', 'Default Description'),
(24, 'default', 0, 'design/head/default_keywords', 'Magento, Varien, E-commerce'),
(25, 'default', 0, 'design/head/default_robots', 'INDEX,FOLLOW'),
(26, 'default', 0, 'design/head/includes', ''),
(27, 'default', 0, 'design/head/demonotice', '0'),
(28, 'default', 0, 'design/header/logo_src', 'images/logo.png'),
(29, 'default', 0, 'design/header/logo_alt', 'Conferences-formations.com'),
(30, 'default', 0, 'design/header/welcome', 'Welcome'),
(31, 'default', 0, 'design/footer/copyright', '&copy; 2008 Magento Demo Store. All Rights Reserved.'),
(32, 'default', 0, 'design/footer/absolute_footer', ''),
(33, 'default', 0, 'design/watermark/image_size', ''),
(34, 'default', 0, 'design/watermark/image_imageOpacity', ''),
(35, 'default', 0, 'design/watermark/image_position', 'stretch'),
(36, 'default', 0, 'design/watermark/small_image_size', ''),
(37, 'default', 0, 'design/watermark/small_image_imageOpacity', ''),
(38, 'default', 0, 'design/watermark/small_image_position', 'stretch'),
(39, 'default', 0, 'design/watermark/thumbnail_size', ''),
(40, 'default', 0, 'design/watermark/thumbnail_imageOpacity', ''),
(41, 'default', 0, 'design/watermark/thumbnail_position', 'stretch'),
(42, 'default', 0, 'design/pagination/pagination_frame', '5'),
(43, 'default', 0, 'design/pagination/pagination_frame_skip', ''),
(44, 'default', 0, 'design/pagination/anchor_text_for_previous', ''),
(45, 'default', 0, 'design/pagination/anchor_text_for_next', '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_email_template`
--

CREATE TABLE IF NOT EXISTS `shop_core_email_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_styles` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  `orig_template_code` varchar(200) default NULL,
  `orig_template_variables` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email templates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_email_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_flag`
--

CREATE TABLE IF NOT EXISTS `shop_core_flag` (
  `flag_id` int(10) unsigned NOT NULL auto_increment,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL default '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_core_flag`
--

INSERT INTO `shop_core_flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'admin_notification_survey', 0, 'a:1:{s:13:"survey_viewed";b:1;}', '2010-06-26 12:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_layout_link`
--

CREATE TABLE IF NOT EXISTS `shop_core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `area` varchar(64) NOT NULL default '',
  `package` varchar(64) NOT NULL default '',
  `theme` varchar(64) NOT NULL default '',
  `layout_update_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_layout_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_layout_update`
--

CREATE TABLE IF NOT EXISTS `shop_core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL auto_increment,
  `handle` varchar(255) default NULL,
  `xml` text,
  `sort_order` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_layout_update`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_resource`
--

CREATE TABLE IF NOT EXISTS `shop_core_resource` (
  `code` varchar(50) NOT NULL default '',
  `version` varchar(50) NOT NULL default '',
  `data_version` varchar(50) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';

--
-- Dumping data for table `shop_core_resource`
--

INSERT INTO `shop_core_resource` (`code`, `version`, `data_version`) VALUES
('adminnotification_setup', '1.0.0', '1.0.0'),
('admin_setup', '0.7.2', '0.7.2'),
('api_setup', '0.8.1', '0.8.1'),
('backup_setup', '0.7.0', '0.7.0'),
('bundle_setup', '0.1.11', '0.1.11'),
('catalogindex_setup', '0.7.10', '0.7.10'),
('cataloginventory_setup', '0.7.5', '0.7.5'),
('catalogrule_setup', '0.7.8', '0.7.8'),
('catalogsearch_setup', '0.7.7', '0.7.7'),
('catalog_setup', '1.4.0.0.21', '1.4.0.0.21'),
('checkout_setup', '0.9.5', '0.9.5'),
('cms_setup', '0.7.13', '0.7.13'),
('compiler_setup', '0.1.0', '0.1.0'),
('contacts_setup', '0.8.0', '0.8.0'),
('core_setup', '0.8.26', '0.8.26'),
('cron_setup', '0.7.1', '0.7.1'),
('customer_setup', '1.4.0.0.6', '1.4.0.0.6'),
('dataflow_setup', '0.7.4', '0.7.4'),
('directory_setup', '0.8.10', '0.8.10'),
('downloadable_setup', '0.1.16', '0.1.16'),
('eav_setup', '0.7.15', '0.7.15'),
('giftmessage_setup', '0.7.2', '0.7.2'),
('googlebase_setup', '0.1.1', '0.1.1'),
('googlecheckout_setup', '0.7.3', '0.7.3'),
('googleoptimizer_setup', '0.1.2', '0.1.2'),
('index_setup', '1.4.0.2', '1.4.0.2'),
('log_setup', '0.7.7', '0.7.7'),
('moneybookers_setup', '1.2', '1.2'),
('newsletter_setup', '0.8.2', '0.8.2'),
('paygate_setup', '0.7.1', '0.7.1'),
('payment_setup', '0.7.0', '0.7.0'),
('paypaluk_setup', '0.7.0', '0.7.0'),
('paypal_setup', '0.7.4', '0.7.4'),
('poll_setup', '0.7.2', '0.7.2'),
('productalert_setup', '0.7.2', '0.7.2'),
('rating_setup', '0.7.2', '0.7.2'),
('reports_setup', '0.7.10', '0.7.10'),
('review_setup', '0.7.6', '0.7.6'),
('salesrule_setup', '0.7.12', '0.7.12'),
('sales_setup', '0.9.56', '0.9.56'),
('sendfriend_setup', '0.7.4', '0.7.4'),
('shipping_setup', '0.7.0', '0.7.0'),
('sitemap_setup', '0.7.2', '0.7.2'),
('tag_setup', '0.7.5', '0.7.5'),
('tax_setup', '0.7.11', '0.7.11'),
('usa_setup', '0.7.1', '0.7.1'),
('weee_setup', '0.13', '0.13'),
('widget_setup', '1.4.0.0.0', '1.4.0.0.0'),
('wishlist_setup', '0.7.7', '0.7.7');

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_session`
--

CREATE TABLE IF NOT EXISTS `shop_core_session` (
  `session_id` varchar(255) NOT NULL default '',
  `website_id` smallint(5) unsigned default NULL,
  `session_expires` int(10) unsigned NOT NULL default '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY  (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';

--
-- Dumping data for table `shop_core_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_store`
--

CREATE TABLE IF NOT EXISTS `shop_core_store` (
  `store_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `website_id` smallint(5) unsigned default '0',
  `group_id` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `is_active` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_core_store`
--

INSERT INTO `shop_core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_store_group`
--

CREATE TABLE IF NOT EXISTS `shop_core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL default '0',
  `default_store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_core_store_group`
--

INSERT INTO `shop_core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES
(0, 0, 'Default', 0, 0),
(1, 1, 'Main Website Store', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_core_translate`
--

CREATE TABLE IF NOT EXISTS `shop_core_translate` (
  `key_id` int(10) unsigned NOT NULL auto_increment,
  `string` varchar(255) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `translate` varchar(255) NOT NULL default '',
  `locale` varchar(20) NOT NULL default 'en_US',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translation data' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_translate`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_url_rewrite`
--

CREATE TABLE IF NOT EXISTS `shop_core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `category_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `id_path` varchar(255) NOT NULL default '',
  `request_path` varchar(255) NOT NULL default '',
  `target_path` varchar(255) NOT NULL default '',
  `is_system` tinyint(1) unsigned default '1',
  `options` varchar(255) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_PATH` (`id_path`,`is_system`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `IDX_TARGET_PATH` (`target_path`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_url_rewrite`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_variable`
--

CREATE TABLE IF NOT EXISTS `shop_core_variable` (
  `variable_id` int(11) unsigned NOT NULL auto_increment,
  `code` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`variable_id`),
  UNIQUE KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_variable`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_variable_value`
--

CREATE TABLE IF NOT EXISTS `shop_core_variable_value` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `variable_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `plain_value` text NOT NULL,
  `html_value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_VARIABLE_STORE` (`variable_id`,`store_id`),
  KEY `IDX_VARIABLE_ID` (`variable_id`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_core_variable_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_core_website`
--

CREATE TABLE IF NOT EXISTS `shop_core_website` (
  `website_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `default_group_id` smallint(5) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Websites' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_core_website`
--

INSERT INTO `shop_core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_coupon_aggregated`
--

CREATE TABLE IF NOT EXISTS `shop_coupon_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `coupon_code` varchar(50) NOT NULL default '',
  `coupon_uses` int(11) NOT NULL default '0',
  `subtotal_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_amount` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_coupon_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_coupon_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `shop_coupon_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `coupon_code` varchar(50) NOT NULL default '',
  `coupon_uses` int(11) NOT NULL default '0',
  `subtotal_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_amount` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_ORDER_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_coupon_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_cron_schedule`
--

CREATE TABLE IF NOT EXISTS `shop_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL auto_increment,
  `job_code` varchar(255) NOT NULL default '0',
  `status` enum('pending','running','success','missed','error') NOT NULL default 'pending',
  `messages` text,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_cron_schedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_address_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_address_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `input_filter` varchar(255) NOT NULL,
  `lines_to_divide_multiline` smallint(5) unsigned NOT NULL default '0',
  `min_text_length` int(11) unsigned NOT NULL default '0',
  `max_text_length` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `shop_customer_eav_attribute`
--

INSERT INTO `shop_customer_eav_attribute` (`attribute_id`, `is_visible`, `is_visible_on_front`, `input_filter`, `lines_to_divide_multiline`, `min_text_length`, `max_text_length`) VALUES
(1, 1, 0, '', 0, 0, 0),
(2, 0, 0, '', 0, 0, 0),
(3, 1, 0, '', 0, 0, 0),
(4, 1, 0, '', 0, 0, 0),
(5, 1, 0, '', 0, 0, 0),
(6, 1, 0, '', 0, 0, 0),
(7, 1, 0, '', 0, 0, 0),
(8, 1, 0, '', 0, 0, 0),
(9, 1, 0, '', 0, 0, 0),
(10, 1, 0, '', 0, 0, 0),
(11, 1, 0, '', 0, 0, 0),
(12, 1, 0, '', 0, 0, 0),
(13, 0, 0, '', 0, 0, 0),
(14, 0, 0, '', 0, 0, 0),
(15, 1, 0, '', 0, 0, 0),
(16, 0, 0, '', 0, 0, 0),
(17, 0, 0, '', 0, 0, 0),
(18, 1, 0, '', 0, 0, 0),
(19, 1, 0, '', 0, 0, 0),
(20, 1, 0, '', 0, 0, 0),
(21, 1, 0, '', 0, 0, 0),
(22, 1, 0, '', 0, 0, 0),
(23, 1, 0, '', 0, 0, 0),
(24, 1, 0, '', 0, 0, 0),
(25, 1, 0, '', 0, 0, 0),
(26, 1, 0, '', 0, 0, 0),
(27, 1, 0, '', 0, 0, 0),
(28, 1, 0, '', 0, 0, 0),
(29, 1, 0, '', 0, 0, 0),
(30, 1, 0, '', 0, 0, 0),
(31, 1, 0, '', 0, 0, 0),
(32, 1, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `email` varchar(255) NOT NULL default '',
  `group_id` smallint(3) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Entityies' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_customer_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_customer_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_customer_group`
--

CREATE TABLE IF NOT EXISTS `shop_customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL auto_increment,
  `customer_group_code` varchar(32) NOT NULL default '',
  `tax_class_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer groups' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_customer_group`
--

INSERT INTO `shop_customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_batch`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `adapter` varchar(128) default NULL,
  `params` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_batch`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_batch_export`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_batch_export`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_batch_import`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_batch_import`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_import_data`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_import_data` (
  `import_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) default NULL,
  `serial_number` int(11) NOT NULL default '0',
  `value` text,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_import_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_profile`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') default NULL,
  `entity_type` varchar(64) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `data_transfer` enum('file','interactive') default NULL,
  PRIMARY KEY  (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `shop_dataflow_profile`
--

INSERT INTO `shop_dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES
(1, 'Export All Products', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="catalog/convert_adapter_product" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="catalog/convert_parser_product" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_all_products.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file'),
(2, 'Export Product Stocks', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="catalog/convert_adapter_product" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="catalog/convert_parser_product" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n    <var name="map">\r\n        <map name="store"><![CDATA[store]]></map>\r\n        <map name="sku"><![CDATA[sku]]></map>\r\n        <map name="qty"><![CDATA[qty]]></map>\r\n        <map name="is_in_stock"><![CDATA[is_in_stock]]></map>\r\n    </var>\r\n    <var name="_only_specified">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_product_stocks.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:25:"export_product_stocks.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:4:"true";s:7:"product";a:2:{s:2:"db";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}s:4:"file";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file'),
(3, 'Import All Products', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">catalog/convert_adapter_product</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive'),
(4, 'Import Product Stocks', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">catalog/convert_adapter_product</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:18:"export_product.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive'),
(5, 'Export Customers', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="customer/convert_adapter_customer" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="filter/adressType"><![CDATA[default_billing]]></var>\r\n</action>\r\n\r\n<action type="customer/convert_parser_customer" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_customers.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:20:"export_customers.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'customer', 0, 'file'),
(6, 'Import Customers', '2010-06-26 08:03:06', '2010-06-26 08:03:06', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">customer/convert_adapter_customer</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:19:"export_customer.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'customer', 0, 'interactive');

-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_profile_history`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `action_code` varchar(64) default NULL,
  `user_id` int(10) unsigned NOT NULL default '0',
  `performed_at` datetime default NULL,
  PRIMARY KEY  (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_profile_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_dataflow_session`
--

CREATE TABLE IF NOT EXISTS `shop_dataflow_session` (
  `session_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `created_date` datetime default NULL,
  `file` varchar(255) default NULL,
  `type` varchar(32) default NULL,
  `direction` varchar(32) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_dataflow_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_design_change`
--

CREATE TABLE IF NOT EXISTS `shop_design_change` (
  `design_change_id` int(11) NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `design` varchar(255) NOT NULL default '',
  `date_from` date default NULL,
  `date_to` date default NULL,
  PRIMARY KEY  (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_design_change`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_directory_country`
--

CREATE TABLE IF NOT EXISTS `shop_directory_country` (
  `country_id` varchar(2) NOT NULL default '',
  `iso2_code` varchar(2) NOT NULL default '',
  `iso3_code` varchar(3) NOT NULL default '',
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';

--
-- Dumping data for table `shop_directory_country`
--

INSERT INTO `shop_directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PR', 'PR', 'PRI'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `shop_directory_country_format`
--

CREATE TABLE IF NOT EXISTS `shop_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL auto_increment,
  `country_id` varchar(2) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `format` text NOT NULL,
  PRIMARY KEY  (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_directory_country_format`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_directory_country_region`
--

CREATE TABLE IF NOT EXISTS `shop_directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL auto_increment,
  `country_id` varchar(4) NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `default_name` varchar(255) default NULL,
  PRIMARY KEY  (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Country regions' AUTO_INCREMENT=320 ;

--
-- Dumping data for table `shop_directory_country_region`
--

INSERT INTO `shop_directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AF', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AC', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AM', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Voralberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '01', 'Ain'),
(183, 'FR', '02', 'Aisne'),
(184, 'FR', '03', 'Allier'),
(185, 'FR', '04', 'Alpes-de-Haute-Provence'),
(186, 'FR', '05', 'Hautes-Alpes'),
(187, 'FR', '06', 'Alpes-Maritimes'),
(188, 'FR', '07', 'Ardèche'),
(189, 'FR', '08', 'Ardennes'),
(190, 'FR', '09', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d''Or'),
(204, 'FR', '22', 'Côtes-d''Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d''Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea');

-- --------------------------------------------------------

--
-- Table structure for table `shop_directory_country_region_name`
--

CREATE TABLE IF NOT EXISTS `shop_directory_country_region_name` (
  `locale` varchar(8) NOT NULL default '',
  `region_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';

--
-- Dumping data for table `shop_directory_country_region_name`
--

INSERT INTO `shop_directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Voralberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d''Or'),
('en_US', 204, 'Côtes-d''Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d''Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea');

-- --------------------------------------------------------

--
-- Table structure for table `shop_directory_currency_rate`
--

CREATE TABLE IF NOT EXISTS `shop_directory_currency_rate` (
  `currency_from` char(3) NOT NULL default '',
  `currency_to` char(3) NOT NULL default '',
  `rate` decimal(24,12) NOT NULL default '0.000000000000',
  PRIMARY KEY  (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_directory_currency_rate`
--

INSERT INTO `shop_directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', 1.000000000000),
('EUR', 'USD', 1.415000000000),
('USD', 'EUR', 0.706700000000),
('USD', 'USD', 1.000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_link`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `number_of_downloads` int(10) unsigned default NULL,
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(20) NOT NULL default '',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_link_price`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_link_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_link_purchased`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `order_increment_id` varchar(50) NOT NULL default '',
  `order_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_name` varchar(255) NOT NULL default '',
  `product_sku` varchar(255) NOT NULL default '',
  `link_section_title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  KEY `KEY_DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_link_purchased`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_link_purchased_item`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `purchased_id` int(10) unsigned NOT NULL default '0',
  `order_item_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned default '0',
  `link_hash` varchar(255) NOT NULL default '',
  `number_of_downloads_bought` int(10) unsigned NOT NULL default '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL default '0',
  `link_id` int(20) unsigned NOT NULL default '0',
  `link_title` varchar(255) NOT NULL default '',
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(255) NOT NULL default '',
  `status` varchar(50) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADALBE_LINK_HASH` (`link_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_link_purchased_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_link_title`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  UNIQUE KEY `UNQ_LINK_TITLE_STORE` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_link_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_sample`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_sample`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_downloadable_sample_title`
--

CREATE TABLE IF NOT EXISTS `shop_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `sample_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  UNIQUE KEY `UNQ_SAMPLE_TITLE_STORE` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_downloadable_sample_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_code` varchar(255) NOT NULL default '',
  `attribute_model` varchar(255) default NULL,
  `backend_model` varchar(255) default NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL default 'static',
  `backend_table` varchar(255) default NULL,
  `frontend_model` varchar(255) default NULL,
  `frontend_input` varchar(50) default NULL,
  `frontend_label` varchar(255) default NULL,
  `frontend_class` varchar(255) default NULL,
  `source_model` varchar(255) default NULL,
  `is_required` tinyint(1) unsigned NOT NULL default '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL default '0',
  `default_value` text,
  `is_unique` tinyint(1) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY  (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  KEY `IDX_USED_FOR_SORT_BY` (`entity_type_id`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`entity_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=525 ;

--
-- Dumping data for table `shop_eav_attribute`
--

INSERT INTO `shop_eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'customer/customer_attribute_backend_website', 'static', '', '', 'select', 'Associate to Website', '', 'customer/customer_attribute_source_website', 1, 0, '', 0, ''),
(2, 1, 'store_id', NULL, 'customer/customer_attribute_backend_store', 'static', '', '', 'select', 'Create In', '', 'customer/customer_attribute_source_store', 1, 0, '', 0, ''),
(3, 1, 'created_in', NULL, '', 'varchar', '', '', 'text', 'Created From', '', '', 1, 0, '', 0, ''),
(4, 1, 'prefix', NULL, '', 'varchar', '', '', 'text', 'Prefix', '', '', 0, 0, '', 0, ''),
(5, 1, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(6, 1, 'middlename', NULL, '', 'varchar', '', '', 'text', 'Middle Name/Initial', '', '', 0, 0, '', 0, ''),
(7, 1, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(8, 1, 'suffix', NULL, '', 'varchar', '', '', 'text', 'Suffix', '', '', 0, 0, '', 0, ''),
(9, 1, 'email', NULL, '', 'static', '', '', 'text', 'Email', '', '', 1, 0, '', 0, ''),
(10, 1, 'group_id', NULL, '', 'static', '', '', 'select', 'Group', '', 'customer/customer_attribute_source_group', 1, 0, '', 0, ''),
(11, 1, 'dob', NULL, '', 'datetime', '', '', 'date', 'Date Of Birth', '', '', 0, 0, '', 0, ''),
(12, 1, 'password_hash', NULL, 'customer/customer_attribute_backend_password', 'varchar', '', '', 'hidden', '', '', '', 0, 0, '', 0, ''),
(13, 1, 'default_billing', NULL, 'customer/customer_attribute_backend_billing', 'int', '', '', 'text', 'Default Billing Address', '', '', 0, 0, '', 0, ''),
(14, 1, 'default_shipping', NULL, 'customer/customer_attribute_backend_shipping', 'int', '', '', 'text', 'Default Shipping Address', '', '', 0, 0, '', 0, ''),
(15, 1, 'taxvat', NULL, '', 'varchar', '', '', 'text', 'Tax/VAT Number', '', '', 0, 0, '', 0, ''),
(16, 1, 'confirmation', NULL, '', 'varchar', '', '', 'text', 'Is Confirmed', '', '', 0, 0, '', 0, ''),
(17, 1, 'created_at', NULL, '', 'static', '', '', 'date', 'Created At', '', '', 0, 0, '', 0, ''),
(18, 2, 'prefix', NULL, '', 'varchar', '', '', 'text', 'Prefix', '', '', 0, 0, '', 0, ''),
(19, 2, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(20, 2, 'middlename', NULL, '', 'varchar', '', '', 'text', 'Middle Name/Initial', '', '', 0, 0, '', 0, ''),
(21, 2, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(22, 2, 'suffix', NULL, '', 'varchar', '', '', 'text', 'Suffix', '', '', 0, 0, '', 0, ''),
(23, 2, 'company', NULL, '', 'varchar', '', '', 'text', 'Company', '', '', 0, 0, '', 0, ''),
(24, 2, 'street', NULL, 'customer_entity/address_attribute_backend_street', 'text', '', '', 'multiline', 'Street Address', '', '', 1, 0, '', 0, ''),
(25, 2, 'city', NULL, '', 'varchar', '', '', 'text', 'City', '', '', 1, 0, '', 0, ''),
(26, 2, 'country_id', NULL, '', 'varchar', '', '', 'select', 'Country', '', 'customer_entity/address_attribute_source_country', 1, 0, '', 0, ''),
(27, 2, 'region', NULL, 'customer_entity/address_attribute_backend_region', 'varchar', '', '', 'text', 'State/Province', '', '', 1, 0, '', 0, ''),
(28, 2, 'region_id', NULL, '', 'int', '', '', 'hidden', 'State/Province', '', 'customer_entity/address_attribute_source_region', 0, 0, '', 0, ''),
(29, 2, 'postcode', NULL, '', 'varchar', '', '', 'text', 'Zip/Postal Code', '', '', 1, 0, '', 0, ''),
(30, 2, 'telephone', NULL, '', 'varchar', '', '', 'text', 'Telephone', '', '', 1, 0, '', 0, ''),
(31, 2, 'fax', NULL, '', 'varchar', '', '', 'text', 'Fax', '', '', 0, 0, '', 0, ''),
(32, 1, 'gender', NULL, '', 'int', '', '', 'select', 'Gender', '', 'eav/entity_attribute_source_table', 0, 0, '', 0, ''),
(33, 3, 'name', NULL, '', 'varchar', '', '', 'text', 'Name', '', '', 1, 0, '', 0, ''),
(34, 3, 'is_active', NULL, '', 'int', '', '', 'select', 'Is Active', '', 'eav/entity_attribute_source_boolean', 1, 0, '', 0, ''),
(35, 3, 'url_key', NULL, 'catalog/category_attribute_backend_urlkey', 'varchar', '', '', 'text', 'URL key', '', '', 0, 0, '', 0, ''),
(36, 3, 'description', NULL, '', 'text', '', '', 'textarea', 'Description', '', '', 0, 0, '', 0, ''),
(37, 3, 'image', NULL, 'catalog/category_attribute_backend_image', 'varchar', '', '', 'image', 'Image', '', '', 0, 0, '', 0, ''),
(38, 3, 'meta_title', NULL, '', 'varchar', '', '', 'text', 'Page Title', '', '', 0, 0, '', 0, ''),
(39, 3, 'meta_keywords', NULL, '', 'text', '', '', 'textarea', 'Meta Keywords', '', '', 0, 0, '', 0, ''),
(40, 3, 'meta_description', NULL, '', 'text', '', '', 'textarea', 'Meta Description', '', '', 0, 0, '', 0, ''),
(41, 3, 'display_mode', NULL, '', 'varchar', '', '', 'select', 'Display Mode', '', 'catalog/category_attribute_source_mode', 0, 0, '', 0, ''),
(42, 3, 'landing_page', NULL, '', 'int', '', '', 'select', 'CMS Block', '', 'catalog/category_attribute_source_page', 0, 0, '', 0, ''),
(43, 3, 'is_anchor', NULL, '', 'int', '', '', 'select', 'Is Anchor', '', 'eav/entity_attribute_source_boolean', 0, 0, '', 0, ''),
(44, 3, 'path', NULL, '', 'static', '', '', '', 'Path', '', '', 0, 0, '', 0, ''),
(45, 3, 'position', NULL, '', 'static', '', '', '', 'Position', '', '', 0, 0, '', 0, ''),
(46, 3, 'all_children', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(47, 3, 'path_in_store', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(48, 3, 'children', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(49, 3, 'url_path', NULL, '', 'varchar', '', '', '', '', '', '', 0, 0, '', 0, ''),
(50, 3, 'custom_design', NULL, '', 'varchar', '', '', 'select', 'Custom Design', '', 'core/design_source_design', 0, 0, '', 0, ''),
(51, 3, 'custom_design_apply', NULL, '', 'int', '', '', 'select', 'Apply To', '', 'core/design_source_apply', 0, 0, '', 0, ''),
(52, 3, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active From', '', '', 0, 0, '', 0, ''),
(53, 3, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active To', '', '', 0, 0, '', 0, ''),
(54, 3, 'page_layout', NULL, '', 'varchar', '', '', 'select', 'Page Layout', '', 'catalog/category_attribute_source_layout', 0, 0, '', 0, ''),
(55, 3, 'custom_layout_update', NULL, '', 'text', '', '', 'textarea', 'Custom Layout Update', '', '', 0, 0, '', 0, ''),
(56, 3, 'level', NULL, '', 'static', '', '', '', 'Level', '', '', 0, 0, '', 0, ''),
(57, 3, 'children_count', NULL, '', 'static', '', '', '', 'Children Count', '', '', 0, 0, '', 0, ''),
(58, 3, 'available_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'text', '', '', 'multiselect', 'Available Product Listing Sort by', '', 'catalog/category_attribute_source_sortby', 1, 0, '', 0, ''),
(59, 3, 'default_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'varchar', '', '', 'select', 'Default Product Listing Sort by', '', 'catalog/category_attribute_source_sortby', 1, 0, '', 0, ''),
(60, 4, 'name', NULL, '', 'varchar', '', '', 'text', 'Name', '', '', 1, 0, '', 0, ''),
(61, 4, 'description', NULL, '', 'text', '', '', 'textarea', 'Description', '', '', 1, 0, '', 0, ''),
(62, 4, 'short_description', NULL, '', 'text', '', '', 'textarea', 'Short Description', '', '', 1, 0, '', 0, ''),
(63, 4, 'sku', NULL, '', 'static', '', '', 'text', 'SKU', '', '', 1, 0, '', 1, ''),
(64, 4, 'price', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Price', '', '', 1, 0, '', 0, ''),
(65, 4, 'special_price', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Special Price', '', '', 0, 0, '', 0, ''),
(66, 4, 'special_from_date', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', '', '', 'date', 'Special Price From Date', '', '', 0, 0, '', 0, ''),
(67, 4, 'special_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Special Price To Date', '', '', 0, 0, '', 0, ''),
(68, 4, 'cost', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Cost', '', '', 0, 1, '', 0, ''),
(69, 4, 'weight', NULL, '', 'decimal', '', '', 'text', 'Weight', '', '', 1, 0, '', 0, ''),
(70, 4, 'manufacturer', NULL, '', 'int', '', '', 'select', 'Manufacturer', '', '', 0, 1, '', 0, ''),
(71, 4, 'meta_title', NULL, '', 'varchar', '', '', 'text', 'Meta Title', '', '', 0, 0, '', 0, ''),
(72, 4, 'meta_keyword', NULL, '', 'text', '', '', 'textarea', 'Meta Keywords', '', '', 0, 0, '', 0, ''),
(73, 4, 'meta_description', NULL, '', 'varchar', '', '', 'textarea', 'Meta Description', '', '', 0, 0, '', 0, 'Maximum 255 chars'),
(74, 4, 'image', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Base Image', '', '', 0, 0, '', 0, ''),
(75, 4, 'small_image', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Small Image', '', '', 0, 0, '', 0, ''),
(76, 4, 'thumbnail', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Thumbnail', '', '', 0, 0, '', 0, ''),
(77, 4, 'media_gallery', NULL, 'catalog/product_attribute_backend_media', 'varchar', '', '', 'gallery', 'Media Gallery', '', '', 0, 0, '', 0, ''),
(78, 4, 'old_id', NULL, '', 'int', '', '', '', '', '', '', 0, 0, '', 0, ''),
(79, 4, 'tier_price', NULL, 'catalog/product_attribute_backend_tierprice', 'decimal', '', '', 'text', 'Tier Price', '', '', 0, 0, '', 0, ''),
(80, 4, 'color', NULL, '', 'int', '', '', 'select', 'Color', '', '', 0, 1, '', 0, ''),
(81, 4, 'news_from_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Set Product as New from Date', '', '', 0, 0, '', 0, ''),
(82, 4, 'news_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Set Product as New to Date', '', '', 0, 0, '', 0, ''),
(83, 4, 'gallery', NULL, '', 'varchar', '', '', 'gallery', 'Image Gallery', '', '', 0, 0, '', 0, ''),
(84, 4, 'status', NULL, '', 'int', '', '', 'select', 'Status', '', 'catalog/product_status', 1, 0, '', 0, ''),
(85, 4, 'tax_class_id', NULL, '', 'int', '', '', 'select', 'Tax Class', '', 'tax/class_source_product', 1, 0, '', 0, ''),
(86, 4, 'url_key', NULL, 'catalog/product_attribute_backend_urlkey', 'varchar', '', '', 'text', 'URL key', '', '', 0, 0, '', 0, ''),
(87, 4, 'url_path', NULL, '', 'varchar', '', '', '', '', '', '', 0, 0, '', 0, ''),
(88, 4, 'minimal_price', NULL, '', 'decimal', '', '', 'price', 'Minimal Price', '', '', 1, 0, '', 0, ''),
(89, 4, 'visibility', NULL, '', 'int', '', '', 'select', 'Visibility', '', 'catalog/product_visibility', 1, 0, '4', 0, ''),
(90, 4, 'custom_design', NULL, '', 'varchar', '', '', 'select', 'Custom Design', '', 'core/design_source_design', 0, 0, '', 0, ''),
(91, 4, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active From', '', '', 0, 0, '', 0, ''),
(92, 4, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active To', '', '', 0, 0, '', 0, ''),
(93, 4, 'custom_layout_update', NULL, '', 'text', '', '', 'textarea', 'Custom Layout Update', '', '', 0, 0, '', 0, ''),
(94, 4, 'page_layout', NULL, '', 'varchar', '', '', 'select', 'Page Layout', '', 'catalog/product_attribute_source_layout', 0, 0, '', 0, ''),
(95, 4, 'category_ids', NULL, '', 'static', '', '', '', '', '', '', 0, 0, '', 0, ''),
(96, 4, 'options_container', NULL, '', 'varchar', '', '', 'select', 'Display product options in', '', 'catalog/entity_product_attribute_design_options_container', 0, 0, 'container2', 0, ''),
(97, 4, 'required_options', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(98, 4, 'has_options', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(99, 4, 'image_label', NULL, '', 'varchar', '', '', 'text', 'Image Label', '', '', 0, 0, '', 0, ''),
(100, 4, 'small_image_label', NULL, '', 'varchar', '', '', 'text', 'Small Image Label', '', '', 0, 0, '', 0, ''),
(101, 4, 'thumbnail_label', NULL, '', 'varchar', '', '', 'text', 'Thumbnail Label', '', '', 0, 0, '', 0, ''),
(102, 4, 'created_at', NULL, 'eav/entity_attribute_backend_time_created', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(103, 4, 'updated_at', NULL, 'eav/entity_attribute_backend_time_updated', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(104, 11, 'entity_id', NULL, 'sales_entity/order_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(105, 11, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(106, 11, 'store_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(107, 11, 'remote_ip', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(108, 11, 'status', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(109, 11, 'state', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(110, 11, 'hold_before_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(111, 11, 'hold_before_state', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(112, 11, 'relation_parent_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(113, 11, 'relation_parent_real_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(114, 11, 'relation_child_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(115, 11, 'relation_child_real_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(116, 11, 'original_increment_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(117, 11, 'edit_increment', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(118, 11, 'ext_order_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(119, 11, 'ext_customer_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(120, 11, 'quote_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(121, 11, 'quote_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(122, 11, 'billing_address_id', NULL, 'sales_entity/order_attribute_backend_billing', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(123, 11, 'shipping_address_id', NULL, 'sales_entity/order_attribute_backend_shipping', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(124, 11, 'coupon_code', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(125, 11, 'applied_rule_ids', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(126, 11, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(127, 11, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(128, 11, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(129, 11, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(130, 11, 'store_to_base_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(131, 11, 'store_to_order_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(132, 11, 'base_to_global_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(133, 11, 'base_to_order_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(134, 11, 'is_virtual', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(135, 11, 'shipping_method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(136, 11, 'shipping_description', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(137, 11, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(138, 11, 'tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(139, 11, 'shipping_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(140, 11, 'shipping_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(141, 11, 'discount_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(142, 11, 'subtotal', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(143, 11, 'grand_total', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(144, 11, 'total_paid', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(145, 11, 'total_due', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(146, 11, 'total_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(147, 11, 'total_qty_ordered', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(148, 11, 'total_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(149, 11, 'total_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(150, 11, 'total_online_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(151, 11, 'total_offline_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(152, 11, 'adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(153, 11, 'adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(154, 11, 'base_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(155, 11, 'base_shipping_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(156, 11, 'base_shipping_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(157, 11, 'base_discount_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(158, 11, 'base_subtotal', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(159, 11, 'base_grand_total', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(160, 11, 'base_total_paid', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(161, 11, 'base_total_due', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(162, 11, 'base_total_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(163, 11, 'base_total_qty_ordered', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(164, 11, 'base_total_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(165, 11, 'base_total_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(166, 11, 'base_total_online_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(167, 11, 'base_total_offline_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(168, 11, 'base_adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(169, 11, 'base_adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(170, 11, 'subtotal_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(171, 11, 'subtotal_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(172, 11, 'discount_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(173, 11, 'discount_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(174, 11, 'discount_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(175, 11, 'subtotal_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(176, 11, 'tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(177, 11, 'tax_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(178, 11, 'tax_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(179, 11, 'shipping_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(180, 11, 'shipping_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(181, 11, 'shipping_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(182, 11, 'base_subtotal_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(183, 11, 'base_subtotal_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(184, 11, 'base_discount_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(185, 11, 'base_discount_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(186, 11, 'base_discount_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(187, 11, 'base_subtotal_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(188, 11, 'base_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(189, 11, 'base_tax_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(190, 11, 'base_tax_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(191, 11, 'base_shipping_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(192, 11, 'base_shipping_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(193, 11, 'base_shipping_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(194, 11, 'protect_code', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(195, 11, 'customer_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(196, 11, 'customer_group_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(197, 11, 'customer_email', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(198, 11, 'customer_prefix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(199, 11, 'customer_firstname', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(200, 11, 'customer_middlename', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(201, 11, 'customer_lastname', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(202, 11, 'customer_suffix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(203, 11, 'customer_note', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(204, 11, 'customer_note_notify', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(205, 11, 'customer_is_guest', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(206, 11, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(207, 11, 'customer_taxvat', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(208, 11, 'customer_dob', NULL, '', 'datetime', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(209, 11, 'customer_gender', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(210, 12, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(211, 12, 'quote_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(212, 12, 'address_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(213, 12, 'customer_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(214, 12, 'customer_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(215, 12, 'email', NULL, '', 'varchar', '', '', 'text', 'Email', '', '', 1, 0, '', 0, ''),
(216, 12, 'prefix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(217, 12, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(218, 12, 'middlename', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(219, 12, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(220, 12, 'suffix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(221, 12, 'company', NULL, '', 'varchar', '', '', 'text', 'Company', '', '', 1, 0, '', 0, ''),
(222, 12, 'street', NULL, '', 'varchar', '', '', 'text', 'Street Address', '', '', 1, 0, '', 0, ''),
(223, 12, 'city', NULL, '', 'varchar', '', '', 'text', 'City', '', '', 1, 0, '', 0, ''),
(224, 12, 'region', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(225, 12, 'region_id', NULL, '', 'int', '', '', 'text', 'State/Province', '', '', 1, 0, '', 0, ''),
(226, 12, 'postcode', NULL, '', 'varchar', '', '', 'text', 'Zip/Postal Code', '', '', 1, 0, '', 0, ''),
(227, 12, 'country_id', NULL, '', 'varchar', '', '', 'text', 'Country', '', '', 1, 0, '', 0, ''),
(228, 12, 'telephone', NULL, '', 'varchar', '', '', 'text', 'Telephone', '', '', 1, 0, '', 0, ''),
(229, 12, 'fax', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(230, 13, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(231, 13, 'quote_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(232, 13, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(233, 13, 'super_product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(234, 13, 'parent_product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(235, 13, 'is_virtual', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(236, 13, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(237, 13, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(238, 13, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(239, 13, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(240, 13, 'is_qty_decimal', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(241, 13, 'qty_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(242, 13, 'qty_backordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(243, 13, 'qty_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(244, 13, 'qty_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(245, 13, 'qty_shipped', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(246, 13, 'qty_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(247, 13, 'original_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(248, 13, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(249, 13, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(250, 13, 'discount_percent', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(251, 13, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(252, 13, 'discount_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(253, 13, 'tax_percent', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(254, 13, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(255, 13, 'tax_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(256, 13, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(257, 13, 'row_weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(258, 13, 'row_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(259, 13, 'invoiced_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(260, 13, 'amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(261, 13, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(262, 13, 'base_original_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(263, 13, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(264, 13, 'base_discount_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(265, 13, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(266, 13, 'base_tax_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(267, 13, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(268, 13, 'base_row_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(269, 13, 'base_invoiced_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(270, 13, 'base_amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(271, 13, 'applied_rule_ids', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(272, 13, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(273, 14, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(274, 14, 'quote_payment_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(275, 14, 'method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(276, 14, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(277, 14, 'last_trans_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(278, 14, 'po_number', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(279, 14, 'cc_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(280, 14, 'cc_number_enc', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(281, 14, 'cc_last4', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(282, 14, 'cc_owner', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(283, 14, 'cc_exp_month', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(284, 14, 'cc_exp_year', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(285, 14, 'cc_ss_issue', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(286, 14, 'cc_ss_start_month', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(287, 14, 'cc_ss_start_year', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(288, 14, 'cc_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(289, 14, 'cc_status_description', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(290, 14, 'cc_trans_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(291, 14, 'cc_approval', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(292, 14, 'cc_avs_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(293, 14, 'cc_cid_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(294, 14, 'cc_debug_request_body', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(295, 14, 'cc_debug_response_body', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(296, 14, 'cc_debug_response_serialized', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(297, 14, 'anet_trans_method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(298, 14, 'echeck_routing_number', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(299, 14, 'echeck_bank_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(300, 14, 'echeck_account_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(301, 14, 'echeck_account_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(302, 14, 'echeck_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(303, 14, 'amount_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(304, 14, 'amount_authorized', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(305, 14, 'amount_paid', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(306, 14, 'amount_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(307, 14, 'amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(308, 14, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(309, 14, 'shipping_captured', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(310, 14, 'shipping_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(311, 14, 'base_amount_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(312, 14, 'base_amount_authorized', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(313, 14, 'base_amount_paid', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(314, 14, 'base_amount_paid_online', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(315, 14, 'base_amount_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(316, 14, 'base_amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(317, 14, 'base_amount_refunded_online', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(318, 14, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(319, 14, 'base_shipping_captured', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(320, 14, 'base_shipping_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(321, 15, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(322, 15, 'status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(323, 15, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(324, 15, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(325, 16, 'entity_id', NULL, 'sales_entity/order_invoice_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(326, 16, 'state', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(327, 16, 'is_used_for_refund', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(328, 16, 'transaction_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(329, 16, 'order_id', NULL, 'sales_entity/order_invoice_attribute_backend_order', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(330, 16, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(331, 16, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(332, 16, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(333, 16, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(334, 16, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(335, 16, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(336, 16, 'store_to_base_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(337, 16, 'store_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(338, 16, 'base_to_global_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(339, 16, 'base_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(340, 16, 'subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(341, 16, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(342, 16, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(343, 16, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(344, 16, 'grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(345, 16, 'total_qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(346, 16, 'can_void_flag', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(347, 16, 'base_subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(348, 16, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(349, 16, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(350, 16, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(351, 16, 'base_grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(352, 16, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(353, 16, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(354, 17, 'parent_id', NULL, 'sales_entity/order_invoice_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(355, 17, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(356, 17, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(357, 17, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(358, 17, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(359, 17, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(360, 17, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(361, 17, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(362, 17, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(363, 17, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(364, 17, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(365, 17, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(366, 17, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(367, 17, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(368, 17, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(369, 17, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(370, 17, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(371, 18, 'parent_id', NULL, 'sales_entity/order_invoice_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(372, 18, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(373, 18, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(374, 19, 'entity_id', NULL, 'sales_entity/order_shipment_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(375, 19, 'customer_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(376, 19, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(377, 19, 'shipment_status', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(378, 19, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(379, 19, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(380, 19, 'total_qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(381, 19, 'total_weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(382, 19, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(383, 19, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(384, 20, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(385, 20, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(386, 20, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(387, 20, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(388, 20, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(389, 20, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(390, 20, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(391, 20, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(392, 20, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(393, 20, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(394, 20, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(395, 21, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(396, 21, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(397, 21, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(398, 22, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(399, 22, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(400, 22, 'number', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(401, 22, 'carrier_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(402, 22, 'title', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(403, 22, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(404, 22, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(405, 22, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(406, 23, 'entity_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(407, 23, 'state', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(408, 23, 'invoice_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(409, 23, 'transaction_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(410, 23, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(411, 23, 'creditmemo_status', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(412, 23, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(413, 23, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(414, 23, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(415, 23, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(416, 23, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(417, 23, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(418, 23, 'store_to_base_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(419, 23, 'store_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(420, 23, 'base_to_global_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(421, 23, 'base_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(422, 23, 'subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(423, 23, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(424, 23, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(425, 23, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(426, 23, 'adjustment', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(427, 23, 'adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(428, 23, 'adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(429, 23, 'grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(430, 23, 'base_subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(431, 23, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(432, 23, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(433, 23, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(434, 23, 'base_adjustment', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(435, 23, 'base_adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(436, 23, 'base_adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(437, 23, 'base_grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(438, 23, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(439, 23, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(440, 24, 'parent_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(441, 24, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(442, 24, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(443, 24, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(444, 24, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(445, 24, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(446, 24, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(447, 24, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(448, 24, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(449, 24, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(450, 24, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(451, 24, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(452, 24, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(453, 24, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(454, 24, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(455, 24, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(456, 24, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(457, 25, 'parent_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(458, 25, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(459, 25, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(460, 13, 'product_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(461, 11, 'can_ship_partially', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(462, 11, 'can_ship_partially_item', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(463, 11, 'payment_authorization_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(464, 11, 'payment_authorization_expiration', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(465, 11, 'shipping_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(466, 11, 'base_shipping_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(468, 11, 'forced_do_shipment_with_invoice', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '0', 0, ''),
(469, 11, 'base_total_invoiced_cost', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(470, 11, 'x_forwarded_for', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(471, 14, 'additional_information', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(472, 11, 'discount_description', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(473, 11, 'shipping_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(474, 11, 'base_shipping_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(475, 11, 'paypal_ipn_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '0', 0, ''),
(476, 14, 'cc_secure_verify', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(477, 4, 'enable_googlecheckout', NULL, '', 'int', '', '', 'select', 'Is product available for purchase with Google Checkout', '', 'eav/entity_attribute_source_boolean', 0, 0, '1', 0, ''),
(478, 16, 'shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(479, 16, 'base_shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(480, 23, 'shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(481, 23, 'base_shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(482, 11, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(483, 11, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(484, 17, 'price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(485, 17, 'base_price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(486, 17, 'row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(487, 17, 'base_row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(488, 16, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(489, 16, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(490, 24, 'price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(491, 24, 'base_price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(492, 24, 'row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(493, 24, 'base_row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(494, 23, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(495, 23, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(496, 11, 'gift_message_id', NULL, '', 'int', '', '', 'text', '', '', '', 0, 0, '', 0, ''),
(497, 4, 'gift_message_available', NULL, 'giftmessage/entity_attribute_backend_boolean_config', 'varchar', '', '', 'select', 'Allow Gift Message', '', 'giftmessage/entity_attribute_source_boolean_config', 0, 0, '2', 0, '');
INSERT INTO `shop_eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(498, 4, 'price_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(499, 4, 'sku_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(500, 4, 'weight_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(501, 4, 'price_view', NULL, '', 'int', '', '', 'select', 'Price View', '', 'bundle/product_attribute_source_price_view', 1, 0, '', 0, ''),
(502, 4, 'shipment_type', NULL, '', 'int', '', '', '', 'Shipment', '', '', 1, 0, '', 0, ''),
(503, 4, 'links_purchased_separately', NULL, '', 'int', '', '', '', 'Links can be purchased separately', '', '', 1, 0, '', 0, ''),
(504, 4, 'samples_title', NULL, '', 'varchar', '', '', '', 'Samples title', '', '', 1, 0, '', 0, ''),
(505, 4, 'links_title', NULL, '', 'varchar', '', '', '', 'Links title', '', '', 1, 0, '', 0, ''),
(506, 4, 'links_exist', NULL, '', 'int', '', '', '', '', '', '', 0, 0, '0', 0, ''),
(507, 24, 'base_weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(508, 24, 'base_weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(509, 24, 'weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(510, 24, 'weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(511, 17, 'base_weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(512, 17, 'base_weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(513, 17, 'weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(514, 17, 'weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(515, 17, 'weee_tax_applied', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(516, 24, 'weee_tax_applied', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(517, 24, 'weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(518, 24, 'weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(519, 24, 'base_weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(520, 24, 'base_weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(521, 17, 'weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(522, 17, 'weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(523, 17, 'base_weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(524, 17, 'base_weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute_group`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_name` varchar(255) NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  `default_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `shop_eav_attribute_group`
--

INSERT INTO `shop_eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES
(1, 1, 'General', 1, 1),
(2, 2, 'General', 1, 1),
(3, 3, 'General Information', 10, 1),
(4, 4, 'General', 1, 1),
(5, 4, 'Prices', 2, 0),
(6, 4, 'Meta Information', 3, 0),
(7, 4, 'Images', 4, 0),
(8, 4, 'Design', 6, 0),
(9, 3, 'Display Settings', 20, 0),
(10, 3, 'Custom Design', 30, 0),
(11, 5, 'General', 1, 1),
(12, 6, 'General', 1, 1),
(13, 7, 'General', 1, 1),
(14, 8, 'General', 1, 1),
(15, 9, 'General', 1, 1),
(16, 10, 'General', 1, 1),
(17, 11, 'General', 1, 1),
(18, 12, 'General', 1, 1),
(19, 13, 'General', 1, 1),
(20, 14, 'General', 1, 1),
(21, 15, 'General', 1, 1),
(22, 16, 'General', 1, 1),
(23, 17, 'General', 1, 1),
(24, 18, 'General', 1, 1),
(25, 19, 'General', 1, 1),
(26, 20, 'General', 1, 1),
(27, 21, 'General', 1, 1),
(28, 22, 'General', 1, 1),
(29, 23, 'General', 1, 1),
(30, 24, 'General', 1, 1),
(31, 25, 'General', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute_label`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute_label` (
  `attribute_label_id` int(11) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`attribute_label_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_LABEL_STORE` (`store_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE_STORE` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute_option`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_eav_attribute_option`
--

INSERT INTO `shop_eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 32, 0),
(2, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute_option_value`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_eav_attribute_option_value`
--

INSERT INTO `shop_eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_attribute_set`
--

CREATE TABLE IF NOT EXISTS `shop_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_name` varchar(255) character set utf8 collate utf8_swedish_ci NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `shop_eav_attribute_set`
--

INSERT INTO `shop_eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 1),
(2, 2, 'Default', 1),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1),
(9, 9, 'Default', 1),
(10, 10, 'Default', 1),
(11, 11, 'Default', 1),
(12, 12, 'Default', 1),
(13, 13, 'Default', 1),
(14, 14, 'Default', 1),
(15, 15, 'Default', 1),
(16, 16, 'Default', 1),
(17, 17, 'Default', 1),
(18, 18, 'Default', 1),
(19, 19, 'Default', 1),
(20, 20, 'Default', 1),
(21, 21, 'Default', 1),
(22, 22, 'Default', 1),
(23, 23, 'Default', 1),
(24, 24, 'Default', 1),
(25, 25, 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entityies' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_attribute`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=523 ;

--
-- Dumping data for table `shop_eav_entity_attribute`
--

INSERT INTO `shop_eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 30),
(4, 1, 1, 1, 4, 37),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 43),
(7, 1, 1, 1, 7, 50),
(8, 1, 1, 1, 8, 53),
(9, 1, 1, 1, 9, 60),
(10, 1, 1, 1, 10, 70),
(11, 1, 1, 1, 11, 80),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 82),
(14, 1, 1, 1, 14, 83),
(15, 1, 1, 1, 15, 84),
(16, 1, 1, 1, 16, 85),
(17, 1, 1, 1, 17, 86),
(18, 2, 2, 2, 18, 7),
(19, 2, 2, 2, 19, 10),
(20, 2, 2, 2, 20, 13),
(21, 2, 2, 2, 21, 20),
(22, 2, 2, 2, 22, 23),
(23, 2, 2, 2, 23, 30),
(24, 2, 2, 2, 24, 40),
(25, 2, 2, 2, 25, 50),
(26, 2, 2, 2, 26, 60),
(27, 2, 2, 2, 27, 70),
(28, 2, 2, 2, 28, 80),
(29, 2, 2, 2, 29, 90),
(30, 2, 2, 2, 30, 100),
(31, 2, 2, 2, 31, 110),
(32, 1, 1, 1, 32, 87),
(33, 3, 3, 3, 33, 1),
(34, 3, 3, 3, 34, 2),
(35, 3, 3, 3, 35, 3),
(36, 3, 3, 3, 36, 4),
(37, 3, 3, 3, 37, 5),
(38, 3, 3, 3, 38, 6),
(39, 3, 3, 3, 39, 7),
(40, 3, 3, 3, 40, 8),
(41, 3, 3, 9, 41, 10),
(42, 3, 3, 9, 42, 20),
(43, 3, 3, 9, 43, 30),
(44, 3, 3, 3, 44, 12),
(45, 3, 3, 3, 45, 13),
(46, 3, 3, 3, 46, 14),
(47, 3, 3, 3, 47, 15),
(48, 3, 3, 3, 48, 16),
(49, 3, 3, 3, 49, 17),
(50, 3, 3, 10, 50, 10),
(51, 3, 3, 10, 51, 20),
(52, 3, 3, 10, 52, 30),
(53, 3, 3, 10, 53, 40),
(54, 3, 3, 10, 54, 50),
(55, 3, 3, 10, 55, 60),
(56, 3, 3, 3, 56, 24),
(57, 3, 3, 3, 57, 25),
(58, 3, 3, 9, 58, 40),
(59, 3, 3, 9, 59, 50),
(60, 4, 4, 4, 60, 1),
(61, 4, 4, 4, 61, 2),
(62, 4, 4, 4, 62, 3),
(63, 4, 4, 4, 63, 4),
(64, 4, 4, 5, 64, 1),
(65, 4, 4, 5, 65, 2),
(66, 4, 4, 5, 66, 3),
(67, 4, 4, 5, 67, 4),
(68, 4, 4, 5, 68, 5),
(69, 4, 4, 4, 69, 5),
(70, 4, 4, 6, 71, 1),
(71, 4, 4, 6, 72, 2),
(72, 4, 4, 6, 73, 3),
(73, 4, 4, 7, 74, 1),
(74, 4, 4, 7, 75, 2),
(75, 4, 4, 7, 76, 3),
(76, 4, 4, 7, 77, 4),
(77, 4, 4, 4, 78, 6),
(78, 4, 4, 5, 79, 6),
(79, 4, 4, 4, 81, 7),
(80, 4, 4, 4, 82, 8),
(81, 4, 4, 7, 83, 5),
(82, 4, 4, 4, 84, 9),
(83, 4, 4, 5, 85, 7),
(84, 4, 4, 4, 86, 10),
(85, 4, 4, 4, 87, 11),
(86, 4, 4, 5, 88, 8),
(87, 4, 4, 4, 89, 12),
(88, 4, 4, 8, 90, 1),
(89, 4, 4, 8, 91, 2),
(90, 4, 4, 8, 92, 3),
(91, 4, 4, 8, 93, 4),
(92, 4, 4, 8, 94, 5),
(93, 4, 4, 4, 95, 13),
(94, 4, 4, 8, 96, 6),
(95, 4, 4, 4, 97, 14),
(96, 4, 4, 4, 98, 15),
(97, 4, 4, 4, 99, 16),
(98, 4, 4, 4, 100, 17),
(99, 4, 4, 4, 101, 18),
(100, 4, 4, 4, 102, 19),
(101, 4, 4, 4, 103, 20),
(102, 11, 11, 17, 104, 1),
(103, 11, 11, 17, 105, 2),
(104, 11, 11, 17, 106, 3),
(105, 11, 11, 17, 107, 4),
(106, 11, 11, 17, 108, 5),
(107, 11, 11, 17, 109, 6),
(108, 11, 11, 17, 110, 7),
(109, 11, 11, 17, 111, 8),
(110, 11, 11, 17, 112, 9),
(111, 11, 11, 17, 113, 10),
(112, 11, 11, 17, 114, 11),
(113, 11, 11, 17, 115, 12),
(114, 11, 11, 17, 116, 13),
(115, 11, 11, 17, 117, 14),
(116, 11, 11, 17, 118, 15),
(117, 11, 11, 17, 119, 16),
(118, 11, 11, 17, 120, 17),
(119, 11, 11, 17, 121, 18),
(120, 11, 11, 17, 122, 19),
(121, 11, 11, 17, 123, 20),
(122, 11, 11, 17, 124, 21),
(123, 11, 11, 17, 125, 22),
(124, 11, 11, 17, 126, 23),
(125, 11, 11, 17, 127, 24),
(126, 11, 11, 17, 128, 25),
(127, 11, 11, 17, 129, 26),
(128, 11, 11, 17, 130, 27),
(129, 11, 11, 17, 131, 28),
(130, 11, 11, 17, 132, 29),
(131, 11, 11, 17, 133, 30),
(132, 11, 11, 17, 134, 31),
(133, 11, 11, 17, 135, 32),
(134, 11, 11, 17, 136, 33),
(135, 11, 11, 17, 137, 34),
(136, 11, 11, 17, 138, 35),
(137, 11, 11, 17, 139, 36),
(138, 11, 11, 17, 140, 37),
(139, 11, 11, 17, 141, 38),
(140, 11, 11, 17, 142, 39),
(141, 11, 11, 17, 143, 40),
(142, 11, 11, 17, 144, 41),
(143, 11, 11, 17, 145, 42),
(144, 11, 11, 17, 146, 43),
(145, 11, 11, 17, 147, 44),
(146, 11, 11, 17, 148, 45),
(147, 11, 11, 17, 149, 46),
(148, 11, 11, 17, 150, 47),
(149, 11, 11, 17, 151, 48),
(150, 11, 11, 17, 152, 49),
(151, 11, 11, 17, 153, 50),
(152, 11, 11, 17, 154, 51),
(153, 11, 11, 17, 155, 52),
(154, 11, 11, 17, 156, 53),
(155, 11, 11, 17, 157, 54),
(156, 11, 11, 17, 158, 55),
(157, 11, 11, 17, 159, 56),
(158, 11, 11, 17, 160, 57),
(159, 11, 11, 17, 161, 58),
(160, 11, 11, 17, 162, 59),
(161, 11, 11, 17, 163, 60),
(162, 11, 11, 17, 164, 61),
(163, 11, 11, 17, 165, 62),
(164, 11, 11, 17, 166, 63),
(165, 11, 11, 17, 167, 64),
(166, 11, 11, 17, 168, 65),
(167, 11, 11, 17, 169, 66),
(168, 11, 11, 17, 170, 67),
(169, 11, 11, 17, 171, 68),
(170, 11, 11, 17, 172, 69),
(171, 11, 11, 17, 173, 70),
(172, 11, 11, 17, 174, 71),
(173, 11, 11, 17, 175, 72),
(174, 11, 11, 17, 176, 73),
(175, 11, 11, 17, 177, 74),
(176, 11, 11, 17, 178, 75),
(177, 11, 11, 17, 179, 76),
(178, 11, 11, 17, 180, 77),
(179, 11, 11, 17, 181, 78),
(180, 11, 11, 17, 182, 79),
(181, 11, 11, 17, 183, 80),
(182, 11, 11, 17, 184, 81),
(183, 11, 11, 17, 185, 82),
(184, 11, 11, 17, 186, 83),
(185, 11, 11, 17, 187, 84),
(186, 11, 11, 17, 188, 85),
(187, 11, 11, 17, 189, 86),
(188, 11, 11, 17, 190, 87),
(189, 11, 11, 17, 191, 88),
(190, 11, 11, 17, 192, 89),
(191, 11, 11, 17, 193, 90),
(192, 11, 11, 17, 194, 91),
(193, 11, 11, 17, 195, 92),
(194, 11, 11, 17, 196, 93),
(195, 11, 11, 17, 197, 94),
(196, 11, 11, 17, 198, 95),
(197, 11, 11, 17, 199, 96),
(198, 11, 11, 17, 200, 97),
(199, 11, 11, 17, 201, 98),
(200, 11, 11, 17, 202, 99),
(201, 11, 11, 17, 203, 100),
(202, 11, 11, 17, 204, 101),
(203, 11, 11, 17, 205, 102),
(204, 11, 11, 17, 206, 103),
(205, 11, 11, 17, 207, 104),
(206, 11, 11, 17, 208, 105),
(207, 11, 11, 17, 209, 106),
(208, 12, 12, 18, 210, 1),
(209, 12, 12, 18, 211, 2),
(210, 12, 12, 18, 212, 3),
(211, 12, 12, 18, 213, 4),
(212, 12, 12, 18, 214, 5),
(213, 12, 12, 18, 215, 6),
(214, 12, 12, 18, 216, 7),
(215, 12, 12, 18, 217, 8),
(216, 12, 12, 18, 218, 9),
(217, 12, 12, 18, 219, 10),
(218, 12, 12, 18, 220, 11),
(219, 12, 12, 18, 221, 12),
(220, 12, 12, 18, 222, 13),
(221, 12, 12, 18, 223, 14),
(222, 12, 12, 18, 224, 15),
(223, 12, 12, 18, 225, 16),
(224, 12, 12, 18, 226, 17),
(225, 12, 12, 18, 227, 18),
(226, 12, 12, 18, 228, 19),
(227, 12, 12, 18, 229, 20),
(228, 13, 13, 19, 230, 1),
(229, 13, 13, 19, 231, 2),
(230, 13, 13, 19, 232, 3),
(231, 13, 13, 19, 233, 4),
(232, 13, 13, 19, 234, 5),
(233, 13, 13, 19, 235, 6),
(234, 13, 13, 19, 236, 7),
(235, 13, 13, 19, 237, 8),
(236, 13, 13, 19, 238, 9),
(237, 13, 13, 19, 239, 10),
(238, 13, 13, 19, 240, 11),
(239, 13, 13, 19, 241, 12),
(240, 13, 13, 19, 242, 13),
(241, 13, 13, 19, 243, 14),
(242, 13, 13, 19, 244, 15),
(243, 13, 13, 19, 245, 16),
(244, 13, 13, 19, 246, 17),
(245, 13, 13, 19, 247, 18),
(246, 13, 13, 19, 248, 19),
(247, 13, 13, 19, 249, 20),
(248, 13, 13, 19, 250, 21),
(249, 13, 13, 19, 251, 22),
(250, 13, 13, 19, 252, 23),
(251, 13, 13, 19, 253, 24),
(252, 13, 13, 19, 254, 25),
(253, 13, 13, 19, 255, 26),
(254, 13, 13, 19, 256, 27),
(255, 13, 13, 19, 257, 28),
(256, 13, 13, 19, 258, 29),
(257, 13, 13, 19, 259, 30),
(258, 13, 13, 19, 260, 31),
(259, 13, 13, 19, 261, 32),
(260, 13, 13, 19, 262, 33),
(261, 13, 13, 19, 263, 34),
(262, 13, 13, 19, 264, 35),
(263, 13, 13, 19, 265, 36),
(264, 13, 13, 19, 266, 37),
(265, 13, 13, 19, 267, 38),
(266, 13, 13, 19, 268, 39),
(267, 13, 13, 19, 269, 40),
(268, 13, 13, 19, 270, 41),
(269, 13, 13, 19, 271, 42),
(270, 13, 13, 19, 272, 43),
(271, 14, 14, 20, 273, 1),
(272, 14, 14, 20, 274, 2),
(273, 14, 14, 20, 275, 3),
(274, 14, 14, 20, 276, 4),
(275, 14, 14, 20, 277, 5),
(276, 14, 14, 20, 278, 6),
(277, 14, 14, 20, 279, 7),
(278, 14, 14, 20, 280, 8),
(279, 14, 14, 20, 281, 9),
(280, 14, 14, 20, 282, 10),
(281, 14, 14, 20, 283, 11),
(282, 14, 14, 20, 284, 12),
(283, 14, 14, 20, 285, 13),
(284, 14, 14, 20, 286, 14),
(285, 14, 14, 20, 287, 15),
(286, 14, 14, 20, 288, 16),
(287, 14, 14, 20, 289, 17),
(288, 14, 14, 20, 290, 18),
(289, 14, 14, 20, 291, 19),
(290, 14, 14, 20, 292, 20),
(291, 14, 14, 20, 293, 21),
(292, 14, 14, 20, 294, 22),
(293, 14, 14, 20, 295, 23),
(294, 14, 14, 20, 296, 24),
(295, 14, 14, 20, 297, 25),
(296, 14, 14, 20, 298, 26),
(297, 14, 14, 20, 299, 27),
(298, 14, 14, 20, 300, 28),
(299, 14, 14, 20, 301, 29),
(300, 14, 14, 20, 302, 30),
(301, 14, 14, 20, 303, 31),
(302, 14, 14, 20, 304, 32),
(303, 14, 14, 20, 305, 33),
(304, 14, 14, 20, 306, 34),
(305, 14, 14, 20, 307, 35),
(306, 14, 14, 20, 308, 36),
(307, 14, 14, 20, 309, 37),
(308, 14, 14, 20, 310, 38),
(309, 14, 14, 20, 311, 39),
(310, 14, 14, 20, 312, 40),
(311, 14, 14, 20, 313, 41),
(312, 14, 14, 20, 314, 42),
(313, 14, 14, 20, 315, 43),
(314, 14, 14, 20, 316, 44),
(315, 14, 14, 20, 317, 45),
(316, 14, 14, 20, 318, 46),
(317, 14, 14, 20, 319, 47),
(318, 14, 14, 20, 320, 48),
(319, 15, 15, 21, 321, 1),
(320, 15, 15, 21, 322, 2),
(321, 15, 15, 21, 323, 3),
(322, 15, 15, 21, 324, 4),
(323, 16, 16, 22, 325, 1),
(324, 16, 16, 22, 326, 2),
(325, 16, 16, 22, 327, 3),
(326, 16, 16, 22, 328, 4),
(327, 16, 16, 22, 329, 5),
(328, 16, 16, 22, 330, 6),
(329, 16, 16, 22, 331, 7),
(330, 16, 16, 22, 332, 8),
(331, 16, 16, 22, 333, 9),
(332, 16, 16, 22, 334, 10),
(333, 16, 16, 22, 335, 11),
(334, 16, 16, 22, 336, 12),
(335, 16, 16, 22, 337, 13),
(336, 16, 16, 22, 338, 14),
(337, 16, 16, 22, 339, 15),
(338, 16, 16, 22, 340, 16),
(339, 16, 16, 22, 341, 17),
(340, 16, 16, 22, 342, 18),
(341, 16, 16, 22, 343, 19),
(342, 16, 16, 22, 344, 20),
(343, 16, 16, 22, 345, 21),
(344, 16, 16, 22, 346, 22),
(345, 16, 16, 22, 347, 23),
(346, 16, 16, 22, 348, 24),
(347, 16, 16, 22, 349, 25),
(348, 16, 16, 22, 350, 26),
(349, 16, 16, 22, 351, 27),
(350, 16, 16, 22, 352, 28),
(351, 16, 16, 22, 353, 29),
(352, 17, 17, 23, 354, 1),
(353, 17, 17, 23, 355, 2),
(354, 17, 17, 23, 356, 3),
(355, 17, 17, 23, 357, 4),
(356, 17, 17, 23, 358, 5),
(357, 17, 17, 23, 359, 6),
(358, 17, 17, 23, 360, 7),
(359, 17, 17, 23, 361, 8),
(360, 17, 17, 23, 362, 9),
(361, 17, 17, 23, 363, 10),
(362, 17, 17, 23, 364, 11),
(363, 17, 17, 23, 365, 12),
(364, 17, 17, 23, 366, 13),
(365, 17, 17, 23, 367, 14),
(366, 17, 17, 23, 368, 15),
(367, 17, 17, 23, 369, 16),
(368, 17, 17, 23, 370, 17),
(369, 18, 18, 24, 371, 1),
(370, 18, 18, 24, 372, 2),
(371, 18, 18, 24, 373, 3),
(372, 19, 19, 25, 374, 1),
(373, 19, 19, 25, 375, 2),
(374, 19, 19, 25, 376, 3),
(375, 19, 19, 25, 377, 4),
(376, 19, 19, 25, 378, 5),
(377, 19, 19, 25, 379, 6),
(378, 19, 19, 25, 380, 7),
(379, 19, 19, 25, 381, 8),
(380, 19, 19, 25, 382, 9),
(381, 19, 19, 25, 383, 10),
(382, 20, 20, 26, 384, 1),
(383, 20, 20, 26, 385, 2),
(384, 20, 20, 26, 386, 3),
(385, 20, 20, 26, 387, 4),
(386, 20, 20, 26, 388, 5),
(387, 20, 20, 26, 389, 6),
(388, 20, 20, 26, 390, 7),
(389, 20, 20, 26, 391, 8),
(390, 20, 20, 26, 392, 9),
(391, 20, 20, 26, 393, 10),
(392, 20, 20, 26, 394, 11),
(393, 21, 21, 27, 395, 1),
(394, 21, 21, 27, 396, 2),
(395, 21, 21, 27, 397, 3),
(396, 22, 22, 28, 398, 1),
(397, 22, 22, 28, 399, 2),
(398, 22, 22, 28, 400, 3),
(399, 22, 22, 28, 401, 4),
(400, 22, 22, 28, 402, 5),
(401, 22, 22, 28, 403, 6),
(402, 22, 22, 28, 404, 7),
(403, 22, 22, 28, 405, 8),
(404, 23, 23, 29, 406, 1),
(405, 23, 23, 29, 407, 2),
(406, 23, 23, 29, 408, 3),
(407, 23, 23, 29, 409, 4),
(408, 23, 23, 29, 410, 5),
(409, 23, 23, 29, 411, 6),
(410, 23, 23, 29, 412, 7),
(411, 23, 23, 29, 413, 8),
(412, 23, 23, 29, 414, 9),
(413, 23, 23, 29, 415, 10),
(414, 23, 23, 29, 416, 11),
(415, 23, 23, 29, 417, 12),
(416, 23, 23, 29, 418, 13),
(417, 23, 23, 29, 419, 14),
(418, 23, 23, 29, 420, 15),
(419, 23, 23, 29, 421, 16),
(420, 23, 23, 29, 422, 17),
(421, 23, 23, 29, 423, 18),
(422, 23, 23, 29, 424, 19),
(423, 23, 23, 29, 425, 20),
(424, 23, 23, 29, 426, 21),
(425, 23, 23, 29, 427, 22),
(426, 23, 23, 29, 428, 23),
(427, 23, 23, 29, 429, 24),
(428, 23, 23, 29, 430, 25),
(429, 23, 23, 29, 431, 26),
(430, 23, 23, 29, 432, 27),
(431, 23, 23, 29, 433, 28),
(432, 23, 23, 29, 434, 29),
(433, 23, 23, 29, 435, 30),
(434, 23, 23, 29, 436, 31),
(435, 23, 23, 29, 437, 32),
(436, 23, 23, 29, 438, 33),
(437, 23, 23, 29, 439, 34),
(438, 24, 24, 30, 440, 1),
(439, 24, 24, 30, 441, 2),
(440, 24, 24, 30, 442, 3),
(441, 24, 24, 30, 443, 4),
(442, 24, 24, 30, 444, 5),
(443, 24, 24, 30, 445, 6),
(444, 24, 24, 30, 446, 7),
(445, 24, 24, 30, 447, 8),
(446, 24, 24, 30, 448, 9),
(447, 24, 24, 30, 449, 10),
(448, 24, 24, 30, 450, 11),
(449, 24, 24, 30, 451, 12),
(450, 24, 24, 30, 452, 13),
(451, 24, 24, 30, 453, 14),
(452, 24, 24, 30, 454, 15),
(453, 24, 24, 30, 455, 16),
(454, 24, 24, 30, 456, 17),
(455, 25, 25, 31, 457, 1),
(456, 25, 25, 31, 458, 2),
(457, 25, 25, 31, 459, 3),
(458, 13, 13, 19, 460, 44),
(459, 11, 11, 17, 461, 107),
(460, 11, 11, 17, 462, 108),
(461, 11, 11, 17, 463, 109),
(462, 11, 11, 17, 464, 110),
(463, 11, 11, 17, 465, 111),
(464, 11, 11, 17, 466, 112),
(465, 11, 11, 17, 467, 113),
(466, 11, 11, 17, 468, 114),
(467, 11, 11, 17, 469, 115),
(468, 11, 11, 17, 470, 116),
(469, 14, 14, 20, 471, 49),
(470, 11, 11, 17, 472, 117),
(471, 11, 11, 17, 473, 118),
(472, 11, 11, 17, 474, 119),
(473, 11, 11, 17, 475, 120),
(474, 14, 14, 20, 476, 50),
(475, 4, 4, 5, 477, 21),
(476, 16, 16, 22, 478, 30),
(477, 16, 16, 22, 479, 31),
(478, 23, 23, 29, 480, 35),
(479, 23, 23, 29, 481, 36),
(480, 11, 11, 17, 482, 121),
(481, 11, 11, 17, 483, 122),
(482, 17, 17, 23, 484, 18),
(483, 17, 17, 23, 485, 19),
(484, 17, 17, 23, 486, 20),
(485, 17, 17, 23, 487, 21),
(486, 16, 16, 22, 488, 32),
(487, 16, 16, 22, 489, 33),
(488, 24, 24, 30, 490, 18),
(489, 24, 24, 30, 491, 19),
(490, 24, 24, 30, 492, 20),
(491, 24, 24, 30, 493, 21),
(492, 23, 23, 29, 494, 37),
(493, 23, 23, 29, 495, 38),
(494, 11, 11, 17, 496, 123),
(495, 4, 4, 4, 497, 21),
(496, 4, 4, 4, 498, 22),
(497, 4, 4, 4, 499, 23),
(498, 4, 4, 4, 500, 24),
(499, 4, 4, 5, 501, 22),
(500, 4, 4, 4, 502, 25),
(501, 4, 4, 4, 503, 26),
(502, 4, 4, 4, 504, 27),
(503, 4, 4, 4, 505, 28),
(504, 4, 4, 4, 506, 29),
(505, 24, 24, 30, 507, 22),
(506, 24, 24, 30, 508, 23),
(507, 24, 24, 30, 509, 24),
(508, 24, 24, 30, 510, 25),
(509, 17, 17, 23, 511, 22),
(510, 17, 17, 23, 512, 23),
(511, 17, 17, 23, 513, 24),
(512, 17, 17, 23, 514, 25),
(513, 17, 17, 23, 515, 26),
(514, 24, 24, 30, 516, 26),
(515, 24, 24, 30, 517, 27),
(516, 24, 24, 30, 518, 28),
(517, 24, 24, 30, 519, 29),
(518, 24, 24, 30, 520, 30),
(519, 17, 17, 23, 521, 27),
(520, 17, 17, 23, 522, 28),
(521, 17, 17, 23, 523, 29),
(522, 17, 17, 23, 524, 30);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_store`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `increment_prefix` varchar(20) NOT NULL default '',
  `increment_last_id` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_type`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_code` varchar(50) NOT NULL default '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL default '',
  `value_table_prefix` varchar(255) NOT NULL default '',
  `entity_id_field` varchar(255) NOT NULL default '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL default '1',
  `data_sharing_key` varchar(100) default 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_model` varchar(255) NOT NULL default '',
  `increment_per_store` tinyint(1) unsigned NOT NULL default '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL default '8',
  `increment_pad_char` char(1) NOT NULL default '0',
  `additional_attribute_table` varchar(255) NOT NULL default '',
  `entity_attribute_collection` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `shop_eav_entity_type`
--

INSERT INTO `shop_eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'customer/customer', '', 'customer/entity', '', '', 1, 'default', 1, 'eav/entity_increment_numeric', 0, 8, '0', 'customer/eav_attribute', 'customer/eav_attribute'),
(2, 'customer_address', 'customer/customer_address', '', 'customer/address_entity', '', '', 1, 'default', 2, '', 0, 8, '0', 'customer/eav_attribute', 'customer/eav_attribute'),
(3, 'catalog_category', 'catalog/category', 'catalog/resource_eav_attribute', 'catalog/category', '', '', 1, 'default', 3, '', 0, 8, '0', 'catalog/eav_attribute', 'catalog/category_attribute_collection'),
(4, 'catalog_product', 'catalog/product', 'catalog/resource_eav_attribute', 'catalog/product', '', '', 1, 'default', 4, '', 0, 8, '0', 'catalog/eav_attribute', 'catalog/product_attribute_collection'),
(5, 'quote', 'sales/quote', '', 'sales/quote', '', '', 1, 'default', 5, '', 0, 8, '0', '', ''),
(6, 'quote_item', 'sales/quote_item', '', 'sales/quote_item', '', '', 1, 'default', 6, '', 0, 8, '0', '', ''),
(7, 'quote_address', 'sales/quote_address', '', 'sales/quote_address', '', '', 1, 'default', 7, '', 0, 8, '0', '', ''),
(8, 'quote_address_item', 'sales/quote_address_item', '', 'sales/quote_entity', '', '', 1, 'default', 8, '', 0, 8, '0', '', ''),
(9, 'quote_address_rate', 'sales/quote_address_rate', '', 'sales/quote_entity', '', '', 1, 'default', 9, '', 0, 8, '0', '', ''),
(10, 'quote_payment', 'sales/quote_payment', '', 'sales/quote_entity', '', '', 1, 'default', 10, '', 0, 8, '0', '', ''),
(11, 'order', 'sales/order', '', 'sales/order', '', '', 1, 'default', 11, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(12, 'order_address', 'sales/order_address', '', 'sales/order_entity', '', '', 1, 'default', 12, '', 0, 8, '0', '', ''),
(13, 'order_item', 'sales/order_item', '', 'sales/order_entity', '', '', 1, 'default', 13, '', 0, 8, '0', '', ''),
(14, 'order_payment', 'sales/order_payment', '', 'sales/order_entity', '', '', 1, 'default', 14, '', 0, 8, '0', '', ''),
(15, 'order_status_history', 'sales/order_status_history', '', 'sales/order_entity', '', '', 1, 'default', 15, '', 0, 8, '0', '', ''),
(16, 'invoice', 'sales/order_invoice', '', 'sales/order_entity', '', '', 1, 'default', 16, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(17, 'invoice_item', 'sales/order_invoice_item', '', 'sales/order_entity', '', '', 1, 'default', 17, '', 0, 8, '0', '', ''),
(18, 'invoice_comment', 'sales/order_invoice_comment', '', 'sales/order_entity', '', '', 1, 'default', 18, '', 0, 8, '0', '', ''),
(19, 'shipment', 'sales/order_shipment', '', 'sales/order_entity', '', '', 1, 'default', 19, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(20, 'shipment_item', 'sales/order_shipment_item', '', 'sales/order_entity', '', '', 1, 'default', 20, '', 0, 8, '0', '', ''),
(21, 'shipment_comment', 'sales/order_shipment_comment', '', 'sales/order_entity', '', '', 1, 'default', 21, '', 0, 8, '0', '', ''),
(22, 'shipment_track', 'sales/order_shipment_track', '', 'sales/order_entity', '', '', 1, 'default', 22, '', 0, 8, '0', '', ''),
(23, 'creditmemo', 'sales/order_creditmemo', '', 'sales/order_entity', '', '', 1, 'default', 23, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(24, 'creditmemo_item', 'sales/order_creditmemo_item', '', 'sales/order_entity', '', '', 1, 'default', 24, '', 0, 8, '0', '', ''),
(25, 'creditmemo_comment', 'sales/order_creditmemo_comment', '', 'sales/order_entity', '', '', 1, 'default', 25, '', 0, 8, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_eav_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_eav_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_form_element`
--

CREATE TABLE IF NOT EXISTS `shop_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `fieldset_id` smallint(5) unsigned default NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`element_id`),
  UNIQUE KEY `UNQ_FORM_ATTRIBUTE` (`type_id`,`attribute_id`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_FORM_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `shop_eav_form_element`
--

INSERT INTO `shop_eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 5, 0),
(2, 1, 1, 7, 1),
(3, 1, 1, 9, 2),
(4, 2, 2, 5, 0),
(5, 2, 2, 7, 1),
(6, 2, 2, 9, 2),
(7, 3, 3, 19, 0),
(8, 3, 3, 21, 1),
(9, 3, 3, 23, 2),
(10, 3, 3, 30, 3),
(11, 3, 3, 31, 4),
(12, 3, 4, 24, 0),
(13, 3, 4, 25, 1),
(14, 3, 4, 27, 2),
(15, 3, 4, 29, 3),
(16, 3, 4, 26, 4),
(17, 4, NULL, 19, 0),
(18, 4, NULL, 21, 1),
(19, 4, NULL, 23, 2),
(20, 4, NULL, 9, 3),
(21, 4, NULL, 24, 4),
(22, 4, NULL, 25, 5),
(23, 4, NULL, 27, 6),
(24, 4, NULL, 29, 7),
(25, 4, NULL, 26, 8),
(26, 4, NULL, 30, 9),
(27, 4, NULL, 31, 10),
(28, 5, NULL, 19, 0),
(29, 5, NULL, 21, 1),
(30, 5, NULL, 23, 2),
(31, 5, NULL, 9, 3),
(32, 5, NULL, 24, 4),
(33, 5, NULL, 25, 5),
(34, 5, NULL, 27, 6),
(35, 5, NULL, 29, 7),
(36, 5, NULL, 26, 8),
(37, 5, NULL, 30, 9),
(38, 5, NULL, 31, 10),
(39, 6, NULL, 19, 0),
(40, 6, NULL, 21, 1),
(41, 6, NULL, 23, 2),
(42, 6, NULL, 24, 3),
(43, 6, NULL, 25, 4),
(44, 6, NULL, 27, 5),
(45, 6, NULL, 29, 6),
(46, 6, NULL, 26, 7),
(47, 6, NULL, 30, 8),
(48, 6, NULL, 31, 9),
(49, 7, NULL, 19, 0),
(50, 7, NULL, 21, 1),
(51, 7, NULL, 23, 2),
(52, 7, NULL, 24, 3),
(53, 7, NULL, 25, 4),
(54, 7, NULL, 27, 5),
(55, 7, NULL, 29, 6),
(56, 7, NULL, 26, 7),
(57, 7, NULL, 30, 8),
(58, 7, NULL, 31, 9),
(59, 8, 5, 5, 0),
(60, 8, 5, 7, 1),
(61, 8, 5, 9, 2),
(62, 8, 6, 23, 0),
(63, 8, 6, 30, 1),
(64, 8, 6, 24, 2),
(65, 8, 6, 25, 3),
(66, 8, 6, 27, 4),
(67, 8, 6, 29, 5),
(68, 8, 6, 26, 6);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_form_fieldset`
--

CREATE TABLE IF NOT EXISTS `shop_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `code` char(64) NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fieldset_id`),
  UNIQUE KEY `UNQ_FORM_FIELDSET_CODE` (`type_id`,`code`),
  KEY `IDX_FORM_TYPE` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `shop_eav_form_fieldset`
--

INSERT INTO `shop_eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES
(1, 1, 'general', 1),
(2, 2, 'general', 1),
(3, 3, 'contact', 1),
(4, 3, 'address', 2),
(5, 8, 'general', 1),
(6, 8, 'address', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_form_fieldset_label`
--

CREATE TABLE IF NOT EXISTS `shop_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY  (`fieldset_id`,`store_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_eav_form_fieldset_label`
--

INSERT INTO `shop_eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES
(1, 0, 'Personal Information'),
(2, 0, 'Account Information'),
(3, 0, 'Contact Information'),
(4, 0, 'Address'),
(5, 0, 'Personal Information'),
(6, 0, 'Address Information');

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_form_type`
--

CREATE TABLE IF NOT EXISTS `shop_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` char(64) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_system` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(64) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`type_id`),
  UNIQUE KEY `UNQ_FORM_TYPE_CODE` (`code`,`theme`,`store_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `shop_eav_form_type`
--

INSERT INTO `shop_eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'customer_account_create', 'customer_account_create', 1, '', 0),
(2, 'customer_account_edit', 'customer_account_edit', 1, '', 0),
(3, 'customer_address_edit', 'customer_address_edit', 1, '', 0),
(4, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(5, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(6, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(7, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0),
(8, 'checkout_multishipping_register', 'checkout_multishipping_register', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_eav_form_type_entity`
--

CREATE TABLE IF NOT EXISTS `shop_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_eav_form_type_entity`
--

INSERT INTO `shop_eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(5, 1),
(8, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop_gift_message`
--

CREATE TABLE IF NOT EXISTS `shop_gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL auto_increment,
  `customer_id` int(7) unsigned NOT NULL default '0',
  `sender` varchar(255) NOT NULL default '',
  `recipient` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_gift_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_googlebase_attributes`
--

CREATE TABLE IF NOT EXISTS `shop_googlebase_attributes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_googlebase_attributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_googlebase_items`
--

CREATE TABLE IF NOT EXISTS `shop_googlebase_items` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL default '0000-00-00 00:00:00',
  `expires` datetime NOT NULL default '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL default '0',
  `clicks` smallint(5) unsigned NOT NULL default '0',
  `views` smallint(5) unsigned NOT NULL default '0',
  `is_hidden` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_googlebase_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_googlebase_types`
--

CREATE TABLE IF NOT EXISTS `shop_googlebase_types` (
  `type_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  `target_country` varchar(2) NOT NULL default 'US',
  PRIMARY KEY  (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_googlebase_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_googlecheckout_api_debug`
--

CREATE TABLE IF NOT EXISTS `shop_googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `dir` enum('in','out') default NULL,
  `url` varchar(255) default NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_googlecheckout_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_googleoptimizer_code`
--

CREATE TABLE IF NOT EXISTS `shop_googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL default '',
  `additional_data` text,
  PRIMARY KEY  (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_googleoptimizer_code`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_index_event`
--

CREATE TABLE IF NOT EXISTS `shop_index_event` (
  `event_id` bigint(20) unsigned NOT NULL auto_increment,
  `type` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_pk` bigint(20) default NULL,
  `created_at` datetime NOT NULL,
  `old_data` mediumtext,
  `new_data` mediumtext,
  PRIMARY KEY  (`event_id`),
  UNIQUE KEY `IDX_UNIQUE_EVENT` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_index_event`
--

INSERT INTO `shop_index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES
(1, 'save', 'catalog_category', 1, '2010-06-26 12:03:08', 'a:2:{s:30:"Mage_Catalog_Model_Indexer_Url";N;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;}', 'a:7:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:30:"Mage_Catalog_Model_Indexer_Url";N;s:37:"catalog_category_product_match_result";b:1;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;s:35:"catalogsearch_fulltext_match_result";b:0;}'),
(2, 'save', 'catalog_category', 2, '2010-06-26 12:03:08', 'a:2:{s:30:"Mage_Catalog_Model_Indexer_Url";N;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;}', 'a:7:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:30:"Mage_Catalog_Model_Indexer_Url";N;s:37:"catalog_category_product_match_result";b:1;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;s:35:"catalogsearch_fulltext_match_result";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `shop_index_process`
--

CREATE TABLE IF NOT EXISTS `shop_index_process` (
  `process_id` int(10) unsigned NOT NULL auto_increment,
  `indexer_code` varchar(32) NOT NULL,
  `status` enum('pending','working','require_reindex') NOT NULL default 'pending',
  `started_at` datetime default NULL,
  `ended_at` datetime default NULL,
  `mode` enum('real_time','manual') NOT NULL default 'real_time',
  PRIMARY KEY  (`process_id`),
  UNIQUE KEY `IDX_CODE` (`indexer_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `shop_index_process`
--

INSERT INTO `shop_index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES
(1, 'catalog_product_attribute', 'require_reindex', NULL, NULL, 'real_time'),
(2, 'catalog_product_price', 'require_reindex', NULL, NULL, 'real_time'),
(3, 'catalog_url', 'require_reindex', NULL, NULL, 'real_time'),
(4, 'catalog_product_flat', 'require_reindex', NULL, NULL, 'real_time'),
(5, 'catalog_category_flat', 'require_reindex', NULL, NULL, 'real_time'),
(6, 'catalog_category_product', 'require_reindex', NULL, NULL, 'real_time'),
(7, 'catalogsearch_fulltext', 'require_reindex', NULL, NULL, 'real_time'),
(8, 'cataloginventory_stock', 'require_reindex', NULL, NULL, 'real_time');

-- --------------------------------------------------------

--
-- Table structure for table `shop_index_process_event`
--

CREATE TABLE IF NOT EXISTS `shop_index_process_event` (
  `process_id` int(10) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `status` enum('new','working','done','error') NOT NULL default 'new',
  PRIMARY KEY  (`process_id`,`event_id`),
  KEY `FK_INDEX_EVNT_PROCESS` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_index_process_event`
--

INSERT INTO `shop_index_process_event` (`process_id`, `event_id`, `status`) VALUES
(3, 1, 'done'),
(3, 2, 'done'),
(6, 1, 'done'),
(6, 2, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_customer`
--

CREATE TABLE IF NOT EXISTS `shop_log_customer` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `visitor_id` bigint(20) unsigned default NULL,
  `customer_id` int(11) NOT NULL default '0',
  `login_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `logout_at` datetime default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customers log information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_log_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_log_quote`
--

CREATE TABLE IF NOT EXISTS `shop_log_quote` (
  `quote_id` int(10) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote log data';

--
-- Dumping data for table `shop_log_quote`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_log_summary`
--

CREATE TABLE IF NOT EXISTS `shop_log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned default NULL,
  `visitor_count` int(11) NOT NULL default '0',
  `customer_count` int(11) NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summary log information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_log_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_log_summary_type`
--

CREATE TABLE IF NOT EXISTS `shop_log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_code` varchar(64) NOT NULL default '',
  `period` smallint(5) unsigned NOT NULL default '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL default 'MINUTE',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Type of summary information' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_log_summary_type`
--

INSERT INTO `shop_log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES
(1, 'hour', 1, 'HOUR'),
(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_url`
--

CREATE TABLE IF NOT EXISTS `shop_log_url` (
  `url_id` bigint(20) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `visit_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL visiting history';

--
-- Dumping data for table `shop_log_url`
--

INSERT INTO `shop_log_url` (`url_id`, `visitor_id`, `visit_time`) VALUES
(1, 1, '2010-06-26 12:04:55'),
(2, 1, '2010-06-26 12:11:47'),
(3, 1, '2010-06-26 12:13:57'),
(4, 1, '2010-06-26 12:15:29'),
(5, 1, '2010-06-26 12:19:19'),
(6, 1, '2010-06-26 12:19:40'),
(7, 1, '2010-06-26 12:36:04'),
(8, 1, '2010-06-26 12:39:03'),
(9, 1, '2010-06-26 12:48:32'),
(10, 2, '2010-06-26 12:48:51'),
(11, 2, '2010-06-26 12:49:10'),
(12, 2, '2010-06-26 12:49:15'),
(13, 2, '2010-06-26 12:49:17'),
(14, 2, '2010-06-26 12:49:19'),
(15, 2, '2010-06-26 12:49:20'),
(16, 2, '2010-06-26 12:49:21'),
(17, 2, '2010-06-26 12:49:27'),
(18, 1, '2010-06-26 12:49:31'),
(19, 3, '2010-06-26 16:14:08'),
(20, 4, '2010-06-26 16:14:21'),
(21, 3, '2010-06-26 16:14:35'),
(22, 3, '2010-06-26 16:14:38'),
(23, 3, '2010-06-26 16:14:38'),
(24, 3, '2010-06-26 16:14:39'),
(25, 3, '2010-06-26 16:14:41'),
(26, 3, '2010-06-26 16:14:46'),
(27, 3, '2010-06-26 16:14:49'),
(28, 4, '2010-06-26 16:15:42'),
(29, 5, '2010-06-26 16:52:15'),
(30, 5, '2010-06-26 16:52:58'),
(31, 5, '2010-06-26 16:52:59'),
(32, 5, '2010-06-26 16:53:00'),
(33, 5, '2010-06-26 16:53:12'),
(34, 6, '2010-06-26 21:51:48'),
(35, 6, '2010-06-26 21:52:00'),
(36, 6, '2010-06-26 21:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_url_info`
--

CREATE TABLE IF NOT EXISTS `shop_log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL default '',
  `referer` varchar(255) default NULL,
  PRIMARY KEY  (`url_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `shop_log_url_info`
--

INSERT INTO `shop_log_url_info` (`url_id`, `url`, `referer`) VALUES
(1, 'http://conferences-formations.com/shop/index.php/', 'http://conferences-formations.com/shop/index.php/install/wizard/end/'),
(2, 'http://conferences-formations.com/shop/index.php/', 'http://conferences-formations.com/shop/index.php/install/wizard/end/'),
(3, 'http://conferences-formations.com/shop/index.php/', 'http://conferences-formations.com/shop/index.php/install/wizard/end/'),
(4, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/shop/index.php/'),
(5, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/shop/index.php/'),
(6, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/shop/index.php/'),
(7, 'http://conferences-formations.com/shop/', ''),
(8, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/index.php/blog/index'),
(9, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/'),
(10, 'http://conferences-formations.com/shop/', ''),
(11, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/'),
(12, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/index.php/checkout/cart/'),
(13, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(14, 'http://conferences-formations.com/shop/index.php/checkout/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(15, 'http://conferences-formations.com/shop/index.php/checkout/onepage/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(16, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(17, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/index.php/checkout/cart/'),
(18, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/'),
(19, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/index.php/home/contact'),
(20, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/'),
(21, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/'),
(22, 'http://conferences-formations.com/shop/index.php/checkout/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(23, 'http://conferences-formations.com/shop/index.php/checkout/onepage/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(24, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(25, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/index.php/checkout/cart/'),
(26, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/index.php/checkout/cart/'),
(27, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/index.php/customer/account/login/'),
(28, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/'),
(29, 'http://conferences-formations.com/shop/', ''),
(30, 'http://conferences-formations.com/shop/index.php/checkout/', 'http://conferences-formations.com/shop/'),
(31, 'http://conferences-formations.com/shop/index.php/checkout/onepage/', 'http://conferences-formations.com/shop/'),
(32, 'http://conferences-formations.com/shop/index.php/checkout/cart/', 'http://conferences-formations.com/shop/'),
(33, 'http://conferences-formations.com/shop/index.php/customer/account/login/', 'http://conferences-formations.com/shop/index.php/checkout/cart/'),
(34, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/index.php'),
(35, 'http://conferences-formations.com/shop/admin', ''),
(36, 'http://conferences-formations.com/shop/', 'http://conferences-formations.com/index.php');

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_visitor`
--

CREATE TABLE IF NOT EXISTS `shop_log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `session_id` char(64) NOT NULL default '',
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='System visitors log' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `shop_log_visitor`
--

INSERT INTO `shop_log_visitor` (`visitor_id`, `session_id`, `first_visit_at`, `last_visit_at`, `last_url_id`, `store_id`) VALUES
(1, 'fd38c94adbb7e5f4ee73fafce93bdc69', '2010-06-26 12:04:55', '2010-06-26 12:49:31', 18, 1),
(2, 'b9bd7f1ca864443e6dfef29aa3988d85', '2010-06-26 12:48:51', '2010-06-26 12:49:27', 17, 1),
(3, '58a3b994f7f0417b6950a2db285c24e2', '2010-06-26 16:14:08', '2010-06-26 16:14:49', 27, 1),
(4, '6eb19637ef4a9884d7d324cf26d67e7f', '2010-06-26 16:14:21', '2010-06-26 16:15:42', 28, 1),
(5, '52f15eb9de2ffba58b70a3c03e1ce0b2', '2010-06-26 16:52:15', '2010-06-26 16:53:12', 33, 1),
(6, 'cc0b76891c76acb418b15ee13324e49b', '2010-06-26 21:51:48', '2010-06-26 21:52:30', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_visitor_info`
--

CREATE TABLE IF NOT EXISTS `shop_log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL default '0',
  `http_referer` varchar(255) default NULL,
  `http_user_agent` varchar(255) default NULL,
  `http_accept_charset` varchar(255) default NULL,
  `http_accept_language` varchar(255) default NULL,
  `server_addr` bigint(20) default NULL,
  `remote_addr` bigint(20) default NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';

--
-- Dumping data for table `shop_log_visitor_info`
--

INSERT INTO `shop_log_visitor_info` (`visitor_id`, `http_referer`, `http_user_agent`, `http_accept_charset`, `http_accept_language`, `server_addr`, `remote_addr`) VALUES
(1, 'http://conferences-formations.com/shop/index.php/install/wizard/end/', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.4) Gecko/20100611 Firefox/3.6.4 ( .NET CLR 3.5.30729)', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 1162394882, 3075548382),
(2, '', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.70 Safari/533.4', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 1162394882, 3075548382),
(3, 'http://conferences-formations.com/index.php/home/contact', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.70 Safari/533.4', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', 1162394882, 415986775),
(4, 'http://conferences-formations.com/', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', '', 'en-us', 1162394882, 1984369547),
(5, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.2.4) Gecko/20100611 Firefox/3.6.4 ( .NET CLR 3.5.30729)', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 1162394882, 1984396034),
(6, 'http://conferences-formations.com/index.php', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.70 Safari/533.4', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', 1162394882, 415986775);

-- --------------------------------------------------------

--
-- Table structure for table `shop_log_visitor_online`
--

CREATE TABLE IF NOT EXISTS `shop_log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime default NULL,
  `customer_id` int(10) unsigned default NULL,
  `last_url` varchar(255) default NULL,
  PRIMARY KEY  (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_log_visitor_online`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_problem`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL auto_increment,
  `subscriber_id` int(7) unsigned default NULL,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `problem_error_code` int(3) unsigned default '0',
  `problem_error_text` varchar(200) default NULL,
  PRIMARY KEY  (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_newsletter_problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_queue`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL auto_increment,
  `template_id` int(7) unsigned NOT NULL default '0',
  `queue_status` int(3) unsigned NOT NULL default '0',
  `queue_start_at` datetime default NULL,
  `queue_finish_at` datetime default NULL,
  PRIMARY KEY  (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_newsletter_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_queue_link`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL auto_increment,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `subscriber_id` int(7) unsigned NOT NULL default '0',
  `letter_sent_at` datetime default NULL,
  PRIMARY KEY  (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SEND_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_newsletter_queue_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_queue_store_link`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_newsletter_queue_store_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_subscriber`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default '0',
  `change_status_at` datetime default NULL,
  `customer_id` int(11) unsigned NOT NULL default '0',
  `subscriber_email` varchar(150) character set latin1 collate latin1_general_ci NOT NULL default '',
  `subscriber_status` int(3) NOT NULL default '0',
  `subscriber_confirm_code` varchar(32) default 'NULL',
  PRIMARY KEY  (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_newsletter_subscriber`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_newsletter_template`
--

CREATE TABLE IF NOT EXISTS `shop_newsletter_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_text_preprocessed` text,
  `template_styles` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `template_actual` tinyint(1) unsigned default '1',
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_newsletter_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_paygate_authorizenet_debug`
--

CREATE TABLE IF NOT EXISTS `shop_paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_paygate_authorizenet_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_paypaluk_api_debug`
--

CREATE TABLE IF NOT EXISTS `shop_paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_paypaluk_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_paypal_api_debug`
--

CREATE TABLE IF NOT EXISTS `shop_paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_paypal_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_poll`
--

CREATE TABLE IF NOT EXISTS `shop_poll` (
  `poll_id` int(10) unsigned NOT NULL auto_increment,
  `poll_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_closed` datetime default NULL,
  `active` smallint(6) NOT NULL default '1',
  `closed` tinyint(1) NOT NULL default '0',
  `answers_display` smallint(6) default NULL,
  PRIMARY KEY  (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_poll`
--

INSERT INTO `shop_poll` (`poll_id`, `poll_title`, `votes_count`, `store_id`, `date_posted`, `date_closed`, `active`, `closed`, `answers_display`) VALUES
(1, 'What is your favorite color', 5, 1, '2010-06-26 08:03:12', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_poll_answer`
--

CREATE TABLE IF NOT EXISTS `shop_poll_answer` (
  `answer_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `answer_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `answer_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shop_poll_answer`
--

INSERT INTO `shop_poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES
(1, 1, 'Green', 4, 0),
(2, 1, 'Red', 1, 0),
(3, 1, 'Black', 0, 0),
(4, 1, 'Magenta', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_poll_store`
--

CREATE TABLE IF NOT EXISTS `shop_poll_store` (
  `poll_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_poll_store`
--

INSERT INTO `shop_poll_store` (`poll_id`, `store_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_poll_vote`
--

CREATE TABLE IF NOT EXISTS `shop_poll_vote` (
  `vote_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `poll_answer_id` int(10) unsigned NOT NULL default '0',
  `ip_address` bigint(20) default NULL,
  `customer_id` int(11) default NULL,
  `vote_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_poll_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_product_alert_price`
--

CREATE TABLE IF NOT EXISTS `shop_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_product_alert_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_product_alert_stock`
--

CREATE TABLE IF NOT EXISTS `shop_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_product_alert_stock`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_rating`
--

CREATE TABLE IF NOT EXISTS `shop_rating` (
  `rating_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_id` smallint(6) unsigned NOT NULL default '0',
  `rating_code` varchar(64) NOT NULL default '',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ratings' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_rating`
--

INSERT INTO `shop_rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES
(1, 1, 'Quality', 0),
(2, 1, 'Value', 0),
(3, 1, 'Price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_entity`
--

CREATE TABLE IF NOT EXISTS `shop_rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_code` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_rating_entity`
--

INSERT INTO `shop_rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_option`
--

CREATE TABLE IF NOT EXISTS `shop_rating_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `value` tinyint(3) unsigned NOT NULL default '0',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating options' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `shop_rating_option`
--

INSERT INTO `shop_rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_option_vote`
--

CREATE TABLE IF NOT EXISTS `shop_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `remote_ip` varchar(16) NOT NULL default '',
  `remote_ip_long` int(11) NOT NULL default '0',
  `customer_id` int(11) unsigned default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `review_id` bigint(20) unsigned default NULL,
  `percent` tinyint(3) NOT NULL default '0',
  `value` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_rating_option_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_option_vote_aggregated`
--

CREATE TABLE IF NOT EXISTS `shop_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `vote_count` int(10) unsigned NOT NULL default '0',
  `vote_value_sum` int(10) unsigned NOT NULL default '0',
  `percent` tinyint(3) NOT NULL default '0',
  `percent_approved` tinyint(3) default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_rating_option_vote_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_store`
--

CREATE TABLE IF NOT EXISTS `shop_rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_rating_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_title`
--

CREATE TABLE IF NOT EXISTS `shop_rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_rating_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_report_compared_product_index`
--

CREATE TABLE IF NOT EXISTS `shop_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_id` int(10) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY  (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_report_compared_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_report_event`
--

CREATE TABLE IF NOT EXISTS `shop_report_event` (
  `event_id` bigint(20) unsigned NOT NULL auto_increment,
  `logged_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL default '0',
  `object_id` int(10) unsigned NOT NULL default '0',
  `subject_id` int(10) unsigned NOT NULL default '0',
  `subtype` tinyint(3) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_report_event`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_report_event_types`
--

CREATE TABLE IF NOT EXISTS `shop_report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL auto_increment,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `shop_report_event_types`
--

INSERT INTO `shop_report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 1),
(2, 'sendfriend_product', 1),
(3, 'catalog_product_compare_add_product', 1),
(4, 'checkout_cart_add_product', 1),
(5, 'wishlist_add_product', 1),
(6, 'wishlist_share', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_report_viewed_product_index`
--

CREATE TABLE IF NOT EXISTS `shop_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_id` int(10) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY  (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_report_viewed_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_review`
--

CREATE TABLE IF NOT EXISTS `shop_review` (
  `review_id` bigint(20) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL default '0',
  `entity_pk_value` int(10) unsigned NOT NULL default '0',
  `status_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_review`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_review_detail`
--

CREATE TABLE IF NOT EXISTS `shop_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL auto_increment,
  `review_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL default '',
  `customer_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  KEY `FK_REVIEW_DETAIL_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_review_detail`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_review_entity`
--

CREATE TABLE IF NOT EXISTS `shop_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_review_entity`
--

INSERT INTO `shop_review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `shop_review_entity_summary`
--

CREATE TABLE IF NOT EXISTS `shop_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL auto_increment,
  `entity_pk_value` bigint(20) NOT NULL default '0',
  `entity_type` tinyint(4) NOT NULL default '0',
  `reviews_count` smallint(6) NOT NULL default '0',
  `rating_summary` tinyint(4) NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_review_entity_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_review_status`
--

CREATE TABLE IF NOT EXISTS `shop_review_status` (
  `status_id` tinyint(3) unsigned NOT NULL auto_increment,
  `status_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review statuses' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shop_review_status`
--

INSERT INTO `shop_review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `shop_review_store`
--

CREATE TABLE IF NOT EXISTS `shop_review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_review_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_salesrule`
--

CREATE TABLE IF NOT EXISTS `shop_salesrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default '0000-00-00',
  `to_date` date default '0000-00-00',
  `coupon_code` varchar(255) default NULL,
  `uses_per_coupon` int(11) NOT NULL default '0',
  `uses_per_customer` int(11) NOT NULL default '0',
  `customer_group_ids` varchar(255) NOT NULL default '',
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `is_advanced` tinyint(3) unsigned NOT NULL default '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL default '',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_qty` decimal(12,4) unsigned default NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `apply_to_shipping` tinyint(1) unsigned NOT NULL default '0',
  `times_used` int(11) unsigned NOT NULL default '0',
  `is_rss` tinyint(4) NOT NULL default '0',
  `website_ids` text,
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_salesrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_salesrule_customer`
--

CREATE TABLE IF NOT EXISTS `shop_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `times_used` smallint(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_salesrule_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_salesrule_label`
--

CREATE TABLE IF NOT EXISTS `shop_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) default NULL,
  PRIMARY KEY  (`label_id`),
  UNIQUE KEY `IDX_RULE_STORE` (`rule_id`,`store_id`),
  KEY `FK_SALESRULE_LABEL_STORE` (`store_id`),
  KEY `FK_SALESRULE_LABEL_RULE` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_salesrule_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_order_item`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned default NULL,
  `quote_item_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `product_type` varchar(255) default NULL,
  `product_options` text,
  `weight` decimal(12,4) default '0.0000',
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `qty_backordered` decimal(12,4) default '0.0000',
  `qty_canceled` decimal(12,4) default '0.0000',
  `qty_invoiced` decimal(12,4) default '0.0000',
  `qty_ordered` decimal(12,4) default '0.0000',
  `qty_refunded` decimal(12,4) default '0.0000',
  `qty_shipped` decimal(12,4) default '0.0000',
  `base_cost` decimal(12,4) default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `original_price` decimal(12,4) default NULL,
  `base_original_price` decimal(12,4) default NULL,
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `tax_invoiced` decimal(12,4) default '0.0000',
  `base_tax_invoiced` decimal(12,4) default '0.0000',
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `discount_invoiced` decimal(12,4) default '0.0000',
  `base_discount_invoiced` decimal(12,4) default '0.0000',
  `amount_refunded` decimal(12,4) default '0.0000',
  `base_amount_refunded` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `gift_message_id` int(10) default NULL,
  `gift_message_available` int(10) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `ext_order_item_id` varchar(255) default NULL,
  `locked_do_invoice` int(10) unsigned default NULL,
  `locked_do_ship` int(10) unsigned default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `IDX_ORDER` (`order_id`),
  KEY `FK_SALES_ORDER_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_order_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned default '1',
  `is_virtual` tinyint(1) unsigned default '0',
  `is_multi_shipping` tinyint(1) unsigned default '0',
  `items_count` int(10) unsigned default '0',
  `items_qty` decimal(12,4) default '0.0000',
  `orig_order_id` int(10) unsigned default '0',
  `store_to_base_rate` decimal(12,4) default '0.0000',
  `store_to_quote_rate` decimal(12,4) default '0.0000',
  `base_currency_code` varchar(255) default NULL,
  `store_currency_code` varchar(255) default NULL,
  `quote_currency_code` varchar(255) default NULL,
  `grand_total` decimal(12,4) default '0.0000',
  `base_grand_total` decimal(12,4) default '0.0000',
  `checkout_method` varchar(255) default NULL,
  `customer_id` int(10) unsigned default '0',
  `customer_tax_class_id` int(10) unsigned default '0',
  `customer_group_id` int(10) unsigned default '0',
  `customer_email` varchar(255) default NULL,
  `customer_prefix` varchar(40) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_middlename` varchar(40) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_suffix` varchar(40) default NULL,
  `customer_dob` datetime default NULL,
  `customer_note` varchar(255) default NULL,
  `customer_note_notify` tinyint(1) unsigned default '1',
  `customer_is_guest` tinyint(1) unsigned default '0',
  `remote_ip` varchar(32) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `reserved_order_id` varchar(64) default '',
  `password_hash` varchar(255) default NULL,
  `coupon_code` varchar(255) default NULL,
  `global_currency_code` varchar(255) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_quote_rate` decimal(12,4) default NULL,
  `customer_taxvat` varchar(255) default NULL,
  `customer_gender` varchar(255) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `subtotal_with_discount` decimal(12,4) default NULL,
  `base_subtotal_with_discount` decimal(12,4) default NULL,
  `is_changed` int(10) unsigned default NULL,
  `trigger_recollect` tinyint(1) NOT NULL default '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_address`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned default NULL,
  `save_in_address_book` tinyint(1) default '0',
  `customer_address_id` int(10) unsigned default NULL,
  `address_type` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `prefix` varchar(40) default NULL,
  `firstname` varchar(255) default NULL,
  `middlename` varchar(40) default NULL,
  `lastname` varchar(255) default NULL,
  `suffix` varchar(40) default NULL,
  `company` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `region_id` int(10) unsigned default NULL,
  `postcode` varchar(255) default NULL,
  `country_id` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL default '0',
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL default '0',
  `shipping_method` varchar(255) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `weight` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `discount_description` varchar(255) default NULL,
  `shipping_discount_amount` decimal(12,4) default NULL,
  `base_shipping_discount_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `base_subtotal_total_incl_tax` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_address`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_address_item`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL auto_increment,
  `parent_item_id` int(10) unsigned default NULL,
  `quote_address_id` int(10) unsigned NOT NULL default '0',
  `quote_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_id` int(10) unsigned default NULL,
  `super_product_id` int(10) unsigned default NULL,
  `parent_product_id` int(10) unsigned default NULL,
  `sku` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `free_shipping` int(10) unsigned default NULL,
  `is_qty_decimal` int(10) unsigned default NULL,
  `price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default NULL,
  `no_discount` int(10) unsigned default NULL,
  `tax_percent` decimal(12,4) default NULL,
  `base_price` decimal(12,4) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `IDX_PARENT_ITEM_ID` (`parent_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_address_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_item`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `parent_item_id` int(10) unsigned default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `custom_price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_type` varchar(255) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `original_custom_price` decimal(12,4) default NULL,
  `redirect_url` varchar(255) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_SALES_QUOTE_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_item_option`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_item_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_payment`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `method` varchar(255) default '',
  `cc_type` varchar(255) default '',
  `cc_number_enc` varchar(255) default '',
  `cc_last4` varchar(255) default '',
  `cc_cid_enc` varchar(255) default '',
  `cc_owner` varchar(255) default '',
  `cc_exp_month` tinyint(2) unsigned default '0',
  `cc_exp_year` smallint(4) unsigned default '0',
  `cc_ss_owner` varchar(255) default '',
  `cc_ss_start_month` tinyint(2) unsigned default '0',
  `cc_ss_start_year` smallint(4) unsigned default '0',
  `cybersource_token` varchar(255) default '',
  `paypal_correlation_id` varchar(255) default '',
  `paypal_payer_id` varchar(255) default '',
  `paypal_payer_status` varchar(255) default '',
  `po_number` varchar(255) default '',
  `additional_data` text,
  `cc_ss_issue` varchar(255) default NULL,
  `additional_information` text,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_flat_quote_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `shop_sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL auto_increment,
  `address_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `carrier` varchar(255) default NULL,
  `carrier_title` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL default '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY  (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_flat_quote_shipping_rate`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_invoiced_aggregated`
--

CREATE TABLE IF NOT EXISTS `shop_sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_invoiced_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_invoiced_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `shop_sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_invoiced_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  `customer_id` int(10) unsigned default NULL,
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `total_paid` decimal(12,4) NOT NULL default '0.0000',
  `total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_total_paid` decimal(12,4) NOT NULL default '0.0000',
  `base_total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `base_total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_refunded` decimal(12,4) default NULL,
  `subtotal_canceled` decimal(12,4) default NULL,
  `discount_refunded` decimal(12,4) default NULL,
  `discount_canceled` decimal(12,4) default NULL,
  `discount_invoiced` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `tax_canceled` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `shipping_canceled` decimal(12,4) default NULL,
  `base_subtotal_refunded` decimal(12,4) default NULL,
  `base_subtotal_canceled` decimal(12,4) default NULL,
  `base_discount_refunded` decimal(12,4) default NULL,
  `base_discount_canceled` decimal(12,4) default NULL,
  `base_discount_invoiced` decimal(12,4) default NULL,
  `base_tax_refunded` decimal(12,4) default NULL,
  `base_tax_canceled` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `base_shipping_canceled` decimal(12,4) default NULL,
  `subtotal_invoiced` decimal(12,4) default NULL,
  `tax_invoiced` decimal(12,4) default NULL,
  `shipping_invoiced` decimal(12,4) default NULL,
  `base_subtotal_invoiced` decimal(12,4) default NULL,
  `base_tax_invoiced` decimal(12,4) default NULL,
  `base_shipping_invoiced` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_refunded` decimal(12,4) default NULL,
  `base_shipping_tax_refunded` decimal(12,4) default NULL,
  `base_total_invoiced_cost` decimal(12,4) default NULL,
  `protect_code` varchar(6) default NULL,
  `store_to_base_rate` decimal(12,4) NOT NULL default '0.0000',
  `store_to_order_rate` decimal(12,4) NOT NULL default '0.0000',
  `base_to_global_rate` decimal(12,4) NOT NULL default '0.0000',
  `base_to_order_rate` decimal(12,4) NOT NULL default '0.0000',
  `status` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `is_virtual` tinyint(1) unsigned NOT NULL default '0',
  `shipping_description` varchar(255) NOT NULL default '',
  `coupon_code` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_ORDER_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `base_profit_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_invoiced_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_refunded_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_canceled_amount` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DATETIME` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DECIMAL` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_ORDER_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_STORE` (`store_id`),
  KEY `IDX_SALES_ORDER_ENTITY_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity_int`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity_text`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_int`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_INT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_tax`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_text`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_TEXT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_order_varchar`
--

CREATE TABLE IF NOT EXISTS `shop_sales_order_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_VARCHAR` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_order_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `shop_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL default '0',
  `payment_id` int(10) unsigned NOT NULL default '0',
  `txn_id` varchar(100) NOT NULL default '',
  `parent_txn_id` varchar(100) default NULL,
  `txn_type` varchar(15) NOT NULL default '',
  `is_closed` tinyint(1) unsigned NOT NULL default '1',
  `additional_information` blob,
  PRIMARY KEY  (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_payment_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_refunded_aggregated`
--

CREATE TABLE IF NOT EXISTS `shop_sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_refunded_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_refunded_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `shop_sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_refunded_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_shipping_aggregated`
--

CREATE TABLE IF NOT EXISTS `shop_sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_shipping_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sales_shipping_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `shop_sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sales_shipping_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sendfriend_log`
--

CREATE TABLE IF NOT EXISTS `shop_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `ip` bigint(20) NOT NULL default '0',
  `time` int(10) unsigned NOT NULL,
  `website_id` smallint(5) NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_REMOTE_ADDR` (`ip`),
  KEY `IDX_LOG_TIME` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sendfriend_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_tablerate`
--

CREATE TABLE IF NOT EXISTS `shop_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL auto_increment,
  `website_id` int(11) NOT NULL default '0',
  `dest_country_id` varchar(4) NOT NULL default '0',
  `dest_region_id` int(10) NOT NULL default '0',
  `dest_zip` varchar(10) NOT NULL default '',
  `condition_name` varchar(20) NOT NULL default '',
  `condition_value` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `cost` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_shipping_tablerate`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_sitemap`
--

CREATE TABLE IF NOT EXISTS `shop_sitemap` (
  `sitemap_id` int(11) NOT NULL auto_increment,
  `sitemap_type` varchar(32) default NULL,
  `sitemap_filename` varchar(32) default NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_sitemap`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_tag`
--

CREATE TABLE IF NOT EXISTS `shop_tag` (
  `tag_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `status` smallint(6) NOT NULL default '0',
  `first_customer_id` int(10) unsigned NOT NULL default '0',
  `first_store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_tag_relation`
--

CREATE TABLE IF NOT EXISTS `shop_tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL auto_increment,
  `tag_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(6) unsigned NOT NULL default '1',
  `active` tinyint(1) unsigned NOT NULL default '1',
  `created_at` datetime default NULL,
  PRIMARY KEY  (`tag_relation_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_tag_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_tag_summary`
--

CREATE TABLE IF NOT EXISTS `shop_tag_summary` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `customers` int(11) unsigned NOT NULL default '0',
  `products` int(11) unsigned NOT NULL default '0',
  `uses` int(11) unsigned NOT NULL default '0',
  `historical_uses` int(11) unsigned NOT NULL default '0',
  `popularity` int(11) unsigned NOT NULL default '0',
  `base_popularity` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_tag_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_calculation`
--

CREATE TABLE IF NOT EXISTS `shop_tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_tax_calculation`
--

INSERT INTO `shop_tax_calculation` (`tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES
(1, 1, 3, 2),
(2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_calculation_rate`
--

CREATE TABLE IF NOT EXISTS `shop_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL auto_increment,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(12) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `zip_is_range` tinyint(1) default NULL,
  `zip_from` varchar(10) default NULL,
  `zip_to` varchar(10) default NULL,
  PRIMARY KEY  (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_TAX_CALCULATION_RATE_RANGE` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop_tax_calculation_rate`
--

INSERT INTO `shop_tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', 8.2500, NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', 8.3750, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_calculation_rate_title`
--

CREATE TABLE IF NOT EXISTS `shop_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL auto_increment,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_tax_calculation_rate_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_calculation_rule`
--

CREATE TABLE IF NOT EXISTS `shop_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shop_tax_calculation_rule`
--

INSERT INTO `shop_tax_calculation_rule` (`tax_calculation_rule_id`, `code`, `priority`, `position`) VALUES
(1, 'Retail Customer-Taxable Goods-Rate 1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_class`
--

CREATE TABLE IF NOT EXISTS `shop_tax_class` (
  `class_id` smallint(6) NOT NULL auto_increment,
  `class_name` varchar(255) NOT NULL default '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL default 'CUSTOMER',
  PRIMARY KEY  (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shop_tax_class`
--

INSERT INTO `shop_tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Shipping', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `shop_tax_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `shop_tax_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `code` varchar(255) NOT NULL default '',
  `order_status` varchar(50) NOT NULL default '',
  `percent` float(12,4) NOT NULL default '0.0000',
  `orders_count` int(11) unsigned NOT NULL default '0',
  `tax_base_amount_sum` float(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_CODE_ORDER_STATUS` (`period`,`store_id`,`code`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_tax_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_weee_discount`
--

CREATE TABLE IF NOT EXISTS `shop_weee_discount` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_weee_discount`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_weee_tax`
--

CREATE TABLE IF NOT EXISTS `shop_weee_tax` (
  `value_id` int(11) NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `country` varchar(2) NOT NULL default '',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `state` varchar(255) NOT NULL default '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_weee_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_widget`
--

CREATE TABLE IF NOT EXISTS `shop_widget` (
  `widget_id` int(10) unsigned NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parameters` text,
  PRIMARY KEY  (`widget_id`),
  KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_widget_instance`
--

CREATE TABLE IF NOT EXISTS `shop_widget_instance` (
  `instance_id` int(11) unsigned NOT NULL auto_increment,
  `type` varchar(255) NOT NULL default '',
  `package_theme` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `store_ids` varchar(255) NOT NULL default '0',
  `widget_parameters` text,
  `sort_order` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_widget_instance`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_widget_instance_page`
--

CREATE TABLE IF NOT EXISTS `shop_widget_instance_page` (
  `page_id` int(11) unsigned NOT NULL auto_increment,
  `instance_id` int(11) unsigned NOT NULL default '0',
  `group` varchar(25) NOT NULL default '',
  `layout_handle` varchar(255) NOT NULL default '',
  `block_reference` varchar(255) NOT NULL default '',
  `for` varchar(25) NOT NULL default '',
  `entities` text,
  `template` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_widget_instance_page`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_widget_instance_page_layout`
--

CREATE TABLE IF NOT EXISTS `shop_widget_instance_page_layout` (
  `page_id` int(11) unsigned NOT NULL default '0',
  `layout_update_id` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `page_id` (`page_id`,`layout_update_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_widget_instance_page_layout`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_wishlist`
--

CREATE TABLE IF NOT EXISTS `shop_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) unsigned default '0',
  `sharing_code` varchar(32) character set latin1 collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`wishlist_id`),
  UNIQUE KEY `UNQ_CUSTOMER` (`customer_id`),
  KEY `IDX_IS_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_wishlist`
--


-- --------------------------------------------------------

--
-- Table structure for table `shop_wishlist_item`
--

CREATE TABLE IF NOT EXISTS `shop_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`wishlist_item_id`),
  KEY `IDX_WISHLIST` (`wishlist_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shop_wishlist_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `social_bookmarking_engines`
--

CREATE TABLE IF NOT EXISTS `social_bookmarking_engines` (
  `eng_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `enabled` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`eng_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `social_bookmarking_engines`
--

INSERT INTO `social_bookmarking_engines` (`eng_id`, `name`, `url`, `icon`, `enabled`) VALUES
(1, 'Favorites', 'sbAddtoFavorites(''|link|'',''|title|'')', 'star.png', '1'),
(2, 'Del.icio.us', 'http://del.icio.us/post?url=|link|;title=|title|', 'delicious.png', '1'),
(3, 'Digg', 'http://digg.com/submit?phase=2&url=|link|&title=|title|', 'digg.png', '1'),
(4, 'Furl', 'http://www.furl.net/storeIt.jsp?u=|link|&t=|title|', 'furl.gif', '1'),
(5, 'Magnolia', 'http://ma.gnolia.com/bookmarklet/add?url=|link|&title=|title|', 'magnolia.png', '1'),
(6, 'StumbleUpon', 'http://www.stumbleupon.com/submit?url=|link|&title=|title|', 'stumbleupon.png', '1'),
(7, 'Google', 'http://www.google.com/bookmarks/mark?op=edit&bkmk=|link|&title=|title|', 'google.gif', '1'),
(8, 'Yahoo', 'http://myweb2.search.yahoo.com/myresults/bookmarklet?t=|title|&u=|link|', 'yahoo.png', '1'),
(9, 'Technorati', 'http://technorati.com/faves?add=|link|', 'technorati.gif', '1'),
(10, 'BlinkList', 'http://www.blinklist.com/index.php?Action=Blink/addblink.php&Url=|link|&Title=|title|', 'blinklist.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `sub_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `type` enum('channel','playlist') NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sub_id` (`sub_id`,`mem_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subscriptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `tags_cache`
--

CREATE TABLE IF NOT EXISTS `tags_cache` (
  `type` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `weight` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags_cache`
--

INSERT INTO `tags_cache` (`type`, `tags`, `weight`, `created`) VALUES
('videos', '', '', 1277346183);

-- --------------------------------------------------------

--
-- Table structure for table `tblaccessories`
--

CREATE TABLE IF NOT EXISTS `tblaccessories` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `ElementName` varchar(50) default NULL,
  `ElementContent` text,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tblaccessories`
--

INSERT INTO `tblaccessories` (`ID`, `ElementName`, `ElementContent`) VALUES
(1, 'About', '<p>&nbsp;Hello Confor.ca</p>'),
(2, 'How', NULL),
(3, 'Rules', NULL),
(4, 'Training', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE IF NOT EXISTS `tbladmin` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PayPalAccount` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Right` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `Name`, `FirstName`, `Email`, `PayPalAccount`, `Password`, `Right`) VALUES
(9, 'Quyet', 'Dao Van', 'daovanquyet@xemmex.net', 'daovanquyet@paypal.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(8, 'admin', 'admin', 'admin@confor.ca', 'admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladvertisement`
--

CREATE TABLE IF NOT EXISTS `tbladvertisement` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `DateBeginning` date NOT NULL,
  `DateExpiry` date NOT NULL,
  `AdvertiserName` varchar(50) NOT NULL,
  `AdvertiserEmail` varchar(50) NOT NULL,
  `URL` text NOT NULL,
  `TextTips` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `tbladvertisement`
--

INSERT INTO `tbladvertisement` (`ID`, `DateBeginning`, `DateExpiry`, `AdvertiserName`, `AdvertiserEmail`, `URL`, `TextTips`, `ImageLink`) VALUES
(1, '2010-06-14', '2010-06-21', 'dang the cuong', 'cuongdt90@gmail.com', 'http://vnexpress.net/GL/Home/', 'Donec quam felis, ultricies nec, pellentesque eu, ', 'cuu_vui_ve_va_soi_xam16.jpg'),
(26, '2010-06-16', '2010-06-30', 'nguyen van a', 'abcd@yahoo.com', 'http://abc.com', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam14.jpg'),
(25, '2010-06-16', '2010-06-16', 'NGUYEN HAI DANG', 'a@yahoo.com', 'http://vnexpress.net/GL/Home/', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam15.jpg'),
(22, '2010-06-16', '2010-06-22', 'CUONG', 'abc@yahoo.com', 'http://dantri.com.vn/', 'Consequat massa quis enim. Donec pede justo, fring', 'cuu_vui_ve_va_soi_xam1.jpg'),
(23, '2010-06-16', '2010-06-22', 'avs', 'abcz@yahoo.com', 'http://dantri.com.vn/', 'Eequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblblog`
--

CREATE TABLE IF NOT EXISTS `tblblog` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Author` int(50) NOT NULL,
  `About` text NOT NULL,
  `Title` varchar(50) character set latin1 NOT NULL,
  `Subject` varchar(50) character set latin1 NOT NULL,
  `Keywords` varchar(200) character set latin1 NOT NULL,
  `Text` text character set latin1 NOT NULL,
  `Link` varchar(200) character set latin1 NOT NULL,
  `CountView` int(11) unsigned default NULL,
  `CountComment` int(11) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblblog_tbladmin` (`Author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tblblog`
--

INSERT INTO `tblblog` (`ID`, `Date`, `Author`, `About`, `Title`, `Subject`, `Keywords`, `Text`, `Link`, `CountView`, `CountComment`) VALUES
(2, '2010-06-26', 8, 'test', 'Commandant Robert Piché', 'Ma rencontre avec un héros!', 'he, la communication, confor', '<p>Nous sommes le vendredi 23 octobre 2009 et nous sommes au Mont-Temblant. J&rsquo;ai ?t? invit?e comme conf?renci?re dans le cadre du Colloque 2009 du Regroupement des gestionnaires en approvisionnement des universit?s qu?b?coises (RGAUQ). Le titre du colloque ? Un monde en turbulence : savoir anticiper et man&oelig;uvrer ?. Le conf?rencier suivant sera nul autre que le<b>commandant?</b></p>', 'post_1.jpg', 27, 3),
(4, '2010-06-25', 8, 'We''re in the very good position of being able to deliver relatively strong growth rates [compared] to what we''re seeing in other major economies', 'But Mr Geithner said the US and Europe have much ', 'We all agree that we have to restore responsibilit', 'But he said that', '<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">But he said that the US and Europe would take &quot;different paths, at a different pace&quot; in order to reach the common goal.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">&quot;It''s going to require different things as we have different strengths and weaknesses,&quot; he said.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">Mr Geithner said the US was not in a position to work out what were the best policies for European countries to pursue.</p>\n<p><span class="cross-head" style="display: block; margin-top: 0.648em; margin-right: 0px; margin-bottom: 0.648em; margin-left: 0px; font-weight: 800; font-size: 1.083em; ">''Strong growth''</span></p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">The treasury secretary said the US had laid out &quot;very ambitious plans as well&quot; to cut its deficit.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">But he said the US was in a stronger position than many other economies to cut its debt levels.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">&quot;We''re in the very good position of being able to deliver relatively strong growth rates [compared] to what we''re seeing in other major economies,&quot; he said.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">Some commentators in Europe argue that austerity measures should only be introduced once strong growth has been secured in the wake of the global downturn.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">This was a more widely held position until the Greek debt crisis focused policymakers'' minds on cutting debt levels.</p>\n<p style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; clear: left; margin-top: 0px; margin-right: 0px; margin-bottom: 0.708em; margin-left: 0px; font-size: 1.083em; ">The Greek crisis showed that governments with high levels of debt find it very difficult to borrow money from international investors, money that they need to service existing debts.</p>', 'post_3.jpg', 5, 0),
(6, '2010-06-25', 8, 'admin', 'blog sang 18', 'kaka', 'kasd akdaksdk asda asdasd', '<p>&nbsp;admin</p>', 'port_1.jpg', 9, 0),
(7, '2010-06-26', 8, 'the author', 'Blog 26 / 06', 'test blog on host', 'fun ac', '<p>test blog !</p>', 'port_6.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE IF NOT EXISTS `tblcategory` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(70) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `Name`) VALUES
(1, 'Actuality'),
(2, 'Technology'),
(3, 'Interview'),
(4, 'Design'),
(5, 'Mobile'),
(6, 'Movies');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomment`
--

CREATE TABLE IF NOT EXISTS `tblcomment` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Comment` text NOT NULL,
  `Blog` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Website` varchar(200) default NULL,
  `Email` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblcomment_tblblog` (`Blog`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblcomment`
--

INSERT INTO `tblcomment` (`ID`, `Comment`, `Blog`, `Date`, `Author`, `Website`, `Email`, `Status`) VALUES
(1, 'Explication sur l’origine et la symbolique de la peur face à l’avion. Directives sur l’utilisation de ces détentes guidées', 2, '2010-06-25 11:06:57', 'admin', 'http://confor.ca', 'admin@confor.ca', 1),
(2, 'test thui mà', 2, '2010-06-26 12:06:34', 'huunam09', 'http://google.com', 'huunam09@yahoo.com.vn', 1),
(3, 'asdasdasd', 2, '2010-06-26 01:06:11', 'huunam09', 'http://google.com', 'se7max@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblevent`
--

CREATE TABLE IF NOT EXISTS `tblevent` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Speaker` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tblevent`
--

INSERT INTO `tblevent` (`ID`, `Date`, `Title`, `Subject`, `Keywords`, `Description`, `Speaker`, `Status`) VALUES
(1, '2010-06-12', 'abc', 'haha', 'acbd', 'sdfr sfs fsa fasf', 1, 1),
(2, '2010-06-12', 'skjfh askfjh afkj shadfkj as', 'sdkj fhska fhskj dfskja dfh', 'hsdh', 's dkfhskdj fhakjs fhkjs dfhkjas hdfkja skhfj askjf hkjash fkj shkjf hksjahfakjsfh kajh fkajfh kjfh kj fhkjasfh kjsahf ksjhfskajfh', 2, 1),
(3, '2010-06-12', 'adjsk dkjs dsk sklfa slkf slkfjl', 'kldsjfasklf jaskldfjlasjflas ', 'skjd', 'kdslfjasf jaslkf jalk f', 1, 0),
(4, '2010-06-12', 'xyzww', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', 2, 1),
(5, '2010-06-12', 'fdfsd', 'fsfsafsa', 'ddsf', '<p>&nbsp;sdfas fasf<img src="http://localhost/confor/system/plugins/fckeditor/editor/images/smiley/msn/angry_smile.gif" alt="" /></p>', 2, 1),
(6, '2010-06-16', 'sadadasd', 'adsadada', 'adad', '<p>?asd ad ad ad ad a d?d</p>', 2, 1),
(7, '2010-06-16', '7wqeqewqewqe', 'xyzwwsdqweq', 'qwqw', '<p>456sq qw e qqeq</p>\n<p>?</p>', 7, 1),
(8, '2010-06-17', ' skjfh askj fhaskjh fkjas f', 'sfsa fs fsfs fsfsa', 'sfds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a "significant change".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an "independent public commission" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', 1, 1),
(9, '2010-06-17', 'csdfsfs', 'sdfasfssd sdf sdf ', 'sdds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a "significant change".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an "independent public commission" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', 1, 1),
(21, '2010-06-18', 'oi con meo', 'con meo dien', 'a b', '<p>Sed vel urna neque, ut ornare lacus. Aenean pretium luctus elit, id dictum dolor varius quis. Morbi venenatis ante quis nunc vehicula pellentesque. Sed et elit eu metus porta egestas. Ut adipiscing dui at dolor lacinia eleifend. Sed et leo neque. Nullam placerat sagittis tristique. In sed cursus purus. Nulla.<br />\n&nbsp;</p>', 0, 1),
(18, '2010-06-17', 'skjfh askj fhaskjh fkjas fssssdasd', 'adadadds?sasas', 'adaq', '<p>asda a ad ad asd asda ?&acirc; da da ?a ada adadadad </p>', 1, 1),
(19, '2010-06-18', 'oh oh oh yeah', 'mmmmm ac ac', 'sac', '<p><span style="font-size: xx-large;"><span style="font-family: Verdana;">sl <span style="color: rgb(153, 204, 0);">fsld fslf sklf alf ald fasl</span>f dslf asf</span></span></p>\n<p><strong>daf alsf alf alf asfasfasf</strong></p>', 2, 1),
(22, '2010-06-18', '111111111111111111111', '2222222222222', '3333', '<p>4444444444444444444444444444444444</p>', 10, 1),
(23, '2010-06-18', 'xyz', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE IF NOT EXISTS `tblfeedback` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Date` text NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Message` text NOT NULL,
  `Ticket` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblfeedback_tbladmin` (`Admin`),
  KEY `FK_tblfeedback_tblticket` (`Ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tblfeedback`
--


-- --------------------------------------------------------

--
-- Table structure for table `tblremember_me`
--

CREATE TABLE IF NOT EXISTS `tblremember_me` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(16) character set latin1 collate latin1_general_cs default NULL,
  `usernamehash` varchar(128) default NULL,
  `random_string` varchar(128) default NULL,
  `origin_time` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tblremember_me`
--


-- --------------------------------------------------------

--
-- Table structure for table `tblshop`
--

CREATE TABLE IF NOT EXISTS `tblshop` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Status` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblshop`
--

INSERT INTO `tblshop` (`ID`, `Status`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscription`
--

CREATE TABLE IF NOT EXISTS `tblsubscription` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `SubcriptionDate` date default NULL,
  `SubscriptionType` int(10) unsigned default NULL,
  `SubscriptionExpiration` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SubscriptionType` (`SubscriptionType`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tblsubscription`
--

INSERT INTO `tblsubscription` (`ID`, `SubcriptionDate`, `SubscriptionType`, `SubscriptionExpiration`) VALUES
(1, '2010-06-07', 1, '2014-08-08'),
(2, '2010-06-16', 2, '2010-07-10'),
(3, NULL, 2, NULL),
(4, NULL, 3, NULL),
(5, NULL, 1, NULL),
(6, NULL, 2, NULL),
(7, NULL, 1, NULL),
(8, NULL, 1, NULL),
(9, NULL, 1, NULL),
(10, NULL, 1, NULL),
(11, NULL, 1, NULL),
(12, NULL, 1, NULL),
(13, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscriptiontype`
--

CREATE TABLE IF NOT EXISTS `tblsubscriptiontype` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `TypeName` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tblsubscriptiontype`
--

INSERT INTO `tblsubscriptiontype` (`ID`, `TypeName`) VALUES
(1, 'level1'),
(2, 'level2'),
(3, 'level3'),
(4, 'level4'),
(5, 'level5');

-- --------------------------------------------------------

--
-- Table structure for table `tblticket`
--

CREATE TABLE IF NOT EXISTS `tblticket` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Date` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Message` text NOT NULL,
  `Speaker` int(11) default NULL,
  `Is_answered` tinyint(1) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblticket_users` (`Speaker`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblticket`
--

INSERT INTO `tblticket` (`ID`, `Date`, `Title`, `Status`, `Message`, `Speaker`, `Is_answered`) VALUES
(1, '2010-06-25 06:06:14', 'test', 2, 'test', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblvideoconference`
--

CREATE TABLE IF NOT EXISTS `tblvideoconference` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` datetime NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Viewed` int(11) unsigned NOT NULL,
  `Upload` tinyint(1) NOT NULL,
  `Recording` tinyint(1) NOT NULL,
  `VideoLink` varchar(200) NOT NULL,
  `Ticket` int(11) default NULL,
  `Speaker` int(11) unsigned NOT NULL,
  `ImagesLink` varchar(200) default NULL,
  `Category` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Ticket` (`Ticket`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tblvideoconference`
--

INSERT INTO `tblvideoconference` (`ID`, `Date`, `Title`, `Subject`, `Keywords`, `Description`, `Viewed`, `Upload`, `Recording`, `VideoLink`, `Ticket`, `Speaker`, `ImagesLink`, `Category`) VALUES
(1, '2010-06-11 14:26:58', 'Bullshit', 'Bullshit', 'a', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 24, 1, 0, 'The Elephant Song - Cool Tunes for Kids by Eric Herman.flv', 10, 1, 'The Elephant Song - Cool Tunes for Kids by Eric Herman.jpg', 1),
(3, '2010-06-16 09:05:51', 'YouTube - Funny Commercial', 'YouTube - Funny Commercial', 'a b c', 'YouTube - Funny Commercial', 2, 1, 0, 'YouTube - Funny Commercial(1).flv', 1, 3, 'YouTube - Funny Commercial.jpg', 1),
(4, '2010-06-16 09:08:18', 'best, funniest commercial video', 'best, funniest commercial video', 'a b c d', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', 45, 1, 0, 'best, funniest commercial video.flv', 3, 3, 'best, funniest commercial video.jpg', 2),
(5, '2010-06-16 09:10:40', 'funny Commercial', 'funny Commercial', 'a b c d e', 'funny Commercial', 2, 1, 0, 'funny Commercial.flv', 4, 4, 'funny Commercial.jpg', 1),
(6, '2010-06-16 09:11:37', 'without brains', 'without brains', 'a b c d e f', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', 2, 1, 0, 'without brains.flv', 5, 5, 'without brains.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE IF NOT EXISTS `tips` (
  `page` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `theme` varchar(50) NOT NULL,
  UNIQUE KEY `page` (`page`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`page`, `message`, `theme`) VALUES
('join_verification', 'You may receive your verification email to your junk mailbox.', 'default'),
('upgrade', 'Upgrade your account to get full access to all categories and videos on this site!', 'default'),
('videos_upload', 'Do not upload any TV shows, music videos, music concerts, or commercials without permission unless they consist entirely of content you created yourself.', 'default'),
('videos_upload_complete', 'It may take up to several minutes before your video will be converted and published.', 'default'),
('videos_upload_general', 'Uploads usually take 1-5 minutes per MB on a high-speed connection, and converting your video takes a few minutes.<br /><br /><strong>Your video is limited to ;module;videos;maxtime; minutes and ;module;videos;maxsize; MB.</strong>', 'default'),
('', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
  `tempPassword` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `membership_id`, `username`, `email`, `name`, `first_name`, `company_name`, `country`, `password`, `cookie_id`, `token`, `register_date`, `last_ip`, `last_access`, `notify`, `status`, `userlevel`, `language`, `description`, `tempPassword`) VALUES
(1, 1, 'admin', 'yugi3000@gmail.com', 'Webmaster', NULL, NULL, '1', 'e10adc3949ba59abbe56e057f20f883e', '76bc88f9181512c7d25845479e96f4ba', '0', '2010-03-03 15:08:38', '113.23.41.76', '0000-00-00 00:00:00', 1, 1, 9, 'en', NULL, 'pigN5mkKmYioxkxhUiaJ'),
(24, 1, 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '1', '21232f297a57a5a743894a0e4a801fc3', 'a45e8a7bb02c385c5ae9046aa4971ace', '0', '2010-06-23 14:06:30', '127.0.0.1', '0000-00-00 00:00:00', 0, 1, 1, 'en', NULL, NULL),
(25, 1, 'zun3000', 'zun3000@gmail.com', 'Mz MEO', 'meo', 'XEMMEX', '1', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'no info', NULL),
(26, 1, 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', '09bd6b044f68755b69cee95dd985f9d8', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'abc e', NULL),
(27, 1, 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'af', NULL),
(28, 1, 'meomeoz', 'yugi3000z@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '90', 'ac48ec59d616758e95e63b08a1689240', 'ea05b1290c1eb0c0b7af6227288f5df6', '0', '0000-00-00 00:00:00', '118.71.123.2', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'abc', NULL),
(29, 1, 'xemmex', 'admin@xemmex.com', 'May Webber', 'Michael', 'XemmeX', '224', 'fd2a748726310daee26ba75690a5ef8e', '4bc27cf894c8dfa211488637da4bfadc', '0', '0000-00-00 00:00:00', '24.203.116.87', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'This is a test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_copy`
--

CREATE TABLE IF NOT EXISTS `users_copy` (
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
  `tempPassword` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users_copy`
--

INSERT INTO `users_copy` (`id`, `membership_id`, `username`, `email`, `name`, `first_name`, `company_name`, `country`, `password`, `cookie_id`, `token`, `register_date`, `last_ip`, `last_access`, `notify`, `status`, `userlevel`, `language`, `description`, `tempPassword`) VALUES
(1, 1, 'admin', 'yugi3000@gmail.com', 'Webmaster', NULL, NULL, '1', 'fcea920f7412b5da7be0cf42b8c93759', 'd73afbe01cc44f65ab776533f86015a8', '0', '2010-03-03 15:08:38', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 9, 'en', NULL, '7W1Toep46ypnPAtzsmb1'),
(24, 1, 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '1', '21232f297a57a5a743894a0e4a801fc3', 'a45e8a7bb02c385c5ae9046aa4971ace', '0', '2010-06-23 14:06:30', '127.0.0.1', '0000-00-00 00:00:00', 0, 1, 1, 'en', NULL, NULL),
(25, 1, 'zun3000', 'zun3000@gmail.com', 'Mz MEO', 'meo', 'XEMMEX', '1', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'no info', NULL),
(26, 1, 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', '09bd6b044f68755b69cee95dd985f9d8', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'abc e', NULL),
(27, 1, 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', 1, 1, 1, 'en', 'af', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE IF NOT EXISTS `verification` (
  `val` char(6) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `inv_id` char(40) NOT NULL,
  UNIQUE KEY `val` (`val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verification`
--


-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `vid_id` bigint(20) unsigned NOT NULL auto_increment,
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
  `converted` enum('0','1') NOT NULL default '0',
  `featured` enum('0','1') NOT NULL default '0',
  `approved` enum('0','1') NOT NULL default '0',
  `viewed` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`vid_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100008 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`vid_id`, `mem_id`, `title`, `description`, `category`, `tags`, `date`, `country`, `location`, `broadcast`, `comments`, `comment_voting`, `responses`, `ratings`, `embedding`, `vhash`, `shash`, `length`, `rating`, `votes`, `posted`, `screenshot`, `converted`, `featured`, `approved`, `viewed`) VALUES
(100000, 1, 'abc', 'xxxx', 1, 'as adj kajsd askj', 1230742859, 223, 'ad', 0, 1, 1, 1, 1, 1, 'The Elephant Song - Cool Tunes for Kids by Eric Herman.flv', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.jpg', 0, 0, 0, 1277174807, 0, '0', '0', '0', 27),
(100001, 1, 'Bullshit', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 1, 'as adj kajsd askj', 1230742859, 223, 'dsfasdfasfas', 0, 1, 1, 1, 1, 1, 'YouTube - Funny Commercial(1).flv', 'YouTube - Funny Commercial.jpg', 0, 0, 0, 1277174, 0, '0', '0', '0', 14),
(100002, 1, 'YouTube - Funny Commercial', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 2, 'as adj kajsd askj', 1230742820, 1, 'sdf sdfs dfs afsafsf', 0, 1, 1, 1, 1, 1, 'best, funniest commercial video', 'best, funniest commercial video.jpg', 0, 0, 0, 12771745, 0, '0', '0', '0', 13),
(100003, 4, 'best, funniest commercial video', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 3, 'ds sd qw assd', 1230742859, 100, 'ds s sdf sf safasfasf', 0, 1, 1, 1, 1, 1, 'funny Commercial.flv', 'funny Commercial.jpg', 0, 0, 0, 12771741, 0, '0', '0', '0', 7),
(100004, 3, '100 bucks you will laugh', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 4, 'ds sd sd sd', 1230742859, 20, 'akldj akldj akldj akldj ald', 0, 0, 0, 0, 0, 0, '100 bucks you will laugh.flv', 'fat_dance.jpg', 0, 0, 0, 12771741, 0, '0', '0', '0', 2229),
(100005, 2, 'Fat Kid Gets Owned', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 5, 'ds sa wer sd', 1230742859, 34, 'sad sdf sdfsaf sf à', 0, 0, 0, 0, 0, 0, 'Fat Kid Gets Owned.flv', 'Fat Kid Gets Owned.jpg', 0, 0, 0, 12771741, 0, '0', '0', '0', 343440),
(100006, 3, 'Funniest Goal', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 2, 'sd sdw svc', 1230742859, 54, 'asdasdads ad adad', 0, 0, 0, 0, 0, 0, 'Funniest Goal.flv', 'Funniest Goal.jpg', 0, 0, 0, 12771741, 0, '0', '0', '0', 427),
(100007, 4, 'GIRL GETS OWNED BY RC TRUCK LOL', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', 5, 'sd sdw svc', 1230742859, 23, 'a dadad adadasdad', 0, 0, 0, 0, 0, 0, 'GIRL GETS OWNED BY RC TRUCK LOL.flv', 'GIRL GETS OWNED BY RC TRUCK LOL.jpg', 0, 0, 0, 12771741, 0, '0', '0', '0', 5458);

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--

CREATE TABLE IF NOT EXISTS `video_comments` (
  `com_id` bigint(20) unsigned NOT NULL auto_increment,
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `reply_to` bigint(20) unsigned NOT NULL,
  `posted` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  `rating` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`com_id`),
  KEY `vid_id` (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `video_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `video_comment_votes`
--

CREATE TABLE IF NOT EXISTS `video_comment_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `com_id` bigint(20) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_comment_votes`
--


-- --------------------------------------------------------

--
-- Table structure for table `video_convert`
--

CREATE TABLE IF NOT EXISTS `video_convert` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `hash` varchar(100) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `tstamp` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_convert`
--

INSERT INTO `video_convert` (`vid_id`, `hash`, `ext`, `tstamp`) VALUES
(100000, '87/0b/c7/870bc725b8e76c7', '.mp4', 1277174807);

-- --------------------------------------------------------

--
-- Table structure for table `video_responses`
--

CREATE TABLE IF NOT EXISTS `video_responses` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `response_to` bigint(20) unsigned NOT NULL,
  `approved` enum('0','1') NOT NULL default '0',
  `posted` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`response_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_responses`
--


-- --------------------------------------------------------

--
-- Table structure for table `video_votes`
--

CREATE TABLE IF NOT EXISTS `video_votes` (
  `mem_id` bigint(20) unsigned NOT NULL,
  `vid_id` bigint(20) unsigned NOT NULL,
  `rate` tinyint(3) unsigned NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `mem_id` (`mem_id`,`vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_votes`
--


-- --------------------------------------------------------

--
-- Table structure for table `video_watch`
--

CREATE TABLE IF NOT EXISTS `video_watch` (
  `vid_id` bigint(20) unsigned NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  `expire` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `vid_id` (`vid_id`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_watch`
--


-- --------------------------------------------------------

--
-- Table structure for table `viewkeys`
--

CREATE TABLE IF NOT EXISTS `viewkeys` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `viewkey` varchar(250) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `viewkey` (`viewkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `viewkeys`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `shop_admin_rule`
--
ALTER TABLE `shop_admin_rule`
  ADD CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `shop_admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_api_rule`
--
ALTER TABLE `shop_api_rule`
  ADD CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `shop_api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_api_session`
--
ALTER TABLE `shop_api_session`
  ADD CONSTRAINT `FK_API_SESSION_USER` FOREIGN KEY (`user_id`) REFERENCES `shop_api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogindex_aggregation`
--
ALTER TABLE `shop_catalogindex_aggregation`
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogindex_aggregation_to_tag`
--
ALTER TABLE `shop_catalogindex_aggregation_to_tag`
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `shop_catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `shop_catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogindex_eav`
--
ALTER TABLE `shop_catalogindex_eav`
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogindex_minimal_price`
--
ALTER TABLE `shop_catalogindex_minimal_price`
  ADD CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogindex_price`
--
ALTER TABLE `shop_catalogindex_price`
  ADD CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_cataloginventory_stock_item`
--
ALTER TABLE `shop_cataloginventory_stock_item`
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `shop_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_cataloginventory_stock_status`
--
ALTER TABLE `shop_cataloginventory_stock_status`
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `shop_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogrule_group_website`
--
ALTER TABLE `shop_catalogrule_group_website`
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `shop_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogrule_product`
--
ALTER TABLE `shop_catalogrule_product`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `shop_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogrule_product_price`
--
ALTER TABLE `shop_catalogrule_product_price`
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogsearch_query`
--
ALTER TABLE `shop_catalogsearch_query`
  ADD CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalogsearch_result`
--
ALTER TABLE `shop_catalogsearch_result`
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `shop_catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_entity_datetime`
--
ALTER TABLE `shop_catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_entity_decimal`
--
ALTER TABLE `shop_catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_entity_int`
--
ALTER TABLE `shop_catalog_category_entity_int`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_entity_text`
--
ALTER TABLE `shop_catalog_category_entity_text`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_entity_varchar`
--
ALTER TABLE `shop_catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_product`
--
ALTER TABLE `shop_catalog_category_product`
  ADD CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_category_product_index`
--
ALTER TABLE `shop_catalog_category_product_index`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_compare_item`
--
ALTER TABLE `shop_catalog_compare_item`
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_eav_attribute`
--
ALTER TABLE `shop_catalog_eav_attribute`
  ADD CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_bundle_option`
--
ALTER TABLE `shop_catalog_product_bundle_option`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_bundle_option_value`
--
ALTER TABLE `shop_catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_bundle_price_index`
--
ALTER TABLE `shop_catalog_product_bundle_price_index`
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_bundle_selection`
--
ALTER TABLE `shop_catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_enabled_index`
--
ALTER TABLE `shop_catalog_product_enabled_index`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity`
--
ALTER TABLE `shop_catalog_product_entity`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `shop_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_datetime`
--
ALTER TABLE `shop_catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_decimal`
--
ALTER TABLE `shop_catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_gallery`
--
ALTER TABLE `shop_catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_int`
--
ALTER TABLE `shop_catalog_product_entity_int`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_media_gallery`
--
ALTER TABLE `shop_catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_media_gallery_value`
--
ALTER TABLE `shop_catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `shop_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_text`
--
ALTER TABLE `shop_catalog_product_entity_text`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_tier_price`
--
ALTER TABLE `shop_catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_entity_varchar`
--
ALTER TABLE `shop_catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_index_eav`
--
ALTER TABLE `shop_catalog_product_index_eav`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_index_eav_decimal`
--
ALTER TABLE `shop_catalog_product_index_eav_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_index_price`
--
ALTER TABLE `shop_catalog_product_index_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_index_tier_price`
--
ALTER TABLE `shop_catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_index_website`
--
ALTER TABLE `shop_catalog_product_index_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_link`
--
ALTER TABLE `shop_catalog_product_link`
  ADD CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `shop_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_link_attribute`
--
ALTER TABLE `shop_catalog_product_link_attribute`
  ADD CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `shop_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_link_attribute_decimal`
--
ALTER TABLE `shop_catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `shop_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `shop_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_link_attribute_int`
--
ALTER TABLE `shop_catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `shop_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `shop_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_catalog_product_link_attribute_varchar`
--
ALTER TABLE `shop_catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `shop_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `shop_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option`
--
ALTER TABLE `shop_catalog_product_option`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option_price`
--
ALTER TABLE `shop_catalog_product_option_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option_title`
--
ALTER TABLE `shop_catalog_product_option_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option_type_price`
--
ALTER TABLE `shop_catalog_product_option_type_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `shop_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option_type_title`
--
ALTER TABLE `shop_catalog_product_option_type_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `shop_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_option_type_value`
--
ALTER TABLE `shop_catalog_product_option_type_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_relation`
--
ALTER TABLE `shop_catalog_product_relation`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_CHILD` FOREIGN KEY (`child_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_super_attribute`
--
ALTER TABLE `shop_catalog_product_super_attribute`
  ADD CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_catalog_product_super_attribute_label`
--
ALTER TABLE `shop_catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `shop_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_super_attribute_pricing`
--
ALTER TABLE `shop_catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `shop_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_super_link`
--
ALTER TABLE `shop_catalog_product_super_link`
  ADD CONSTRAINT `FK_SUPER_PRODUCT_LINK_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SUPER_PRODUCT_LINK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_catalog_product_website`
--
ALTER TABLE `shop_catalog_product_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_WEBSITE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_checkout_agreement_store`
--
ALTER TABLE `shop_checkout_agreement_store`
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `shop_checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_cms_block_store`
--
ALTER TABLE `shop_cms_block_store`
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `shop_cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_cms_page_store`
--
ALTER TABLE `shop_cms_page_store`
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `shop_cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_cache_tag`
--
ALTER TABLE `shop_core_cache_tag`
  ADD CONSTRAINT `FK_CORE_CACHE_TAG` FOREIGN KEY (`cache_id`) REFERENCES `shop_core_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_layout_link`
--
ALTER TABLE `shop_core_layout_link`
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `shop_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_session`
--
ALTER TABLE `shop_core_session`
  ADD CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_store`
--
ALTER TABLE `shop_core_store`
  ADD CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `shop_core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_store_group`
--
ALTER TABLE `shop_core_store_group`
  ADD CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_translate`
--
ALTER TABLE `shop_core_translate`
  ADD CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_url_rewrite`
--
ALTER TABLE `shop_core_url_rewrite`
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `shop_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_core_variable_value`
--
ALTER TABLE `shop_core_variable_value`
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `shop_core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_coupon_aggregated`
--
ALTER TABLE `shop_coupon_aggregated`
  ADD CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_coupon_aggregated_order`
--
ALTER TABLE `shop_coupon_aggregated_order`
  ADD CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity`
--
ALTER TABLE `shop_customer_address_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity_datetime`
--
ALTER TABLE `shop_customer_address_entity_datetime`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity_decimal`
--
ALTER TABLE `shop_customer_address_entity_decimal`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity_int`
--
ALTER TABLE `shop_customer_address_entity_int`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity_text`
--
ALTER TABLE `shop_customer_address_entity_text`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_address_entity_varchar`
--
ALTER TABLE `shop_customer_address_entity_varchar`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_eav_attribute`
--
ALTER TABLE `shop_customer_eav_attribute`
  ADD CONSTRAINT `FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity`
--
ALTER TABLE `shop_customer_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity_datetime`
--
ALTER TABLE `shop_customer_entity_datetime`
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity_decimal`
--
ALTER TABLE `shop_customer_entity_decimal`
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity_int`
--
ALTER TABLE `shop_customer_entity_int`
  ADD CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity_text`
--
ALTER TABLE `shop_customer_entity_text`
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customer_entity_varchar`
--
ALTER TABLE `shop_customer_entity_varchar`
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_dataflow_batch`
--
ALTER TABLE `shop_dataflow_batch`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `shop_dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_dataflow_batch_export`
--
ALTER TABLE `shop_dataflow_batch_export`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `shop_dataflow_batch` (`batch_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_dataflow_batch_import`
--
ALTER TABLE `shop_dataflow_batch_import`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `shop_dataflow_batch` (`batch_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_dataflow_import_data`
--
ALTER TABLE `shop_dataflow_import_data`
  ADD CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `shop_dataflow_session` (`session_id`);

--
-- Constraints for table `shop_dataflow_profile_history`
--
ALTER TABLE `shop_dataflow_profile_history`
  ADD CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `shop_dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_design_change`
--
ALTER TABLE `shop_design_change`
  ADD CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_directory_country_region_name`
--
ALTER TABLE `shop_directory_country_region_name`
  ADD CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `shop_directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_link`
--
ALTER TABLE `shop_downloadable_link`
  ADD CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_link_price`
--
ALTER TABLE `shop_downloadable_link_price`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `shop_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_link_purchased`
--
ALTER TABLE `shop_downloadable_link_purchased`
  ADD CONSTRAINT `FK_DOWNLOADABLE_PURCHASED_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `shop_sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_link_purchased_item`
--
ALTER TABLE `shop_downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `shop_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `shop_sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_link_title`
--
ALTER TABLE `shop_downloadable_link_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `shop_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_sample`
--
ALTER TABLE `shop_downloadable_sample`
  ADD CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_downloadable_sample_title`
--
ALTER TABLE `shop_downloadable_sample_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `shop_downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute`
--
ALTER TABLE `shop_eav_attribute`
  ADD CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute_group`
--
ALTER TABLE `shop_eav_attribute_group`
  ADD CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `shop_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute_label`
--
ALTER TABLE `shop_eav_attribute_label`
  ADD CONSTRAINT `FK_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute_option`
--
ALTER TABLE `shop_eav_attribute_option`
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute_option_value`
--
ALTER TABLE `shop_eav_attribute_option_value`
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_attribute_set`
--
ALTER TABLE `shop_eav_attribute_set`
  ADD CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity`
--
ALTER TABLE `shop_eav_entity`
  ADD CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_attribute`
--
ALTER TABLE `shop_eav_entity_attribute`
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `shop_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_datetime`
--
ALTER TABLE `shop_eav_entity_datetime`
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_decimal`
--
ALTER TABLE `shop_eav_entity_decimal`
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_int`
--
ALTER TABLE `shop_eav_entity_int`
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_store`
--
ALTER TABLE `shop_eav_entity_store`
  ADD CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_text`
--
ALTER TABLE `shop_eav_entity_text`
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_entity_varchar`
--
ALTER TABLE `shop_eav_entity_varchar`
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_form_element`
--
ALTER TABLE `shop_eav_form_element`
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `shop_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `shop_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_form_fieldset`
--
ALTER TABLE `shop_eav_form_fieldset`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `shop_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_form_fieldset_label`
--
ALTER TABLE `shop_eav_form_fieldset_label`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `shop_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_form_type`
--
ALTER TABLE `shop_eav_form_type`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_eav_form_type_entity`
--
ALTER TABLE `shop_eav_form_type_entity`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `shop_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_googlebase_attributes`
--
ALTER TABLE `shop_googlebase_attributes`
  ADD CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `shop_googlebase_types` (`type_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_googlebase_items`
--
ALTER TABLE `shop_googlebase_items`
  ADD CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_googlebase_types`
--
ALTER TABLE `shop_googlebase_types`
  ADD CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `shop_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_googleoptimizer_code`
--
ALTER TABLE `shop_googleoptimizer_code`
  ADD CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_index_process_event`
--
ALTER TABLE `shop_index_process_event`
  ADD CONSTRAINT `FK_INDEX_EVNT_PROCESS` FOREIGN KEY (`event_id`) REFERENCES `shop_index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT` FOREIGN KEY (`process_id`) REFERENCES `shop_index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_newsletter_problem`
--
ALTER TABLE `shop_newsletter_problem`
  ADD CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `shop_newsletter_queue` (`queue_id`),
  ADD CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `shop_newsletter_subscriber` (`subscriber_id`);

--
-- Constraints for table `shop_newsletter_queue`
--
ALTER TABLE `shop_newsletter_queue`
  ADD CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `shop_newsletter_template` (`template_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_newsletter_queue_link`
--
ALTER TABLE `shop_newsletter_queue_link`
  ADD CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `shop_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `shop_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_newsletter_queue_store_link`
--
ALTER TABLE `shop_newsletter_queue_store_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `shop_newsletter_queue` (`queue_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_newsletter_subscriber`
--
ALTER TABLE `shop_newsletter_subscriber`
  ADD CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_poll`
--
ALTER TABLE `shop_poll`
  ADD CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_poll_answer`
--
ALTER TABLE `shop_poll_answer`
  ADD CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `shop_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_poll_store`
--
ALTER TABLE `shop_poll_store`
  ADD CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `shop_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_poll_vote`
--
ALTER TABLE `shop_poll_vote`
  ADD CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `shop_poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_product_alert_price`
--
ALTER TABLE `shop_product_alert_price`
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_product_alert_stock`
--
ALTER TABLE `shop_product_alert_stock`
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_rating`
--
ALTER TABLE `shop_rating`
  ADD CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `shop_rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_rating_option`
--
ALTER TABLE `shop_rating_option`
  ADD CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `shop_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_rating_option_vote`
--
ALTER TABLE `shop_rating_option_vote`
  ADD CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `shop_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `shop_rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_rating_option_vote_aggregated`
--
ALTER TABLE `shop_rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `shop_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_rating_store`
--
ALTER TABLE `shop_rating_store`
  ADD CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `shop_rating` (`rating_id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_rating_title`
--
ALTER TABLE `shop_rating_title`
  ADD CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `shop_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_report_compared_product_index`
--
ALTER TABLE `shop_report_compared_product_index`
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_report_event`
--
ALTER TABLE `shop_report_event`
  ADD CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `shop_report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_report_viewed_product_index`
--
ALTER TABLE `shop_report_viewed_product_index`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_review`
--
ALTER TABLE `shop_review`
  ADD CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `shop_review_status` (`status_id`);

--
-- Constraints for table `shop_review_detail`
--
ALTER TABLE `shop_review_detail`
  ADD CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `shop_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_review_entity_summary`
--
ALTER TABLE `shop_review_entity_summary`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_review_store`
--
ALTER TABLE `shop_review_store`
  ADD CONSTRAINT `FK_REVIEW_STORE_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `shop_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_salesrule_customer`
--
ALTER TABLE `shop_salesrule_customer`
  ADD CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `shop_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_salesrule_label`
--
ALTER TABLE `shop_salesrule_label`
  ADD CONSTRAINT `FK_SALESRULE_LABEL_RULE` FOREIGN KEY (`rule_id`) REFERENCES `shop_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_order_item`
--
ALTER TABLE `shop_sales_flat_order_item`
  ADD CONSTRAINT `FK_SALES_ORDER_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote`
--
ALTER TABLE `shop_sales_flat_quote`
  ADD CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_address`
--
ALTER TABLE `shop_sales_flat_quote_address`
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `shop_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_address_item`
--
ALTER TABLE `shop_sales_flat_quote_address_item`
  ADD CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `shop_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `shop_sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `shop_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_item`
--
ALTER TABLE `shop_sales_flat_quote_item`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `shop_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `shop_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_item_option`
--
ALTER TABLE `shop_sales_flat_quote_item_option`
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `shop_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_payment`
--
ALTER TABLE `shop_sales_flat_quote_payment`
  ADD CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `shop_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_flat_quote_shipping_rate`
--
ALTER TABLE `shop_sales_flat_quote_shipping_rate`
  ADD CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `shop_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_invoiced_aggregated`
--
ALTER TABLE `shop_sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_invoiced_aggregated_order`
--
ALTER TABLE `shop_sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order`
--
ALTER TABLE `shop_sales_order`
  ADD CONSTRAINT `FK_SALES_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_aggregated_created`
--
ALTER TABLE `shop_sales_order_aggregated_created`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_datetime`
--
ALTER TABLE `shop_sales_order_datetime`
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_decimal`
--
ALTER TABLE `shop_sales_order_decimal`
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity`
--
ALTER TABLE `shop_sales_order_entity`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity_datetime`
--
ALTER TABLE `shop_sales_order_entity_datetime`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity_decimal`
--
ALTER TABLE `shop_sales_order_entity_decimal`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity_int`
--
ALTER TABLE `shop_sales_order_entity_int`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity_text`
--
ALTER TABLE `shop_sales_order_entity_text`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_entity_varchar`
--
ALTER TABLE `shop_sales_order_entity_varchar`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_int`
--
ALTER TABLE `shop_sales_order_int`
  ADD CONSTRAINT `FK_SALES_ORDER_INT` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_tax`
--
ALTER TABLE `shop_sales_order_tax`
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ORDER` FOREIGN KEY (`order_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_text`
--
ALTER TABLE `shop_sales_order_text`
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_order_varchar`
--
ALTER TABLE `shop_sales_order_varchar`
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `shop_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_payment_transaction`
--
ALTER TABLE `shop_sales_payment_transaction`
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `shop_sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `shop_sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `shop_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_refunded_aggregated`
--
ALTER TABLE `shop_sales_refunded_aggregated`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_refunded_aggregated_order`
--
ALTER TABLE `shop_sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_shipping_aggregated`
--
ALTER TABLE `shop_sales_shipping_aggregated`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sales_shipping_aggregated_order`
--
ALTER TABLE `shop_sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shop_sitemap`
--
ALTER TABLE `shop_sitemap`
  ADD CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_tag_relation`
--
ALTER TABLE `shop_tag_relation`
  ADD CONSTRAINT `FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `shop_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_tag_summary`
--
ALTER TABLE `shop_tag_summary`
  ADD CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `shop_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_tax_calculation`
--
ALTER TABLE `shop_tax_calculation`
  ADD CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `shop_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `shop_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `shop_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `shop_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_tax_calculation_rate_title`
--
ALTER TABLE `shop_tax_calculation_rate_title`
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `shop_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_tax_order_aggregated_created`
--
ALTER TABLE `shop_tax_order_aggregated_created`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_weee_discount`
--
ALTER TABLE `shop_weee_discount`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `shop_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_weee_tax`
--
ALTER TABLE `shop_weee_tax`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `shop_directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `shop_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `shop_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_widget_instance_page`
--
ALTER TABLE `shop_widget_instance_page`
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `shop_widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_widget_instance_page_layout`
--
ALTER TABLE `shop_widget_instance_page_layout`
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `shop_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `shop_widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_wishlist`
--
ALTER TABLE `shop_wishlist`
  ADD CONSTRAINT `FK_WISHLIST_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_wishlist_item`
--
ALTER TABLE `shop_wishlist_item`
  ADD CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `shop_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `shop_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `shop_wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;
