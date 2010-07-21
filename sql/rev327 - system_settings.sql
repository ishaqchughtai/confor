-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 22, 2010 at 01:41 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

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
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(11) NOT NULL,
  `num_per_page_video` tinyint(11) NOT NULL DEFAULT '7',
  `num_per_page_conf` tinyint(11) NOT NULL DEFAULT '7',
  `num_per_page_blog` tinyint(11) NOT NULL DEFAULT '7',
  `order_conf_field` varchar(50) DEFAULT NULL,
  `order_conf_sort` varchar(5) NOT NULL DEFAULT 'asc',
  `order_video_field` varchar(50) DEFAULT NULL,
  `order_video_sort` varchar(5) NOT NULL DEFAULT 'asc',
  `order_blog_field` varchar(50) DEFAULT NULL,
  `order_blog_sort` varchar(5) NOT NULL DEFAULT 'asc',
  `site_off` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `num_per_page_video`, `num_per_page_conf`, `num_per_page_blog`, `order_conf_field`, `order_conf_sort`, `order_video_field`, `order_video_sort`, `order_blog_field`, `order_blog_sort`, `site_off`) VALUES
(1, 5, 7, 3, 'title', 'asc', 'date', 'desc', 'CountView', 'asc', 0);
