-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2010 at 02:32 PM
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
-- Table structure for table `tbloffice`
--

DROP TABLE IF EXISTS `tbloffice`;
CREATE TABLE IF NOT EXISTS `tbloffice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `lang` char(4) NOT NULL DEFAULT 'en',
  `Image` varchar(200) DEFAULT 'noimage.gif',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tbloffice`
--

INSERT INTO `tbloffice` (`id`, `title`, `content`, `date`, `lang`, `Image`, `sort`) VALUES
(6, 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', 0),
(2, 'hehehe', 'chang co noi dung gi dau ma vao xem', '2010-07-16', 'fr', 'noimage.gif', 0),
(3, 'title tieng phap154545', '<p>noi dung cui mia</p>', '2010-07-16', 'fr', 'noimage.gif', 0),
(4, 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'fr', 'noimage.gif', 0),
(5, 'Eng 1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'en', 'noimage.gif', 1),
(7, 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', 0),
(8, 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif', 0),
(9, 'Eng 2', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif', 2),
(10, 'Eng 3', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif', 3),
(11, 'title tieng phap154545', '<p>title tieng phap154545</p>', '2010-07-17', 'fr', 'noimage.gif', 0),
(12, 'Eng 4', '<p>title tieng phap154545</p>', '2010-07-17', 'en', 'noimage.gif', 4),
(13, 'Eng 5', '<p>title tieng phap154545</p>', '2010-07-17', 'en', 'noimage.gif', 5),
(14, 'Eng 6', '<p>test new</p>', '2010-07-23', 'en', '6O5pKXd5hUPmcQ17.jpg', 6),
(15, 'Eng 7', '<p>test</p>', '2010-07-23', 'en', 'PCBhctHmRRGVHmWC.jpg', 7);
