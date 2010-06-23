-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 22, 2010 at 01:28 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `confor`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`id`)
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
-- Table structure for table `get speaker by id`
-- in use (#1356 - View 'confor.get speaker by id' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE IF NOT EXISTS `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
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
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(100) DEFAULT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate_amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `txn_id`, `membership_id`, `user_id`, `rate_id`, `rate_amount`, `date`, `status`) VALUES
(1, NULL, 2, 1, 2, '0.99', '2010-03-02 12:10:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `amount` varchar(255) NOT NULL,
  `term` bigint(255) NOT NULL,
  `term_c` varchar(1) NOT NULL,
  `automatic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
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
  `reg_verify` tinyint(1) NOT NULL DEFAULT '0',
  `reg_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `user_limit` varchar(5) NOT NULL DEFAULT '0',
  `currency` varchar(3) NOT NULL,
  `cur_symbol` varchar(5) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `version` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`site_name`, `site_slogan`, `site_url`, `keywords`, `desc`, `site_email`, `paypal_id`, `sandbox`, `reg_verify`, `reg_allowed`, `user_limit`, `currency`, `cur_symbol`, `captcha`, `version`) VALUES
('Your Site Name', 'Your Site Name Slogan', 'http://localhost/project/confor/pay', 'site keywords,separated,by,coma', 'Meta Description', 'yoursite@email.com', 'paypal@youremail.com', 1, 1, 1, '0', 'USD', '$', 1, 'v.1.0');

--


CREATE TABLE IF NOT EXISTS `users` (
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `membership_id`, `username`, `email`, `name`, `first_name`, `company_name`, `country`, `password`, `cookie_id`, `token`, `register_date`, `last_ip`, `last_access`, `notify`, `status`, `userlevel`) VALUES
(1, 1, 'admin', 'admin@emailaddress.com', 'Webmaster', NULL, NULL, NULL, '21232f297a57a5a743894a0e4a801fc3', '2caf514cf33dd0472169a4e46ece3569', '0', '2010-03-03 15:08:38', '127.0.0.1', '2010-06-22 00:54:51', 1, 1, 9);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
