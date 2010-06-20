/*
MySQL Data Transfer
Source Host: localhost
Source Database: confor
Target Host: localhost
Target Database: confor
Date: 20/06/2010 8:51:09 SA
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tbladmin
-- ----------------------------
CREATE TABLE `tbladmin` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PayPalAccount` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Right` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbladvertisement
-- ----------------------------
CREATE TABLE `tbladvertisement` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `DateBeginning` date NOT NULL,
  `DateExpiry` date NOT NULL,
  `AdvertiserName` varchar(50) NOT NULL,
  `AdvertiserEmail` varchar(50) NOT NULL,
  `URL` text NOT NULL,
  `TextTips` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblblog
-- ----------------------------
CREATE TABLE `tblblog` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Author` int(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(200) NOT NULL,
  `Text` text NOT NULL,
  `Link` varchar(200) NOT NULL,
  `CountView` int(11) unsigned default NULL,
  `CountComment` int(11) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_tblblog_tbladmin` (`Author`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblcomment
-- ----------------------------
CREATE TABLE `tblcomment` (
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
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblevent
-- ----------------------------
CREATE TABLE `tblevent` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Date` date NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` char(4) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Speaker` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Speaker` (`Speaker`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblremember_me
-- ----------------------------
CREATE TABLE `tblremember_me` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(16) character set latin1 collate latin1_general_cs default NULL,
  `usernamehash` varchar(128) default NULL,
  `random_string` varchar(128) default NULL,
  `origin_time` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblspeaker
-- ----------------------------
CREATE TABLE `tblspeaker` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `CompanyName` varchar(50) default NULL,
  `Email` varchar(50) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Language` varchar(10) default 'en',
  `Password` varchar(50) NOT NULL,
  `Description` text,
  `Subscription` int(10) unsigned NOT NULL,
  `Suspend` tinyint(1) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Subscription` (`Subscription`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblsubscription
-- ----------------------------
CREATE TABLE `tblsubscription` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `SubcriptionDate` date default NULL,
  `SubscriptionType` int(10) unsigned default NULL,
  `SubscriptionExpiration` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SubscriptionType` (`SubscriptionType`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblsubscriptiontype
-- ----------------------------
CREATE TABLE `tblsubscriptiontype` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `TypeName` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblvideoconference
-- ----------------------------
CREATE TABLE `tblvideoconference` (
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- View structure for get speaker by id
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get speaker by id` AS select `tblspeaker`.`Email` AS `Email`,`tblspeaker`.`ID` AS `ID`,`tblsubscriptiontype`.`TypeName` AS `TypeName` from ((`tblspeaker` join `tblsubscription` on((`tblspeaker`.`Subscription` = `tblsubscription`.`ID`))) join `tblsubscriptiontype` on((`tblsubscription`.`SubscriptionType` = `tblsubscriptiontype`.`ID`))) order by `tblspeaker`.`ID` limit 2,4;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tbladmin` VALUES ('9', 'Quyet', 'Dao Van', 'daovanquyet@xemmex.net', 'daovanquyet@paypal.com', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tbladmin` VALUES ('8', 'admin', 'admin', 'admin@confor.ca', 'admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `tbladvertisement` VALUES ('1', '2010-06-14', '2010-06-21', 'dang the cuong', 'cuongdt90@gmail.com', 'http://vnexpress.net/GL/Home/', 'Donec quam felis, ultricies nec, pellentesque eu, ', 'cuu_vui_ve_va_soi_xam16.jpg');
INSERT INTO `tbladvertisement` VALUES ('26', '2010-06-16', '2010-06-30', 'nguyen van a', 'abcd@yahoo.com', 'http://abc.com', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam14.jpg');
INSERT INTO `tbladvertisement` VALUES ('25', '2010-06-16', '2010-06-16', 'NGUYEN HAI DANG', 'a@yahoo.com', 'http://vnexpress.net/GL/Home/', 'Nulla consequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam15.jpg');
INSERT INTO `tbladvertisement` VALUES ('22', '2010-06-16', '2010-06-22', 'CUONG', 'abc@yahoo.com', 'http://dantri.com.vn/', 'Consequat massa quis enim. Donec pede justo, fring', 'cuu_vui_ve_va_soi_xam1.jpg');
INSERT INTO `tbladvertisement` VALUES ('23', '2010-06-16', '2010-06-22', 'avs', 'abcz@yahoo.com', 'http://dantri.com.vn/', 'Eequat massa quis enim. Donec pede justo,', 'cuu_vui_ve_va_soi_xam4.jpg');
INSERT INTO `tblblog` VALUES ('1', '2010-06-13', '8', 'new blog', 'new blog', 'asda', '<p><strong><em><u>asdasdasd</u></em></strong></p>\n<p>asdasdasdasd</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('2', '2010-06-13', '8', 'asdasd test', 'asdasdasd', 'asda', '<p>asdasd</p>', 'slider_2.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('3', '2010-06-13', '8', 'thu cai asdasd', 'asdasdasd', '1231', '<p>asdasd</p>', 'AudiLogo_1_.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('5', '2010-06-13', '8', 'asdqwe2', 'qwe', 'q2', '<p>wqqqqqqqqqqqqqqqqqqqqqq</p>', 'google_maps.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('7', '2010-06-13', '8', '321312', '1231231', '1231', '<p>123123qweqwe</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('8', '2010-06-16', '8', '213qweqwe', 'qweqweqwe', 'asdasdasd asdas asdasd sadasd', '<p>qweqweqweqweqweqwe</p>', 'Love-Is.jpg', '26', '2');
INSERT INTO `tblblog` VALUES ('9', '2010-06-13', '8', 'qweqweqweqwe', 'weqweqwe', 'qweq', '<p>qweqweqwe</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('13', '2010-06-13', '8', 'Blog ngay 13', 'asdasdasd', 'asda', '<p>asdasdasdasdasdasd</p>', 'Blue_hills.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('16', '2010-06-13', '8', '213qweqwe11', 'asdasdasd', '11 2', '<p>asdas</p>', 'google_maps.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('10', '2010-06-13', '8', 'new nhat', 'asdasdasd', 'asda', '<p>sdasdasdasd</p>', '650jma.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('11', '2010-06-13', '8', 'aw', 'qwe', 'qweq', '<p>qweqweqweqwe</p>', 'Sunset.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('12', '2010-06-13', '8', 'asdasdasdasdasdasdasd', 'asdas', 'asda', '<p>asdasdasdasd</p>', '650jma.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('14', '2010-06-13', '8', '213qweqwem', '112323123333333333333', '124', '<p>mkm</p>', '0-3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('15', '2010-06-13', '8', 'blog chieu', 'asdkak', 'asdk', '<p>sadasdasdasd</p>', 'port_1.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('17', '2010-06-15', '8', 'blog toi 13 a', 'asdasd', 'asda', '<p>asdasdasd</p>', 'AudiLogo_1_.jpg', '23', '1');
INSERT INTO `tblblog` VALUES ('18', '2010-06-13', '8', 'need iphone', 'new blog', 'asdk', '<p>asdasdasdasd</p>', 'boeing-737-business-jet-model-plane_m.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('19', '2010-06-14', '8', 'test lan cuoi', 'asdasd', 'asda', '<p>asdasdasdas</p>', 'hubert.jpg', '3', '0');
INSERT INTO `tblblog` VALUES ('20', '2010-06-14', '8', 'thu id ', 'qweqwe', 'qweq', '<p>weqweqaw</p>', 'post_2.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('21', '2010-06-14', '8', 'thu id asd', 'asdasd', 'asda', '<p>asdasdasd</p>', 'post_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('22', '2010-06-14', '8', 'thu lai id ', 'asdasd', 'adas', '<p>adasdasda</p>', 'port_6.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('23', '2010-06-14', '8', 'chiu 24', 'qwe', 'qweq', '<p>sdfsdfsdf</p>', 'sponsor_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('31', '2010-06-15', '8', 'blog dem 15', 'new blog', 'asda', '<p>asdasd</p>', 'port_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('27', '2010-06-15', '8', 'blog toi 15', 'hekeka', 'asda', '<p>asdasd</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('28', '2010-06-15', '8', 'mkmmkkkkkkk', 'asdasdasd', 'asda', '<p>ghcvhc</p>', 'post_3.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('29', '2010-06-15', '8', 'tessssssss', 'asdasdasd', 'asda', '<p>asdasd</p>', 'port_4.jpg', '0', '0');
INSERT INTO `tblblog` VALUES ('44', '2010-06-16', '8', 'blog dem 15 1', 'asdasdasd', 'asd asdas asda asda', '<p>asdasdasd</p>', 'port_4.jpg', '4', '0');
INSERT INTO `tblblog` VALUES ('42', '2010-06-16', '8', 'blog chieu 16 1511', 'asdasd', 'asd asdas asda', '<p>asdasd</p>', 'google_maps.jpg', '8', '0');
INSERT INTO `tblblog` VALUES ('46', '2010-06-17', '8', 'nguoi viet', 'xxx', 'yyy', '<p><span style=\"font-size: xx-large;\"><span style=\"font-family: Arial;\"><span style=\"color: rgb(153, 204, 0);\">oap.</span></span></span> ac.</p>', 'pet.JPG', '66', '1');
INSERT INTO `tblcomment` VALUES ('67', '11111111111111111', '8', '2010-06-16 04:06:52', 'xemmex new', 'http://asdasdasd.com', 'huunam09@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('66', 'ádasdasd', '8', '2010-06-16 02:06:41', 'admin', 'http://google.com', 'se7max@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('68', 'asdasd', '17', '2010-06-16 05:06:05', 'xemmex new', 'http://asdasdasd.com', 'huunam09@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('69', 'oh my god', '8', '2010-06-17 04:06:30', 'Dang', 'www.abc', 'yugi3000@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('70', 'oh my god', '8', '2010-06-17 04:06:04', 'Dang', 'www.abc', 'yugi3000@gmail.com', '0');
INSERT INTO `tblcomment` VALUES ('73', 'xxxxxxx', '46', '2010-06-17 06:06:15', 'toiotoi', 'oh oh', 'yugi3000@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('74', 'bbbbb', '46', '2010-06-17 06:06:14', 'meomeo', 'xsafsafaf', 'yugi3000@gmail.com', '0');
INSERT INTO `tblevent` VALUES ('1', '2010-06-12', 'abc', 'haha', 'acbd', 'sdfr sfs fsa fasf', '1', '1');
INSERT INTO `tblevent` VALUES ('2', '2010-06-12', 'skjfh askfjh afkj shadfkj as', 'sdkj fhska fhskj dfskja dfh', 'hsdh', 's dkfhskdj fhakjs fhkjs dfhkjas hdfkja skhfj askjf hkjash fkj shkjf hksjahfakjsfh kajh fkajfh kjfh kj fhkjasfh kjsahf ksjhfskajfh', '2', '1');
INSERT INTO `tblevent` VALUES ('3', '2010-06-12', 'adjsk dkjs dsk sklfa slkf slkfjl', 'kldsjfasklf jaskldfjlasjflas ', 'skjd', 'kdslfjasf jaslkf jalk f', '1', '0');
INSERT INTO `tblevent` VALUES ('4', '2010-06-12', 'xyzww', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('5', '2010-06-12', 'fdfsd', 'fsfsafsa', 'ddsf', '<p>&nbsp;sdfas fasf<img src=\"http://localhost/confor/system/plugins/fckeditor/editor/images/smiley/msn/angry_smile.gif\" alt=\"\" /></p>', '2', '1');
INSERT INTO `tblevent` VALUES ('6', '2010-06-16', 'sadadasd', 'adsadada', 'adad', '<p>?asd ad ad ad ad a d?d</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('7', '2010-06-16', '7wqeqewqewqe', 'xyzwwsdqweq', 'qwqw', '<p>456sq qw e qqeq</p>\n<p>?</p>', '7', '1');
INSERT INTO `tblevent` VALUES ('8', '2010-06-17', ' skjfh askj fhaskjh fkjas f', 'sfsa fs fsfs fsfsa', 'sfds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a \"significant change\".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an \"independent public commission\" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', '1', '1');
INSERT INTO `tblevent` VALUES ('9', '2010-06-17', 'csdfsfs', 'sdfasfssd sdf sdf ', 'sdds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a \"significant change\".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an \"independent public commission\" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', '1', '1');
INSERT INTO `tblevent` VALUES ('21', '2010-06-18', 'oi con meo', 'con meo dien', 'a b', '<p>Sed vel urna neque, ut ornare lacus. Aenean pretium luctus elit, id dictum dolor varius quis. Morbi venenatis ante quis nunc vehicula pellentesque. Sed et elit eu metus porta egestas. Ut adipiscing dui at dolor lacinia eleifend. Sed et leo neque. Nullam placerat sagittis tristique. In sed cursus purus. Nulla.<br />\n&nbsp;</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('18', '2010-06-17', 'skjfh askj fhaskjh fkjas fssssdasd', 'adadadds?sasas', 'adaq', '<p>asda a ad ad asd asda ?&acirc; da da ?a ada adadadad </p>', '1', '1');
INSERT INTO `tblevent` VALUES ('19', '2010-06-18', 'oh oh oh yeah', 'mmmmm ac ac', 'sac', '<p><span style=\"font-size: xx-large;\"><span style=\"font-family: Verdana;\">sl <span style=\"color: rgb(153, 204, 0);\">fsld fslf sklf alf ald fasl</span>f dslf asf</span></span></p>\n<p><strong>daf alsf alf alf asfasfasf</strong></p>', '2', '1');
INSERT INTO `tblevent` VALUES ('22', '2010-06-18', '111111111111111111111', '2222222222222', '3333', '<p>4444444444444444444444444444444444</p>', '10', '1');
INSERT INTO `tblevent` VALUES ('23', '2010-06-18', 'xyz', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '7', '1');
INSERT INTO `tblremember_me` VALUES ('8', 'abc@gmail.com', 'c0d0a32c405c68cb538e3891a3e3bce98887f012', 'xrrnuBjWJo8QCGu7QDaBKijDIn7BQBJjsqWpgI0LsUTybI2imAhqNnIpkSGTGNRbUQ529PRJ4g6jvGDxIzjolEuzOxlQO1yYrOyHektT4dlx0awZ9xOWlLrY1wysXTtN', '1276917079');
INSERT INTO `tblspeaker` VALUES ('1', 'Phong', 'Nguyen ', 'XEMMEX', 'abc@gmail.com', '1', 'fr', 'e10adc3949ba59abbe56e057f20f883e', 'bbb cccc dddd', '2', '0');
INSERT INTO `tblspeaker` VALUES ('2', 'abcxxx', 'Meo meo', 'xemmex', 'def@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'adf  asdf sdf', '2', null);
INSERT INTO `tblspeaker` VALUES ('3', '', 'adsafsfa', 'llllm', 'abc11@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'afaf', '1', null);
INSERT INTO `tblspeaker` VALUES ('4', '', 'asaa dafsf', 'kkkk', 'abc10@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'asfaf', '1', null);
INSERT INTO `tblspeaker` VALUES ('5', '', 'aabb ccdd', 'yyy', 'abc9@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'asfa', '1', null);
INSERT INTO `tblspeaker` VALUES ('6', '', 'eee fff ggg', 'hhhh', 'abc8@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'as', '1', null);
INSERT INTO `tblspeaker` VALUES ('7', 'daica', 'gg  adaf', 'gggg', 'abc7@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('8', '', 'sda asadfasf', 'ffff', 'abc6@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fa', '1', null);
INSERT INTO `tblspeaker` VALUES ('9', '', 'adfadf', 'eeee', 'abc5@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('10', '', 'adfa  afff', 'dddd', 'abc4@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'a', '1', null);
INSERT INTO `tblspeaker` VALUES ('11', '', 'adf saaaa', 'cccc', 'abc3@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fd', '1', null);
INSERT INTO `tblspeaker` VALUES ('12', '', 'bbdddsaf', 'bbbb', 'abc2@gmail.com', '1', 'en', 'e10adc3949ba59abbe56e057f20f883e', 'fdff', '1', null);
INSERT INTO `tblsubscription` VALUES ('1', '2010-06-07', '1', '2014-08-08');
INSERT INTO `tblsubscription` VALUES ('2', '2010-06-16', '2', '2010-07-10');
INSERT INTO `tblsubscription` VALUES ('3', null, '2', null);
INSERT INTO `tblsubscription` VALUES ('4', null, '3', null);
INSERT INTO `tblsubscription` VALUES ('5', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('6', null, '2', null);
INSERT INTO `tblsubscription` VALUES ('7', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('8', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('9', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('10', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('11', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('12', null, '1', null);
INSERT INTO `tblsubscription` VALUES ('13', null, '1', null);
INSERT INTO `tblsubscriptiontype` VALUES ('1', 'level1');
INSERT INTO `tblsubscriptiontype` VALUES ('2', 'level2');
INSERT INTO `tblsubscriptiontype` VALUES ('3', 'level3');
INSERT INTO `tblsubscriptiontype` VALUES ('4', 'level4');
INSERT INTO `tblsubscriptiontype` VALUES ('5', 'level5');
INSERT INTO `tblvideoconference` VALUES ('1', '2010-06-11 14:26:58', 'Bullshit', 'Bullshit', 'a', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '20', '1', '0', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.flv', '10', '1', 'The Elephant Song - Cool Tunes for Kids by Eric Herman.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('2', '2010-06-11 14:30:42', 'Go to hell', 'What the hell', 'a b', 'san massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed id nibh in risus rhoncus mattis. Morb', '12', '0', '1', 'fashion_promo.flv', '20', '2', 'fashion_promo.jpg', '2');
INSERT INTO `tblvideoconference` VALUES ('3', '2010-06-16 09:05:51', 'YouTube - Funny Commercial', 'YouTube - Funny Commercial', 'a b c', 'YouTube - Funny Commercial', '2', '1', '0', 'YouTube - Funny Commercial(1).flv', '1', '3', 'YouTube - Funny Commercial.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('4', '2010-06-16 09:08:18', 'best, funniest commercial video', 'best, funniest commercial video', 'a b c d', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', '2', '1', '0', 'best, funniest commercial video.flv', '3', '3', 'best, funniest commercial video.jpg', '2');
INSERT INTO `tblvideoconference` VALUES ('5', '2010-06-16 09:10:40', 'funny Commercial', 'funny Commercial', 'a b c d e', 'funny Commercial', '2', '1', '0', 'funny Commercial.flv', '4', '4', 'funny Commercial.jpg', '1');
INSERT INTO `tblvideoconference` VALUES ('6', '2010-06-16 09:11:37', 'without brains', 'without brains', 'a b c d e f', 'ra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla he', '2', '1', '0', 'without brains.flv', '5', '5', 'without brains.jpg', '2');
INSERT INTO `tblvideoconference` VALUES ('7', '2010-06-16 09:13:16', 'Binh minh diu em', 'Binh minh diu em', 'a b c d e f g', 'Binh minh diu em', '36', '1', '0', 'Binh minh diu em.flv', '6', '6', 'Binh minh diu em.jpg', '3');
INSERT INTO `tblvideoconference` VALUES ('8', '2010-06-16 16:38:08', 'Cay sao giay', 'Cay sao giay', 'a b c d e f g h', 'Cay sao giay.flv', '27', '1', '0', 'Cay sao giay.flv', '5', '3', 'Cay sao giay.jpg', null);
