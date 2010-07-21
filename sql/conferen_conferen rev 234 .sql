/*
MySQL Data Transfer
Source Host: localhost
Source Database: conferen_conferen
Target Host: localhost
Target Database: conferen_conferen
Date: 12/07/2010 5:27:04 CH
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for captcha
-- ----------------------------
CREATE TABLE `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for code
-- ----------------------------
CREATE TABLE `code` (
  `ip` char(15) NOT NULL,
  `code` char(6) NOT NULL,
  `try` tinyint(3) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
CREATE TABLE `email_templates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for geo_countries
-- ----------------------------
CREATE TABLE `geo_countries` (
  `con_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for memberships
-- ----------------------------
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
-- Table structure for payment_gateway
-- ----------------------------
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
-- Table structure for payments
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for presshop_access
-- ----------------------------
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
-- Table structure for presshop_accessory
-- ----------------------------
CREATE TABLE `presshop_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_address
-- ----------------------------
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
-- Table structure for presshop_alias
-- ----------------------------
CREATE TABLE `presshop_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attachment
-- ----------------------------
CREATE TABLE `presshop_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `mime` varchar(32) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attachment_lang
-- ----------------------------
CREATE TABLE `presshop_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attribute
-- ----------------------------
CREATE TABLE `presshop_attribute` (
  `id_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attribute_group
-- ----------------------------
CREATE TABLE `presshop_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attribute_group_lang
-- ----------------------------
CREATE TABLE `presshop_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_attribute_impact
-- ----------------------------
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
-- Table structure for presshop_attribute_lang
-- ----------------------------
CREATE TABLE `presshop_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_block_cms
-- ----------------------------
CREATE TABLE `presshop_block_cms` (
  `id_block` int(10) unsigned NOT NULL,
  `id_cms` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_block`,`id_cms`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_carrier
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_carrier_group
-- ----------------------------
CREATE TABLE `presshop_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_carrier` (`id_carrier`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_carrier_lang
-- ----------------------------
CREATE TABLE `presshop_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  UNIQUE KEY `shipper_lang_index` (`id_lang`,`id_carrier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_carrier_zone
-- ----------------------------
CREATE TABLE `presshop_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_cart
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_cart_discount
-- ----------------------------
CREATE TABLE `presshop_cart_discount` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  KEY `cart_discount_index` (`id_cart`,`id_discount`),
  KEY `id_discount` (`id_discount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_cart_product
-- ----------------------------
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
-- Table structure for presshop_category
-- ----------------------------
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
-- Table structure for presshop_category_group
-- ----------------------------
CREATE TABLE `presshop_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  KEY `category_group_index` (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_category_lang
-- ----------------------------
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
-- Table structure for presshop_category_product
-- ----------------------------
CREATE TABLE `presshop_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `category_product_index` (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_cms
-- ----------------------------
CREATE TABLE `presshop_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cms`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_cms_lang
-- ----------------------------
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
-- Table structure for presshop_configuration
-- ----------------------------
CREATE TABLE `presshop_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_configuration_lang
-- ----------------------------
CREATE TABLE `presshop_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_connections
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_connections_page
-- ----------------------------
CREATE TABLE `presshop_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_connections_source
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_contact
-- ----------------------------
CREATE TABLE `presshop_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_contact_lang
-- ----------------------------
CREATE TABLE `presshop_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  UNIQUE KEY `contact_lang_index` (`id_contact`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_country
-- ----------------------------
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
-- Table structure for presshop_country_lang
-- ----------------------------
CREATE TABLE `presshop_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `country_lang_index` (`id_country`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_currency
-- ----------------------------
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
-- Table structure for presshop_customer
-- ----------------------------
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
-- Table structure for presshop_customer_group
-- ----------------------------
CREATE TABLE `presshop_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_customization
-- ----------------------------
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
-- Table structure for presshop_customization_field
-- ----------------------------
CREATE TABLE `presshop_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_customization_field_lang
-- ----------------------------
CREATE TABLE `presshop_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_customized_data
-- ----------------------------
CREATE TABLE `presshop_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_date_range
-- ----------------------------
CREATE TABLE `presshop_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_delivery
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_discount
-- ----------------------------
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
-- Table structure for presshop_discount_category
-- ----------------------------
CREATE TABLE `presshop_discount_category` (
  `id_category` int(11) unsigned NOT NULL,
  `id_discount` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_discount`),
  KEY `discount` (`id_discount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_discount_lang
-- ----------------------------
CREATE TABLE `presshop_discount_lang` (
  `id_discount` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id_discount`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_discount_quantity
-- ----------------------------
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
-- Table structure for presshop_discount_type
-- ----------------------------
CREATE TABLE `presshop_discount_type` (
  `id_discount_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_discount_type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_discount_type_lang
-- ----------------------------
CREATE TABLE `presshop_discount_type_lang` (
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_discount_type`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_employee
-- ----------------------------
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
-- Table structure for presshop_feature
-- ----------------------------
CREATE TABLE `presshop_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_feature`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_feature_lang
-- ----------------------------
CREATE TABLE `presshop_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_feature_product
-- ----------------------------
CREATE TABLE `presshop_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_feature_value
-- ----------------------------
CREATE TABLE `presshop_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_feature_value_lang
-- ----------------------------
CREATE TABLE `presshop_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_group
-- ----------------------------
CREATE TABLE `presshop_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_group_lang
-- ----------------------------
CREATE TABLE `presshop_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `attribute_lang_index` (`id_group`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_guest
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_hook
-- ----------------------------
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
-- Table structure for presshop_hook_module
-- ----------------------------
CREATE TABLE `presshop_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_hook_module_exceptions
-- ----------------------------
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
-- Table structure for presshop_image
-- ----------------------------
CREATE TABLE `presshop_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  KEY `image_product` (`id_product`),
  KEY `product_position` (`id_product`,`position`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_image_lang
-- ----------------------------
CREATE TABLE `presshop_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  UNIQUE KEY `image_lang_index` (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_image_type
-- ----------------------------
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
-- Table structure for presshop_lang
-- ----------------------------
CREATE TABLE `presshop_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_manufacturer
-- ----------------------------
CREATE TABLE `presshop_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_manufacturer_lang
-- ----------------------------
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
-- Table structure for presshop_message
-- ----------------------------
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
-- Table structure for presshop_message_readed
-- ----------------------------
CREATE TABLE `presshop_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_meta
-- ----------------------------
CREATE TABLE `presshop_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `meta_name` (`page`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_meta_lang
-- ----------------------------
CREATE TABLE `presshop_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_meta`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_module
-- ----------------------------
CREATE TABLE `presshop_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_module_country
-- ----------------------------
CREATE TABLE `presshop_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_country`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_module_currency
-- ----------------------------
CREATE TABLE `presshop_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_module_group
-- ----------------------------
CREATE TABLE `presshop_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_operating_system
-- ----------------------------
CREATE TABLE `presshop_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_detail
-- ----------------------------
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
-- Table structure for presshop_order_discount
-- ----------------------------
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
-- Table structure for presshop_order_history
-- ----------------------------
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
-- Table structure for presshop_order_message
-- ----------------------------
CREATE TABLE `presshop_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_message_lang
-- ----------------------------
CREATE TABLE `presshop_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_return
-- ----------------------------
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
-- Table structure for presshop_order_return_detail
-- ----------------------------
CREATE TABLE `presshop_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_return_state
-- ----------------------------
CREATE TABLE `presshop_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_return_state_lang
-- ----------------------------
CREATE TABLE `presshop_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_return_state`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_slip
-- ----------------------------
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
-- Table structure for presshop_order_slip_detail
-- ----------------------------
CREATE TABLE `presshop_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_order_state
-- ----------------------------
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
-- Table structure for presshop_order_state_lang
-- ----------------------------
CREATE TABLE `presshop_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_state`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_orders
-- ----------------------------
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
-- Table structure for presshop_pack
-- ----------------------------
CREATE TABLE `presshop_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_page
-- ----------------------------
CREATE TABLE `presshop_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_page_type
-- ----------------------------
CREATE TABLE `presshop_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_page_viewed
-- ----------------------------
CREATE TABLE `presshop_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_pagenotfound
-- ----------------------------
CREATE TABLE `presshop_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_product
-- ----------------------------
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
-- Table structure for presshop_product_attachment
-- ----------------------------
CREATE TABLE `presshop_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_product_attribute
-- ----------------------------
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
-- Table structure for presshop_product_attribute_combination
-- ----------------------------
CREATE TABLE `presshop_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_product_attribute_image
-- ----------------------------
CREATE TABLE `presshop_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_product_download
-- ----------------------------
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
-- Table structure for presshop_product_lang
-- ----------------------------
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
-- Table structure for presshop_product_sale
-- ----------------------------
CREATE TABLE `presshop_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_product_tag
-- ----------------------------
CREATE TABLE `presshop_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_profile
-- ----------------------------
CREATE TABLE `presshop_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_profile_lang
-- ----------------------------
CREATE TABLE `presshop_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_quick_access
-- ----------------------------
CREATE TABLE `presshop_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_quick_access_lang
-- ----------------------------
CREATE TABLE `presshop_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_range_price
-- ----------------------------
CREATE TABLE `presshop_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_range_weight
-- ----------------------------
CREATE TABLE `presshop_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_referrer
-- ----------------------------
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
-- Table structure for presshop_referrer_cache
-- ----------------------------
CREATE TABLE `presshop_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_scene
-- ----------------------------
CREATE TABLE `presshop_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_scene_category
-- ----------------------------
CREATE TABLE `presshop_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_scene_lang
-- ----------------------------
CREATE TABLE `presshop_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_scene_products
-- ----------------------------
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
-- Table structure for presshop_search_engine
-- ----------------------------
CREATE TABLE `presshop_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_search_index
-- ----------------------------
CREATE TABLE `presshop_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_search_word
-- ----------------------------
CREATE TABLE `presshop_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`word`)
) ENGINE=MyISAM AUTO_INCREMENT=2173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_sekeyword
-- ----------------------------
CREATE TABLE `presshop_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_state
-- ----------------------------
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
-- Table structure for presshop_statssearch
-- ----------------------------
CREATE TABLE `presshop_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_subdomain
-- ----------------------------
CREATE TABLE `presshop_subdomain` (
  `id_subdomain` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id_subdomain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_supplier
-- ----------------------------
CREATE TABLE `presshop_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_supplier_lang
-- ----------------------------
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
-- Table structure for presshop_tab
-- ----------------------------
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
-- Table structure for presshop_tab_lang
-- ----------------------------
CREATE TABLE `presshop_tab_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_tag
-- ----------------------------
CREATE TABLE `presshop_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_tax
-- ----------------------------
CREATE TABLE `presshop_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_tax`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_tax_lang
-- ----------------------------
CREATE TABLE `presshop_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `tax_lang_index` (`id_tax`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_tax_state
-- ----------------------------
CREATE TABLE `presshop_tax_state` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned NOT NULL,
  KEY `tax_state_index` (`id_tax`,`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_tax_zone
-- ----------------------------
CREATE TABLE `presshop_tax_zone` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  KEY `tax_zone_index` (`id_tax`,`id_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_timezone
-- ----------------------------
CREATE TABLE `presshop_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_web_browser
-- ----------------------------
CREATE TABLE `presshop_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for presshop_zone
-- ----------------------------
CREATE TABLE `presshop_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for private_access
-- ----------------------------
CREATE TABLE `private_access` (
  `id` bigint(20) unsigned NOT NULL,
  `type` enum('video','playlist','group') NOT NULL,
  `mem_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`type`,`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rates
-- ----------------------------
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
-- Table structure for ratingbans
-- ----------------------------
CREATE TABLE `ratingbans` (
  `identityList` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `idList` varchar(100) COLLATE latin1_general_ci NOT NULL,
  KEY `identityList` (`identityList`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for ratingitems
-- ----------------------------
CREATE TABLE `ratingitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueName` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `totalVotes` int(11) NOT NULL DEFAULT '0',
  `totalPoints` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueName` (`uniqueName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
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
-- Table structure for tblaccessories
-- ----------------------------
CREATE TABLE `tblaccessories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ElementName` varchar(50) DEFAULT NULL,
  `ElementContent` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbladmin
-- ----------------------------
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
-- Table structure for tbladvertisement
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblblog
-- ----------------------------
CREATE TABLE `tblblog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Author` int(50) NOT NULL,
  `About` text NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Keywords` varchar(200) NOT NULL,
  `Text` text NOT NULL,
  `Link` varchar(200) NOT NULL,
  `CountView` int(11) unsigned DEFAULT NULL,
  `CountComment` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblblog_tbladmin` (`Author`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcategory
-- ----------------------------
CREATE TABLE `tblcategory` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblcomment
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblevent
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblfeedback
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblremember_me
-- ----------------------------
CREATE TABLE `tblremember_me` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `usernamehash` varchar(128) DEFAULT NULL,
  `random_string` varchar(128) DEFAULT NULL,
  `origin_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tblshowroom
-- ----------------------------
CREATE TABLE `tblshowroom` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Video` int(11) NOT NULL,
  `SpeakerImages` varchar(50) NOT NULL,
  `Show` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tblShowroom_Videos` (`Video`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblticket
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for verification
-- ----------------------------
CREATE TABLE `verification` (
  `val` char(6) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `inv_id` char(40) NOT NULL,
  UNIQUE KEY `val` (`val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_settings
-- ----------------------------
CREATE TABLE `video_settings` (
  `id` int(11) NOT NULL,
  `resize_w` int(11) DEFAULT NULL,
  `resize_h` int(11) DEFAULT NULL,
  `thumb_w` int(11) DEFAULT NULL,
  `thumb_h` int(11) DEFAULT NULL,
  `allowed_ext` varchar(255) DEFAULT NULL,
  `max_upload_size` int(11) DEFAULT NULL,
  `ratio` varchar(10) DEFAULT NULL,
  `vbrate` int(11) DEFAULT NULL,
  `sbrate` int(11) DEFAULT NULL,
  `srate` int(11) DEFAULT NULL,
  `thumb_frame` int(11) DEFAULT NULL,
  `is_resize` tinyint(4) DEFAULT NULL,
  `keep_ratio` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_temps
-- ----------------------------
CREATE TABLE `video_temps` (
  `id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `expire` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `word` (`filename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
CREATE TABLE `videos` (
  `vid_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `title_fr` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `description_fr` text NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `code` VALUES ('127.0.0.1', '7245F5', '1', '1277346146');
INSERT INTO `email_templates` VALUES ('1', 'Registration Email', 'Please verify your email', 'Welcome [USERNAME]! Thanks for registering.\r\n---------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n---------------------------------------------------\r\n\r\nThe administrator of this site has requested all new accounts\r\nto be activated by the users who created them thus your account\r\nis currently inactive. To activate your account,\r\nplease visit this link:\r\n[LINK]\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('2', 'Forgot Password Email', 'Password Reset', 'New password reset from [SITE_NAME]!\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello, [USERNAME]\r\n\r\nIt seems that you or someone requested a new password for you.\r\n\r\nWe have generated a new password, as requested:\r\n\r\nYour new password: [PASSWORD]\r\n\r\n\r\nTo use the new password you need to activate it. To do this click the link provided below and login with your new password.\r\n[LINK]\r\n\r\nYou can change your password after you sign in.\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nPassword requested from IP: [IP]');
INSERT INTO `email_templates` VALUES ('3', 'Welcome Mail From Admin', 'You have been registered', 'Welcome [NAME]! Thanks for registering.\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHello,\r\n\r\nYou\'re now a member of [SITE_NAME].\r\n\r\nHere are your login details. Please keep them in a safe place:\r\n\r\nUsername: [USERNAME]\r\nPassword: [PASSWORD]\r\n\r\n\r\n---------------------------------------------------------------------------------------------------------\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]');
INSERT INTO `email_templates` VALUES ('4', 'Default Newsletter', 'Newsletter', 'Hello,\r\n[USERNAME]\r\nYou are receiving this email as a part of your newsletter subscription\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nHere goes your newsletter content\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nThanks,\r\n[SITE_NAME] Team\r\n[URL]\r\n---------------------------------------------------------------------------------------------------------\r\nTo stop receiving future newsletters please login into your account\r\nand uncheck newsletter subscription box.');
INSERT INTO `email_templates` VALUES ('5', 'Transaction Completed', 'Payment from payPal', 'Hello, Admin\r\n\r\nYou have received new PayPal payment following:\r\n\r\n---------------------------------------------------------------------------------------------------------\r\n\r\nUsername: [USERNAME]\r\nItem: [ITEMNAME]\r\nPrice: [PRICE]\r\n\r\nStatus: [STATUS] \r\n\r\n---------------------------------------------------------------------------------------------------------\r\nYou can view this transaction from [URL]');
INSERT INTO `email_templates` VALUES ('6', 'Transaction Suspicious', 'Suspicious Transaction', 'Hello, Admin\r\n----------------------------------------------------------\r\nThe following transaction has been disabled due to suspicious activity:\r\n\r\nBuyer: [USERNAME]\r\nItem: [ITEM]\r\nPrice: [PRICE]\r\nStatus: [STATUS]\r\n\r\n----------------------------------------------------------\r\nPlease verify this transaction is correct. If it is, please activate it in the transaction section of your site\'s \r\nadministration control panel. If not, it appears that someone tried to fraudulently obtain products from your site.');
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
INSERT INTO `memberships` VALUES ('1', 'Bronzes free', 'Bronzes free', '1', '1', '1');
INSERT INTO `memberships` VALUES ('2', 'Super Membership', 'This is super membership', '1', '1', '1');
INSERT INTO `memberships` VALUES ('3', 'Silver', 'Silver', '1', '1', '1');
INSERT INTO `memberships` VALUES ('4', 'Bronze', 'Bronze', '1', '1', '1');
INSERT INTO `memberships` VALUES ('5', 'Gold', 'Gold', '0', '1', '1');
INSERT INTO `payments` VALUES ('1', null, '3', '2', '2', '0.99', '2010-07-14 12:10:14', '1');
INSERT INTO `payments` VALUES ('7', null, '3', '36', '2', '1.99', '2010-07-12 10:28:41', '1');
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
INSERT INTO `presshop_address` VALUES ('1', '21', '5', '0', '1', '0', 'manufacturer', null, 'JOBS', 'STEVE', '1 Infinite Loop', null, '95014', 'Cupertino', null, '(800) 275-2273', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53', '1', '0');
INSERT INTO `presshop_address` VALUES ('2', '8', '0', '1', '0', '0', 'Mon adresse', 'My Company', 'DOE', 'John', '16, Main street', '2nd floor', '75000', 'Paris ', null, '0102030405', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53', '1', '0');
INSERT INTO `presshop_address` VALUES ('3', '222', '0', '2', '0', '0', 'My address', '', 'nam', 'nam', 'aaaaa', '', '10000', 'ha noi', '', '', '', '2010-07-03 03:40:43', '2010-07-03 03:40:43', '1', '0');
INSERT INTO `presshop_address` VALUES ('4', '4', '54', '3', '0', '0', 'Mon adresse', 'XemmeX', 'May Webber', 'Michael', '840A, John-West', '', 'G1V 3E1', 'Québec', '', '', '', '2010-07-06 22:35:14', '2010-07-06 22:35:14', '1', '0');
INSERT INTO `presshop_address` VALUES ('5', '222', '0', '4', '0', '0', 'lethitham', 'Test', 'le', 'tham', '306/27 Nguyen Thai SOn', '', '70000', 'HCM', '', '', '', '2010-07-07 01:46:25', '2010-07-07 01:46:25', '1', '0');
INSERT INTO `presshop_alias` VALUES ('4', 'piod', 'ipod', '1');
INSERT INTO `presshop_alias` VALUES ('3', 'ipdo', 'ipod', '1');
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
INSERT INTO `presshop_attribute_group` VALUES ('1', '0');
INSERT INTO `presshop_attribute_group` VALUES ('2', '1');
INSERT INTO `presshop_attribute_group` VALUES ('3', '0');
INSERT INTO `presshop_attribute_group_lang` VALUES ('1', '1', 'Disk space', 'Disk space');
INSERT INTO `presshop_attribute_group_lang` VALUES ('1', '2', 'Capacité', 'Capacité');
INSERT INTO `presshop_attribute_group_lang` VALUES ('2', '1', 'Color', 'Color');
INSERT INTO `presshop_attribute_group_lang` VALUES ('2', '2', 'Couleur', 'Couleur');
INSERT INTO `presshop_attribute_group_lang` VALUES ('3', '1', 'ICU', 'Processor');
INSERT INTO `presshop_attribute_group_lang` VALUES ('3', '2', 'ICU', 'Processeur');
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
INSERT INTO `presshop_block_cms` VALUES ('12', '1');
INSERT INTO `presshop_block_cms` VALUES ('12', '2');
INSERT INTO `presshop_block_cms` VALUES ('12', '3');
INSERT INTO `presshop_block_cms` VALUES ('12', '4');
INSERT INTO `presshop_block_cms` VALUES ('23', '3');
INSERT INTO `presshop_block_cms` VALUES ('23', '4');
INSERT INTO `presshop_carrier` VALUES ('1', '0', '0', null, '1', '0', '0', '0', '0');
INSERT INTO `presshop_carrier` VALUES ('2', '1', 'My carrier', '', '1', '1', '1', '0', '0');
INSERT INTO `presshop_carrier` VALUES ('3', '4', 'Postes Canada', 'http://www.canadapost.ca/cpotools/apps/track/business/findByTrackNumber?execution=e7s1', '1', '0', '1', '0', '0');
INSERT INTO `presshop_carrier_group` VALUES ('1', '1');
INSERT INTO `presshop_carrier_group` VALUES ('3', '1');
INSERT INTO `presshop_carrier_lang` VALUES ('1', '1', 'Pick up in-store');
INSERT INTO `presshop_carrier_lang` VALUES ('1', '2', 'Retrait au magasin');
INSERT INTO `presshop_carrier_lang` VALUES ('2', '1', 'Delivery next day!');
INSERT INTO `presshop_carrier_lang` VALUES ('2', '2', 'Livraison le lendemain !');
INSERT INTO `presshop_carrier_lang` VALUES ('3', '1', 'Delivery next day!');
INSERT INTO `presshop_carrier_lang` VALUES ('3', '2', 'Livraison régulière');
INSERT INTO `presshop_carrier_zone` VALUES ('1', '1');
INSERT INTO `presshop_carrier_zone` VALUES ('2', '1');
INSERT INTO `presshop_carrier_zone` VALUES ('2', '2');
INSERT INTO `presshop_carrier_zone` VALUES ('3', '1');
INSERT INTO `presshop_carrier_zone` VALUES ('3', '2');
INSERT INTO `presshop_carrier_zone` VALUES ('3', '3');
INSERT INTO `presshop_carrier_zone` VALUES ('3', '4');
INSERT INTO `presshop_carrier_zone` VALUES ('3', '5');
INSERT INTO `presshop_cart` VALUES ('1', '2', '2', '6', '6', '1', '1', '1', '1', '0', null, '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_cart` VALUES ('2', '0', '2', '0', '0', '2', '0', '3', '1', '0', '', '2010-07-01 10:33:00', '2010-07-01 10:58:58');
INSERT INTO `presshop_cart` VALUES ('3', '0', '1', '3', '3', '2', '2', '5', '1', '0', '', '2010-07-02 09:49:47', '2010-07-09 07:22:35');
INSERT INTO `presshop_cart` VALUES ('5', '0', '2', '0', '0', '2', '0', '26', '1', '0', '', '2010-07-06 22:14:52', '2010-07-06 23:40:20');
INSERT INTO `presshop_cart` VALUES ('4', '0', '1', '0', '0', '2', '0', '17', '1', '0', '', '2010-07-04 03:48:52', '2010-07-04 03:48:52');
INSERT INTO `presshop_cart` VALUES ('6', '0', '2', '4', '4', '2', '3', '27', '1', '0', '', '2010-07-06 22:23:21', '2010-07-06 22:35:14');
INSERT INTO `presshop_cart` VALUES ('7', '0', '1', '5', '5', '2', '4', '30', '1', '0', '', '2010-07-07 01:04:52', '2010-07-07 05:38:12');
INSERT INTO `presshop_cart` VALUES ('8', '0', '1', '0', '0', '2', '0', '31', '1', '0', '', '2010-07-07 02:48:12', '2010-07-07 02:51:51');
INSERT INTO `presshop_cart` VALUES ('9', '0', '2', '0', '0', '2', '0', '33', '1', '0', '', '2010-07-07 09:31:33', '2010-07-07 09:31:46');
INSERT INTO `presshop_cart` VALUES ('10', '0', '2', '0', '0', '2', '0', '36', '1', '0', '', '2010-07-07 14:48:46', '2010-07-07 14:48:46');
INSERT INTO `presshop_cart` VALUES ('11', '0', '2', '0', '0', '2', '0', '35', '1', '0', '', '2010-07-07 22:17:57', '2010-07-07 22:17:57');
INSERT INTO `presshop_cart` VALUES ('12', '0', '1', '0', '0', '2', '0', '23', '1', '0', '', '2010-07-08 03:46:05', '2010-07-08 03:46:05');
INSERT INTO `presshop_cart` VALUES ('13', '3', '2', '4', '4', '2', '3', '38', '1', '1', '', '2010-07-08 12:10:12', '2010-07-08 13:02:53');
INSERT INTO `presshop_cart` VALUES ('14', '0', '2', '0', '0', '2', '0', '39', '1', '0', '', '2010-07-08 12:12:44', '2010-07-08 12:17:55');
INSERT INTO `presshop_cart` VALUES ('15', '0', '2', '0', '0', '2', '0', '44', '1', '0', '', '2010-07-08 17:23:18', '2010-07-08 17:28:51');
INSERT INTO `presshop_cart` VALUES ('16', '3', '2', '4', '4', '2', '3', '27', '1', '0', '', '2010-07-08 17:42:51', '2010-07-08 17:55:49');
INSERT INTO `presshop_cart` VALUES ('17', '0', '2', '0', '0', '2', '0', '57', '1', '0', '', '2010-07-09 16:50:14', '2010-07-09 16:50:14');
INSERT INTO `presshop_cart` VALUES ('18', '0', '1', '0', '0', '2', '0', '0', '1', '0', '', '2010-07-10 05:36:45', '2010-07-10 05:36:45');
INSERT INTO `presshop_cart` VALUES ('19', '0', '1', '0', '0', '2', '0', '0', '1', '0', '', '2010-07-10 05:43:57', '2010-07-10 05:43:57');
INSERT INTO `presshop_cart` VALUES ('20', '0', '1', '0', '0', '2', '0', '0', '1', '0', '', '2010-07-10 10:23:50', '2010-07-10 10:23:50');
INSERT INTO `presshop_cart` VALUES ('21', '0', '1', '0', '0', '2', '0', '0', '1', '0', '', '2010-07-10 17:57:54', '2010-07-10 17:57:54');
INSERT INTO `presshop_cart` VALUES ('22', '0', '1', '0', '0', '2', '0', '0', '1', '0', '', '2010-07-10 18:39:13', '2010-07-10 18:39:13');
INSERT INTO `presshop_cart` VALUES ('23', '0', '2', '0', '0', '2', '0', '4', '1', '0', '', '2010-07-11 13:55:35', '2010-07-11 13:57:05');
INSERT INTO `presshop_cart` VALUES ('24', '0', '2', '0', '0', '2', '0', '84', '1', '0', '', '2010-07-11 17:27:10', '2010-07-11 17:27:10');
INSERT INTO `presshop_cart_product` VALUES ('7', '11', '0', '1', '2010-07-07 05:40:01');
INSERT INTO `presshop_cart_product` VALUES ('6', '10', '0', '1', '2010-07-06 22:35:52');
INSERT INTO `presshop_cart_product` VALUES ('18', '10', '0', '1', '2010-07-10 05:36:45');
INSERT INTO `presshop_cart_product` VALUES ('17', '12', '0', '1', '2010-07-09 16:50:14');
INSERT INTO `presshop_cart_product` VALUES ('19', '14', '0', '1', '2010-07-10 05:43:57');
INSERT INTO `presshop_cart_product` VALUES ('9', '13', '0', '1', '2010-07-07 10:19:27');
INSERT INTO `presshop_cart_product` VALUES ('10', '14', '0', '1', '2010-07-07 14:48:46');
INSERT INTO `presshop_cart_product` VALUES ('11', '10', '0', '1', '2010-07-07 22:17:57');
INSERT INTO `presshop_cart_product` VALUES ('12', '10', '0', '20', '2010-07-08 03:46:05');
INSERT INTO `presshop_cart_product` VALUES ('12', '14', '0', '6', '2010-07-08 03:47:03');
INSERT INTO `presshop_cart_product` VALUES ('12', '13', '0', '1', '2010-07-08 03:47:20');
INSERT INTO `presshop_cart_product` VALUES ('12', '12', '0', '1', '2010-07-08 03:47:34');
INSERT INTO `presshop_cart_product` VALUES ('12', '11', '0', '10', '2010-07-08 03:55:43');
INSERT INTO `presshop_cart_product` VALUES ('20', '13', '0', '1', '2010-07-10 10:23:51');
INSERT INTO `presshop_cart_product` VALUES ('16', '10', '0', '1', '2010-07-08 17:42:51');
INSERT INTO `presshop_cart_product` VALUES ('13', '10', '0', '1', '2010-07-08 12:15:39');
INSERT INTO `presshop_cart_product` VALUES ('21', '12', '0', '1', '2010-07-10 17:57:54');
INSERT INTO `presshop_cart_product` VALUES ('22', '11', '0', '1', '2010-07-10 18:39:13');
INSERT INTO `presshop_cart_product` VALUES ('24', '11', '0', '1', '2010-07-11 17:27:10');
INSERT INTO `presshop_category` VALUES ('1', '0', '0', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_category` VALUES ('6', '1', '1', '1', '2010-07-06 21:07:58', '2010-07-06 21:07:58');
INSERT INTO `presshop_category` VALUES ('5', '1', '1', '1', '2010-07-06 21:02:04', '2010-07-06 21:02:04');
INSERT INTO `presshop_category` VALUES ('7', '1', '1', '1', '2010-07-06 21:10:47', '2010-07-06 21:10:47');
INSERT INTO `presshop_category_group` VALUES ('1', '1');
INSERT INTO `presshop_category_group` VALUES ('5', '1');
INSERT INTO `presshop_category_group` VALUES ('6', '1');
INSERT INTO `presshop_category_group` VALUES ('7', '1');
INSERT INTO `presshop_category_lang` VALUES ('1', '1', 'Home', '', 'home', null, null, null);
INSERT INTO `presshop_category_lang` VALUES ('1', '2', 'Accueil', '', 'home', null, null, null);
INSERT INTO `presshop_category_lang` VALUES ('5', '1', 'Online conference ', 'Conference to be viewed online', 'online-conference-', 'Online conference ', 'conference online', 'Conference to be viewed online');
INSERT INTO `presshop_category_lang` VALUES ('5', '2', 'Conférence en ligne', 'Conférence que vous pouvez écouter en ligne.', 'conference-en-ligne', 'Conférence en ligne', 'conférence', 'Conférence que vous pouvez écouter en ligne.');
INSERT INTO `presshop_category_lang` VALUES ('6', '1', 'Books', 'Books to be buy that is about our speakers', 'books', 'Book', 'books', 'Books to be buy that is about our speakers');
INSERT INTO `presshop_category_lang` VALUES ('6', '2', 'Livre', 'Vente de livre', 'livre', 'Livre', 'livre', 'Vente de livre');
INSERT INTO `presshop_category_lang` VALUES ('7', '1', 'CD', 'CD to be buy that is about our speakers', 'cd', 'CD', 'CD', 'CD to be buy that is about our speakers');
INSERT INTO `presshop_category_lang` VALUES ('7', '2', 'CD', 'CD à vendre', 'cd', 'CD', 'CD', 'CD à vendre');
INSERT INTO `presshop_category_product` VALUES ('6', '14', '3');
INSERT INTO `presshop_category_product` VALUES ('6', '13', '2');
INSERT INTO `presshop_category_product` VALUES ('6', '11', '0');
INSERT INTO `presshop_category_product` VALUES ('6', '12', '1');
INSERT INTO `presshop_category_product` VALUES ('7', '10', '0');
INSERT INTO `presshop_cms` VALUES ('1');
INSERT INTO `presshop_cms` VALUES ('2');
INSERT INTO `presshop_cms` VALUES ('3');
INSERT INTO `presshop_cms` VALUES ('4');
INSERT INTO `presshop_cms` VALUES ('5');
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
INSERT INTO `presshop_configuration` VALUES ('14', 'PS_NAVIGATION_PIPE', '>', '2010-06-30 10:43:53', '2010-07-08 18:55:17');
INSERT INTO `presshop_configuration` VALUES ('15', 'PS_PRODUCTS_PER_PAGE', '10', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('16', 'PS_PURCHASE_MINIMUM', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('17', 'PS_PRODUCTS_ORDER_WAY', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('18', 'PS_PRODUCTS_ORDER_BY', '4', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('19', 'PS_DISPLAY_QTIES', '1', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration` VALUES ('20', 'PS_SHIPPING_HANDLING', '2', '2010-06-30 10:43:53', '2010-07-08 12:14:52');
INSERT INTO `presshop_configuration` VALUES ('21', 'PS_SHIPPING_FREE_PRICE', '300', '2010-06-30 10:43:53', '2010-07-08 12:14:52');
INSERT INTO `presshop_configuration` VALUES ('22', 'PS_SHIPPING_FREE_WEIGHT', '20', '2010-06-30 10:43:53', '2010-07-08 12:14:52');
INSERT INTO `presshop_configuration` VALUES ('23', 'PS_SHIPPING_METHOD', '1', '2010-06-30 10:43:53', '2010-07-08 12:14:52');
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
INSERT INTO `presshop_configuration` VALUES ('65', 'PS_CARRIER_DEFAULT', '3', '2010-06-30 10:43:53', '2010-07-08 12:57:37');
INSERT INTO `presshop_configuration` VALUES ('66', 'PAYPAL_BUSINESS', 'rene@confor.ca', '2010-06-30 10:43:53', '2010-07-08 17:55:27');
INSERT INTO `presshop_configuration` VALUES ('67', 'PAYPAL_SANDBOX', '0', '2010-06-30 10:43:53', '2010-07-08 17:55:27');
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
INSERT INTO `presshop_configuration` VALUES ('100', 'PS_LOGO', '', '2010-06-30 16:59:35', '2010-07-08 18:55:17');
INSERT INTO `presshop_configuration` VALUES ('101', 'PS_FAVICON', '', '2010-06-30 16:59:35', '2010-07-08 18:55:17');
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
INSERT INTO `presshop_configuration` VALUES ('117', 'PAYPAL_HEADER', 'http://conferences-formations.com/pay/images/paypal.jpg', '2010-07-08 13:01:07', '2010-07-08 17:55:27');
INSERT INTO `presshop_configuration_lang` VALUES ('36', '1', 'IN', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('36', '2', 'FA', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('38', '1', 'DE', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('38', '2', 'LI', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('46', '1', 'a|the|of|on|in|and|to', '2010-06-30 10:43:53');
INSERT INTO `presshop_configuration_lang` VALUES ('46', '2', 'le|les|de|et|en|des|les|une', '2010-06-30 10:43:53');
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
INSERT INTO `presshop_connections` VALUES ('49', '27', '1', '415986775', '2010-07-07 19:20:00', '');
INSERT INTO `presshop_connections` VALUES ('50', '27', '1', '415986775', '2010-07-08 10:02:32', '');
INSERT INTO `presshop_connections` VALUES ('51', '39', '1', '2147483647', '2010-07-08 10:22:18', '');
INSERT INTO `presshop_connections` VALUES ('52', '27', '1', '415986775', '2010-07-08 10:58:28', '');
INSERT INTO `presshop_connections` VALUES ('53', '40', '28', '2147483647', '2010-07-08 12:01:59', '');
INSERT INTO `presshop_connections` VALUES ('54', '41', '32', '2147483647', '2010-07-08 12:12:00', '');
INSERT INTO `presshop_connections` VALUES ('55', '42', '31', '2147483647', '2010-07-08 12:38:04', '');
INSERT INTO `presshop_connections` VALUES ('56', '43', '19', '2147483647', '2010-07-08 12:42:52', '');
INSERT INTO `presshop_connections` VALUES ('57', '44', '1', '2147483647', '2010-07-08 14:04:14', '');
INSERT INTO `presshop_connections` VALUES ('58', '27', '32', '415986775', '2010-07-08 15:50:45', '');
INSERT INTO `presshop_connections` VALUES ('59', '27', '1', '415986775', '2010-07-08 17:30:02', '');
INSERT INTO `presshop_connections` VALUES ('60', '46', '1', '2147483647', '2010-07-08 18:00:53', '');
INSERT INTO `presshop_connections` VALUES ('61', '47', '1', '2147483647', '2010-07-08 21:50:23', '');
INSERT INTO `presshop_connections` VALUES ('62', '48', '1', '1096584581', '2010-07-08 22:00:24', '');
INSERT INTO `presshop_connections` VALUES ('63', '49', '1', '1984383970', '2010-07-08 22:31:58', '');
INSERT INTO `presshop_connections` VALUES ('64', '50', '1', '415986775', '2010-07-08 23:04:22', '');
INSERT INTO `presshop_connections` VALUES ('65', '51', '31', '2147483647', '2010-07-09 09:45:24', '');
INSERT INTO `presshop_connections` VALUES ('66', '52', '28', '415955517', '2010-07-09 14:06:11', '');
INSERT INTO `presshop_connections` VALUES ('67', '53', '1', '1089194667', '2010-07-09 15:13:40', '');
INSERT INTO `presshop_connections` VALUES ('68', '54', '28', '1612158439', '2010-07-09 15:59:10', '');
INSERT INTO `presshop_connections` VALUES ('69', '55', '32', '2147483647', '2010-07-09 16:49:02', '');
INSERT INTO `presshop_connections` VALUES ('70', '56', '1', '2147483647', '2010-07-09 16:49:23', '');
INSERT INTO `presshop_connections` VALUES ('71', '57', '1', '2147483647', '2010-07-09 16:49:35', '');
INSERT INTO `presshop_connections` VALUES ('72', '58', '31', '1176030565', '2010-07-09 19:13:01', '');
INSERT INTO `presshop_connections` VALUES ('73', '59', '1', '1167952208', '2010-07-09 19:26:56', '');
INSERT INTO `presshop_connections` VALUES ('74', '60', '28', '1275759627', '2010-07-09 21:54:30', '');
INSERT INTO `presshop_connections` VALUES ('75', '61', '31', '2147483647', '2010-07-09 22:17:24', '');
INSERT INTO `presshop_connections` VALUES ('76', '62', '32', '1611962998', '2010-07-09 22:40:34', '');
INSERT INTO `presshop_connections` VALUES ('77', '63', '36', '415788894', '2010-07-09 22:41:41', '');
INSERT INTO `presshop_connections` VALUES ('78', '64', '37', '405129964', '2010-07-09 23:07:37', '');
INSERT INTO `presshop_connections` VALUES ('79', '65', '28', '1177645258', '2010-07-10 00:14:36', '');
INSERT INTO `presshop_connections` VALUES ('80', '66', '31', '1162269786', '2010-07-10 00:48:37', '');
INSERT INTO `presshop_connections` VALUES ('81', '67', '1', '1168091965', '2010-07-10 10:03:32', '');
INSERT INTO `presshop_connections` VALUES ('82', '68', '1', '1168091965', '2010-07-10 10:03:33', '');
INSERT INTO `presshop_connections` VALUES ('83', '69', '31', '1612031152', '2010-07-10 10:41:39', '');
INSERT INTO `presshop_connections` VALUES ('84', '70', '1', '1279438198', '2010-07-10 12:37:51', '');
INSERT INTO `presshop_connections` VALUES ('85', '71', '37', '1245189990', '2010-07-10 14:15:32', '');
INSERT INTO `presshop_connections` VALUES ('86', '72', '28', '2147483647', '2010-07-10 17:28:42', '');
INSERT INTO `presshop_connections` VALUES ('87', '73', '28', '1245192178', '2010-07-10 22:41:03', '');
INSERT INTO `presshop_connections` VALUES ('88', '74', '28', '1245312489', '2010-07-10 23:14:00', '');
INSERT INTO `presshop_connections` VALUES ('89', '75', '1', '1245371112', '2010-07-10 23:57:11', '');
INSERT INTO `presshop_connections` VALUES ('90', '76', '37', '2147483647', '2010-07-10 23:59:15', '');
INSERT INTO `presshop_connections` VALUES ('91', '77', '31', '1115860344', '2010-07-11 00:25:27', '');
INSERT INTO `presshop_connections` VALUES ('92', '78', '37', '415807106', '2010-07-11 01:16:06', '');
INSERT INTO `presshop_connections` VALUES ('93', '79', '32', '1279348935', '2010-07-11 08:45:54', '');
INSERT INTO `presshop_connections` VALUES ('94', '80', '1', '415988730', '2010-07-11 11:16:42', '');
INSERT INTO `presshop_connections` VALUES ('95', '81', '32', '1176431789', '2010-07-11 11:20:08', '');
INSERT INTO `presshop_connections` VALUES ('96', '82', '32', '1096614426', '2010-07-11 15:05:34', '');
INSERT INTO `presshop_connections` VALUES ('97', '83', '31', '2147483647', '2010-07-11 15:41:56', '');
INSERT INTO `presshop_connections` VALUES ('98', '84', '31', '1178056488', '2010-07-11 17:26:31', '');
INSERT INTO `presshop_connections` VALUES ('99', '85', '31', '1096722145', '2010-07-11 19:37:44', '');
INSERT INTO `presshop_connections` VALUES ('100', '86', '31', '2147483647', '2010-07-11 21:07:06', '');
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
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-08 09:18:37', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '1', '2010-07-08 09:28:15', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '36', '2010-07-08 09:33:46', null);
INSERT INTO `presshop_connections_page` VALUES ('50', '1', '2010-07-08 10:02:32', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '1', '2010-07-08 10:22:18', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '11', '2010-07-08 10:34:17', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '17', '2010-07-08 10:46:56', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 10:58:28', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '29', '2010-07-08 10:58:38', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '30', '2010-07-08 10:58:45', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '27', '2010-07-08 10:58:49', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-08 10:59:45', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 11:17:50', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 11:33:43', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 11:34:22', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '1', '2010-07-08 11:43:38', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 11:49:03', null);
INSERT INTO `presshop_connections_page` VALUES ('28', '32', '2010-07-08 11:54:26', null);
INSERT INTO `presshop_connections_page` VALUES ('53', '28', '2010-07-08 12:01:59', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '29', '2010-07-08 12:10:08', null);
INSERT INTO `presshop_connections_page` VALUES ('53', '36', '2010-07-08 12:10:11', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:10:15', null);
INSERT INTO `presshop_connections_page` VALUES ('54', '32', '2010-07-08 12:12:00', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '27', '2010-07-08 12:12:35', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '28', '2010-07-08 12:12:35', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:12:43', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:12:53', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '28', '2010-07-08 12:14:50', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '28', '2010-07-08 12:15:12', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:15:14', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:15:24', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '27', '2010-07-08 12:15:36', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:15:42', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '28', '2010-07-08 12:15:43', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '3', '2010-07-08 12:17:24', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '9', '2010-07-08 12:18:03', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '27', '2010-07-08 12:18:24', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '30', '2010-07-08 12:18:31', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '29', '2010-07-08 12:18:48', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '29', '2010-07-08 12:22:05', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '29', '2010-07-08 12:23:54', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '31', '2010-07-08 12:38:04', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '19', '2010-07-08 12:41:22', null);
INSERT INTO `presshop_connections_page` VALUES ('56', '19', '2010-07-08 12:42:52', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '2', '2010-07-08 12:43:45', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '38', '2010-07-08 12:44:17', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '36', '2010-07-08 12:45:57', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '19', '2010-07-08 12:48:02', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '29', '2010-07-08 12:49:23', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '32', '2010-07-08 12:49:52', null);
INSERT INTO `presshop_connections_page` VALUES ('55', '18', '2010-07-08 12:50:16', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 12:57:50', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '3', '2010-07-08 12:57:55', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '21', '2010-07-08 12:58:20', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '22', '2010-07-08 12:58:30', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '23', '2010-07-08 12:59:13', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 12:59:44', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '9', '2010-07-08 13:01:22', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '21', '2010-07-08 13:01:27', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '22', '2010-07-08 13:01:30', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '23', '2010-07-08 13:01:34', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '21', '2010-07-08 13:02:38', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '22', '2010-07-08 13:02:52', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '23', '2010-07-08 13:02:54', null);
INSERT INTO `presshop_connections_page` VALUES ('57', '1', '2010-07-08 14:04:14', null);
INSERT INTO `presshop_connections_page` VALUES ('52', '1', '2010-07-08 14:51:11', null);
INSERT INTO `presshop_connections_page` VALUES ('58', '32', '2010-07-08 15:50:45', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '10', '2010-07-08 16:04:08', null);
INSERT INTO `presshop_connections_page` VALUES ('57', '1', '2010-07-08 17:22:47', null);
INSERT INTO `presshop_connections_page` VALUES ('57', '27', '2010-07-08 17:23:11', null);
INSERT INTO `presshop_connections_page` VALUES ('57', '1', '2010-07-08 17:28:44', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 17:30:02', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 17:40:14', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '3', '2010-07-08 17:40:30', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '20', '2010-07-08 17:41:37', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '27', '2010-07-08 17:42:37', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '9', '2010-07-08 17:42:53', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '21', '2010-07-08 17:42:59', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '22', '2010-07-08 17:43:02', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '23', '2010-07-08 17:43:14', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 17:44:23', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '27', '2010-07-08 17:47:01', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '21', '2010-07-08 17:47:04', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '22', '2010-07-08 17:47:07', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '23', '2010-07-08 17:47:09', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 17:55:36', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '21', '2010-07-08 17:55:40', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '21', '2010-07-08 17:55:45', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '22', '2010-07-08 17:55:48', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '23', '2010-07-08 17:55:49', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 17:57:03', null);
INSERT INTO `presshop_connections_page` VALUES ('60', '1', '2010-07-08 18:00:53', null);
INSERT INTO `presshop_connections_page` VALUES ('59', '1', '2010-07-08 21:23:52', null);
INSERT INTO `presshop_connections_page` VALUES ('61', '1', '2010-07-08 21:50:23', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '1', '2010-07-08 21:51:24', null);
INSERT INTO `presshop_connections_page` VALUES ('62', '1', '2010-07-08 22:00:24', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '1', '2010-07-08 22:26:10', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '30', '2010-07-08 22:26:46', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '29', '2010-07-08 22:26:53', null);
INSERT INTO `presshop_connections_page` VALUES ('46', '29', '2010-07-08 22:27:14', null);
INSERT INTO `presshop_connections_page` VALUES ('63', '1', '2010-07-08 22:31:58', null);
INSERT INTO `presshop_connections_page` VALUES ('64', '1', '2010-07-08 23:04:22', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-09 00:02:47', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-09 00:03:01', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-09 00:03:38', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-09 00:04:35', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '31', '2010-07-09 00:12:02', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '7', '2010-07-09 00:12:27', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '1', '2010-07-09 07:22:14', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '28', '2010-07-09 07:55:12', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '31', '2010-07-09 07:55:34', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '36', '2010-07-09 07:57:13', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-09 07:58:01', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '37', '2010-07-09 08:10:00', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '32', '2010-07-09 08:25:03', null);
INSERT INTO `presshop_connections_page` VALUES ('65', '31', '2010-07-09 09:45:24', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '1', '2010-07-09 12:05:28', null);
INSERT INTO `presshop_connections_page` VALUES ('66', '28', '2010-07-09 14:06:11', null);
INSERT INTO `presshop_connections_page` VALUES ('67', '1', '2010-07-09 15:13:40', null);
INSERT INTO `presshop_connections_page` VALUES ('67', '28', '2010-07-09 15:14:26', null);
INSERT INTO `presshop_connections_page` VALUES ('67', '31', '2010-07-09 15:15:43', null);
INSERT INTO `presshop_connections_page` VALUES ('68', '28', '2010-07-09 15:59:10', null);
INSERT INTO `presshop_connections_page` VALUES ('69', '32', '2010-07-09 16:49:02', null);
INSERT INTO `presshop_connections_page` VALUES ('70', '1', '2010-07-09 16:49:23', null);
INSERT INTO `presshop_connections_page` VALUES ('71', '1', '2010-07-09 16:49:35', null);
INSERT INTO `presshop_connections_page` VALUES ('71', '29', '2010-07-09 16:49:54', null);
INSERT INTO `presshop_connections_page` VALUES ('71', '32', '2010-07-09 17:00:55', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-09 18:32:32', null);
INSERT INTO `presshop_connections_page` VALUES ('72', '31', '2010-07-09 19:13:01', null);
INSERT INTO `presshop_connections_page` VALUES ('72', '1', '2010-07-09 19:13:12', null);
INSERT INTO `presshop_connections_page` VALUES ('72', '27', '2010-07-09 19:13:26', null);
INSERT INTO `presshop_connections_page` VALUES ('72', '39', '2010-07-09 19:13:34', null);
INSERT INTO `presshop_connections_page` VALUES ('72', '19', '2010-07-09 19:13:58', null);
INSERT INTO `presshop_connections_page` VALUES ('73', '1', '2010-07-09 19:26:56', null);
INSERT INTO `presshop_connections_page` VALUES ('74', '28', '2010-07-09 21:54:30', null);
INSERT INTO `presshop_connections_page` VALUES ('75', '31', '2010-07-09 22:17:24', null);
INSERT INTO `presshop_connections_page` VALUES ('76', '32', '2010-07-09 22:40:34', null);
INSERT INTO `presshop_connections_page` VALUES ('76', '37', '2010-07-09 22:41:33', null);
INSERT INTO `presshop_connections_page` VALUES ('77', '36', '2010-07-09 22:41:41', null);
INSERT INTO `presshop_connections_page` VALUES ('78', '37', '2010-07-09 23:07:37', null);
INSERT INTO `presshop_connections_page` VALUES ('21', '1', '2010-07-09 23:22:50', null);
INSERT INTO `presshop_connections_page` VALUES ('19', '37', '2010-07-09 23:59:36', null);
INSERT INTO `presshop_connections_page` VALUES ('79', '28', '2010-07-10 00:14:36', null);
INSERT INTO `presshop_connections_page` VALUES ('79', '31', '2010-07-10 00:15:06', null);
INSERT INTO `presshop_connections_page` VALUES ('80', '31', '2010-07-10 00:48:37', null);
INSERT INTO `presshop_connections_page` VALUES ('61', '1', '2010-07-10 02:47:21', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-10 05:25:22', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '36', '2010-07-10 05:25:26', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '28', '2010-07-10 05:25:41', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '32', '2010-07-10 05:26:05', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '39', '2010-07-10 05:26:41', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '33', '2010-07-10 05:26:46', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '31', '2010-07-10 05:26:50', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '30', '2010-07-10 05:26:53', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 05:26:59', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '32', '2010-07-10 05:27:01', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 05:27:08', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 05:27:09', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 05:27:15', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '3', '2010-07-10 05:27:28', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 05:28:06', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 05:28:10', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '27', '2010-07-10 05:30:41', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '7', '2010-07-10 05:31:12', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '37', '2010-07-10 05:31:19', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '40', '2010-07-10 05:32:11', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '6', '2010-07-10 05:32:19', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '18', '2010-07-10 05:32:27', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 05:32:59', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '3', '2010-07-10 05:33:06', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '37', '2010-07-10 05:33:11', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '3', '2010-07-10 05:33:18', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 05:33:31', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '18', '2010-07-10 05:34:13', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '6', '2010-07-10 05:35:14', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 05:36:52', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 05:40:36', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '31', '2010-07-10 05:42:57', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 05:44:08', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '4', '2010-07-10 05:45:36', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '27', '2010-07-10 05:51:19', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 06:32:52', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '3', '2010-07-10 06:36:35', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '33', '2010-07-10 06:50:16', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '36', '2010-07-10 06:57:13', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 06:59:23', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 08:04:57', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '3', '2010-07-10 08:56:17', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '4', '2010-07-10 09:18:23', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '41', '2010-07-10 09:51:49', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 09:56:37', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 10:00:50', null);
INSERT INTO `presshop_connections_page` VALUES ('81', '1', '2010-07-10 10:03:32', null);
INSERT INTO `presshop_connections_page` VALUES ('82', '1', '2010-07-10 10:03:33', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 10:23:53', null);
INSERT INTO `presshop_connections_page` VALUES ('83', '31', '2010-07-10 10:41:39', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 10:46:53', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '38', '2010-07-10 11:16:08', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 11:18:08', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '38', '2010-07-10 11:18:36', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '28', '2010-07-10 11:35:22', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 12:36:04', null);
INSERT INTO `presshop_connections_page` VALUES ('84', '1', '2010-07-10 12:37:51', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '30', '2010-07-10 13:22:00', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 13:37:12', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 13:58:53', null);
INSERT INTO `presshop_connections_page` VALUES ('85', '37', '2010-07-10 14:15:32', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 15:18:37', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '31', '2010-07-10 15:32:25', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '32', '2010-07-10 15:32:30', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '36', '2010-07-10 15:36:07', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 15:57:05', null);
INSERT INTO `presshop_connections_page` VALUES ('86', '28', '2010-07-10 17:28:42', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 17:57:57', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '29', '2010-07-10 18:37:51', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '9', '2010-07-10 18:39:15', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 18:52:50', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-10 22:17:28', null);
INSERT INTO `presshop_connections_page` VALUES ('87', '28', '2010-07-10 22:41:03', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-10 23:08:04', null);
INSERT INTO `presshop_connections_page` VALUES ('88', '28', '2010-07-10 23:14:00', null);
INSERT INTO `presshop_connections_page` VALUES ('89', '1', '2010-07-10 23:57:11', null);
INSERT INTO `presshop_connections_page` VALUES ('90', '37', '2010-07-10 23:59:15', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '2', '2010-07-11 00:06:26', null);
INSERT INTO `presshop_connections_page` VALUES ('91', '31', '2010-07-11 00:25:27', null);
INSERT INTO `presshop_connections_page` VALUES ('91', '28', '2010-07-11 00:26:07', null);
INSERT INTO `presshop_connections_page` VALUES ('92', '37', '2010-07-11 01:16:06', null);
INSERT INTO `presshop_connections_page` VALUES ('92', '19', '2010-07-11 01:16:59', null);
INSERT INTO `presshop_connections_page` VALUES ('92', '28', '2010-07-11 01:17:23', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-11 04:48:54', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-11 05:25:54', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '28', '2010-07-11 05:26:42', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '36', '2010-07-11 05:27:06', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '32', '2010-07-11 05:27:43', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '31', '2010-07-11 05:39:54', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-11 05:54:52', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-11 08:11:24', null);
INSERT INTO `presshop_connections_page` VALUES ('93', '32', '2010-07-11 08:45:54', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '19', '2010-07-11 10:11:17', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '1', '2010-07-11 10:25:40', null);
INSERT INTO `presshop_connections_page` VALUES ('24', '3', '2010-07-11 10:25:56', null);
INSERT INTO `presshop_connections_page` VALUES ('94', '1', '2010-07-11 11:16:42', null);
INSERT INTO `presshop_connections_page` VALUES ('95', '32', '2010-07-11 11:20:08', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '37', '2010-07-11 11:37:37', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '1', '2010-07-11 11:52:11', null);
INSERT INTO `presshop_connections_page` VALUES ('32', '29', '2010-07-11 11:52:49', null);
INSERT INTO `presshop_connections_page` VALUES ('0', '1', '2010-07-11 13:38:50', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-11 13:53:50', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '1', '2010-07-11 13:54:11', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '6', '2010-07-11 13:54:23', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '7', '2010-07-11 13:54:39', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '30', '2010-07-11 13:55:03', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '27', '2010-07-11 13:55:21', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '3', '2010-07-11 13:55:43', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '3', '2010-07-11 13:56:03', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '9', '2010-07-11 13:56:21', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '9', '2010-07-11 13:56:37', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '9', '2010-07-11 13:56:53', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '9', '2010-07-11 13:57:05', null);
INSERT INTO `presshop_connections_page` VALUES ('18', '30', '2010-07-11 13:57:23', null);
INSERT INTO `presshop_connections_page` VALUES ('96', '32', '2010-07-11 15:05:34', null);
INSERT INTO `presshop_connections_page` VALUES ('97', '31', '2010-07-11 15:41:56', null);
INSERT INTO `presshop_connections_page` VALUES ('98', '31', '2010-07-11 17:26:31', null);
INSERT INTO `presshop_connections_page` VALUES ('99', '31', '2010-07-11 19:37:44', null);
INSERT INTO `presshop_connections_page` VALUES ('100', '31', '2010-07-11 21:07:06', null);
INSERT INTO `presshop_connections_page` VALUES ('25', '1', '2010-07-11 21:47:45', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '1', '2010-07-12 05:25:14', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '3', '2010-07-12 05:26:43', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '3', '2010-07-12 05:26:44', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '1', '2010-07-12 05:26:49', null);
INSERT INTO `presshop_connections_page` VALUES ('51', '1', '2010-07-12 05:31:30', null);
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
INSERT INTO `presshop_connections_source` VALUES ('112', '19', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-08 09:18:37');
INSERT INTO `presshop_connections_source` VALUES ('113', '32', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 09:28:15');
INSERT INTO `presshop_connections_source` VALUES ('114', '28', 'http://conferences-formations.com/index.php/conference_office', 'conferences-formations.com/prestashop/product.php?id_product=13', '', '2010-07-08 09:33:46');
INSERT INTO `presshop_connections_source` VALUES ('115', '51', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-08 10:22:18');
INSERT INTO `presshop_connections_source` VALUES ('116', '18', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 10:59:45');
INSERT INTO `presshop_connections_source` VALUES ('117', '52', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 11:33:43');
INSERT INTO `presshop_connections_source` VALUES ('118', '52', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 11:34:22');
INSERT INTO `presshop_connections_source` VALUES ('119', '51', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 11:43:38');
INSERT INTO `presshop_connections_source` VALUES ('120', '52', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 11:49:03');
INSERT INTO `presshop_connections_source` VALUES ('121', '28', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/product.php?id_product=12', '', '2010-07-08 11:54:26');
INSERT INTO `presshop_connections_source` VALUES ('122', '51', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-08 12:12:35');
INSERT INTO `presshop_connections_source` VALUES ('123', '51', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-08 12:14:50');
INSERT INTO `presshop_connections_source` VALUES ('124', '51', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-08 12:15:12');
INSERT INTO `presshop_connections_source` VALUES ('125', '51', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-08 12:15:43');
INSERT INTO `presshop_connections_source` VALUES ('126', '57', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-08 14:04:14');
INSERT INTO `presshop_connections_source` VALUES ('127', '52', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-08 14:51:11');
INSERT INTO `presshop_connections_source` VALUES ('128', '58', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-08 15:50:45');
INSERT INTO `presshop_connections_source` VALUES ('129', '57', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-08 17:22:47');
INSERT INTO `presshop_connections_source` VALUES ('130', '57', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-08 17:28:44');
INSERT INTO `presshop_connections_source` VALUES ('131', '60', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 18:00:53');
INSERT INTO `presshop_connections_source` VALUES ('132', '59', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-08 21:23:52');
INSERT INTO `presshop_connections_source` VALUES ('133', '61', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 21:50:23');
INSERT INTO `presshop_connections_source` VALUES ('134', '32', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 21:51:24');
INSERT INTO `presshop_connections_source` VALUES ('135', '62', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-08 22:00:24');
INSERT INTO `presshop_connections_source` VALUES ('136', '46', 'http://www.conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-08 22:26:10');
INSERT INTO `presshop_connections_source` VALUES ('137', '63', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-08 22:31:58');
INSERT INTO `presshop_connections_source` VALUES ('138', '64', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-08 23:04:22');
INSERT INTO `presshop_connections_source` VALUES ('139', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-09 00:02:47');
INSERT INTO `presshop_connections_source` VALUES ('140', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-09 00:03:01');
INSERT INTO `presshop_connections_source` VALUES ('141', '21', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-09 00:03:38');
INSERT INTO `presshop_connections_source` VALUES ('142', '21', 'http://conferences-formations.com/index.php/contact', 'conferences-formations.com/prestashop/', '', '2010-07-09 00:04:35');
INSERT INTO `presshop_connections_source` VALUES ('143', '24', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-09 00:12:02');
INSERT INTO `presshop_connections_source` VALUES ('144', '19', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-09 07:22:14');
INSERT INTO `presshop_connections_source` VALUES ('145', '65', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-09 09:45:24');
INSERT INTO `presshop_connections_source` VALUES ('146', '24', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-09 12:05:28');
INSERT INTO `presshop_connections_source` VALUES ('147', '66', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-09 14:06:11');
INSERT INTO `presshop_connections_source` VALUES ('148', '67', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-09 15:13:40');
INSERT INTO `presshop_connections_source` VALUES ('149', '68', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-09 15:59:10');
INSERT INTO `presshop_connections_source` VALUES ('150', '69', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-09 16:49:02');
INSERT INTO `presshop_connections_source` VALUES ('151', '70', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-09 16:49:23');
INSERT INTO `presshop_connections_source` VALUES ('152', '71', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-09 16:49:35');
INSERT INTO `presshop_connections_source` VALUES ('153', '72', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-09 19:13:01');
INSERT INTO `presshop_connections_source` VALUES ('154', '72', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-09 19:13:12');
INSERT INTO `presshop_connections_source` VALUES ('155', '73', '', 'conferences-formations.com/prestashop/', '', '2010-07-09 19:26:56');
INSERT INTO `presshop_connections_source` VALUES ('156', '74', 'http://conferences-formations.com/index.php/home/play/100043', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-09 21:54:30');
INSERT INTO `presshop_connections_source` VALUES ('157', '75', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-09 22:17:24');
INSERT INTO `presshop_connections_source` VALUES ('158', '76', 'http://conferences-formations.com/index.php/accessories/show_element/training', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-09 22:40:34');
INSERT INTO `presshop_connections_source` VALUES ('159', '76', 'http://conferences-formations.com/index.php/home/play/100034', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-09 22:41:33');
INSERT INTO `presshop_connections_source` VALUES ('160', '77', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=13&lang=2', '', '2010-07-09 22:41:41');
INSERT INTO `presshop_connections_source` VALUES ('161', '78', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-09 23:07:37');
INSERT INTO `presshop_connections_source` VALUES ('162', '21', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/', '', '2010-07-09 23:22:50');
INSERT INTO `presshop_connections_source` VALUES ('163', '19', 'http://conferences-formations.com/index.php/accessories/show_element/rules', 'conferences-formations.com/prestashop/product.php?id_product=14', '', '2010-07-09 23:59:36');
INSERT INTO `presshop_connections_source` VALUES ('164', '79', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-10 00:14:36');
INSERT INTO `presshop_connections_source` VALUES ('165', '79', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-10 00:15:06');
INSERT INTO `presshop_connections_source` VALUES ('166', '80', 'http://conferences-formations.com/index.php/accessories/show_element/about', 'conferences-formations.com/prestashop/product.php?id_product=11', '', '2010-07-10 00:48:37');
INSERT INTO `presshop_connections_source` VALUES ('167', '61', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-10 02:47:21');
INSERT INTO `presshop_connections_source` VALUES ('168', '81', '', 'conferences-formations.com/prestashop/', '', '2010-07-10 10:03:32');
INSERT INTO `presshop_connections_source` VALUES ('169', '82', '', 'conferences-formations.com/prestashop/', '', '2010-07-10 10:03:33');
INSERT INTO `presshop_connections_source` VALUES ('170', '83', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-10 10:41:39');
INSERT INTO `presshop_connections_source` VALUES ('171', '84', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-10 12:37:51');
INSERT INTO `presshop_connections_source` VALUES ('172', '85', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-10 14:15:32');
INSERT INTO `presshop_connections_source` VALUES ('173', '86', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-10 17:28:42');
INSERT INTO `presshop_connections_source` VALUES ('174', '87', 'http://conferences-formations.com/index.php/blog/blog_content/admin/Atelier', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-10 22:41:03');
INSERT INTO `presshop_connections_source` VALUES ('175', '88', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/product.php?id_product=10&lang=2', '', '2010-07-10 23:14:00');
INSERT INTO `presshop_connections_source` VALUES ('176', '89', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-10 23:57:11');
INSERT INTO `presshop_connections_source` VALUES ('177', '90', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-10 23:59:15');
INSERT INTO `presshop_connections_source` VALUES ('178', '91', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-11 00:25:27');
INSERT INTO `presshop_connections_source` VALUES ('179', '92', 'http://conferences-formations.com/index.php/home/play/100043', 'conferences-formations.com/prestashop/product.php?id_product=14&lang=2', '', '2010-07-11 01:16:06');
INSERT INTO `presshop_connections_source` VALUES ('180', '93', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-11 08:45:54');
INSERT INTO `presshop_connections_source` VALUES ('181', '24', 'http://conferences-formations.com/index.php', 'conferences-formations.com/prestashop/', '', '2010-07-11 10:25:40');
INSERT INTO `presshop_connections_source` VALUES ('182', '94', 'http://conferences-formations.com/index.php/accessories/show_element/training', 'conferences-formations.com/prestashop/', '', '2010-07-11 11:16:42');
INSERT INTO `presshop_connections_source` VALUES ('183', '95', 'http://conferences-formations.com/index.php/home/play/100043', 'conferences-formations.com/prestashop/product.php?id_product=12', '', '2010-07-11 11:20:08');
INSERT INTO `presshop_connections_source` VALUES ('184', '32', 'http://conferences-formations.com/index.php/event/show_event/2010-07-07/5', 'conferences-formations.com/prestashop/', '', '2010-07-11 11:52:11');
INSERT INTO `presshop_connections_source` VALUES ('185', '18', 'http://conferences-formations.com/index.php/blog/blog_content/admin/Peur%20de%20lavion%20-%20tes%20Ativans%20ou%20ma%20DS', 'conferences-formations.com/prestashop/', '', '2010-07-11 13:53:50');
INSERT INTO `presshop_connections_source` VALUES ('186', '96', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=12&lang=2', '', '2010-07-11 15:05:34');
INSERT INTO `presshop_connections_source` VALUES ('187', '97', 'http://conferences-formations.com/index.php/blog', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-11 15:41:56');
INSERT INTO `presshop_connections_source` VALUES ('188', '98', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-11 17:26:31');
INSERT INTO `presshop_connections_source` VALUES ('189', '99', 'http://conferences-formations.com/index.php/event/show_event/2010-07-19/5', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-11 19:37:44');
INSERT INTO `presshop_connections_source` VALUES ('190', '100', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/product.php?id_product=11&lang=2', '', '2010-07-11 21:07:06');
INSERT INTO `presshop_connections_source` VALUES ('191', '25', 'http://conferences-formations.com/', 'conferences-formations.com/prestashop/', '', '2010-07-11 21:47:45');
INSERT INTO `presshop_connections_source` VALUES ('192', '51', 'http://localhost/confor/', 'localhost/confor/prestashop/', '', '2010-07-12 05:25:14');
INSERT INTO `presshop_connections_source` VALUES ('193', '51', 'http://localhost/confor/', 'localhost/confor/prestashop/', '', '2010-07-12 05:26:49');
INSERT INTO `presshop_connections_source` VALUES ('194', '51', 'http://localhost/confor/', 'localhost/confor/prestashop/', '', '2010-07-12 05:31:30');
INSERT INTO `presshop_contact` VALUES ('1', 'admin@conferences-formations.com', '0');
INSERT INTO `presshop_contact` VALUES ('2', 'admin@conferences-formations.com', '0');
INSERT INTO `presshop_contact_lang` VALUES ('1', '1', 'Webmaster', 'If a technical problem occurs on this website');
INSERT INTO `presshop_contact_lang` VALUES ('1', '2', 'Webmaster', 'Si un problème technique survient sur le site');
INSERT INTO `presshop_contact_lang` VALUES ('2', '1', 'Customer service', 'For any question about a product, an order');
INSERT INTO `presshop_contact_lang` VALUES ('2', '2', 'Service client', 'Pour toute question ou réclamation sur une commande');
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
INSERT INTO `presshop_currency` VALUES ('1', 'Euro', 'EUR', '€', '1', '2', '1', '1.000000', '1');
INSERT INTO `presshop_currency` VALUES ('2', 'Canada Dollar', 'CAD', '$', '0', '3', '1', '1.000000', '0');
INSERT INTO `presshop_currency` VALUES ('3', 'Pound', 'GBP', '£', '0', '1', '1', '0.800000', '1');
INSERT INTO `presshop_customer` VALUES ('1', '1', '1', '47ce86627c1f3c792a80773c5d2deaf8', 'pub@prestashop.com', 'ad807bdf0426766c05c64041124d30ce', '2010-06-30 10:43:53', '1970-01-15', 'DOE', '1', null, null, '1', 'John', null, '1', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_customer` VALUES ('2', '1', '1', '0837f0ccb139160eb26b651c2119cd70', 'huunam09@gmail.com', '049a32d5d6e50193119cf2fc2d6c8b84', '2010-07-02 21:40:43', '1989-01-01', 'nam', '1', '183.81.36.107', '2010-07-03 03:40:43', '0', 'nam', null, '1', '0', '2010-07-03 03:40:43', '2010-07-03 03:40:43');
INSERT INTO `presshop_customer` VALUES ('3', '1', '1', '487796638fe57854f37e0eb2843e43f6', 'mayman@live.ca', '9b30e29c4764da1636879826d89b10b0', '2010-07-06 16:35:14', '1966-05-31', 'May Webber', '0', null, null, '0', 'Michael', null, '1', '0', '2010-07-06 22:35:14', '2010-07-06 22:35:14');
INSERT INTO `presshop_customer` VALUES ('4', '2', '1', '7ec1968e1b96f3ff96bc3f23e48fb58b', 'tham212001@yahoo.com', 'f53ce83b594ef838ac7f720439bf705c', '2010-07-06 19:46:25', '1983-01-02', 'le', '0', null, null, '0', 'tham', null, '1', '0', '2010-07-07 01:46:25', '2010-07-07 01:46:25');
INSERT INTO `presshop_customer_group` VALUES ('1', '1');
INSERT INTO `presshop_customer_group` VALUES ('2', '1');
INSERT INTO `presshop_customer_group` VALUES ('3', '1');
INSERT INTO `presshop_customer_group` VALUES ('4', '1');
INSERT INTO `presshop_date_range` VALUES ('1', '2010-06-30 00:00:00', '2010-06-30 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('2', '2010-07-01 00:00:00', '2010-07-01 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('3', '2010-07-02 00:00:00', '2010-07-02 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('4', '2010-07-03 00:00:00', '2010-07-03 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('5', '2010-07-04 00:00:00', '2010-07-04 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('6', '2010-07-05 00:00:00', '2010-07-05 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('7', '2010-07-06 00:00:00', '2010-07-06 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('8', '2010-07-07 00:00:00', '2010-07-07 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('9', '2010-07-08 00:00:00', '2010-07-08 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('10', '2010-07-09 00:00:00', '2010-07-09 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('11', '2010-07-10 00:00:00', '2010-07-10 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('12', '2010-07-11 00:00:00', '2010-07-11 23:59:59');
INSERT INTO `presshop_date_range` VALUES ('13', '2010-07-12 00:00:00', '2010-07-12 23:59:59');
INSERT INTO `presshop_delivery` VALUES ('1', '2', null, '1', '1', '5.00');
INSERT INTO `presshop_delivery` VALUES ('2', '2', null, '1', '2', '5.00');
INSERT INTO `presshop_delivery` VALUES ('7', '2', '1', null, '2', '5.00');
INSERT INTO `presshop_delivery` VALUES ('6', '2', '1', null, '1', '5.00');
INSERT INTO `presshop_delivery` VALUES ('8', '3', '2', null, '2', '5.00');
INSERT INTO `presshop_delivery` VALUES ('9', '3', '2', null, '1', '5.00');
INSERT INTO `presshop_delivery` VALUES ('10', '3', null, '2', '1', '5.00');
INSERT INTO `presshop_delivery` VALUES ('11', '3', null, '2', '2', '5.00');
INSERT INTO `presshop_discount_type` VALUES ('1');
INSERT INTO `presshop_discount_type` VALUES ('2');
INSERT INTO `presshop_discount_type` VALUES ('3');
INSERT INTO `presshop_discount_type_lang` VALUES ('1', '1', 'Discount on order (%)');
INSERT INTO `presshop_discount_type_lang` VALUES ('2', '1', 'Discount on order (amount)');
INSERT INTO `presshop_discount_type_lang` VALUES ('3', '1', 'Free shipping');
INSERT INTO `presshop_discount_type_lang` VALUES ('1', '2', 'Réduction sur la commande (%)');
INSERT INTO `presshop_discount_type_lang` VALUES ('2', '2', 'Réduction sur la commande (montant)');
INSERT INTO `presshop_discount_type_lang` VALUES ('3', '2', 'Frais de port gratuits');
INSERT INTO `presshop_employee` VALUES ('1', '1', 'LE', 'Tham', 'admin@conferences-formations.com', '9e293890d0ed2b54a87c21be02eef1b0', '2010-06-30 10:47:18', '2010-01-01', '2010-12-31', '1');
INSERT INTO `presshop_feature` VALUES ('1');
INSERT INTO `presshop_feature` VALUES ('2');
INSERT INTO `presshop_feature` VALUES ('3');
INSERT INTO `presshop_feature` VALUES ('4');
INSERT INTO `presshop_feature` VALUES ('5');
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
INSERT INTO `presshop_feature_value` VALUES ('9', '5', null);
INSERT INTO `presshop_feature_value` VALUES ('10', '5', null);
INSERT INTO `presshop_feature_value_lang` VALUES ('9', '1', 'Jack stereo');
INSERT INTO `presshop_feature_value_lang` VALUES ('9', '2', 'Jack stéréo');
INSERT INTO `presshop_feature_value_lang` VALUES ('10', '1', 'Mini-jack stereo');
INSERT INTO `presshop_feature_value_lang` VALUES ('10', '2', 'Mini-jack stéréo');
INSERT INTO `presshop_group` VALUES ('1', '0.00', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_group_lang` VALUES ('1', '1', 'Default');
INSERT INTO `presshop_group_lang` VALUES ('1', '2', 'Défaut');
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
INSERT INTO `presshop_guest` VALUES ('44', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('39', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('40', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('41', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('42', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('43', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('46', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('47', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('48', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('49', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('50', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en');
INSERT INTO `presshop_guest` VALUES ('51', '1', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `presshop_guest` VALUES ('52', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-fr');
INSERT INTO `presshop_guest` VALUES ('53', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('54', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('55', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('56', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('57', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('58', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('59', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('60', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('61', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('62', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('63', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('64', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('65', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('66', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('67', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('68', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('69', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('70', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('71', '4', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('72', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('73', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('74', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('75', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-fr');
INSERT INTO `presshop_guest` VALUES ('76', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('77', '2', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('78', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('79', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('80', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('81', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'en-us');
INSERT INTO `presshop_guest` VALUES ('82', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('83', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('84', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
INSERT INTO `presshop_guest` VALUES ('85', '1', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr-ca');
INSERT INTO `presshop_guest` VALUES ('86', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fr');
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
INSERT INTO `presshop_image` VALUES ('52', '10', '1', '1');
INSERT INTO `presshop_image` VALUES ('53', '11', '1', '1');
INSERT INTO `presshop_image` VALUES ('54', '12', '1', '1');
INSERT INTO `presshop_image` VALUES ('55', '13', '1', '1');
INSERT INTO `presshop_image` VALUES ('56', '14', '1', '1');
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
INSERT INTO `presshop_image_type` VALUES ('1', 'small', '45', '45', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('2', 'medium', '80', '80', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('3', 'large', '300', '300', '1', '1', '1', '1', '0');
INSERT INTO `presshop_image_type` VALUES ('4', 'thickbox', '600', '600', '1', '0', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('5', 'category', '500', '150', '0', '1', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('6', 'home', '129', '129', '1', '0', '0', '0', '0');
INSERT INTO `presshop_image_type` VALUES ('7', 'large_scene', '556', '200', '0', '0', '0', '0', '1');
INSERT INTO `presshop_image_type` VALUES ('8', 'thumb_scene', '161', '58', '0', '0', '0', '0', '1');
INSERT INTO `presshop_lang` VALUES ('1', 'English (English)', '1', 'en');
INSERT INTO `presshop_lang` VALUES ('2', 'Français (French)', '1', 'fr');
INSERT INTO `presshop_manufacturer` VALUES ('1', 'Apple Computer, Inc', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_manufacturer` VALUES ('2', 'Shure Incorporated', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
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
INSERT INTO `presshop_module_currency` VALUES ('3', '2');
INSERT INTO `presshop_module_currency` VALUES ('4', '2');
INSERT INTO `presshop_module_currency` VALUES ('6', '2');
INSERT INTO `presshop_module_group` VALUES ('3', '1');
INSERT INTO `presshop_module_group` VALUES ('4', '1');
INSERT INTO `presshop_module_group` VALUES ('6', '1');
INSERT INTO `presshop_operating_system` VALUES ('1', 'Windows XP');
INSERT INTO `presshop_operating_system` VALUES ('2', 'Windows Vista');
INSERT INTO `presshop_operating_system` VALUES ('3', 'MacOsX');
INSERT INTO `presshop_operating_system` VALUES ('4', 'Linux');
INSERT INTO `presshop_order_detail` VALUES ('1', '1', '7', '23', 'iPod touch - Capacité: 32Go', '1', '0', '0', '0', '0', '392.140500', '0.000000', null, null, null, '0', 'TVA 19.6%', '19.600', '0.00', '0', '', '0', '0000-00-00 00:00:00');
INSERT INTO `presshop_order_detail` VALUES ('2', '1', '9', '0', 'Écouteurs à isolation sonore Shure SE210', '1', '0', '0', '0', '0', '124.581900', '0.000000', null, null, null, '0', 'TVA 19.6%', '19.600', '0.00', '0', '', '0', '0000-00-00 00:00:00');
INSERT INTO `presshop_order_history` VALUES ('1', '0', '1', '1', '2010-06-30 10:43:53');
INSERT INTO `presshop_order_message` VALUES ('1', '2010-06-30 10:43:53');
INSERT INTO `presshop_order_message_lang` VALUES ('1', '1', 'Delay', 'Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,');
INSERT INTO `presshop_order_message_lang` VALUES ('1', '2', 'Délai', 'Bonjour,\n\nUn des éléments de votre commande est actuellement en réapprovisionnement, ce qui peut légèrement retarder son envoi.\n\nMerci de votre compréhension.\n\nCordialement,');
INSERT INTO `presshop_order_return_state` VALUES ('1', '#ADD8E6');
INSERT INTO `presshop_order_return_state` VALUES ('2', '#EEDDFF');
INSERT INTO `presshop_order_return_state` VALUES ('3', '#DDFFAA');
INSERT INTO `presshop_order_return_state` VALUES ('4', '#FFD3D3');
INSERT INTO `presshop_order_return_state` VALUES ('5', '#FFFFBB');
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
INSERT INTO `presshop_orders` VALUES ('1', '2', '2', '1', '1', '1', '2', '2', '47ce86627c1f3c792a80773c5d2deaf8', 'Chèque', 'cheque', '1', '0', '', '', '0.00', '625.98', '625.98', '516.72', '618.00', '7.98', '0.00', '1', '0', '2008-09-10 15:30:44', '0000-00-00 00:00:00', '0', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
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
INSERT INTO `presshop_page` VALUES ('38', '4', '0');
INSERT INTO `presshop_page` VALUES ('39', '4', '1');
INSERT INTO `presshop_page` VALUES ('40', '19', null);
INSERT INTO `presshop_page` VALUES ('41', '20', null);
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
INSERT INTO `presshop_page_type` VALUES ('19', 'best-sales.php');
INSERT INTO `presshop_page_type` VALUES ('20', 'supplier.php');
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
INSERT INTO `presshop_page_viewed` VALUES ('28', '9', '6');
INSERT INTO `presshop_page_viewed` VALUES ('37', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('36', '9', '4');
INSERT INTO `presshop_page_viewed` VALUES ('33', '9', '2');
INSERT INTO `presshop_page_viewed` VALUES ('32', '9', '5');
INSERT INTO `presshop_page_viewed` VALUES ('31', '9', '3');
INSERT INTO `presshop_page_viewed` VALUES ('9', '9', '14');
INSERT INTO `presshop_page_viewed` VALUES ('14', '9', '7');
INSERT INTO `presshop_page_viewed` VALUES ('1', '9', '29');
INSERT INTO `presshop_page_viewed` VALUES ('11', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('17', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('29', '9', '8');
INSERT INTO `presshop_page_viewed` VALUES ('30', '9', '3');
INSERT INTO `presshop_page_viewed` VALUES ('27', '9', '7');
INSERT INTO `presshop_page_viewed` VALUES ('3', '9', '3');
INSERT INTO `presshop_page_viewed` VALUES ('19', '9', '3');
INSERT INTO `presshop_page_viewed` VALUES ('2', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('38', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('18', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('21', '9', '7');
INSERT INTO `presshop_page_viewed` VALUES ('22', '9', '6');
INSERT INTO `presshop_page_viewed` VALUES ('23', '9', '6');
INSERT INTO `presshop_page_viewed` VALUES ('10', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('20', '9', '1');
INSERT INTO `presshop_page_viewed` VALUES ('1', '10', '14');
INSERT INTO `presshop_page_viewed` VALUES ('31', '10', '6');
INSERT INTO `presshop_page_viewed` VALUES ('7', '10', '1');
INSERT INTO `presshop_page_viewed` VALUES ('28', '10', '5');
INSERT INTO `presshop_page_viewed` VALUES ('36', '10', '2');
INSERT INTO `presshop_page_viewed` VALUES ('37', '10', '4');
INSERT INTO `presshop_page_viewed` VALUES ('32', '10', '4');
INSERT INTO `presshop_page_viewed` VALUES ('29', '10', '1');
INSERT INTO `presshop_page_viewed` VALUES ('27', '10', '1');
INSERT INTO `presshop_page_viewed` VALUES ('39', '10', '1');
INSERT INTO `presshop_page_viewed` VALUES ('19', '10', '1');
INSERT INTO `presshop_page_viewed` VALUES ('28', '11', '6');
INSERT INTO `presshop_page_viewed` VALUES ('31', '11', '6');
INSERT INTO `presshop_page_viewed` VALUES ('1', '11', '6');
INSERT INTO `presshop_page_viewed` VALUES ('36', '11', '3');
INSERT INTO `presshop_page_viewed` VALUES ('32', '11', '3');
INSERT INTO `presshop_page_viewed` VALUES ('39', '11', '1');
INSERT INTO `presshop_page_viewed` VALUES ('33', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('30', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('9', '11', '7');
INSERT INTO `presshop_page_viewed` VALUES ('2', '11', '8');
INSERT INTO `presshop_page_viewed` VALUES ('19', '11', '14');
INSERT INTO `presshop_page_viewed` VALUES ('3', '11', '5');
INSERT INTO `presshop_page_viewed` VALUES ('27', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('7', '11', '1');
INSERT INTO `presshop_page_viewed` VALUES ('37', '11', '4');
INSERT INTO `presshop_page_viewed` VALUES ('40', '11', '1');
INSERT INTO `presshop_page_viewed` VALUES ('6', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('18', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('4', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('41', '11', '1');
INSERT INTO `presshop_page_viewed` VALUES ('38', '11', '2');
INSERT INTO `presshop_page_viewed` VALUES ('29', '11', '1');
INSERT INTO `presshop_page_viewed` VALUES ('2', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('31', '12', '6');
INSERT INTO `presshop_page_viewed` VALUES ('28', '12', '3');
INSERT INTO `presshop_page_viewed` VALUES ('37', '12', '2');
INSERT INTO `presshop_page_viewed` VALUES ('19', '12', '5');
INSERT INTO `presshop_page_viewed` VALUES ('1', '12', '8');
INSERT INTO `presshop_page_viewed` VALUES ('36', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('32', '12', '4');
INSERT INTO `presshop_page_viewed` VALUES ('3', '12', '3');
INSERT INTO `presshop_page_viewed` VALUES ('29', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('6', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('7', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('30', '12', '2');
INSERT INTO `presshop_page_viewed` VALUES ('27', '12', '1');
INSERT INTO `presshop_page_viewed` VALUES ('9', '12', '4');
INSERT INTO `presshop_page_viewed` VALUES ('1', '13', '3');
INSERT INTO `presshop_page_viewed` VALUES ('3', '13', '2');
INSERT INTO `presshop_product` VALUES ('10', '0', '0', '4', '7', '0', '0', '', '0.00', '20', '15.950000', '0.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0.2', '2', '0', '0', '0', '0', '1', '1', '2010-07-06 22:06:50', '2010-07-08 12:14:38');
INSERT INTO `presshop_product` VALUES ('11', '0', '0', '4', '6', '0', '1', '', '0.00', '10', '24.950000', '20.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0', '0', '0', '0', '0', '0', '1', '1', '2010-07-06 23:38:47', '2010-07-07 08:27:07');
INSERT INTO `presshop_product` VALUES ('12', '0', '0', '4', '6', '0', '0', '', '0.00', '1', '34.950000', '0.000000', '0.00', '0', '2010-07-06 00:00:00', '2010-07-06 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 00:16:10', '2010-07-07 14:33:54');
INSERT INTO `presshop_product` VALUES ('13', '0', '0', '4', '6', '0', '0', '', '0.00', '1', '26.580000', '19.500000', '0.00', '0', '2010-07-07 00:00:00', '2010-07-07 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 10:09:00', '2010-07-07 10:19:06');
INSERT INTO `presshop_product` VALUES ('14', '0', '0', '4', '6', '0', '0', '', '0.00', '7', '29.950000', '19.500000', '0.00', '0', '2010-07-07 00:00:00', '2010-07-07 00:00:00', '', '', '', '0', '2', '0', '0', '0', '0', '1', '1', '2010-07-07 14:47:16', '2010-07-08 10:57:47');
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
INSERT INTO `presshop_profile` VALUES ('1');
INSERT INTO `presshop_profile_lang` VALUES ('1', '1', 'Administrator');
INSERT INTO `presshop_profile_lang` VALUES ('2', '1', 'Administrateur');
INSERT INTO `presshop_quick_access` VALUES ('1', '0', 'index.php');
INSERT INTO `presshop_quick_access` VALUES ('2', '1', '../');
INSERT INTO `presshop_quick_access` VALUES ('3', '0', 'index.php?tab=AdminCatalog&addcategory');
INSERT INTO `presshop_quick_access` VALUES ('4', '0', 'index.php?tab=AdminCatalog&addproduct');
INSERT INTO `presshop_quick_access` VALUES ('5', '0', 'index.php?tab=AdminDiscounts&adddiscount');
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
INSERT INTO `presshop_range_price` VALUES ('1', '2', '0.000000', '10000.000000');
INSERT INTO `presshop_range_price` VALUES ('2', '3', '0.000000', '10000.000000');
INSERT INTO `presshop_range_weight` VALUES ('1', '2', '0.000000', '10000.000000');
INSERT INTO `presshop_range_weight` VALUES ('2', '3', '0.000000', '10000.000000');
INSERT INTO `presshop_scene` VALUES ('2', '1');
INSERT INTO `presshop_scene_lang` VALUES ('2', '1', 'The Shop Confor.ca');
INSERT INTO `presshop_scene_lang` VALUES ('2', '2', 'La Boutique Confor.ca');
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
INSERT INTO `presshop_subdomain` VALUES ('1', 'www');
INSERT INTO `presshop_supplier` VALUES ('1', 'AppleStore', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
INSERT INTO `presshop_supplier` VALUES ('2', 'Shure Online Store', '2010-06-30 10:43:53', '2010-06-30 10:43:53');
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
INSERT INTO `presshop_tax` VALUES ('5', '5.000');
INSERT INTO `presshop_tax` VALUES ('4', '12.870');
INSERT INTO `presshop_tax_lang` VALUES ('5', '2', 'Ontario');
INSERT INTO `presshop_tax_lang` VALUES ('5', '1', 'Ontario');
INSERT INTO `presshop_tax_lang` VALUES ('4', '1', 'GST/TSQ combined');
INSERT INTO `presshop_tax_lang` VALUES ('4', '2', 'TPS/TVQ combinée');
INSERT INTO `presshop_tax_state` VALUES ('4', '54');
INSERT INTO `presshop_tax_state` VALUES ('5', '53');
INSERT INTO `presshop_tax_zone` VALUES ('1', '1');
INSERT INTO `presshop_tax_zone` VALUES ('2', '1');
INSERT INTO `presshop_tax_zone` VALUES ('4', '1');
INSERT INTO `presshop_tax_zone` VALUES ('4', '2');
INSERT INTO `presshop_tax_zone` VALUES ('4', '3');
INSERT INTO `presshop_tax_zone` VALUES ('4', '4');
INSERT INTO `presshop_tax_zone` VALUES ('4', '5');
INSERT INTO `presshop_tax_zone` VALUES ('5', '1');
INSERT INTO `presshop_tax_zone` VALUES ('5', '2');
INSERT INTO `presshop_tax_zone` VALUES ('5', '3');
INSERT INTO `presshop_tax_zone` VALUES ('5', '4');
INSERT INTO `presshop_tax_zone` VALUES ('5', '5');
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
INSERT INTO `presshop_web_browser` VALUES ('1', 'Safari');
INSERT INTO `presshop_web_browser` VALUES ('2', 'Firefox 2.x');
INSERT INTO `presshop_web_browser` VALUES ('3', 'Firefox 3.x');
INSERT INTO `presshop_web_browser` VALUES ('4', 'Opera');
INSERT INTO `presshop_web_browser` VALUES ('5', 'IE 6.x');
INSERT INTO `presshop_web_browser` VALUES ('6', 'IE 7.x');
INSERT INTO `presshop_web_browser` VALUES ('7', 'IE 8.x');
INSERT INTO `presshop_web_browser` VALUES ('8', 'Google Chrome');
INSERT INTO `presshop_zone` VALUES ('1', 'Europe', '1', '1');
INSERT INTO `presshop_zone` VALUES ('2', 'US', '1', '1');
INSERT INTO `presshop_zone` VALUES ('3', 'Asia', '1', '1');
INSERT INTO `presshop_zone` VALUES ('4', 'Africa', '1', '1');
INSERT INTO `presshop_zone` VALUES ('5', 'Oceania', '1', '1');
INSERT INTO `rates` VALUES ('1', '2', 'Weekly', 'Weekly access to protected areas', '0.99', '1', 'W', '1');
INSERT INTO `rates` VALUES ('2', '3', 'Monthly', 'Monthly access to protected areas', '1.99', '1', 'M', '1');
INSERT INTO `rates` VALUES ('3', '2', 'Yearly', 'Yearly access to protected areas', '10.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('4', '3', 'Full', 'Unlimited access to protected areas', '19.99', '1', 'Y', '1');
INSERT INTO `rates` VALUES ('10', '5', 'monthly', 'monthly gold', '50', '30', 'D', '1');
INSERT INTO `rates` VALUES ('11', '4', 'year', 'year bronzes', '500', '1', 'Y', '1');
INSERT INTO `settings` VALUES ('Confor.ca', 'Video conference', 'http://conferences-formations.com/pay', 'site keywords,separated,by,coma', 'Meta Description', 'info@confor.ca', 'tham21_1278651451_biz@yahoo.com', '0', '1', '1', '0', 'USD', '$', '1', 'v.1.0');
INSERT INTO `tblaccessories` VALUES ('1', 'About', '<p>Nous sommes:</p>\n<p>- Une agence de conf&eacute;renciers international</p>\n<p>- Une agence pour formateurs</p>\n<p>- Une WebTV</p>\n<p>- Location de studio vid&eacute;o HD</p>\n<p>- Studio de montage vid&eacute;o HD</p>\n<p>- Studio d\'enregistrement audio</p>\n<p>&nbsp;</p>\n<p><span style=\"font-family: Verdana; \">Groupe Confor formations &amp; conf&eacute;rences inc. <br />\n110 Notre-Dame Est <br />\nThetford Mines, Qu&eacute;bec, Canada<br />\nG6G 2J8<br />\n1-418-622-2000 poste 130<br />\n1-877-523-8647 poste 130<br />\ninfo@confor.ca<br />\n</span></p>');
INSERT INTO `tblaccessories` VALUES ('2', 'How', null);
INSERT INTO `tblaccessories` VALUES ('3', 'Rules', '<p>test the rules</p>');
INSERT INTO `tblaccessories` VALUES ('4', 'Training', '<p>test training</p>');
INSERT INTO `tblaccessories` VALUES ('5', 'Office', '<p><span style=\"font-size: small\"><span style=\"font-family: Arial\"><a href=\"http://conferences-formations.com/index.php/blog/blog_content_admin/admin/Conf&eacute;rence%20du%20Commandant%20Pich&eacute;\"><font size=\"5\">Commandant Robert Pich&eacute;</font><font size=\"2\"> </font></a></span></span></p>\n<p><span style=\"font-size: small\"><span style=\"font-family: Arial\">Quand l\'impossible devient r&eacute;alit&eacute;!</span> </span></p>\n<p>&nbsp;</p>\n<p><font size=\"5\"><a href=\"http://conferences-formations.com/index.php/blog/blog_content_admin/admin/Conf&eacute;rence%20George%20Wright#\">George Wright</a></font></p>\n<p><span style=\"font-size: small\"><span style=\"font-family: Arial\">La communication en milieu de travail...</span></span></p>\n<p>&nbsp;</p>');
INSERT INTO `tbladmin` VALUES ('9', 'Quyet', 'Dao Van', 'daovanquyet@xemmex.net', 'daovanquyet@paypal.com', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tbladmin` VALUES ('8', 'admin', 'site admin', 'admin@confor.ca', 'admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `tbladmin` VALUES ('10', 'normal_admin', 'normal_admin', 'normal_admin@confor.ca', 'normal_admin@confor.ca', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tbladvertisement` VALUES ('29', '2010-07-07', '2010-08-31', 'Confor.ca Ad', 'admin@confor.ca', 'http://conferences-formations.com/index.php/contact', 'Annoncez-vous chez Confor.ca', 'confor_ad_285x285.jpg');
INSERT INTO `tbladvertisement` VALUES ('31', '2010-07-08', '2010-09-30', 'Vaincre la peur en avion', 'admin@confor.ca', 'http://conferences-formations.com/index.php/blog/blog_content/admin/Atelier', 'Atelier - Vaincre la peur en avion!', 'peur_ad_285x285.jpg');
INSERT INTO `tblblog` VALUES ('3', '2010-07-08', '8', 'J\'étais présent lors de la conférence du Commandant Robert Piché, de Florence Béliard et de George Wright.  Cette conférence a eu lieu à Candiac et le sujet était la peur en avion.  Ils ont donné des trucs pour aider les gens qui avaient peur en avion.  Voici un article qui a paru dans le journal de Candiac.', 'Conférence Commandant Piché - Peur en avion', 'Le commandant Piché attire les foules', 'commandant Piché peur avion', '<p style=\"text-align: justify;\"><span style=\"font-family: Arial; \"><span style=\"font-size: medium; \">Le commandant Pich&eacute; attire les foules<br />\nDenyse B&eacute;gin</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-family: Arial; \"><span style=\"font-size: medium; \"><br />\nLe Reflet - 19 mars 2010<br />\nDivers &gt; Divers</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-family: Arial; \"><span style=\"font-size: medium; \"><br />\nCANDIAC - La pr&eacute;sence du commandant Robert Pich&eacute; &agrave; Candiac le 9 mars a piqu&eacute; la curiosit&eacute; de 165 personnes venues l\'entendre parler de la peur de l\'avion.<br />\nLes participants ont eu des frissons dans le dos en d&eacute;but de soir&eacute;e en &eacute;coutant une courte vid&eacute;o qui reconstituait l\'atterrissage d\'urgence du vol 236 qu\'il pilotait. Ils ont pu mesurer l\'ampleur de l\'exploit accompli par le pilote d\'Air Transat en 2001.<br />\nLors de sa conf&eacute;rence, accompagn&eacute; des th&eacute;rapeutes George Wright et Florence B&eacute;liard, il a tent&eacute; de rassurer les gens &agrave; propos de la s&eacute;curit&eacute; dans les avions. Il a expliqu&eacute; que les avions sont inspect&eacute;s avant leur d&eacute;collage et que les membres de l\'&eacute;quipage se pr&eacute;parent minutieusement. Rien n\'est laiss&eacute; au hasard. En plus, au Qu&eacute;bec, nous apprenons notre m&eacute;tier dans des conditions difficiles et, deux fois par ann&eacute;e, notre licence de pilote est remise en jeu lors de tests avec un simulateur de vol&eacute;, a-t-il fait valoir. De leur c&ocirc;t&eacute;, les th&eacute;rapeutes ont d&eacute;crit bri&egrave;vement le fonctionnement du cerveau en expliquant pourquoi des traumatismes enfouis causent parfois des peurs incontr&ocirc;lables des ann&eacute;es plus tard.</span></span></p>', 'XCzF1gKmsQY3sGI2.jpg', '60', '0');
INSERT INTO `tblblog` VALUES ('6', '2010-07-09', '8', 'Voici un extrait du livre de Mme Nicole Dumont qui en plus d\'être auteure, elle est formatrice et conférencière.', 'Dire adieu aux illusions', 'Extrait du livre: Dire adieu aux illusions', 'Nicole Dumont conférencière auteure', '<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">LA PERSONNALIT&Eacute; AU SERVICE DE L&rsquo;&Ecirc;TRE<br />\n&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Une des grandes illusions de l&rsquo;&ecirc;tre humain a &eacute;t&eacute; de croire que son identit&eacute; &eacute;tait confin&eacute;e &agrave; sa personnalit&eacute;. Il y a eu confusion entre le v&eacute;hicule et le voyageur. La r&eacute;alit&eacute;, c&rsquo;est que le voyageur, l&rsquo;&ecirc;tre, utilise le v&eacute;hicule, c&rsquo;est-&agrave;-dire le corps et la personnalit&eacute;, pour se rendre &agrave; la destination qu&rsquo;il a choisie. Mettre la personnalit&eacute; au service de l&rsquo;&acirc;me est une attitude &agrave; d&eacute;velopper dans chaque sph&egrave;re de sa vie. L&rsquo;&acirc;me conna&icirc;t son &laquo; terminus &raquo; et conna&icirc;t le bien fond&eacute; de chacune de ses exp&eacute;riences. D&egrave;s que la personnalit&eacute; s&rsquo;isole de l&rsquo;&acirc;me et poursuit des buts personnels, une &eacute;norme tension est cr&eacute;&eacute;e, car elle n&rsquo;a pas acc&egrave;s &agrave; l&rsquo;intelligence du c&oelig;ur et &agrave; la conscience du but poursuivi. Devant une telle absence de moyens, pas &eacute;tonnant que l&rsquo;anxi&eacute;t&eacute; soit au rendez-vous !</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Sans nous &eacute;tendre sur les raisons qui ont provoqu&eacute; cette scission, attardons-nous plut&ocirc;t aux moyens &agrave; prendre pour r&eacute;tablir la communication.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&nbsp;J&rsquo;ai observ&eacute; une constante chez les personnes qui requi&egrave;rent mes services en consultation : elles ont perdu le contact avec leur &ecirc;tre profond, leur raison d&rsquo;&ecirc;tre. Ce ph&eacute;nom&egrave;ne occasionne des &eacute;tats de stress, de crise, de maladie, de d&eacute;pression, souvent d&eacute;clench&eacute;s par des &eacute;v&eacute;nements de perte, de d&eacute;fis ou de grands changements. Comprenons que c&rsquo;est l&rsquo;&acirc;me dans son besoin de gu&eacute;rir ou d&rsquo;&eacute;quilibrer un aspect de la personne qui attire &agrave; elle les circonstances d&eacute;stabilisantes, car elle poursuit toujours son but. Elle commence par attirer des situations o&ugrave; l&rsquo;apprentissage peut se faire en douceur.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Tant que la le&ccedil;on n&rsquo;est pas comprise et que la gu&eacute;rison int&eacute;rieure n&rsquo;a pas &eacute;t&eacute; compl&eacute;t&eacute;e,&nbsp;l&rsquo;&acirc;me inlassablement, sans aucune forme de jugement ni d&rsquo;impatience,&nbsp;magn&eacute;tise des circonstances propices aux prises de conscience.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Celles-ci sont per&ccedil;ues comme des &eacute;preuves par la personnalit&eacute; et les dites &eacute;preuves vont toujours en amplifiant, jusqu&rsquo;&agrave; l&rsquo;int&eacute;gration de chaque prise de conscience. Nous avons donc tout avantage &agrave; nous questionner chaque fois que nous nous retrouvons dans une situation jug&eacute;e d&eacute;sagr&eacute;able, car celles-ci semblent s&rsquo;empiler comme les devoirs d&rsquo;&eacute;coliers laiss&eacute;s en plan.&nbsp; Les &eacute;preuves sont des occasions par excellence pour s&rsquo;arr&ecirc;ter, s&rsquo;int&eacute;rioriser et observer. Mais au d&eacute;but, c&rsquo;est le choc ; la r&eacute;volte et l&rsquo;impuissance nous envahissent. Comme nous avons appris &agrave; chercher les causes &agrave; l&rsquo;ext&eacute;rieur, nous perdons un temps pr&eacute;cieux dans des d&eacute;marches de toutes sortes, esp&eacute;rant trouver la solution miracle, la cure miracle, la personne miracle qui nous sortira de notre cauchemar.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Prendre le d&eacute;clencheur pour la cause, non seulement nous garde dans l&rsquo;illusion, mais nous garde dans l&rsquo;impuissance et la souffrance.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nous poss&eacute;dons en nous la force n&eacute;cessaire pour assumer&nbsp;ce que nous avons inconsciemment cr&eacute;&eacute;.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Encore faut-il admettre cet &eacute;nonc&eacute;. J&rsquo;ai vu bien des gens r&eacute;sister &agrave; cette approche, au point d&rsquo;augmenter grandement leur &eacute;tat de souffrance. On dit que les &eacute;preuves font grandir. Cela est vrai dans la mesure o&ugrave; la personne s&rsquo;ouvre &agrave; transformer certaines attitudes. D&egrave;s que l&rsquo;on comprend que les &eacute;preuves ne nous sont pas envoy&eacute;es de l&rsquo;ext&eacute;rieur, mais qu&rsquo;elles sont en r&eacute;sonance avec les aspects de nous qui cherchent &agrave; s&rsquo;&eacute;quilibrer, alors une ouverture se cr&eacute;e et la personnalit&eacute; cesse de r&eacute;sister au d&eacute;sir de gu&eacute;rison de l&rsquo;&acirc;me. Une fois l&rsquo;&eacute;tat de choc pass&eacute; et les frustrations amadou&eacute;es, on peut amorcer l&rsquo;&eacute;tape de la gu&eacute;rison int&eacute;rieure.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nous savons que pour gu&eacute;rir, il faut soigner. Nous avons appris &agrave; le faire avec le corps physique. Mais qu&rsquo;en est-il des maux de l&rsquo;&acirc;me, le mal de vivre, l&rsquo;ins&eacute;curit&eacute;, la peur et la souffrance pour ne nommer que ceux-l&agrave;. N&rsquo;ont-ils pas aussi un grand besoin d&rsquo;&ecirc;tre soign&eacute;s ?&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Prendre conscience que son &ecirc;tre a besoin de soins r&eacute;tablit aussit&ocirc;t le contact entre l&rsquo;&acirc;me et la personnalit&eacute;.&nbsp; Il y a un l&acirc;cher prise qui s&rsquo;op&egrave;re : &laquo; Bon, d&rsquo;accord, j&rsquo;admets que j&rsquo;ai besoin de m&rsquo;arr&ecirc;ter, de prendre soin de moi. &raquo;&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ce qui est &eacute;vident dans le cas du corps physique l&rsquo;est beaucoup moins lorsqu&rsquo;il s&rsquo;agit d&rsquo;un&nbsp; mal int&eacute;rieur. Il est plus facile de suivre &agrave; la lettre un r&eacute;gime pour faire baisser le taux de sucre ou de cholest&eacute;rol que de savoir de quoi l&rsquo;&acirc;me a besoin pour s&rsquo;unifier. Le m&eacute;decin qui prescrit un r&eacute;gime ou une p&eacute;riode de repos se base sur les sympt&ocirc;mes du corps physique. Le m&eacute;decin de l&rsquo;&acirc;me, quant &agrave; lui, se base sur les sympt&ocirc;mes subtils du mal-&ecirc;tre. Et une fois que ce mal a &eacute;t&eacute; d&eacute;tect&eacute; et cibl&eacute;, nous pouvons faire appel &agrave; notre th&eacute;rapeute int&eacute;rieur pour prodiguer les soins les plus appropri&eacute;s. Chaque &ecirc;tre humain poss&egrave;de en lui les cl&eacute;s de sa gu&eacute;rison. S&rsquo;il est vrai que notre vie est le r&eacute;sultat de nos croyances, en voici une &agrave; cultiver pr&eacute;cieusement. Bien s&ucirc;r, cet &eacute;nonc&eacute; n&rsquo;est pas une nouveaut&eacute;, mais nous avons besoin de trouver comment le mettre en pratique au quotidien.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Pr&eacute;cisons d&rsquo;abord qu&rsquo;il n&rsquo;existe aucune &laquo; recette &raquo; universelle, car chaque personne est unique. Disons que nous poss&eacute;dons tous les m&ecirc;mes composantes de base, organis&eacute;es diff&eacute;remment. De ce fait, il existe autant d&rsquo;approches qu&rsquo;il y a d&rsquo;&ecirc;tres humains et par cons&eacute;quent, un grand nombre de &laquo; v&eacute;rit&eacute;s &raquo; aussi valables les unes que les autres. Pour acc&eacute;der &agrave; sa propre v&eacute;rit&eacute;, il suffit de porter attention &agrave; ce que l&rsquo;on ressent. Comme le ressenti n&rsquo;est pas connect&eacute; au rationnel, la seule mani&egrave;re de l&rsquo;aborder est de le laisser &ecirc;tre et de l&rsquo;observer.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le ressenti contient toute l&rsquo;information nous permettant de conna&icirc;tre&nbsp;nos besoins r&eacute;els et d&rsquo;en prendre soin.&nbsp;Voyons de plus pr&egrave;s au moyen de quelques exemples.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Au travail, Suzanne vit une p&eacute;riode tr&egrave;s occup&eacute;e et cela lui occasionne du stress. Elle sent que la pression monte de plus en plus et elle commence &agrave; ne plus avoir envie d&rsquo;aller travailler lorsqu&rsquo;elle se r&eacute;veille le matin. Elle pousse souvent de longs soupirs lorsqu&rsquo;elle est seule; elle se sent parfois agressive ou impatiente pour des v&eacute;tilles.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ce genre de situation est &eacute;videmment tr&egrave;s courante et de ce fait on serait port&eacute; &agrave; penser qu&rsquo;elle est anodine. Cependant, elle pourrait ais&eacute;ment conduire &agrave; un burn-out si Suzanne ne tenait pas compte de ce qu&rsquo;elle ressent, se croyant coinc&eacute;e et oblig&eacute;e de performer. Si une telle croyance l&rsquo;habite, une coll&egrave;gue lui fera peut-&ecirc;tre remarquer qu&rsquo;elle est trop douillette, lui refl&eacute;tant ainsi sa propre croyance. Ici, les sympt&ocirc;mes sont &agrave; la fois physiques et comportementaux. Le corps autant que la psych&eacute; envoient des signaux d&rsquo;alarme. Bien entendu, quand ils sont ignor&eacute;s, les signaux passeront de l&rsquo;alarme &agrave; la d&eacute;tresse et &agrave; un moment, le corps ou les nerfs craqueront. Le seuil de tol&eacute;rance au stress est tr&egrave;s variable d&rsquo;une personne &agrave; l&rsquo;autre et il y a bien autre chose que le syst&egrave;me nerveux en cause.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Supposons que Suzanne ait toujours cru qu&rsquo;elle devait faire le maximum pour &ecirc;tre appr&eacute;ci&eacute;e, la tension sera plus forte chez elle que chez une autre personne qui se sent aim&eacute;e telle qu&rsquo;elle est. De m&ecirc;me la tension montera encore plus si elle a peur de faire des erreurs ou de ne pas &ecirc;tre &agrave; la hauteur du d&eacute;fi qui est devant elle. Ajoutons &agrave; cela une relation plus ou moins saine avec son patron et nous obtenons une belle brochette de &laquo; dossiers &raquo; personnels &agrave; r&eacute;gler par le biais d&rsquo;une circonstance qui se pr&eacute;sente en milieu de travail.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Voyons maintenant vers quelles pistes l&rsquo;observation des sympt&ocirc;mes pourrait nous conduire.&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">1)&nbsp;&nbsp;&nbsp;&nbsp; La perte d&rsquo;envie d&rsquo;aller au travail se classe parmi les sympt&ocirc;mes que nous appellerons : absence de joie de vivre. Voil&agrave; un signe &agrave; prendre au s&eacute;rieux, car la joie de vivre est l&rsquo;&eacute;tat naturel d&rsquo;un &ecirc;tre humain en sant&eacute;. Nous la perdons lorsque nous sentons une pression soutenue qui occasionne stress et ins&eacute;curit&eacute;. Quel pouvoir avons-nous alors sur la pression qui s&rsquo;exerce sur nous ? Le m&ecirc;me pouvoir que nous avons d&rsquo;ouvrir ou non lorsqu&rsquo;on sonne &agrave; sa porte ! N&rsquo;est-ce pas notre privil&egrave;ge de laisser enter qui nous voulons ? Alors si nous sentons une pression venant de l&rsquo;ext&eacute;rieur, est-ce &agrave; dire que nous avons, consciemment ou non, permis qu&rsquo;elle s&rsquo;exerce, ou &agrave; tout le moins que nous n&rsquo;avons rien emp&ecirc;ch&eacute; ? Les sympt&ocirc;mes d&rsquo;inconfort cr&eacute;&eacute;s par une telle attitude nous invitent &agrave; un ajustement en vue de retrouver un &eacute;quilibre. Si nous avons la responsabilit&eacute; d&rsquo;avoir laiss&eacute; entrer quelqu&rsquo;un, n&rsquo;avons-nous pas aussi celle de l&rsquo;inviter &agrave; sortir. Car enfin, on ne peut bl&acirc;mer quiconque d&rsquo;&ecirc;tre entr&eacute; lorsqu&rsquo;une porte &eacute;tait ouverte ! Et si personne d&rsquo;ext&eacute;rieur n&rsquo;&eacute;tait en cause, impliquant que toute la pression viendrait de l&rsquo;int&eacute;rieur ! Ce ph&eacute;nom&egrave;ne, pourtant tr&egrave;s r&eacute;pandu, est rarement conscientis&eacute;. Il est caus&eacute; par une faible estime de soi, qui porte la personne &agrave; exiger d&rsquo;elle-m&ecirc;me la perfection, croyant qu&rsquo;elle ne sera plus appr&eacute;ci&eacute;e si elle fait des erreurs. Dans la plupart des cas, le v&eacute;cu de l&rsquo;enfance a confirm&eacute; et cristallis&eacute; un manque de confiance apport&eacute; par l&rsquo;&acirc;me &agrave; la naissance. D&eacute;velopper la confiance en soi est pour bien des gens un d&eacute;fi majeur. C&rsquo;est pourquoi il n&rsquo;est pas surprenant de voir leur vie jalonn&eacute;e de situations o&ugrave; d&rsquo;autres personnes semblent ne pas leur faire confiance. Ce reflet de leur propre manque de confiance peut leur servir d&rsquo;indice pour v&eacute;rifier o&ugrave; ils en sont dans cet apprentissage. En d&eacute;finitive, les critiques et les pressions ext&eacute;rieures sont le signe d&rsquo;une critique et d&rsquo;une pression int&eacute;rieure correspondante. Admette cela permet de rependre les rennes de sa vie et fait fondre l&rsquo;illusion.&nbsp;&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">2)&nbsp;&nbsp;&nbsp; Le fait de pousser de longs soupirs&nbsp; est le signe qu&rsquo;on se languit de quelque chose. Vous aurez peut-&ecirc;tre devin&eacute; que ce sont les soupirs de l&rsquo;&acirc;me ; mais de quoi se languit-elle ? Elle attend sans doute le moment o&ugrave; la personne comprendra qu&rsquo;elle n&rsquo;a pas besoin d&rsquo;&ecirc;tre autre chose que ce qu&rsquo;elle est pour &ecirc;tre heureuse et en harmonie. Une vieille histoire orientale raconte qu&rsquo;un sage avait utilis&eacute; la nature pour faire comprendre cette notion &agrave; ses disciples. Il disait : &laquo; Regardez ces deux arbres qui vivent c&ocirc;te &agrave; c&ocirc;te dans mon jardin. L&rsquo;un est grand et fort, l&rsquo;autre est petit et souple. Semblent-ils se nuire ? Non, au contraire, ils ont l&rsquo;air d&rsquo;&ecirc;tre en parfaite harmonie. Chacun honore le divin en &eacute;tant ce qu&rsquo;il est. Et si le divin vous a cr&eacute;&eacute;s comme vous &ecirc;tes, c&rsquo;est parce que la vie a besoin de vous tels que vous &ecirc;tes. S&rsquo;il avait voulu des bouddhas, Dieu en aurait cr&eacute;&eacute; des centaines, mais il vous a cr&eacute;&eacute; vous ! Alors pourquoi voulez-vous &ecirc;tre autre chose ? Vous ne trouverez jamais l&rsquo;harmonie ainsi. &raquo;[1]&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">3)&nbsp; La plupart du temps, les mouvements d&rsquo;impatience ou d&rsquo;agressivit&eacute; sont d&eacute;clench&eacute;s par un &eacute;l&eacute;ment qui n&rsquo;a rien &agrave; voir avec la v&eacute;ritable source d&rsquo;un malaise. Nous avons eu un entra&icirc;nement si efficace &agrave; taire nos r&eacute;actions et nos &eacute;motions que nous en avons graduellement perdu le contact. Les sautes d&rsquo;humeurs sont provoqu&eacute;es par nos &eacute;tats de frustration. Pour les enrayer, rien ne sert d&rsquo;essayer de se contr&ocirc;ler et de jouer les gentils ! Cela n&rsquo;en sera que pire. Les sautes d&rsquo;humeur sont comparables &agrave; un avertisseur de fum&eacute;e : il d&eacute;clenche seulement lorsqu&rsquo;il y a une cause de fum&eacute;e. S&rsquo;il y a un d&eacute;but d&rsquo;incendie, on s&rsquo;affairera d&rsquo;abord &agrave; l&rsquo;enrayer plut&ocirc;t qu&rsquo;&agrave; faire taire l&rsquo;avertisseur. Pourquoi n&rsquo;est-ce pas aussi &eacute;vident lorsqu&rsquo;il s&rsquo;agit de notre r&eacute;alit&eacute; int&eacute;rieure ? Notre avertisseur fait pourtant bien son travail. Il attire notre attention par des sympt&ocirc;mes lorsque nous ne respectons pas nos limites et que nous nous traitons sans m&eacute;nagement. Tout probl&egrave;me non trait&eacute; finit par s&rsquo;envenimer, c&rsquo;est bien connu. Il en est ainsi de notre sant&eacute;, de notre bien-&ecirc;tre int&eacute;rieur et de nos relations. Tr&egrave;s rarement un probl&egrave;me, une maladie, se pr&eacute;sentera comme grave au d&eacute;but. C&rsquo;est &agrave; force d&rsquo;ignorer les sympt&ocirc;mes qu&rsquo;une situation amplifie et s&rsquo;envenime. C&rsquo;est souvent au moment o&ugrave; un inconfort devient insupportable que l&rsquo;on r&eacute;agit. Comme il serait moins souffrant d&rsquo;&ecirc;tre attentifs &agrave; tous ces petits signes et de les traiter &agrave; mesure qu&rsquo;ils se pr&eacute;sentent ! &Agrave; tout moment nous pouvons choisir de simplifier notre vie en mettant notre bien-&ecirc;tre en priorit&eacute;.&nbsp; On pourrait objecter : &laquo; Mais il me semble pourtant avoir tour fait pour r&eacute;gler ce probl&egrave;me ! Pourquoi ma situation continue-t-elle d&rsquo;empirer ? &raquo; Faire, est-ce toujours la solution ? Le non faire, l&rsquo;observation et le silence sont parfois les meilleurs atouts pour d&eacute;tecter la v&eacute;ritable source d&rsquo;un probl&egrave;me. Nous nous attaquons trop souvent aux sympt&ocirc;mes, alors que ceux-ci cachent une r&eacute;alit&eacute; que l&rsquo;intuition pourrait capter. Si une situation d&eacute;sagr&eacute;able perdure apr&egrave;s que l&rsquo;on ait tout fait pour y rem&eacute;dier, il est logique d&rsquo;en d&eacute;duire que la v&eacute;ritable source du probl&egrave;me n&rsquo;a pas encore &eacute;t&eacute; d&eacute;couverte. Poursuivons avec un deuxi&egrave;me exemple :</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">--------------------------------------------------------------------------------</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">[1] Inspir&eacute; du Tarot de Rajneesh, Ed. Le Voyage Int&eacute;rieur, 1991</span></span></p>', 'I5iQPKFDgqdpPA17.jpg', '16', '0');
INSERT INTO `tblblog` VALUES ('5', '2010-07-09', '8', 'Voici un extrait du livre de Mme Nicole Dumont qui en plus d\'être auteure, elle est formatrice et conférencière.', 'Extrait du livre de Mme Nicole Dumont', 'Ô Miroirs, Dites-Moi', 'conférencière auteure livre formatrice', '<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">LE MIROIR GUIDE D&rsquo;UTILISATION</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Rares sont les personnes qui n&rsquo;utilisent pas quotidiennement un miroir pour se regarder, ne serait-ce que quelques secondes. La plupart d&rsquo;entre nous le consid&eacute;rons comme un objet indispensable. Je n&rsquo;ai encore rencontr&eacute; personne qui ne sache comment l&rsquo;utiliser. Si on veut se voir, il faut le placer en face de soi, cela tombe sous le sens. On sait tr&egrave;s bien que le tenir en face d&rsquo;une autre personne fera que ce sera elle qui se verra. Cela est tellement simple et pourtant nous passons si souvent &agrave; c&ocirc;t&eacute; de l&rsquo;&eacute;vidence.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le miroir, qui nous servira &agrave; regarder l&rsquo;int&eacute;rieur, s&rsquo;utilise exactement de la m&ecirc;me mani&egrave;re que celui qui nous est familier. Il part du principe que tout ce qui nous entoure, je dis bien tout, peut servir de reflet &agrave; notre r&eacute;alit&eacute; : que ce soit une personne, un &eacute;v&eacute;nement, une maladie, une situation de vie, une co&iuml;ncidence, TOUT.<br />\nAfin de bien saisir cette affirmation, le mental a besoin de s&rsquo;ouvrir &agrave; la dimension intangible, <br />\nspirituelle, cosmique de l&rsquo;&Ecirc;tre.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Au plan invisible, notre champ magn&eacute;tique &eacute;met des ondes et en capte d&rsquo;autres. Naturellement les fr&eacute;quences varient selon les personnes. Ce que nous &eacute;mettons inconsciemment est capt&eacute;, consciemment ou non, par les &ecirc;tres qui sont en r&eacute;sonance vibratoire avec nous. La sagesse populaire le dit &agrave; sa mani&egrave;re : &ldquo; Qui se ressemble s&rsquo;assemble. &rdquo; &ldquo;Dis-moi qui tu fr&eacute;quentes et je te dirai qui tu es &rdquo; &ldquo; Les contraires s&rsquo;attirent. &rdquo; On dit qu&rsquo;il est impossible de reconna&icirc;tre en l&rsquo;autre ce que l&rsquo;on n&rsquo;a pas en soi. D&eacute;j&agrave; on a tendance &agrave; protester et &agrave; trouver des exemples o&ugrave; cela ne peut s&rsquo;appliquer : &ldquo; Ce n&rsquo;est pas parce que je sais tout de suite quand on me ment que je &ldquo;suis &rdquo; moi-m&ecirc;me un menteur ! &rdquo; Je l&rsquo;avoue tout cela semble tr&egrave;s charri&eacute; &agrave; prime abord.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">En tant qu&rsquo;&ecirc;tre libres, nous cr&eacute;ons chaque jour notre r&eacute;alit&eacute;, que nous en soyons conscients ou non.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Notre &eacute;nergie attire magn&eacute;tiquement &agrave; elle tout ce qui refl&egrave;te sa propre r&eacute;alit&eacute;. Ce ph&eacute;nom&egrave;ne, aussi banal qu&rsquo;un regard &agrave; son miroir, nous permet de nous regarder, de voir de quoi nous sommes faits et d&rsquo;apprendre &agrave; vivre avec...</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Pour moi, la vie est comme une grande &eacute;cole, que je baptiserais l&rsquo;&eacute;cole du souvenir, consid&eacute;rant le fait que l&rsquo;&acirc;me sait d&eacute;j&agrave;. L&agrave;, il y a des enseignants pour toute chose que l&rsquo;on souhaite apprendre. Au plan inconscient, toute &acirc;me qui vive se trouve &agrave; enseigner &agrave; son entourage, simplement par ce qu&rsquo;elle EST. L&agrave; o&ugrave; l&rsquo;enseignement diff&egrave;re consid&eacute;rablement d&rsquo;une &eacute;cole ordinaire, c&rsquo;est que l&rsquo;&eacute;l&egrave;ve est le meneur et non l&rsquo;enseignant. C&rsquo;est une &eacute;cole alternative o&ugrave; l&rsquo;&eacute;l&egrave;ve &acirc;me choisit elle-m&ecirc;me les apprentissages qu&rsquo;elle veut faire ; elle utilise alors la personne ou la situation qui est devant elle comme une R&Eacute;FLEXION qui lui renvoie sa propre image. Servons-nous d&rsquo;une analogie emprunt&eacute;e &agrave; l&rsquo;informatique. L&rsquo;&eacute;l&egrave;ve &acirc;me entre la donn&eacute;e ext&eacute;rieure dans son ordinateur et se met &agrave; la recherche de la programmation correspondante dans son propre syst&egrave;me. Une fois identifi&eacute;e, elle v&eacute;rifie si celle-ci est positive ou n&eacute;gative. Dans le dernier cas, elle notera souvent l&rsquo;ing&eacute;rence d&rsquo;un virus (un emp&ecirc;chement de fonctionner) et cherchera &agrave; &eacute;liminer cette programmation pour rendre &agrave; son appareil sa performance originale. Dans la vie courante le mot programmation r&eacute;f&egrave;re aux valeurs apprises et aux croyances qui en ont d&eacute;coul&eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Illustrons &agrave; l&rsquo;aide d&rsquo;un exemple pour chacun des types de donn&eacute;es.<br />\nDONN&Eacute;E POSITIVE<br />\nJ&rsquo;admire les personnes qui ont la capacit&eacute; d&rsquo;exprimer facilement et simplement leurs &eacute;motions. Bien des gens n&rsquo;auront jamais l&rsquo;id&eacute;e d&rsquo;admirer quelqu&rsquo;un pour une telle raison. Je remarque cette caract&eacute;ristique chez les autres parce que j&rsquo;ai besoin de reconna&icirc;tre qu&rsquo;elle est aussi en moi, du moins potentiellement, car il y a de bonnes chances que je me croie loin de cette capacit&eacute;. J&rsquo;ai besoin de regarder vivre les personnes qui le manifestent naturellement pour apprendre comment y arriver. Je choisis d&rsquo;utiliser ces personnes comme enseignantes ou mod&egrave;les quand je prends conscience de mon potentiel &agrave; d&eacute;velopper.<br />\nJ&rsquo;aurai sans doute &agrave; &eacute;liminer la croyance erron&eacute;e qui dit que je suis incapable d&rsquo;exprimer facilement mes &eacute;motions.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">DONN&Eacute;E N&Eacute;GATIVE<br />\nAu travail, j&rsquo;ai du mal &agrave; supporter une personne parce qu&rsquo;elle prend trop de place, parle fort et fait tout pour obtenir l&rsquo;estime des patrons. Par contre ma compagne de bureau s&rsquo;entend tr&egrave;s bien avec cette personne. Qu&rsquo;y a-t-il en elle qui me d&eacute;range tant ? Je peux juger qu&rsquo;elle prend trop de place pour deux raisons oppos&eacute;es : ou bien je me juge chaque fois que j&rsquo;ose prendre ma place ; ou bien je n&rsquo;ose prendre la mienne et ceux qui le font d&rsquo;une fa&ccedil;on voyante me servent de r&eacute;veille- matin pour me dire : &ldquo; C&rsquo;est l&rsquo;heure de prendre ta place, &agrave; ta mani&egrave;re. &rdquo;.<br />\nIci je devrai &eacute;liminer la programmation qui me fait juger ceux qui prennent leur place.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Comme je l&rsquo;ai d&eacute;j&agrave; mentionn&eacute;, les enseignants de ces deux exemples ne sont sans doute pas conscients de la le&ccedil;on qu&rsquo;ils donnent.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Les d&eacute;clencheurs de nos r&eacute;actions n&rsquo;ont nul besoin d&rsquo;&ecirc;tre conscients que nous les utilisons comme miroirs pour notre &eacute;volution.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Avec les miroirs positifs, on apprend en suivant leur exemple et en reconnaissant qu&rsquo;on porte en soi les m&ecirc;mes qualit&eacute;s. Avec les miroirs n&eacute;gatifs, on apprend en admettant qu&rsquo;on porte en soi un aspect qui ressemble &agrave; ce qu&rsquo;on juge n&eacute;gativement chez les autres. Je pr&eacute;cise qu&rsquo;il est vain d&rsquo;essayer de changer cet aspect si on ne l&rsquo;a pas d&rsquo;abord accept&eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Les miroirs n&eacute;gatifs, sont les plus difficiles &agrave; g&eacute;rer, car notre r&eacute;sistance &agrave; reconna&icirc;tre en nous les d&eacute;fauts qui nous agacent chez les autres est en g&eacute;n&eacute;ral tr&egrave;s forte. C&rsquo;est pourquoi ils feront en grande partie l&rsquo;objet de cet ouvrage.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">A propos des reflets positifs, je dirai pour l&rsquo;instant que nous r&eacute;sistons aussi parfois &agrave; les admettre car de reconna&icirc;tre son talent ou la noblesse de sa nature peut faire &eacute;merger des peurs ; les plus courantes sont la peur de ne pas &ecirc;tre &agrave; la hauteur, la peur d&rsquo;&ecirc;tre jug&eacute; et la peur d&rsquo;&eacute;chouer. Voici une fa&ccedil;on de v&eacute;rifier si l&rsquo;on reconna&icirc;t ses propres qualit&eacute;s :<br />\nComment r&eacute;agissons-nous aux compliments que les autres nous font spontan&eacute;ment ?<br />\nCelui ou celle qui reconna&icirc;t sa valeur &agrave; travers un compliment dira simplement &ldquo;merci &rdquo;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le facteur qui d&eacute;termine si nous avons affaire &agrave; une situation miroir, c&rsquo;est notre r&eacute;action. D&egrave;s que quelqu&rsquo;un ou quelque chose nous affecte, il y a r&eacute;sonance avec une r&eacute;sistance &agrave; l&rsquo;int&eacute;rieur de nous.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Toute r&eacute;sistance, qu&rsquo;elle soit face &agrave; l&rsquo;ombre ou &agrave; la lumi&egrave;re, a pour effet de bloquer la libre circulation de notre &eacute;nergie.<br />\nLa r&eacute;sistance vient du jugement. Si nous &eacute;tions neutres face aux &eacute;v&eacute;nements de la vie, nous ne nous demanderions pas si une chose est bien ou mal. Nous approcherions tout en tant qu&rsquo;exp&eacute;rience. De plus, nous serions d&eacute;tach&eacute;s de ce que les autres font ou disent, car nous serions conscients qu&rsquo;ils sont comme nous en train d&rsquo;exp&eacute;rimenter pour apprendre.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Plusieurs d&rsquo;entre nous avons un regard per&ccedil;ant lorsqu&rsquo;il s&rsquo;agit de voir dans le jardin des voisins. Cette caract&eacute;ristique est utilis&eacute;e de fa&ccedil;on malsaine quand nous nous en servons pour dire aux autres leurs quatre v&eacute;rit&eacute;s et pour les critiquer. C&rsquo;est ce que j&rsquo;appelle &ldquo;tenir son miroir &agrave; l&rsquo;envers &rdquo;. Le message plus ou moins subtil envoy&eacute; &agrave; l&rsquo;interlocuteur est alors : &ldquo; Tu ne t&rsquo;es pas vu ! &rdquo; ou &ldquo;regarde-toi donc ! &rdquo; Je ne connais personne qui r&eacute;agisse bien &agrave; ce type d&rsquo;intervention, encore moins quelqu&rsquo;un qui se sente stimul&eacute; &agrave; changer sous son effet. Au contraire, nous nous fermons d&egrave;s qu&rsquo;un autre tente de nous faire changer d&rsquo;avis ou de corriger nos fa&ccedil;ons d&rsquo;agir. Nous n&rsquo;aimons pas nous faire imposer notre rythme de croissance, car cela entrave notre libre arbitre.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">J&rsquo;ai toujours excell&eacute; &agrave; voir tr&egrave;s clairement ce qui se passe pour les autres. Avoir un &oelig;il de lynx est un cadeau de la vie, et s&rsquo;en servir pour prendre les autres en d&eacute;faut revient &agrave; le donner aux autres en oubliant d&rsquo;en profiter pour soi-m&ecirc;me. Tout outil ou cadeau nous est d&rsquo;abord donn&eacute; pour notre propre &eacute;volution. Pour ma part, j&rsquo;utilise maintenant &agrave; profit ma capacit&eacute; &agrave; voir la r&eacute;alit&eacute; de l&rsquo;autre dans mon travail de th&eacute;rapeute. Mais j&rsquo;ai appris &agrave; mes d&eacute;pens que bien mal venu est celui qui donne conseil ou avis alors qu&rsquo;il n&rsquo;a pas &eacute;t&eacute; demand&eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">On ne peut s&rsquo;emp&ecirc;cher de voir ce que l&rsquo;on voit.<br />\nUne fa&ccedil;on saine d&rsquo;en tirer profit est de ramener &agrave; soi tout ce qui nous d&eacute;range chez les autres en cherchant o&ugrave; se trouve la r&eacute;sonance.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Accepter de travailler avec l&rsquo;outil du miroir suppose que l&rsquo;on verra n&eacute;cessairement une r&eacute;sonance avec soi d&egrave;s qu&rsquo;on ne se sentira pas au neutre devant un comportement donn&eacute;. Le lien &agrave; faire peut &ecirc;tre tr&egrave;s subtil ; d&rsquo;ailleurs s&rsquo;il &eacute;tait &eacute;vident, tout le monde appliquerait depuis longtemps ce principe. G&eacute;n&eacute;ralement quand on porte un jugement sur quelqu&rsquo;un, notre syst&egrave;me de valeurs est impliqu&eacute; ; souvent on d&eacute;couvrira que la personne qui nous &eacute;nerve agit comme on le ferait si on se laissait aller. Il y a de bonnes chances que notre vraie nature se manifeste d&egrave;s qu&rsquo;on se permet de mettre de c&ocirc;t&eacute; certaines valeurs. Par exemple, quoi de plus frustrant que d&rsquo;avoir sous le nez un partenaire ou un enfant qui laisse tout tra&icirc;ner, alors qu&rsquo;on s&rsquo;astreint avec peine &agrave; ranger ! Souvent, nous avons besoin de nous attirer des situations exag&eacute;r&eacute;es pour enfin laisser aller le jugement que nous portons sur certains actes. Le jugement en moins, nous pouvons commencer &agrave; agir en accord avec nos besoins plut&ocirc;t que selon un syst&egrave;me de valeurs appris et pas toujours mis &agrave; jour.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Demeurer ouvert &agrave; d&eacute;couvrir des aspects de soi que l&rsquo;on n&rsquo;admet pas facilement est une condition primordiale &agrave; l&rsquo;&eacute;volution.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">On dit souvent : &ldquo; La v&eacute;rit&eacute; choque &rdquo; et cela demeure vrai tant et aussi longtemps que nous n&rsquo;avons pas admis nos travers avec les 2 H de la sant&eacute; mentale : HUMOUR ET HUMILIT&Eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nous sommes sur la terre pour &eacute;voluer ; c&rsquo;est au moins un point que nous avons tous en commun. &Agrave; partir du moment o&ugrave; nous agissons sur nous-m&ecirc;mes d&rsquo;apr&egrave;s ce que nous voyons dans le miroir, nous apprenons &agrave; nous conna&icirc;tre rapidement. Rien ne sert de casser le miroir ou d&rsquo;essayer de le polir lorsque la r&eacute;alit&eacute; qu&rsquo;il refl&egrave;te nous d&eacute;pla&icirc;t ; cette r&eacute;alit&eacute;, nous la transporterons toujours avec nous. Lorsque nous refusons de nous regarder, notre Sagesse int&eacute;rieure se charge de nous placer devant des miroirs de plus en plus grossissants pour nous donner la chance de Voir enfin.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le choix demeure le n&ocirc;tre de nous regarder en face ou de fuir. J&rsquo;aime la pens&eacute;e qui pr&ocirc;ne que peu importe le temps que nous prendrons pour red&eacute;couvrir la Lumi&egrave;re et l&rsquo;Amour, nous y arriverons t&ocirc;t ou tard. Depuis que j&rsquo;ai compris que toute souffrance vient d&rsquo;une r&eacute;sistance, je r&eacute;siste beaucoup moins.<br />\n&nbsp;</span></span></p>', 'CIteFhLYp4cE5qKH.jpg', '17', '0');
INSERT INTO `tblblog` VALUES ('7', '2010-07-07', '8', 'Qu\'elle belle équipe que forme Le Commandant Robert Piché, Florence Béliard et George Wright.  Ils ont offert une belle conférence les trois conférenciers.', 'Conférence - Peur en avion', 'Ici le Commandant Piché', 'conférence commandant Piché Robert', '<p>Ici le commandant Robert Pich&eacute;<br />\nDenyse B&eacute;gin</p>\n<p>Le Reflet - 5 mars 2010</p>\n<p>Actualit&eacute; &gt; Communautaire</p>\n<p>DELSON - Peur en avion? Robert Pich&eacute; souhaite vous aider &agrave; d&eacute;passer vos craintes afin de profiter de votre vol. Difficile de trouver mieux que ce pilote chevronn&eacute; pour le faire!</p>\n<p>Celui-ci a sauv&eacute; la vie de 306 personnes &agrave; bord d\'un Airbus A-330 en ao&ucirc;t 2001 lors d\'un atterrissage d\'urgence survenu aux A&ccedil;ores. Un exploit qui a fait de lui un v&eacute;ritable h&eacute;ros aux yeux du public.</p>\n<p>&laquo;Bien des gens que je croise depuis cet &eacute;v&eacute;nement me disent qu\'ils auraient moins peur en avion si c\'&eacute;tait moi le pilote! Ce que je constate, c\'est qu\'ils ont souvent peur, sans m&ecirc;me trop savoir pourquoi. Ils ont peur d\'avoir peur! D\'autres n\'ont jamais pris l\'avion et ils ont peur! Je me suis dit qu\'il fallait faire quelque chose&raquo;, explique le sympathique personnage au bout du fil.</p>\n<p>Appuy&eacute; par deux th&eacute;rapeutes, il a &eacute;labor&eacute; le programme d\'un s&eacute;minaire d\'une dur&eacute;e de deux jours dans le but de d&eacute;mystifier cette fameuse peur et la faire dispara&icirc;tre parce qu\'elle est injustifi&eacute;e quant &agrave; lui.</p>\n<p>Mardi, &agrave; Candiac, il proposera une version &eacute;court&eacute;e de cette formule. &Agrave; qui veut bien l\'entendre, il prouvera notamment qu\'il est moins dangereux de se d&eacute;placer en avion qu\'en automobile.</p>\n<p>&laquo;Il y a tellement de colportages erron&eacute;s et sans fondement &agrave; propos de l\'avion que les gens finissent par y croire. Lors du s&eacute;minaire, &agrave; la fin de la premi&egrave;re journ&eacute;e, la moiti&eacute; des participants affirment avoir vaincu leur peur. Ce que je veux, c\'est aider les gens, poursuit le commandant. C\'est triste de voir quelqu\'un qui ne peut pas voyager &agrave; cause d\'une peur non fond&eacute;e. J\'aime voyager, pas seulement dans le cadre de mon travail, et je trouve &ccedil;a dommage que tant de personnes se privent &agrave; cause de craintes injustifi&eacute;es.&raquo;</p>\n<p>H&eacute;ros et missionnaire<br />\nSa m&egrave;re a longtemps fait du b&eacute;n&eacute;volat et c\'est sans doute ce qui lui a donn&eacute; la piq&ucirc;re, avoue le pilote qui a cr&eacute;&eacute; la Fondation Robert Pich&eacute;, un organisme de bienfaisance qui vient en aide aux personnes qui ont un probl&egrave;me de d&eacute;pendance face &agrave; l\'alcool et/ou &agrave; la drogue.</p>\n<p>Pour ce qui est de son statut de &laquo;h&eacute;ros&raquo; ou de personnalit&eacute; connue, selon ses propres termes, &ccedil;a ne constitue pas une pression insoutenable sur ses &eacute;paules.</p>\n<p>&laquo;Les Qu&eacute;b&eacute;cois sont g&eacute;n&eacute;ralement super sympathiques, assure-t-il. Certains d\'entre eux, quand je les croise, veulent &ecirc;tre pris en photo avec moi. &Ccedil;a se passe bien. Ce n\'est pas moi qui ai dit que j\'&eacute;tais un h&eacute;ros. Je dois vivre avec les cons&eacute;quences d\'&ecirc;tre une personne connue. &Ccedil;a me va.&raquo;</p>\n<p>La conf&eacute;rence du commandant Robert Pich&eacute; d&eacute;butera &agrave; 19 h 30 au complexe Rom&eacute;o-V.- Patenaude, &agrave; Candiac. Le co&ucirc;t d\'entr&eacute;e est fix&eacute; &agrave; 20 $, remboursables &agrave; l\'achat d\'un voyage. Les billets sont en vente chez Club Voyages Raymonde Potvin, &agrave; Sainte-Catherine et &agrave; Ch&acirc;teauguay, ou chez Summum impression et communication, &agrave; La Prairie. n<br />\n&nbsp;</p>\n<p>&nbsp;</p>', 'GBAey9D1jfaen5bn.jpg', '7', '0');
INSERT INTO `tblblog` VALUES ('8', '2010-07-09', '8', 'Pour en savoir plus sur la Conférence du Commandant Piché, vous pouvez nous joindre au 418 622-2000 poste 130 ou 1 877 523-8647 ou par courriel au info@confor.ca`\n', 'Conférence du Commandant Piché', 'Quand l\'impossible devient réalité!', 'conférence commandant Robert Piché', '<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Conf&eacute;rence corporative:</span></span></p>\n<p><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Le Commandant Pich&eacute; a r&eacute;alis&eacute; un exploit exceptionnel. Il a su faire face &agrave; une situation critique en utilisant judicieusement son exp&eacute;rience, ses comp&eacute;tences et son &eacute;quipage.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Comme il le r&eacute;p&egrave;te depuis : il n\'a fait que son travail! Bien s&ucirc;r, mais quels sont les &eacute;l&eacute;ments qui ont permis d\'&eacute;viter la catastrophe?</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">D&eacute;couvrez de quelle fa&ccedil;on le Commandant Pich&eacute; a r&eacute;ussi &agrave; travailler avec le 30 % de capacit&eacute; de l\'avion qui fonctionnait toujours, plut&ocirc;t que de pleurer le 70 % qu\'il venait de perdre. Tant qu\'il y a de la vie, il y a de l\'espoir! Comme quoi tout est possible quand on y croit!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">L\'exp&eacute;rience du Commandant Pich&eacute; saura vous inspirer, vous transmettre l\'&eacute;nergie dont vous avez besoin &agrave; tous les jours pour toujours aller plus loin et ne jamais baisser les bras.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\"><br />\n</span><u><span style=\"font-family: Arial;\">Sujets trait&eacute;s pendant la conf&eacute;rence:</span></u></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">- L\'importance de la communication et du travail d\'&eacute;quipe;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">- Confiance en soi;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">- D&eacute;velopper une attitude positive;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">- Motivation personnelle;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">- Profiter des chances qui s\'offre &agrave; nous. </span></span></p>\n<p style=\"text-align: justify; \">&nbsp;</p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Conf&eacute;rence scolaire:</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Le Commandant Pich&eacute; a re&ccedil;u des t&eacute;moignages de gens de tout &acirc;ge des quatre coins de la plan&egrave;te. Les gens le f&eacute;licitent, le supportent, l\'admirent. Ainsi, si son exp&eacute;rience peut servir aux jeunes, il en sera tr&egrave;s heureux.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Son message principal: &quot; Croyez en vos r&ecirc;ves et en vous-m&ecirc;me car tout est possible!&quot;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Le Commandant Pich&eacute; r&ecirc;vait de piloter un avion depuis son plus jeune &acirc;ge. Apr&egrave;s ses &eacute;tudes secondaires, il a quitt&eacute; son petit village natal, seul, pour aller r&eacute;aliser son r&ecirc;ve. </span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Il a v&eacute;cu des moments difficiles tout au long de sa carri&egrave;re, mais cela ne l\'a pas emp&egrave;ch&eacute; de toujours croire en lui-m&ecirc;me et d\'avancer. Ce n\'est pas grave de tomber; l\'important, c\'est de se relever!<br />\n</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium;\"><span style=\"font-family: Arial;\">Pour plus de renseignement, vous pouvez nous joindre au 418 622-2000 poste 130 ou 1 877 523-8647.</span></span></p>', 'aNJgXnqKvzaf8rvS.jpg', '39', '2');
INSERT INTO `tblblog` VALUES ('9', '2010-07-09', '8', 'Pour en savoir plus sur la conférence de George Wright sur la communication en milieu de travail, vous pouvez nous joindre au 418 622-2000 poste 130 ou 1 877 523-8647 ou par courriel au info@confor.ca\n\n', 'Conférence George Wright', 'La communication en milieu de travail', 'conférence George Wright communication', '<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Conf&eacute;rence sur la communication en milieu de travail</span></span></p>\n<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\">&Agrave;&nbsp;l&rsquo;&egrave;re des communications rapides, de la productivit&eacute; et de la performance, il devient imp&eacute;ratif&nbsp;&agrave; chaque individu de prendre conscience de ses propres attitudes et comportements nuisibles pour ainsi les modifier afin de cr&eacute;er des relations vivantes et harmonieuses.</span></span></p>\n<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\"><br />\nCette conf&eacute;rence cr&eacute;era certainement une raction en cha&icirc;ne du genre donnez aux suivants&hellip; La pr&eacute;sence empathique du conf&eacute;rencier et son humour saura s&eacute;duire et inspirer les gens. Plusieurs seront personnellement touch&eacute;s par les histoires v&eacute;cues et partag&eacute;es. Les participants auront assur&eacute;ment le d&eacute;sir de mettre en place des changements durables, autant dans leur milieu familiale que celui du travail. Enfin, une conf&eacute;rence qui d&eacute;mystifie les relations.<br />\n</span></span></p>\n<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\">La conf&eacute;rence va permettre d&rsquo;augmenter la motivation, la mobilisation et la fid&eacute;lisation dans l&rsquo;entreprise. Vous y d&eacute;couvrirez des outils pour d&eacute;velopper une communication plus efficace. </span></span></p>\n<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\"><a href=\"http://conferences-formations.com/index.php/home/play/100033\">EXTRAIT DE LA CONF&Eacute;RENCE cliquez ici</a></span></span></p>\n<p><span style=\"font-size: medium\"><span style=\"font-family: Arial\">George Wright, est un conf&eacute;rencier et formateur depuis 1989 au Qu&eacute;bec, en Europe et aux &Eacute;tats-Unis. Ses interventions orient&eacute;es vers une r&eacute;alit&eacute; quotidienne et une vision strat&eacute;gique ont pour but de proposer des solutions efficaces, cr&eacute;atrices et originales en tenant compte des besoins et des ressources du client.<br />\n</span></span></p>\n<p>&nbsp;</p>', 'nTZaoGjBciU8lGlD.jpg', '24', '0');
INSERT INTO `tblblog` VALUES ('10', '2010-07-08', '8', 'Informez-vous pour l\'atelier au 418 622-2000 poste 130 ou 1 877 523-8647.', 'Atelier', 'Libérer vos peurs et votre inconfort en avion', 'peur avion commandant Piché', '<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Animateurs: Commandant Pich&eacute;, George Wright et Florence B&eacute;liard</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Cet atelier de 2 jours va vous permettre de vous lib&eacute;rer de votre peur face &agrave; l&rsquo;avion.&nbsp; Notre expert de l&rsquo;aviation, le Commandant Robert Pich&eacute; va vous expliquer toute la partie aviation.&nbsp; Nous formons des petits groupes (maximum 12 personnes) pour que vous puissiez exprimer vos inqui&eacute;tudes au Commandant Pich&eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Nous avons aussi 2 experts qui ont aid&eacute; plus de 500 personnes &agrave; se lib&eacute;rer de cette peur.&nbsp; Ils vous expliqueront comment r&eacute;agit le cerveau face &agrave; la peur. Par des exemples de cas v&eacute;cu, des exercices et des mises en situation, ils d&eacute;couvriront avec vous votre probl&eacute;matique. Lorsque vous aurez trouv&eacute; avec un des 3 intervenants la provenance de votre peur, ils occuperont de vous pour que vous puissiez passer par-dessus gr&acirc;ce &agrave; des explications plus pouss&eacute;es, des exercices et des mises en situation.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">La raison pour laquelle nous avons un taux de r&eacute;ussite aussi &eacute;lev&eacute;, 95 %, est que nos 3 experts ont pr&eacute;par&eacute; un atelier con&ccedil;u pour les gens comme vous. </span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Comme nos clients le disent, je n&rsquo;ai pas juste r&eacute;gl&eacute; ma peur en avion, j&rsquo;ai compris plein d&rsquo;autres peurs que j&rsquo;avais, ce qui me permet aujourd&rsquo;hui de pouvoir voyager en tout confort et de voir de nouveaux paysages dans une belle ambiance. Nos clients adorent l&rsquo;accessibilit&eacute; des 3 formateurs pendant l&rsquo;atelier et m&ecirc;me des mois apr&egrave;s l&rsquo;atelier.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\"><a href=\"http://conferences-formations.com/index.php/home/play/100043\">Pour voir les vid&eacute;os cliquez ici</a></span></span></p>\n<p style=\"text-align: justify; \">&nbsp;</p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Lieu: Montr&eacute;al (Local d\'Air Transat)</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Date: &agrave; venir</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Lieu: Qu&eacute;bec</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Date: 17 et 18 juillet 2010</span></span></p>\n<p style=\"text-align: justify; \">&nbsp;</p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">Date &agrave; venir dans d\'autres r&eacute;gions, &eacute;crivez-nous</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium\"><span style=\"font-family: Arial\"><br />\nPour inscription: 418 622-2000&nbsp;poste 130 ou&nbsp;1-877-523-8647 ou&nbsp;</span></span><a href=\"mailto:info@confor.ca\"><span style=\"font-size: medium\"><span style=\"font-family: Arial\">info@confor.ca</span></span></a><br />\n&nbsp;</p>', 'loDGYL3wxUqrcHvD.jpg', '33', '0');
INSERT INTO `tblblog` VALUES ('11', '2010-07-09', '8', 'Article du 28 janvier 2010 dans le Journal de Montréal à propos de l\'effet qu\'à eu le Commandant Robert Piché lorsqu\'il a vu le film sur sa vie.', 'Film', 'Film Commandant Piché', 'commandant robert piché conférencier', '<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;Entre ciel et terre&raquo;: le commandant Pich&eacute; &eacute;mu<br />\nLe 28 janvier 2010 - 09:20&nbsp; |&nbsp; Julie Rh&eacute;aume</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">En visionnant le film &laquo;Entre ciel et terre&raquo;, qui raconte sa vie, le commandant Robert Pich&eacute; a &eacute;t&eacute; &eacute;mu aux larmes. La sortie de ce long-m&eacute;trage de Sylvain Archambault est pr&eacute;vue le 7 juillet.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;Je ne pensais pas &ecirc;tre touch&eacute; autant. Au d&eacute;but du tournage, je l\'avoue, j\'avais peur. Je n\'&eacute;tais pas certain de ce que tout cela allait donner sur grand &eacute;cran. Mais le r&eacute;sultat est &eacute;tonnant. Ma sc&egrave;ne pr&eacute;f&eacute;r&eacute;e est celle o&ugrave; on me voit avec mon th&eacute;rapeute six mois apr&egrave;s l\'accident. Michel C&ocirc;t&eacute; joue merveilleusement bien. L\'&eacute;motion est grande. C\'est seulement &agrave; ce moment-l&agrave;, je crois, que j\'ai r&eacute;alis&eacute; l\'ampleur de ce que je venais de vivre. Je ne voyais qu\'un acteur pour jouer avec autant de v&eacute;rit&eacute;, et c\'est Michel C&ocirc;t&eacute;&raquo;, a racont&eacute; Robert Pich&eacute; au Journal de Montr&eacute;al apr&egrave;s avoir visionn&eacute; le film seul dans sa chambre d\'h&ocirc;tel mardi soir.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;Parfois, je vole le m&ecirc;me Airbus 330 que j\'ai amerri. &Ccedil;a me fait tout dr&ocirc;le. Je fais le plus beau m&eacute;tier du monde&raquo;, dit celui qui est toujours &agrave; l\'emploi d\'Air Transat.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Pour tourner son film, Sylvain Archambault a d&ucirc; composer avec un budget de 7 millions $. Cette somme &eacute;tait-elle suffisante, lui a demand&eacute; le Journal de Montr&eacute;al?</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;Je ne me plains pas, car le cin&eacute;ma, c\'est la rencontre entre l\'art et l\'argent. Nous avons choisi d\'explorer le c&ocirc;t&eacute; psychologique d\'un homme. Michel C&ocirc;t&eacute; le joue avec une v&eacute;rit&eacute; &eacute;mouvante. C\'est le r&ocirc;le de sa vie. Il nous montre un Robert Pich&eacute; dans toute son int&eacute;riorit&eacute;, vuln&eacute;rable et parfois apeur&eacute;. C\'est un film touchant&raquo;, a r&eacute;pondu le cin&eacute;aste au quotidien.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">(source: Journal de Montr&eacute;al) <br />\n&nbsp;</span></span></p>', 'djzESJj98Y9S7IOu.jpg', '8', '0');
INSERT INTO `tblblog` VALUES ('12', '2010-07-09', '8', 'Article écrit par Madame Vanasse qui était présente lors d\'une conférence du Commandant Robert Piché.', 'Ma rencontre avec un héros!', 'Article de Madame Vanasse', 'commandant Robert Piché conférencier', '<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ma rencontre avec un h&eacute;ros! <br />\nLe 3 novembre 2009,</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nous sommes le vendredi 23 octobre 2009 et nous sommes au Mont-Temblant. J&rsquo;ai &eacute;t&eacute; invit&eacute;e comme conf&eacute;renci&egrave;re dans le cadre du Colloque 2009 du Regroupement des gestionnaires en approvisionnement des universit&eacute;s qu&eacute;b&eacute;coises (RGAUQ). Le titre du colloque &laquo; Un monde en turbulence : savoir anticiper et man&oelig;uvrer &raquo;. Le conf&eacute;rencier suivant sera nul autre que le commandant Robert Pich&eacute; et le sujet de sa conf&eacute;rence &laquo; Quand l&rsquo;impossible devient r&eacute;alit&eacute;! &raquo;! Je n&rsquo;aurais manqu&eacute; cette opportunit&eacute; pour tout l&rsquo;or du monde. J&rsquo;&eacute;tais assise dans la premi&egrave;re rang&eacute;e, en diagonale avec lui. Personne pour me bloquer la vue, je ne manquerai rien, il sera comme &laquo; tout &agrave; moi &raquo;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le pr&eacute;sident commence sa pr&eacute;sentation. Nous sommes tous tr&egrave;s attentifs. Puis, soudain, plus de lumi&egrave;re; l&rsquo;obscurit&eacute; totale dans la salle et nous entendons une voix nous annoncer des probl&egrave;mes. C&rsquo;est la voix du commandant, il nous r&eacute;p&egrave;te le m&ecirc;me message que celui transmis aux passagers de l&rsquo;avion au moment o&ugrave; l&rsquo;obscurit&eacute; s&rsquo;est install&eacute;e.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ensuite, nous &eacute;coutons un reportage, le reportage de la phase finale de l&rsquo;incident du 24 ao&ucirc;t 2001. Le commandant Pich&eacute; pilote un avion en panne de moteurs &agrave; 39 000 pieds d&rsquo;altitude, la nuit, au milieu de l&rsquo;Atlantique. C&rsquo;est un Airbus A-330 d&rsquo;Air Transat dans lequel se trouvent 291 passagers et 13 membres d&rsquo;&eacute;quipage, le vol TS 236. Dans ce reportage, il y a une simulation du vol des derni&egrave;res minutes et de l&rsquo;atterrissage, des photos. Nous entendons &eacute;galement le t&eacute;moignage de quelques passagers. Beaucoup d&rsquo;&eacute;motion, beaucoup d&rsquo;&eacute;motion&hellip; Puis, les lumi&egrave;res s&rsquo;allument et on annonce &laquo; Mesdames et Messieurs, le commandant Robert Pich&eacute; &raquo;. Il entre, nous l&rsquo;applaudissons, mais aucun son ne sort de nos bouches, stup&eacute;faits, encore sous le choc!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Non, il n&rsquo;est pas en uniforme, il est v&ecirc;tu simplement, mais avec go&ucirc;t. Il est &laquo; beau &raquo;, humble et &eacute;mu (comme nous tous d&rsquo;ailleurs). Il poss&egrave;de beaucoup de charisme. Lentement, il commence &agrave; parler et mentionne avoir vu/entendu le reportage au moins 300 fois. Il d&eacute;clare en &ecirc;tre toujours aussi &eacute;mu. Et il continue &agrave; nous entretenir : &laquo; 86 % des passagers ont peur de prendre l&rsquo;avion, qui fait partie de ce pourcentage? &raquo; Quelques-uns l&egrave;vent la main. Je me suis permise de faire une petite recherche et une &eacute;tude de L&eacute;ger Marketing effectu&eacute;e apr&egrave;s le 11 septembre 2001 nous apporte quelques pr&eacute;cisions : 33 % des passagers d&rsquo;un avion sont inconfortables, 10 % de la population ne prendra jamais l&rsquo;avion.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Avant le 24 ao&ucirc;t 2001, on le nommait &laquo; Capitaine Pich&eacute; &raquo; (oui, il a quand m&ecirc;me 4 gallons!), &laquo; Monsieur Pich&eacute; &raquo;, mais tr&egrave;s rarement &laquo; Commandant Pich&eacute; &raquo;. Depuis, il est devenu le &laquo; Commandant Robert Pich&eacute; &raquo;. Il en est un peu amus&eacute;, car les grades dans l&rsquo;aviation civile n&rsquo;ont pas du tout la m&ecirc;me rigueur que dans le monde militaire, mais bon, c&rsquo;est ainsi. Il parle de l&rsquo;uniforme qui lui attire regards et femmes. Il en a eu 5, &laquo; la derni&egrave;re, je l&rsquo;ai mari&eacute;e; puis il ajoute, vous devriez voir ce que cela me co&ucirc;te! &raquo;. En rigolant, il termine en disant &laquo; J&rsquo;ai raccroch&eacute;, la chasse est termin&eacute;e, je suis rang&eacute;! &raquo;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nIl nous informe sur les &eacute;tapes d&rsquo;un vol normal : la portion en territoire canadien, la portion au-dessus de l&rsquo;oc&eacute;an et la portion au-dessus du territoire europ&eacute;en. Avant de quitter le territoire canadien pour entreprendre l&rsquo;&eacute;tape suivante, un contr&ocirc;leur a&eacute;rien lui demande s&rsquo;il accepte de modifier son plan de vol pour voler &agrave; 60 milles plus au sud et, sans raison, il accepte (le commandant a toujours de choix de modifier ou non le plan initial). Cette d&eacute;cision s&rsquo;av&egrave;rera de premi&egrave;re importance dans le sauvetage.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Puis, il nous parle de sa folie &laquo; de jeunesse, &agrave; 30 ans &raquo; et de la cons&eacute;quence : condamn&eacute; &agrave; 10 ans de prison en G&eacute;orgie. Il ne nie rien, ne cherche pas de faux-fuyant, bref il assume! Une prison o&ugrave; l&rsquo;on retrouve 200 blancs pour environ 600 noirs et il ajoute &laquo; J&rsquo;ai suivi le cours &laquo; Prison 101 &raquo; en une semaine et j&rsquo;ai tr&egrave;s bien r&eacute;ussi! &raquo;. Il a v&eacute;cu un an et demi sous haute dose d&rsquo;adr&eacute;naline, &agrave; survivre, &agrave; ne d&eacute;ranger personne, &agrave; faire le boulot demand&eacute;, bref, &agrave; survivre!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nous revenons dans l&rsquo;Airbus. Au dessus de l&rsquo;oc&eacute;an, il discute avec son premier officier qu&rsquo;il ne conna&icirc;t pas ou tr&egrave;s peu. Puis, en plein milieu de l&rsquo;oc&eacute;an&hellip; une lumi&egrave;re orange s&rsquo;allume : d&eacute;balancement au niveau du carburant entre les ailes!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Sa premi&egrave;re pens&eacute;e va vers les 304 personnes &agrave; bord, y compris lui-m&ecirc;me, un humain : il doit tout faire pour leur s&eacute;curit&eacute;. Il a un travail &agrave; faire et il le fera.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Les pilotes doivent, tous les 6 mois, passer des tests en simulateur de vol. Ils doivent affronter tous les probl&egrave;mes pouvant survenir afin de savoir quoi faire, quoi&hellip; quoi&hellip; &Euml;TRE PR&Ecirc;T! Les moniteurs leur enseignent &agrave; : 1. garder votre calme; 2. consulter votre voisin, premier officier; 3. r&eacute;fl&eacute;chir avant d&rsquo;agir car la pr&eacute;cipitation ne m&egrave;ne pas n&eacute;cessairement &agrave; la bonne d&eacute;cision! Ces recommandations s&rsquo;appliquent &agrave; tout gestionnaire, peu importe le lieu et la situation. En souriant, le commandant nous informe que, depuis le sauvetage du 24 ao&ucirc;t 2001, la simulation sur la panne de carburant a &eacute;t&eacute; ajout&eacute;e!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Alors, n&rsquo;&eacute;coutant que ses moniteurs, il demande &agrave; son premier officier ce qu&rsquo;il pense de la situation, du probl&egrave;me, et sa r&eacute;ponse sera &laquo; Nous allons tous mourir! Nous allons tous mourir! Nous allons&hellip;&raquo;. Le Commandant Pich&eacute; comprend que son premier officier est au bord de la panique si ce n&rsquo;est d&eacute;j&agrave; le cas. Il a maintenant deux probl&egrave;mes &agrave; solutionner : la lumi&egrave;re orange et la panique de son officier et il ne veut surtout pas se laisser gagner par la panique car la panique, c&rsquo;est contagieux!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">MAYDAY! MAYDAY! Y-A-T-IL UN PILOTE &Agrave; BORD? OUI, le commandant Pich&eacute; est &agrave; bord!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Il est dans l&rsquo;avion le plus moderne du monde : 5 ordinateurs de bord qui g&egrave;rent tout, contr&ocirc;lent tout, apportent toutes les solutions &agrave; tous les probl&egrave;mes qui peuvent survenir, etc. etc. etc. Il prend maintenant des d&eacute;cisions : demander &agrave; son copilote de faire les calculs sur la situation du carburant et appuyer sur la commande/action recommand&eacute;e par l&rsquo;ordinateur de bord (il saura plus tard que cette d&eacute;cision n&rsquo;&eacute;tait pas la bonne!). Le calcul du copilote : 8 tonnes de carburant disponible!!! Impossible, de penser le commandant et il r&eacute;vise les calculs&hellip; Ils sont bons, nous allons manquer de carburant! Il d&eacute;cide alors de changer de cap, de tourner vers les A&ccedil;ores. Il faut atterrir, de pr&eacute;f&eacute;rence sur la terre ferme, car amerrir, c&rsquo;est la mort assur&eacute;e! Il nous explique que l&rsquo;eau, c&rsquo;est un bloc qui ne se brise pas. Le ciment se d&eacute;sint&egrave;gre, mais pas l&rsquo;eau et c&rsquo;est l&rsquo;avion qui se d&eacute;sint&egrave;gre. Depuis le d&eacute;but, le voyant orange est allum&eacute; et quelque 14 minutes se sont &eacute;coul&eacute;es.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Une fois les moteurs &eacute;teints, avec 30 % de ses capacit&eacute;s, dans sa t&ecirc;te il se pose une question &laquo; Est-ce que ce gigantesque avion, un Airbus A-330, planera? &raquo;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le copilote sera occup&eacute; avec les communications &agrave; bord et avec la tour de contr&ocirc;le des A&ccedil;ores. Les agents de bord seront, quant &agrave; eux, occup&eacute;s &agrave; contr&ocirc;ler les passagers au mieux et &agrave; les pr&eacute;parer pour un amerrissage&hellip; atterrissage d&rsquo;urgence. Le commandant Pich&eacute; parle avec fiert&eacute; de leur travail et de leur ma&icirc;trise. Ce sont des humains aussi, entre eux : &laquo; si je ne survis pas et que toi tu survis, tu diras &agrave; &hellip; que je l&rsquo;aime &raquo;, et aux passagers devant eux : &laquo; ne craignez rien, tout ira bien &raquo;. Une &eacute;quipe d&rsquo;agents de bord ayant entre 8 et 19 ans d&rsquo;exp&eacute;rience est un fait extr&ecirc;mement rare. On n&rsquo;a jamais autant d&rsquo;exp&eacute;rience sur un seul vol!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&Agrave; bord, les passagers prient, pleurent, se confessent (un homme devant la mort toute proche avouera &agrave; son &eacute;pouse qu&rsquo;il l&rsquo;a tromp&eacute;e&hellip; avec sa s&oelig;ur!), s&rsquo;&eacute;treignent&hellip; une derni&egrave;re fois, se tiennent la main, prient encore et encore.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Au sol, les pompiers et les militaires attendent et ne s&rsquo;attendent &agrave; rien d&rsquo;autre que de ramasser des corps. Ils sont certains que l&rsquo;Airbus va s&rsquo;&eacute;craser en mer ou sur la piste. Bref, personne ne croit en la capacit&eacute; du pilote, c&rsquo;est dire qu&rsquo;ils ne connaissaient pas le commandant Pich&eacute;! Fort de toute son exp&eacute;rience, &laquo; il ne fera que son travail &raquo; et c&rsquo;est ce qu&rsquo;il r&eacute;p&egrave;tera encore et encore depuis le sauvetage.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Contre toute attente, l&rsquo;avion est en vue. Il a plan&eacute; plus de 20 minutes! L&agrave; encore les sceptiques en prendront pour leur rhume! Il faut maintenant atterrir, sans encombre. Cependant, l&rsquo;avion vole trop vite, presque 2 fois la vitesse normale. Mais le commandant Pich&eacute; n&rsquo;a pas le choix, il doit le faire maintenant, pas de 2e chance possible.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Contrairement &agrave; la nuit pr&eacute;c&eacute;dente et aux 4 nuits suivantes, la visibilit&eacute; est &agrave; son meilleur, bonne nouvelle. Un autre facteur d&eacute;terminant : une piste qui a 2 milles de long. Elle est d&rsquo;une longueur exceptionnelle puisqu&rsquo;elle est utilis&eacute;e par la NASA pour l&rsquo;atterrissage de la navette spatiale!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Y-A-T&rsquo;IL UN PILOTE &Agrave; BORD? OUI, le commandant Pich&eacute; est &agrave; bord!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">L&rsquo;adr&eacute;naline est &agrave; son maximum. Le commandant Pich&eacute; pense aux 304 personnes &agrave; bord L&rsquo;homme pense, comme tous les autres, &agrave; sa famille. Il va atterrir&hellip; L&rsquo;avion touche le sol et &hellip; rebondit de 2000 pieds, vacille, tangue, mais&hellip; fort de son exp&eacute;rience de brousse, de guerre, etc., il sait que l&rsquo;avion va se replacer &agrave; l&rsquo;horizontal et planer encore. L&rsquo;adr&eacute;naline est &agrave; son maximum, le plus grand &laquo; High &raquo; de sa vie, avouera-t-il. Il va ma&icirc;triser l&rsquo;Airbus. Il en est &agrave; la derni&egrave;re &eacute;tape : lorsque les roues arri&egrave;re vont retoucher le sol, il faudra freiner&hellip; au bon moment. L&agrave;, c&rsquo;est l&rsquo;exp&eacute;rience qui sera son seul conseiller. Les roues touchent le sol&hellip; l&rsquo;angle est le bon. Il freine, il est &laquo; debout sur les freins &raquo;; les pneus &eacute;clatent avec un bruit d&rsquo;enfer. Le feu se d&eacute;clare au niveau du train d&rsquo;atterrissage et, lentement, le nez de l&rsquo;avion se baisse, les roues avant touchent le sol. Le commandant Pich&eacute; est toujours &laquo; debout sur les freins &raquo; et l&rsquo;Airbus A-330 ralentit, puis s&rsquo;arr&ecirc;te. Pas de dislocation, pas de bris, pas de mort, pas de bless&eacute;&hellip; ils sont tous vivants!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le temps que le commandant Pich&eacute; effectue les derni&egrave;res t&acirc;ches de s&eacute;curisation de l&rsquo;avion, les agents de bord &laquo; op&egrave;rent &raquo; &agrave; leur tour : ouverture des portes, d&eacute;ploiement des toboggans, &eacute;vacuation de tous les passagers et des membres d&rsquo;&eacute;quipage. Quelques blessures mineures, sans plus! Il sort de son cockpit. Il est maintenant seul dans l&rsquo;avion : 1 minute 30 secondes se sont &eacute;coul&eacute;es depuis qu&rsquo;il a donn&eacute; la consigne d&rsquo;&eacute;vacuation. Sa derni&egrave;re responsabilit&eacute; : s&rsquo;assurer qu&rsquo;il n&rsquo;y a plus personne &agrave; bord. Il doit traverser 200 pieds. &laquo; C&rsquo;est long un Airbus A-330! &raquo;. Des montagnes de chaussures, des odeurs naus&eacute;abondes (face &agrave; la mort, les humains &eacute;vacuent le stress et la peur comme ils peuvent), mais personne d&rsquo;accrocher &agrave; son si&egrave;ge, personne dans les toilettes, plus personne &agrave; bord. Alors, il saute dans le toboggan de queue! Sa pens&eacute;e, lorsqu&rsquo;il saute &laquo; je vais perdre mon job! &raquo;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">IL Y AVAIT UN PILOTE &Agrave; BORD, le commandant Robert Pich&eacute;. Calme et en parfait contr&ocirc;le, tel qu&rsquo;&eacute;crit dans la brochure du colloque &laquo; il a su faire face &agrave; une situation critique en utilisant judicieusement son exp&eacute;rience, ses comp&eacute;tences et son &eacute;quipage &raquo;. Une le&ccedil;on de force et de courage : il a surmont&eacute; les difficult&eacute;s et les &eacute;preuves.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">En tout, 42 minutes se sont &eacute;coul&eacute;es depuis que le voyant orange s&rsquo;est allum&eacute;!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">De retour &agrave; la maison, quelques jours plus tard, le commandant Pich&eacute; fera la &laquo; une &raquo; de tous les journaux &laquo; Il a fait de la prison aux &Eacute;tats-Unis&hellip;. &raquo;. Inutile que je donne ici les d&eacute;tails et que je sois aussi &laquo; incroyable et inacceptable &raquo; que l&rsquo;ont &eacute;t&eacute; les journalistes. Dans la religion catholique (je ne connais pas les comparables dans les autres religions, j&rsquo;en suis d&eacute;sol&eacute;e) le Seigneur a dit (je ne me rappelle plus devant qui et dans quelles circonstances) &laquo; Que celui qui est sans p&eacute;ch&eacute; lui lance la premi&egrave;re pierre &raquo; et, &agrave; ce moment, personne n&rsquo;a lanc&eacute; de pierres!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Cette &laquo; campagne de salissage &raquo; a &eacute;t&eacute; la plus grande &eacute;preuve, sa plus grande difficult&eacute;, l&rsquo;&eacute;v&egrave;nement de sa vie le plus difficile &agrave; passer : ses enfants l&rsquo;ignoraient, sauf sa fille a&icirc;n&eacute;e &agrave; qui il l&rsquo;avait dit lorsqu&rsquo;elle a atteint ses 18 ans.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Toujours aussi g&eacute;n&eacute;reux, il r&eacute;pond &agrave; toutes nos questions, aussi simplement et humblement qu&rsquo;il a racont&eacute; le sauvetage. Il a partag&eacute; avec nous et nous avons &eacute;chang&eacute; avec lui. Je me dois de faire un constat : que ce soit le commandant Pich&eacute; ou nous qui l&rsquo;&eacute;coutions, personne n&rsquo;a cherch&eacute; de coupable, de responsable. Le commandant Pich&eacute; a lou&eacute; tous les membres de son &eacute;quipage; il en &eacute;tait fier et reconnaissant.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Nul doute qu&lsquo;Air Transat s&rsquo;est f&eacute;licit&eacute;e d&rsquo;avoir embauch&eacute; le commandant Pich&eacute;. BRAVO &agrave; celui ou &agrave; ceux qui l&rsquo;on support&eacute; et qui lui ont fait confiance. Ils lui ont donn&eacute; une 2e chance.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Lorsque la p&eacute;riode de questions fut termin&eacute;e, il en avait pour nous : &laquo; Avant le sauvetage, si vous aviez su que j&rsquo;avais &eacute;t&eacute; en prison, seriez-vous mont&eacute; &agrave; bord sachant que j&rsquo;en &eacute;tais le commandant? &raquo; Nous avons tous r&eacute;pondu OUI.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Deuxi&egrave;me question : &laquo; Une fois que M. Lacroix aura pay&eacute; sa dette &agrave; la soci&eacute;t&eacute;, allez-vous lui confier votre argent? &raquo; Nous avons tous r&eacute;pondu NON!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le commandant Pich&eacute; n&rsquo;a pas &eacute;t&eacute; en prison parce qu&rsquo;il a fait une erreur de pilotage, il a mal utilis&eacute; son talent et son avion. De plus, les seuls perdants furent ceux qui l&rsquo;ont recrut&eacute; et lui-m&ecirc;me. Pas d&rsquo;autres dommages collat&eacute;raux sauf, bien s&ucirc;r, sa famille. Ses enfants et tous ses proches n&rsquo;ont pas &agrave; avoir honte, bien au contraire. Avec ses 304 vies sauv&eacute;es, ils ont obtenu 304 &laquo; pardons &raquo; dans l&rsquo;honneur et la fiert&eacute;.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Tout au long de sa pr&eacute;sentation, nous avons souri, ri et m&ecirc;me esquiss&eacute; une larme ou deux. Une rencontre excitante? Non. Une rencontre &Eacute;MOUVANTE? OUI. J&rsquo;ai mis quatre jours avant de pouvoir, sans &ecirc;tre trop sous le choc de l&rsquo;&eacute;motivit&eacute;, &eacute;crire ces quelques lignes.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Les facteurs d&eacute;terminants dans ce sauvetage? Il y en a plusieurs. Premi&egrave;rement, ses comp&eacute;tences et son exp&eacute;rience comme pilote hors de tout doute que ce soit au Qu&eacute;bec, dans les pistes enneig&eacute;es, &agrave; la Baie James, sur la C&ocirc;te-Nord ou au Vietnam, aux &Eacute;tats-Unis, etc. Deuxi&egrave;mement, sa survie en prison et c&rsquo;est l&agrave; qu&rsquo;il a vu la mort pour la premi&egrave;re fois. Troisi&egrave;mement, la modification de son plan de vol (60 000 milles plus au sud), des conditions de m&eacute;t&eacute;o exceptionnelles aux A&ccedil;ores, une piste d&rsquo;atterrissage longue de 2 milles. Est-ce que le destin &eacute;tait au rendez-vous? &Eacute;tait-ce son karma ou Dieu sait quoi? Nul doute, il avait en &laquo; main &raquo; toutes les cartes, tous les outils et il n&rsquo;a pas failli &agrave; son job et &agrave; ses responsabilit&eacute;s. Il a &laquo; livr&eacute; &raquo; la marchandise et il a sauv&eacute; 304 vies, y compris la sienne!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le commandant Pich&eacute; a sauv&eacute; 304 vies; je dirais qu&rsquo;il a sauv&eacute; beaucoup plus de vies que cela. Que dire des &laquo; avantages &raquo; collat&eacute;raux? Je parle ici des enfants qui ne sont pas devenus orphelins, des parents qui n&rsquo;ont pas eu &agrave; survivre au d&eacute;c&egrave;s de &laquo; leur chair &raquo;, aux amis, aux voisins, aux patrons/employ&eacute;s et autres qui n&rsquo;ont pas perdu un ou des &ecirc;tres chers. Que dire des enfants qui sont n&eacute;s de ces survivants? Peut-&ecirc;tre que l&rsquo;un d&rsquo;entre eux ou leur descendance sera un autre Einstein ou un autre commandant Pich&eacute; qui sauvera &agrave; son tour d&rsquo;autres vies et ainsi de suite!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Bien entendu, il y a des survivants du vol TS 236 qui n&rsquo;auront pas &eacute;t&eacute; capable et ne seront plus capable de mener une vie normale malgr&eacute; les th&eacute;rapies et l&rsquo;aide qui leur sera apport&eacute;e. Les humains n&rsquo;ont pas tous la m&ecirc;me force, les humains n&rsquo;ont pas tous la m&ecirc;me destin&eacute;e. Il y a aussi les r&eacute;silients, c&rsquo;est-&agrave;-dire ceux qui pr&eacute;sentent une r&eacute;sistance au choc&hellip; rien ne s&rsquo;est pass&eacute; ou, &ccedil;a ne m&rsquo;a pas affect&eacute; du tout.<br />\nUne rumeur veut que les chats aient 7 vies. En est-il de m&ecirc;me pour les humains? 304 personnes ont eu au moins une &laquo; 2e chance &raquo;. Toujours est-il que le commandant Pich&eacute; en est &agrave; sa &laquo; 3e vie &raquo;, tout comme moi d&rsquo;ailleurs, ce qui traduit une raison suppl&eacute;mentaire de mon &eacute;motion. Lorsque tu as vu et affront&eacute; la mort, il est rare que &ccedil;a ne change pas l&rsquo;Homme, cela replace les valeurs et agit sur notre avenir.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Il serait int&eacute;ressant de retracer les survivants pour d&eacute;couvrir ce qu&rsquo;ils sont devenus. Peut-&ecirc;tre que le 10e anniversaire du sauvetage, en ao&ucirc;t 2011, sera un moment de rencontres, d&rsquo;&eacute;changes et&hellip; de larmes de joie!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Le commandant Pich&eacute; a recommenc&eacute; &agrave; piloter en novembre 2001. Il a &agrave; nouveau pilot&eacute; l&rsquo;Airbus &laquo; qui lui a donn&eacute; du fil &agrave; retordre&hellip; en regardant, toutes les 5 minutes, le niveau de carburant! &raquo; et l&agrave;, nous avons tous souri. Il n&rsquo;a pas demand&eacute; d&rsquo;aide et, avec le recul, il avoue qu&rsquo;il aurait d&ucirc; prendre une ann&eacute;e sabbatique. Air Transat ne se serait pas oppos&eacute;e et il aurait d&ucirc; suivre une th&eacute;rapie. Sa th&eacute;rapie, c&rsquo;est peut-&ecirc;tre ses conf&eacute;rences, qui sait? Dans tous les cas, MERCI de cet enrichissant partage et je suis persuad&eacute;e qu&rsquo;il en tire quelque chose.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Finalement, il y a eu la reconnaissance. En effet, le commandant Pich&eacute; a &eacute;t&eacute; honor&eacute; au Qu&eacute;bec, dans sa ville natale, Mont-Joli, &agrave; Qu&eacute;bec et &agrave; Montr&eacute;al; au Canada, &agrave; Ottawa et aux &Eacute;tats-Unis, &agrave; Chicago, &agrave; Washington, par divers organismes et gouvernements. De plus, un film dont le titre sera &laquo; Entre ciel et terre &raquo; verra le jour en juillet 2010 et portera sur sa vie et ses aventures. Nul doute, je le verrai.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">J&rsquo;ai achet&eacute; son livre &laquo; Sauvetage aux A&ccedil;ores &raquo; (nouvelle couverture de &laquo; Robert Pich&eacute; aux commandes du destin &raquo;), Pierre Cayouette, &Eacute;dition Libre Expression, qu&rsquo;il a gentiment autographi&eacute;. Maintenant, je vais le lire.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Comme le dit le commandant Pich&eacute; &laquo; Il n&rsquo;a pas appris &agrave; devenir h&eacute;ros ou &agrave; agir en h&eacute;ros ou &agrave; vivre comme un h&eacute;ros... il n&rsquo;a fait que son travail &raquo;. MERCI et quel exemple.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Il est partenaire avec Confor qui offre, entre autre, des ateliers &laquo; La peur en avion &raquo; </span></span><a href=\"http://www.confor.ca\"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">www.confor.ca</span></span></a></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ensemble, nous avons quitt&eacute; la salle &agrave; d&icirc;ner, pris l&rsquo;ascenseur, attendu nos voitures. Nous avons &eacute;chang&eacute; encore quelques mots, il &eacute;tait toujours aussi humble et toujours aussi &laquo; beau! &raquo; (Sourire!).</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">J&rsquo;esp&egrave;re pouvoir l&rsquo;entendre &agrave; nouveau, une rencontre inoubliable et &agrave; renouveler. Il y aura toujours quelque chose &agrave; retenir, une le&ccedil;on &agrave; tirer.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Commandant Pich&eacute;, MERCI d&rsquo;&ecirc;tre ce que vous avez &eacute;t&eacute;, ce que vous &ecirc;tes et ce que vous serez. J&rsquo;esp&egrave;re humblement, &agrave; mon tour, que vous serez MON commandant de bord lors de mon prochain vol sur Air Transat.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&Agrave; la prochaine!</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Ma rencontre avec un h&eacute;ros<br />\n&copy; 2009 Th&eacute;r&egrave;se Vanasse, Vanasse &amp; Associ&eacute;s Consultants inc.<br />\n3 novembre 2009<br />\n</span></span><a href=\"http://www.vanasse-associes.com/\"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">www.vanasse-associes.com/</span></span></a></p>', 'AvPCLkN5iHkLlEVO.jpg', '6', '0');
INSERT INTO `tblblog` VALUES ('13', '2010-07-09', '8', 'Nos deux conférenciers et notre conférencière offre un atelier pour aider les gens qui ont peur en avion.  Le Commandant Piché s\'occupe du côté technique de l\'aviation.  Pour le côté psychologique, nous avos Mme Florence Béliard et M. George Wright, qui a plus de 500 personnes d\'aider, vont vous expliquer comment le cerveau réagit face à la peur.  Avec leur expérience, ils vont vous aider à dépasser cette peur pour être capable de prendre l\'avion en tout confort.', 'Vaincre la peur en avion', 'Syllabus', 'peur avion conférence Piché', '<p>&nbsp;</p>\n<p><span style=\"font-family: Arial; \"> </span></p>\n<p><span style=\"font-size: medium; \">Lib&eacute;rer vos peurs et votre inconfort en avion<br />\n<span style=\"font-size: small; \">\'\' Voler en tout confort\'\'</span><br />\n<br />\n<strong>Formateurs :</strong><br />\n<br />\n<img border=\"0\" alt=\"\" align=\"left\" style=\"width: 111px; height: 157px\" src=\"http://www.confor.ca/uploads/articles/fdc1a630.jpg\" /></span></p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"> </span></span></p>\n<p>&nbsp;</p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><strong>Commandant Robert Pich&eacute; :</strong><br />\nConf&eacute;rencier reconnu, Commandant de bord depuis plus de 35 ans, ayant r&eacute;ussi l&rsquo;atterrissage d&rsquo;urgence d&rsquo;un Airbus A-330, il pourra vous enseigner les principes de l&rsquo;aviation et r&eacute;pondre &agrave; vos questions.</span></span></p>\n<p>&nbsp;</p>\n<p style=\"text-align: justify; \">&nbsp;</p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"> </span></span></p>\n<p style=\"text-align: justify; \"><img border=\"0\" alt=\"\" align=\"left\" width=\"101\" height=\"126\" src=\"http://www.confor.ca/uploads/articles/362e13e0.jpg\" /></p>\n<p style=\"text-align: justify; \"><span style=\"font-family: Arial; \"> </span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><strong>George Wright :</strong></span></span><br />\n<span style=\"font-size: medium; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"> Formateur, conf&eacute;rencier et th&eacute;rapeute, George est reconnu pour transposer avec savoir et finesse les fondements et origine de la peur.&nbsp; Depuis 2000, notre expert a accompagn&eacute; plus de 400 personnes vers la lib&eacute;ration compl&egrave;te de leurs peurs pour qu&rsquo;ils puissent prendre l&rsquo;avion en tout confort.</span></span><br />\n</span></p>\n<p style=\"text-align: justify; \">&nbsp;</p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">  </span></span><span style=\"font-size: medium; \"> </span></p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><img border=\"0\" alt=\"\" align=\"left\" width=\"101\" height=\"126\" src=\"http://www.confor.ca/uploads/articles/0306d21e.jpg\" /></span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><strong>Florence B&eacute;liard :</strong><br />\nFormatrice, conf&eacute;renci&egrave;re et th&eacute;rapeute, elle accompagne et aide les gens &agrave; se lib&eacute;rer de leurs peurs. Elle est riche d&rsquo;une expertise et d&rsquo;une connaissance acquise depuis plus de 15 ans et offre des solutions et des techniques qui permettent de se lib&eacute;rer.<br />\n&nbsp;</span></span></p>\n<p><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">  </span></span></p>\n<p>&nbsp;<span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n</span></span></p>\n<p><strong><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Description :</span></span></strong></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nLIB&Eacute;RER VOS PEURS ET VOTRE INCONFORT EN AVION est un atelier qui s&rsquo;adresse &agrave; tout individu d&eacute;sireux d&rsquo;en savoir plus sur les principes d&rsquo;aviation et comprendre le fonctionnement du cerveau face aux peurs et la lib&eacute;ration d&eacute;finitive de celles-ci. Comme le proverbe dit : &laquo; La connaissance est l&rsquo;antidote &agrave; la peur. &raquo;<br />\n<br />\n<strong>Objectifs :</strong><br />\n<br />\n&middot; Augmenter la confiance face &agrave; l&rsquo;aviation en g&eacute;n&eacute;ral;<br />\n&middot; Lib&eacute;rer vos peurs afin de prendre l&rsquo;avion ais&eacute;ment;<br />\n&middot; Reprendre le pouvoir dans votre vie.<br />\n</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<strong>Nous r&eacute;pondrons &agrave; vos questions comme :</strong><br />\n</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&middot; C&rsquo;est quoi de la turbulence? &laquo; des poches d&rsquo;air &raquo;<br />\n&middot; Est-ce dangereux des orages &eacute;lectriques? Des &eacute;clairs?<br />\n&middot; Lorsqu&rsquo;il y a du verglas, comment d&eacute;givre-t-on les ailes?<br />\n&middot; Comment &ccedil;a fait pour voler cette grosse masse d&rsquo;acier?<br />\n&middot; Est-ce que le vent peut arracher les ailes?<br />\n&middot; D&rsquo;o&ugrave; provient ma peur?<br />\n&middot; Quoi faire pour me contr&ocirc;ler lorsque j&rsquo;ai peur?<br />\n</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<strong>Contenu :</strong><br />\n<br />\n</span><strong><span style=\"font-family: Arial; \">Dans le cadre de cet atelier, vous verrez :</span></strong></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nLes principes d&rsquo;aviation<br />\n&middot; La m&eacute;t&eacute;orologie<br />\n&middot; Le pilote, les exigences de l&rsquo;emploi, la s&eacute;curit&eacute;<br />\n&middot; Le contr&ocirc;le et le trafic a&eacute;rien<br />\n&middot; La construction et l&rsquo;entretien des avions<br />\n&middot; Les r&eacute;glementations et exigences a&eacute;riennes<br />\n<br />\nLa psychologie et la physiologie<br />\n&middot; Le cerveau et ses programmations<br />\n&middot; Les diff&eacute;rents genres de peurs<br />\n&middot; L&rsquo;origine de ces peurs et la lib&eacute;ration de celles-ci</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<br />\n<strong>Lieu : </strong>Montr&eacute;al, Qu&eacute;bec, Gatineau et dans les r&eacute;gions selon la demande.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<strong>Dur&eacute;e :</strong> 2 jours</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<strong>Informations : </strong>(418) 622-2000 poste 130, 1-877-523-8647</span></span></p>\n<p style=\"text-align: justify; \"><font size=\"3\"><span><a href=\"mailto:info@confor.ca\"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">info@confor.ca</span></span></a></span></font><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\n<br />\n<strong>M&eacute;thodologie :</strong> Informations, exercices de r&eacute;flexion, mises en situation, int&eacute;grations.</span></span></p>', '6UbKHbrgtHpfOqzU.jpg', '19', '0');
INSERT INTO `tblblog` VALUES ('16', '2010-07-09', '8', 'Article écrit par Mme Lortie à propos de la peur en avion.', 'Peur de lavion - tes Ativans ou ma DS', 'Article de Marie-Claude Lortie de la Presse', 'peur avion commandant Piché', '<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Publi&eacute; le 05 juillet 2009 &agrave; 05h00 | Mis &agrave; jour le 05 juillet 2009 &agrave; 05h00</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nPeur de l\'avion: tes Ativan ou ma DS?<br />\n&nbsp;Marie-Claude Lortie<br />\nLa Presse<br />\n&nbsp;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;Imaginez que c\'est comme un petit ruisseau qui frappe un caillou&raquo;, me lance le commandant Robert Pich&eacute; au bout du fil, alors que je l\'implore de me rassurer au sujet des turbulences, ces soubresauts qui me donnent des frissons &agrave; chaque fois que j\'embarque dans un avion.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Un ruisseau? L\'image est efficace. Le pilote, qui s\'est fait conna&icirc;tre en effectuant un atterrissage d\'urgence spectaculaire aux A&ccedil;ores, alors qu\'il &eacute;tait aux commandes d\'un Airbus 330 d\'Air Transat en 2001, en a vu d\'autres. Il parle d\'un ton rassurant presque d&eacute;tach&eacute;, pour ne pas me faire peur. Il ne me dit pas &laquo;y\'a rien l&agrave;&raquo;, mais c\'est tout juste. Je l\'entends et d&eacute;j&agrave; je me sens mieux. Une bonne chose pour lui puisqu\'en marge de son travail de pilote, il donne maintenant des s&eacute;minaires pour aider les gens &agrave; vaincre leur peur de l\'avion pour en finir avec la peur en avion. Il leur explique notamment comment fonctionnent ces grosses b&ecirc;tes, ce qui aide &agrave; &eacute;teindre les craintes irrationnelles.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">&laquo;En 40 ans, ajoute le commandant Pich&eacute;, j\'en ai vu seulement deux fois de la vraie turbulence.&raquo; Bon, me voil&agrave; maintenant convaincue que la troisi&egrave;me fois, ce sera quand je serai &agrave; bord...</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Si tout se passe comme pr&eacute;vu, quand vous lirez ces lignes, je serai &agrave; nouveau sur la terre ferme. Mais entre la r&eacute;daction de ce texte et votre lecture, il y aura un moment difficile: un voyage en avion.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nSept longues heures suspendues dans les nuages que j\'esp&egrave;re passer profond&eacute;ment endormie mais dont je sais que j\'enregistrerai, m&ecirc;me dans mon sommeil, chaque soubresaut.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Apparemment je n\'ai pas tant la phobie de l\'avion qu\'un petit stress post-traumatique. Mon cas ne doit pas &ecirc;tre tr&egrave;s grave car mon envie de voyager est plus forte que mes inqui&eacute;tudes, comme c\'est le cas pour bien des gens. Mais les souvenirs de trois tr&egrave;s mauvaises exp&eacute;riences me hantent et me replongent dans ma peur en avion &agrave; chaque fois que je sens le lourd caisson de m&eacute;tal qui me transporte avoir un petit hoquet.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Depuis l\'accident survenu au d&eacute;but du mois de juin, sur le vol d\'Air France Rio-Paris, sans parler de celui qui est arriv&eacute; cette semaine sur Yemenia Airlines, je me suis rendue compte que je n\'&eacute;tais vraiment pas toute seule. Ces derniers incidents ont d&eacute;clench&eacute;, on dirait, une sorte de ronde de confessions autour de moi. M&ecirc;me des gens calmes et sereins ont d&eacute;velopp&eacute; une petite crainte de l\'avion. Rien de phobique, mais un inconfort, je dirais, appelant m&ecirc;me parfois aux anxiolytiques.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Il faut dire qu\'on est au d&eacute;but de l\'&eacute;t&eacute; et que bien des familles partent en voyage en avion et que la question se pose: quoi faire quand on meurt d\'envie d\'aller en Provence ou en Catalogne et qu\'on a peur de voler? Le timing pour les deux crash, juste avant les vacances, n\'&eacute;tait pas g&eacute;nial.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">La peur en avion n\'est pas exactement anormale, m\'explique Andr&eacute;e Letarte, psychologue au d&eacute;partement des troubles anxieux et de l\'humeur &agrave; l\'h&ocirc;pital Louis-Hyppolite-Lafontaine. Philo-g&eacute;n&eacute;tiquement, nous ne sommes pas programm&eacute;s &agrave; &ecirc;tre assis dans le ciel, en mouvement. &laquo;Il est normal d\'&ecirc;tre d&eacute;stabilis&eacute;&raquo;, dit-elle. Une fois cela reconnu, il faut aussi admettre que prendre l\'avion n\'est pas d&eacute;pourvu &agrave; 100% de danger. Oui il y a des accidents et quand il y en a, ce n\'est pas dr&ocirc;le.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Sauf que, et c\'est l&agrave; la cl&eacute; de la gestion de notre inconfort en avion, il faut aussi comprendre que le risque est tr&egrave;s faible. Tellement faible, qu\'il se compare avantageusement &agrave; celui que l\'on prend &agrave; chaque fois que l\'on prend la voiture.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Chaque ann&eacute;e, lisais-je r&eacute;cemment dans Le Point, il y a au total plus de deux milliards de voyageurs suspendus dans le ciel. Oui, chaque mort dans un &eacute;crasement est 100 % mort. Mais c\'est quand m&ecirc;me une bien petite proportion. Toujours dans Le Point : on a 45 fois plus de risque de mourir en voiture qu\'en train et 90 fois plus qu\'en avion.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">C\'est ce petit discours int&eacute;rieur qu\'il faut se tenir quand on embarque en avion et qu\'on a quelques sueurs froides : &laquo; &Ccedil;a serait bien pire, si je prenais la voiture... &raquo;</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Il y a toutes sortes de fa&ccedil;on de r&eacute;apprendre &agrave; penser quand on embarque dans un avion, continue Mme Letarte et des psychologues peuvent aider les gens qui en sentent le besoin.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Mon truc : me r&eacute;p&eacute;ter que l\'auto c\'est pire, ensuite dormir &eacute;videmment si possible, mais sinon, jouer &agrave; un jeu vid&eacute;o. Quand je suis sur ma DS - je suis pas mal certaine qu\'une PSP aurait le m&ecirc;me effet -- c\'est bizarre, mais mon cerveau arr&ecirc;te de penser &agrave; autre chose. Parfois l\'agent de bord vient me chicaner et me dire de l\'&eacute;teindre au d&eacute;collage et &agrave; l\'atterrissage. Quand je leur explique le probl&egrave;me, ils me laissent tranquille.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Brain Age, Super Mario...</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Non, &ccedil;a ne fait pas tr&egrave;s s&eacute;rieux.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \">Mais je vous le dis, &ccedil;a marche.</span></span></p>\n<p style=\"text-align: justify; \"><span style=\"font-size: medium; \"><span style=\"font-family: Arial; \"><br />\nAtelier peur en avion avec le commandant Pich&eacute;</span></span></p>', 'vFdwNhj6CyTHGdip.jpg', '12', '0');
INSERT INTO `tblcategory` VALUES ('1', 'Coaching');
INSERT INTO `tblcategory` VALUES ('2', 'Famille');
INSERT INTO `tblcategory` VALUES ('3', 'Leadership');
INSERT INTO `tblcategory` VALUES ('4', 'Management');
INSERT INTO `tblcategory` VALUES ('5', 'Psychologie');
INSERT INTO `tblcategory` VALUES ('6', 'Sens de la vie');
INSERT INTO `tblcategory` VALUES ('8', 'Peur en avion');
INSERT INTO `tblcategory` VALUES ('9', 'Santé');
INSERT INTO `tblcategory` VALUES ('10', 'Communication');
INSERT INTO `tblcomment` VALUES ('3', 'Quand à moi je suis plutôt DS! Les pilules ce sont de béquilles!', '16', '2010-07-09 11:07:47', 'Marc Fortin', '', 'marcfortin@hotmail.ca', '0');
INSERT INTO `tblcomment` VALUES ('4', 'Test Comment !', '8', '2010-07-09 11:07:27', 'huunam09', 'xemmex.com', 'huunam09@gmail.com', '1');
INSERT INTO `tblcomment` VALUES ('5', 'Test comment', '8', '2010-07-09 11:07:06', 'admin', 'http://conferences-formations.com', 'admin@confor.ca', '1');
INSERT INTO `tblevent` VALUES ('1', '2010-06-12', 'abc', 'haha', 'acbd', 'sdfr sfs fsa fasf', '1', '1');
INSERT INTO `tblevent` VALUES ('28', '2010-07-07', 'test event', 'test event', 'asda asd dd', '<p>nguoi la noi cuoi con duong</p>\n<p>?</p>', '28', '1');
INSERT INTO `tblevent` VALUES ('29', '2010-07-08', 'Atelier', 'Vaincre la peur en avion', 'peur avion conférencier Piché', '<p>Atelier Qu&eacute;bec</p>\n<p>17 et 18 juillet 2010</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('3', '2010-06-12', 'adjsk dkjs dsk sklfa slkf slkfjl', 'kldsjfasklf jaskldfjlasjflas ', 'skjd', 'kdslfjasf jaslkf jalk f', '1', '0');
INSERT INTO `tblevent` VALUES ('4', '2010-06-12', 'xyzww', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('5', '2010-06-12', 'fdfsd', 'fsfsafsa', 'ddsf', '<p>&nbsp;sdfas fasf<img src=\"http://localhost/confor/system/plugins/fckeditor/editor/images/smiley/msn/angry_smile.gif\" alt=\"\" /></p>', '2', '1');
INSERT INTO `tblevent` VALUES ('6', '2010-06-16', 'sadadasd', 'adsadada', 'adad', '<p>?asd ad ad ad ad a d?d</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('7', '2010-06-16', '7wqeqewqewqe', 'xyzwwsdqweq', 'qwqw', '<p>456sq qw e qqeq</p>\n<p>?</p>', '7', '1');
INSERT INTO `tblevent` VALUES ('8', '2010-06-17', ' skjfh askj fhaskjh fkjas f', 'sfsa fs fsfs fsfsa', 'sfds', 'Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a \"significant change\".\r\n\r\nMr Blair added that the Israeli government would consider the plan in the coming days.\r\n\r\nThe proposal for an \"independent public commission\" into the Gaza convoy raid will be voted on by the Israeli cabinet.\r\n\r\nReacting to the Israeli announcement, Washington described', '1', '1');
INSERT INTO `tblevent` VALUES ('9', '2010-06-17', 'This abc def', 'abc def', 'sdds', '<p>Mr Blair told the BBC Israeli Prime Minister Benjamin Netanyahu had agreed in principle to move from a list of items that are currently permitted into Gaza into a list of prohibited goods - and that was a &quot;significant change&quot;.  Mr Blair added that the Israeli government would consider the plan in the coming days.  The proposal for an &quot;independent public&quot;</p>\n<br />', '29', '1');
INSERT INTO `tblevent` VALUES ('24', '2010-07-02', 'The elephant Song', 'abc', 'abc', '<p>Fusce vehicula, quam non tristique egestas, diam odio iaculis nisi, vel pulvinar justo metus eu erat. Aliquam pretium quam eget urna hendrerit aliquam. Phasellus tempor bibendum est eget auctor. Integer feugiat arcu sit amet lectus cursus malesuad</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('21', '2010-06-18', 'oi con meo', 'con meo dien', 'a b', '<p>Sed vel urna neque, ut ornare lacus. Aenean pretium luctus elit, id dictum dolor varius quis. Morbi venenatis ante quis nunc vehicula pellentesque. Sed et elit eu metus porta egestas. Ut adipiscing dui at dolor lacinia eleifend. Sed et leo neque. Nullam placerat sagittis tristique. In sed cursus purus. Nulla.<br />\n&nbsp;</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('18', '2010-06-17', 'This is a test', 'test', 'tt', '<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris in mi vel enim ornare hendrerit. Morbi sem urna, vulputate non feugiat </p>\n<p>&nbsp;Phasellus velit metus, elementum id pretium vel, rutrum feugiat nulla. Fusce congue, sem in consectetur convallis, enim eros malesuada velit, in vehicula nibh nisl sit amet diam. Nam vel turpis libero. Mauris in lectus felis. Nullam</p>\n<p>&nbsp;</p>', '2', '1');
INSERT INTO `tblevent` VALUES ('19', '2010-06-18', 'whata', 'mmmmm ac ac', 'sac', '<span style=\"font-weight: bold;\">abc def<br />\n</span>', '0', '1');
INSERT INTO `tblevent` VALUES ('22', '2010-06-18', '111111111111111111111', '2222222222222', '3333', '<p>4444444444444444444444444444444444</p>', '10', '1');
INSERT INTO `tblevent` VALUES ('23', '2010-06-18', 'xyz', '2222222222222', '456', '<p>df faf sfsfasdf ads fdsf</p>', '7', '1');
INSERT INTO `tblevent` VALUES ('25', '2010-07-02', 'Hai Dang TEST', 'testnhe', 'abcxx', '<p>ui semper, ipsum quis adipiscing vehicula, lacus augue sollicitudin nisi, et laoreet tortor elit et ante. Sed fermentum neque nec odio consectetur vel laoreet lo</p>', '0', '1');
INSERT INTO `tblevent` VALUES ('26', '2010-07-02', 'Dang test ne`', 'abc', 'def', '<p>abc </p>', '0', '1');
INSERT INTO `tblevent` VALUES ('30', '2010-07-08', 'Test', 'Tester', 'test', '<p>&nbsp;Ceci est un test</p>', '31', '1');
INSERT INTO `tblfeedback` VALUES ('1', '2010-06-30 06:06:55', 'admin send', 'Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply', '2', '8');
INSERT INTO `tblfeedback` VALUES ('2', '2010-06-30 06:06:36', 'admin send', 'Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply', '2', '8');
INSERT INTO `tblfeedback` VALUES ('3', '2010-06-30 06:06:03', 'admin send', '\nTitle :admin send\nBy : admin\n\nMessage :Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply\n', '2', '8');
INSERT INTO `tblfeedback` VALUES ('4', '2010-06-30 07:06:56', 'admin send lai', '\nTitle :admin send\nBy : admin\n\nMessage : Title :admin send By : admin Message :Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply\n', '2', '8');
INSERT INTO `tblfeedback` VALUES ('5', '2010-06-30 07:06:11', 'ticket 21', '\nTitle :admin send lai\nBy : admin\n\nMessage : Title :admin send By : admin Message : Title :admin send By : admin Message :Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply\n', '2', '8');
INSERT INTO `tblfeedback` VALUES ('6', '2010-06-30 07:06:20', 'hoi cai neo', '\nTitle :ticket 21\nBy : admin\n\nMessage : Title :admin send lai By : admin Message : Title :admin send By : admin Message : Title :admin send By : admin Message :Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply Message :Message : You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply\n', '2', '8');
INSERT INTO `tblfeedback` VALUES ('7', '2010-06-30 07:06:37', 'admin send', 'Status : Urgent\n\nMessage :test Your account was created successfully. Login with: Username: huunam09 You need to enter your activation key before you are able to register free domain names. This is an automated message - do not reply ', '3', '8');
INSERT INTO `tblfeedback` VALUES ('8', '2010-06-30 12:06:12', 'Upgrade your subcription', 'Current Membership: \n\n\n\nCurrent Membership Rate: Your payment might be pending. \n\nUpgrade your subcription', '4', '8');
INSERT INTO `tblfeedback` VALUES ('9', '2010-06-30 12:06:02', 'TITLE :Upgrade your subcription', 'TITLE :Upgrade your subcription\nBy : admin\nMESSAGE :Current Membership: Current Membership Rate: Your payment might be pending. Upgrade your subcription\n', '4', '8');
INSERT INTO `tblfeedback` VALUES ('10', '2010-06-30 12:06:02', 'TITLE :TITLE :Upgrade your subcription', 'TITLE :TITLE :Upgrade your subcription\nBy : admin\nMESSAGE :TITLE :Upgrade your subcription By : admin MESSAGE :Current Membership: Current Membership Rate: Your payment might be pending. Upgrade your subcription \n', '4', '8');
INSERT INTO `tblfeedback` VALUES ('11', '2010-06-30 12:06:00', 'TITLE :TITLE :TITLE :Upgrade your subcription', 'TITLE :TITLE :TITLE :Upgrade your subcription\nBy : admin\nMESSAGE :TITLE :TITLE :Upgrade your subcription By : admin MESSAGE :TITLE :Upgrade your subcription By : admin MESSAGE :Current Membership: Current Membership Rate: Your payment might be pending. Upgrade your subcription \n', '4', '8');
INSERT INTO `tblfeedback` VALUES ('12', '2010-06-30 01:06:04', 'huunam09', 'test ticket', '4', '8');
INSERT INTO `tblfeedback` VALUES ('13', '2010-06-30 01:06:26', 'Hello Tham', 'This is test from admin\nHello\nThank you', '5', '8');
INSERT INTO `tblfeedback` VALUES ('14', '2010-06-30 01:06:06', 'Hello test', 'Test sending email from admin to speaker', '5', '8');
INSERT INTO `tblfeedback` VALUES ('15', '2010-06-30 01:06:16', 'huunam09', 'test', '4', '8');
INSERT INTO `tblfeedback` VALUES ('16', '2010-06-30 01:06:08', 'huunam09', 'test', '1', '8');
INSERT INTO `tblfeedback` VALUES ('17', '2010-06-30 01:06:41', 'Hello test', 'Test sending email from admin to speaker', '5', '8');
INSERT INTO `tblfeedback` VALUES ('18', '2010-06-30 01:06:01', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('19', '2010-06-30 01:06:00', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('20', '2010-06-30 01:06:02', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('21', '2010-06-30 01:06:04', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('22', '2010-06-30 01:06:19', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('23', '2010-06-30 01:06:21', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('24', '2010-06-30 01:06:24', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('25', '2010-06-30 01:06:26', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('26', '2010-06-30 01:06:29', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('27', '2010-06-30 01:06:59', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('28', '2010-06-30 01:06:03', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('29', '2010-06-30 01:06:05', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('30', '2010-06-30 01:06:17', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('31', '2010-06-30 01:06:20', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('32', '2010-06-30 01:06:22', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('33', '2010-06-30 01:06:24', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('34', '2010-06-30 01:06:26', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('35', '2010-06-30 01:06:31', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('36', '2010-06-30 01:06:58', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('37', '2010-06-30 02:06:55', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('38', '2010-06-30 02:06:08', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('39', '2010-06-30 02:06:44', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('40', '2010-06-30 02:06:47', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('41', '2010-06-30 02:06:55', 'huunam09', 'test', '1', '8');
INSERT INTO `tblfeedback` VALUES ('42', '2010-06-30 02:06:36', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('43', '2010-06-30 02:06:38', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('44', '2010-06-30 02:06:35', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('45', '2010-06-30 02:06:15', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('46', '2010-06-30 02:06:17', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('47', '2010-06-30 02:06:20', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('48', '2010-06-30 02:06:35', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('49', '2010-06-30 02:06:24', 'huunam09', 'test', '4', '8');
INSERT INTO `tblfeedback` VALUES ('50', '2010-06-30 02:06:09', 'Test sending email', 'Hello test sending from email', '6', '8');
INSERT INTO `tblfeedback` VALUES ('51', '2010-06-30 02:06:26', 'huunam09', 'test', '4', '8');
INSERT INTO `tblfeedback` VALUES ('52', '2010-07-01 03:07:20', 'admin send', '\nTITLE :admin send\nBy : huunam09\nStatus : Ask for a cameraman team\n\nMESSAGE :Current Membership: Bronzes free Current Membership Rate: Your payment might be pending.\nDelete Ticket ', '7', '8');
INSERT INTO `tblshowroom` VALUES ('10', '100021', 'jGmmTrQXX18zjUHS.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('9', '100005', 'TExzgX23ILOVs5Mp.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('8', '100010', 'lOhrO5dI9EFcTmbr.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('11', '100018', 'OymizNIClsOi4rcK.jpg', '0');
INSERT INTO `tblshowroom` VALUES ('12', '100043', '7nUb6d7SLaPFSAOW.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('13', '100030', 'j7vd2SPZtpDZ3Kmi.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('14', '0', 'N4tDUocrw78ILrEr.jpg', '0');
INSERT INTO `tblshowroom` VALUES ('15', '1', 'uw90jDHfGDvjLQ3Z.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('16', '3', 'HwBPsDqssIci6oKf.jpg', '1');
INSERT INTO `tblshowroom` VALUES ('17', '2', 'RPvdELI7CbuczWy3.jpg', '1');
INSERT INTO `tblticket` VALUES ('1', '2010-06-30 06:06:51', 'Test ticket', '2', 'Fusce quam magna, viverra nec tincidunt nec, congue id quam. Suspendisse id porttitor nibh. Aliquam a lectus a nisi bibendum aliquet. Duis vulputate enim volutpat lorem rutrum facilisis accumsan massa gravida. Curabitur convallis dolor ac enim porttitor ac dignissim erat fermentum. Sed lacinia odio quis felis dapibus gravida? Nulla hendrerit urna et orci tincidunt aliquet. Class aptent taciti sociosqu ad litora torquent per conubi', '1', '1');
INSERT INTO `tblticket` VALUES ('2', '2010-06-30 06:06:26', 'test admin cai ', '2', '               You need to enter your activation key before you are able to register free domain names.\n\n\n               This is an automated message - do not reply', '29', '1');
INSERT INTO `tblticket` VALUES ('3', '2010-06-30 07:06:56', 'Test ticket 2', '1', 'test\n\n               Your account was created successfully. Login with:\n\n               Username: huunam09\n\n      \n\n\n               You need to enter your activation key before you are able to register free domain names.\n\n\n               This is an automated message - do not reply\n', '29', '1');
INSERT INTO `tblticket` VALUES ('4', '2010-06-30 12:06:55', 'test ticket new', '2', 'test ticket', '29', '1');
INSERT INTO `tblticket` VALUES ('5', '2010-06-30 01:06:39', 'Test from Tham', '1', 'Test from Tham\nIm testing file', '30', '1');
INSERT INTO `tblticket` VALUES ('6', '2010-06-30 01:06:51', 'Hello test', '1', 'Hello test for sending email', '30', '1');
INSERT INTO `tblticket` VALUES ('7', '2010-07-01 03:07:56', 'admin send', '3', 'Current Membership: Bronzes free\n\nCurrent Membership Rate: Your payment might be pending. ', '29', '1');
INSERT INTO `users` VALUES ('1', '1', 'admin', 'y@gmail.com', 'Webmaster', null, null, '1', 'e10adc3949ba59abbe56e057f20f883e', 'ec2b7ed82bcb1be78b499f87c9c59d1c', '0', '2010-03-03 15:08:38', '118.71.101.144', '0000-00-00 00:00:00', '1', '1', '9', 'en', null, 'pigN5mkKmYioxkxhUiaJ');
INSERT INTO `users` VALUES ('2', '3', 'user1', 'youzun@gmail.com', 'Hai Dang', 'Nguyen', 'XEMMEX', '90', 'e10adc3949ba59abbe56e057f20f883e', '52908bf9f277cc42418007f08a6539df', '0', '2010-06-23 14:06:30', '183.81.36.47', '0000-00-00 00:00:00', '0', '1', '1', 'en', '', null);
INSERT INTO `users` VALUES ('3', '1', 'zun3000', 'zun3000@gmail.com', 'meozzz', 'meo', 'XEMMEX', '121', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no info', null);
INSERT INTO `users` VALUES ('4', '1', 'meocon', 'yugi3k@yahoo.com', 'Con meo con', 'CO MOT', 'XEMMEX.TV', '82', 'e10adc3949ba59abbe56e057f20f883e', 'e712a7d0d43c943295ad1a6a082f57c4', '0', '0000-00-00 00:00:00', '183.81.36.107', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'abc e', null);
INSERT INTO `users` VALUES ('5', '1', 'meomeo', 'abc@yahoo.com', 'MEO Mdosz', 'meo meo', 'dasfaf', '36', 'e10adc3949ba59abbe56e057f20f883e', '8b81ac05676ccaa400f8f24ed5059088', '0', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'af', null);
INSERT INTO `users` VALUES ('28', '1', 'thecuong', 'cuongdt90@gmail.com', 'the cuong', 'dang', 'aprotrain-aptech', '90', 'e10adc3949ba59abbe56e057f20f883e', 'dba146aa7dac2be2a30901a21d19b5d5', '0', '0000-00-00 00:00:00', '117.1.28.231', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'no infos', null);
INSERT INTO `users` VALUES ('35', '1', 'RLabelle', 'rene@confor.ca', 'Labelle', 'Réjean', 'Confor', '224', '8e9c48b394df191d946e78f0eabb58bd', '0', '0', '0000-00-00 00:00:00', '24.203.116.87', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Conférencier, formateur, auteur', null);
INSERT INTO `users` VALUES ('36', '1', 'tham212001', 'tham212001@yahoo.com', 'Tham', 'Le', 'Xemmex', '90', 'e10adc3949ba59abbe56e057f20f883e', '163b3deacb5114eb6d36db81bef727e8', '0', '0000-00-00 00:00:00', '118.69.214.193', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Test paypal', null);
INSERT INTO `users` VALUES ('31', '1', 'xemmex', 'michael.webber@xemmex.com', 'May Webber', 'Michael', 'XemmeX', '224', 'fd2a748726310daee26ba75690a5ef8e', '42f8f3a1965af1ce3cd094c842db6b68', '0', '0000-00-00 00:00:00', '24.203.116.87', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'ABC', null);
INSERT INTO `users` VALUES ('32', '1', 'robertpiche', 'rene@confor.ca', 'Piché', 'Robert', 'Confor', '224', '925d51c5a276dc14d7eacf989682609f', '17c0c70e18de1cdcaa16f8e9a401bd77', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Le Commandant Robert Piché va vous expliquer c\'est quoi de la turbulence.', null);
INSERT INTO `users` VALUES ('33', '1', 'georgewright', 'rene@groupe-ace.com', 'Wright', 'George', 'Groupe Confor', '224', '925d51c5a276dc14d7eacf989682609f', '0', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Conférencier, formateur, expert pour la peur en avion', null);
INSERT INTO `users` VALUES ('34', '1', 'linebolduc', 'rene@confor.ca', 'Bolduc', 'Line', 'Groupe Confor', '224', '925d51c5a276dc14d7eacf989682609f', '0', '0', '0000-00-00 00:00:00', '205.237.48.52', '0000-00-00 00:00:00', '1', '1', '1', 'en', 'Conférencière, formatrice et auteure', null);
INSERT INTO `video_settings` VALUES ('1', '320', '240', '128', '96', '*.avi,*.mp4,*.flv,*.mpg,*.asf,*.3gp,*.mmv,*.mpe,*.mpeg,*.ogv,*.rm,*.wmv,*.ts', '500', '4:3', '500000', '64', '22050', '20', '1', '1');
INSERT INTO `videos` VALUES ('1', '2', 'Suspendisse faucibus turpis(en)', 'Suspendisse faucibus turpis(f)', 'Suspendisse faucibus turpis ac velit mollis tempus. Phasellus a pretium augue. Integer sapien mi, vestibulum ac volutpat a, feugiat vel odio. Donec vitae ante et metus vehicula tempus at at lectus. Ut tellus nunc, mattis eget accumsan nec, sodales sed dolor. Quisque leo nulla, elementum vel porta sit amet, laoreet sed sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ips', 'Suspendisse faucibus turpis ac velit mollis tempus. Phasellus a pretium augue. Integer sapien mi, vestibulum ac volutpat a, feugiat vel odio. Donec vitae ante et metus vehicula tempus at at lectus. Ut tellus nunc, mattis eget accumsan nec, sodales sed dolor. Quisque leo nulla, elementum vel porta sit amet, laoreet sed sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ips', '10', 'aaa', '1278926658', '0', '', '0', '0', '0', '0', '0', '0', 'BEJNBfhtwjHziiLW1278926654.flv', 'BEJNBfhtwjHziiLW1278926654.jpg', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `videos` VALUES ('2', '2', ' Nulla neque felis (en)', ' Nulla neque felis (f)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum dui, bibendum vel rhoncus vitae, vulputate vel tortor. Nulla neque felis', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum dui, bibendum vel rhoncus vitae, vulputate vel tortor. Nulla neque felis', '10', 'aaa', '1278926785', '0', '', '0', '0', '0', '0', '0', '0', 'v3KULHKiByyssc0y1278926782.flv', 'v3KULHKiByyssc0y1278926782.jpg', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `videos` VALUES ('3', '36', 'abc (en)', 'abc (f)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum dui, bibendum vel rhoncus vitae, vulputate vel tortor. Nulla neque felis', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum dui, bibendum vel rhoncus vitae, vulputate vel tortor. Nulla neque felis', '1', 'aaa bbb', '1278926877', '0', '', '0', '0', '0', '0', '0', '0', 'cOaBOrNhNueomZju1278926873.flv', 'cOaBOrNhNueomZju1278926873.jpg', '0', '0', '0', '0', '0', '0', '0', '1', '0');
