/*
Navicat MySQL Data Transfer

Source Server         : xemmex
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : conferen_conferen

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-07-23 17:24:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbloffice`
-- ----------------------------
DROP TABLE IF EXISTS `tbloffice`;
CREATE TABLE `tbloffice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `lang` char(4) NOT NULL DEFAULT 'en',
  `Image` varchar(200) DEFAULT 'noimage.gif',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbloffice
-- ----------------------------
INSERT INTO `tbloffice` VALUES ('6', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('2', 'hehehe', 'chang co noi dung gi dau ma vao xem', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('3', 'title tieng phap154545', '<p>noi dung cui mia</p>', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('4', 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('5', 'hahaha1', '<p>chang co noi dung dau nhe1</p>', '2010-07-16', 'en', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('7', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('8', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('9', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('10', 'title tieng phap154545', 'title tieng phap154545', '2010-07-16', 'en', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('11', 'title tieng phap154545', '<p>title tieng phap154545</p>', '2010-07-17', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('12', 'title tieng', '<p>title tieng phap154545</p>', '2010-07-17', 'en', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('13', 'title', '<p>title tieng phap154545</p>', '2010-07-17', 'fr', 'noimage.gif');
INSERT INTO `tbloffice` VALUES ('14', 'test new', '<p>test new</p>', '2010-07-23', 'fr', '6O5pKXd5hUPmcQ17.jpg');
INSERT INTO `tbloffice` VALUES ('15', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa asd', '<p>test</p>', '2010-07-23', 'fr', 'PCBhctHmRRGVHmWC.jpg');

-- ----------------------------
-- Table structure for `tbltraining`
-- ----------------------------
DROP TABLE IF EXISTS `tbltraining`;
CREATE TABLE `tbltraining` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Content` text NOT NULL,
  `Lang` char(4) NOT NULL DEFAULT 'fr',
  `Image` varchar(200) DEFAULT 'noimage.gif',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltraining
-- ----------------------------
INSERT INTO `tbltraining` VALUES ('3', 'Test French 1', '2010-07-16', '<p><img alt=\"xemmex.com\" src=\"xemmex.com\" />Test French</p>\n<p>&nbsp;</p>', 'fr', 'FTrJbNWY9am0oz5Z.jpg');
INSERT INTO `tbltraining` VALUES ('2', 'Test English', '2010-07-15', 'Test English', 'en', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('4', 'Test French 2', '2010-07-15', 'Test French 2', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('5', 'Test French 3', '2010-07-16', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('6', 'Test French 4', '2010-07-16', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('7', 'Test French 5', '2010-07-15', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('8', 'Test French 6', '2010-07-15', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('9', 'Test French 7', '2010-07-16', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('10', 'Test French 8', '2010-07-16', 'Test French', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('11', 'admin send lai', '2010-07-16', '<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\"><img width=\"80\" height=\"80\" src=\"/uploadFCK/about_author.png\" alt=\"\" />Publi&eacute; le 05 juillet 2009 &agrave; 05h00 | Mis &agrave; jour le 05  juillet 2009 &agrave; 05h00</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\"><br />\nPeur de l\'avion: tes Ativan ou ma  DS?<br />\n&nbsp;Marie-Claude Lortie<br />\nLa Presse<br />\n&nbsp;</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">&laquo;Imaginez que c\'est comme un petit ruisseau qui  frappe un caillou&raquo;, me lance le commandant Robert Pich&eacute; au bout du fil, alors  que je l\'implore de me rassurer au sujet des turbulences, ces soubresauts qui me  donnent des frissons &agrave; chaque fois que j\'embarque dans un  avion.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Un ruisseau? L\'image est efficace. Le pilote, qui  s\'est fait conna&icirc;tre en effectuant un atterrissage d\'urgence spectaculaire aux  A&ccedil;ores, alors qu\'il &eacute;tait aux commandes d\'un Airbus 330 d\'Air Transat en 2001,  en a vu d\'autres. Il parle d\'un ton rassurant presque d&eacute;tach&eacute;, pour ne pas me  faire peur. Il ne me dit pas &laquo;y\'a rien l&agrave;&raquo;, mais c\'est tout juste. Je l\'entends  et d&eacute;j&agrave; je me sens mieux. Une bonne chose pour lui puisqu\'en marge de son  travail de pilote, il donne maintenant des s&eacute;minaires pour aider les gens &agrave;  vaincre leur peur de l\'avion pour en finir avec la peur en avion. Il leur  explique notamment comment fonctionnent ces grosses b&ecirc;tes, ce qui aide &agrave;  &eacute;teindre les craintes irrationnelles.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">&laquo;En 40 ans, ajoute le commandant Pich&eacute;, j\'en ai vu  seulement deux fois de la vraie turbulence.&raquo; Bon, me voil&agrave; maintenant convaincue  que la troisi&egrave;me fois, ce sera quand je serai &agrave; bord...</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Si tout se passe comme pr&eacute;vu, quand vous lirez ces  lignes, je serai &agrave; nouveau sur la terre ferme. Mais entre la r&eacute;daction de ce  texte et votre lecture, il y aura un moment difficile: un voyage en  avion.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\"><br />\nSept longues heures suspendues dans les nuages  que j\'esp&egrave;re passer profond&eacute;ment endormie mais dont je sais que j\'enregistrerai,  m&ecirc;me dans mon sommeil, chaque soubresaut.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Apparemment je n\'ai pas tant la phobie de l\'avion  qu\'un petit stress post-traumatique. Mon cas ne doit pas &ecirc;tre tr&egrave;s grave car mon  envie de voyager est plus forte que mes inqui&eacute;tudes, comme c\'est le cas pour  bien des gens. Mais les souvenirs de trois tr&egrave;s mauvaises exp&eacute;riences me hantent  et me replongent dans ma peur en avion &agrave; chaque fois que je sens le lourd  caisson de m&eacute;tal qui me transporte avoir un petit hoquet.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Depuis l\'accident survenu au d&eacute;but du mois de juin,  sur le vol d\'Air France Rio-Paris, sans parler de celui qui est arriv&eacute; cette  semaine sur Yemenia Airlines, je me suis rendue compte que je n\'&eacute;tais vraiment  pas toute seule. Ces derniers incidents ont d&eacute;clench&eacute;, on dirait, une sorte de  ronde de confessions autour de moi. M&ecirc;me des gens calmes et sereins ont  d&eacute;velopp&eacute; une petite crainte de l\'avion. Rien de phobique, mais un inconfort, je  dirais, appelant m&ecirc;me parfois aux anxiolytiques.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Il faut dire qu\'on est au d&eacute;but de l\'&eacute;t&eacute; et que bien  des familles partent en voyage en avion et que la question se pose: quoi faire  quand on meurt d\'envie d\'aller en Provence ou en Catalogne et qu\'on a peur de  voler? Le timing pour les deux crash, juste avant les vacances, n\'&eacute;tait pas  g&eacute;nial.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">La peur en avion n\'est pas exactement anormale,  m\'explique Andr&eacute;e Letarte, psychologue au d&eacute;partement des troubles anxieux et de  l\'humeur &agrave; l\'h&ocirc;pital Louis-Hyppolite-Lafontaine. Philo-g&eacute;n&eacute;tiquement, nous ne  sommes pas programm&eacute;s &agrave; &ecirc;tre assis dans le ciel, en mouvement. &laquo;Il est normal  d\'&ecirc;tre d&eacute;stabilis&eacute;&raquo;, dit-elle. Une fois cela reconnu, il faut aussi admettre que  prendre l\'avion n\'est pas d&eacute;pourvu &agrave; 100% de danger. Oui il y a des accidents et  quand il y en a, ce n\'est pas dr&ocirc;le.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Sauf que, et c\'est l&agrave; la cl&eacute; de la gestion de notre  inconfort en avion, il faut aussi comprendre que le risque est tr&egrave;s faible.  Tellement faible, qu\'il se compare avantageusement &agrave; celui que l\'on prend &agrave;  chaque fois que l\'on prend la voiture.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Chaque ann&eacute;e, lisais-je r&eacute;cemment dans Le Point, il y  a au total plus de deux milliards de voyageurs suspendus dans le ciel. Oui,  chaque mort dans un &eacute;crasement est 100 % mort. Mais c\'est quand m&ecirc;me une bien  petite proportion. Toujours dans Le Point : on a 45 fois plus de risque de  mourir en voiture qu\'en train et 90 fois plus qu\'en avion.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">C\'est ce petit discours int&eacute;rieur qu\'il faut se tenir  quand on embarque en avion et qu\'on a quelques sueurs froides : &laquo; &Ccedil;a serait bien  pire, si je prenais la voiture... &raquo;</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Il y a toutes sortes de fa&ccedil;on de r&eacute;apprendre &agrave; penser  quand on embarque dans un avion, continue Mme Letarte et des psychologues  peuvent aider les gens qui en sentent le besoin.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Mon truc : me r&eacute;p&eacute;ter que l\'auto c\'est pire, ensuite  dormir &eacute;videmment si possible, mais sinon, jouer &agrave; un jeu vid&eacute;o. Quand je suis  sur ma DS - je suis pas mal certaine qu\'une PSP aurait le m&ecirc;me effet -- c\'est  bizarre, mais mon cerveau arr&ecirc;te de penser &agrave; autre chose. Parfois l\'agent de  bord vient me chicaner et me dire de l\'&eacute;teindre au d&eacute;collage et &agrave;  l\'atterrissage. Quand je leur explique le probl&egrave;me, ils me laissent  tranquille.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Brain Age, Super Mario...</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Non, &ccedil;a ne fait pas tr&egrave;s s&eacute;rieux.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Mais je vous le dis, &ccedil;a marche.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\"><br />\nAtelier peur en avion avec le commandant  Pich&eacute;</span></span></p>', 'fr', 'noimage.gif');
INSERT INTO `tbltraining` VALUES ('13', 'admin send', '2010-07-20', '<p>sadddddddd</p>\n<p>&nbsp;mmmmmaaaaaaaaaa</p>', 'fr', 'VE2NKvUrehqfXwYh.jpg');
INSERT INTO `tbltraining` VALUES ('18', '', '0000-00-00', '', 'fr', 'noimage.gif');
