#
# TABLE STRUCTURE FOR: catalogs
#

DROP TABLE IF EXISTS `catalogs`;

CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Разделы интернет-магазина';

INSERT INTO `catalogs` (`id`, `name`) VALUES ('1', 'Процессоры');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('2', 'Материнские платы');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('3', 'Видеокарты');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('4', 'Жесткие диски');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('5', 'Оперативная память');


#
# TABLE STRUCTURE FOR: discounts
#

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Скидки';

INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('1', 1, 1, '9', '1990-03-05 14:09:43', '1981-09-29 04:57:12', '1977-10-20 21:04:36', '2011-12-05 01:00:10');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('2', 2, 2, '1', '1989-12-27 14:47:12', '2008-04-19 11:14:21', '1991-04-30 07:55:19', '1991-11-03 10:16:41');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('3', 3, 3, '8', '2000-05-10 22:47:16', '2018-10-03 15:52:29', '2014-01-18 15:38:30', '2018-11-22 04:02:16');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('4', 4, 4, '0', '1988-12-01 12:57:06', '2004-10-06 07:40:36', '1997-02-03 01:04:01', '1991-05-28 06:32:27');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('5', 5, 5, '1', '2004-11-27 07:03:55', '1971-07-14 19:46:09', '1985-03-31 04:40:16', '1972-12-24 18:31:55');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('6', 6, 6, '5', '1991-05-31 05:14:01', '1977-05-16 02:01:53', '1974-05-30 23:59:53', '2013-03-17 16:16:52');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('7', 1, 7, '10', '1980-07-06 10:14:42', '2015-10-12 19:23:11', '1986-08-09 15:32:48', '1996-02-06 22:36:16');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('8', 2, 1, '0', '2002-10-23 04:09:15', '2003-05-24 02:13:21', '1973-04-11 20:59:23', '1992-05-17 13:37:49');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('9', 3, 2, '1', '1972-07-20 11:56:23', '1987-07-17 15:35:24', '2002-02-07 21:07:38', '1998-01-12 07:16:41');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('10', 4, 3, '8', '2011-10-29 17:26:43', '2001-06-11 09:13:03', '2004-11-19 23:34:47', '1972-08-09 19:42:03');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('11', 5, 4, '4', '1981-12-16 07:36:37', '1996-08-31 12:02:09', '1979-03-29 06:33:05', '1986-09-23 03:54:24');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('12', 6, 5, '8', '2011-07-19 04:59:31', '1980-04-04 18:52:26', '2009-06-10 21:04:05', '2003-05-27 13:13:35');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('13', 1, 6, '3', '1972-08-14 20:51:17', '1994-10-04 10:12:16', '2002-11-15 04:09:52', '1995-03-31 12:11:32');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('14', 2, 7, '3', '1998-05-08 04:38:55', '2000-04-12 17:18:38', '2014-09-07 22:08:00', '2013-10-31 18:22:39');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('15', 3, 1, '2', '2007-02-21 13:05:53', '1982-08-18 19:58:24', '1988-05-07 10:26:07', '1994-06-30 22:25:26');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('16', 4, 2, '9', '2012-11-24 09:08:44', '1970-09-02 06:42:53', '1978-12-22 19:44:08', '1985-10-03 11:40:53');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('17', 5, 3, '7', '2014-01-30 10:36:20', '2005-08-16 22:25:36', '1984-07-17 03:46:01', '1982-08-20 14:35:33');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('18', 6, 4, '4', '2010-11-24 21:03:50', '2019-05-07 08:17:26', '2015-04-30 15:41:44', '1999-05-24 23:41:26');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('19', 1, 5, '5', '1971-07-21 22:14:32', '1996-02-16 20:41:18', '1977-03-14 18:47:44', '2008-08-28 21:19:34');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('20', 2, 6, '6', '1996-05-16 12:59:14', '1977-03-10 08:13:00', '1975-03-06 14:40:26', '1977-10-15 12:35:48');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('21', 3, 7, '2', '1983-06-20 02:42:19', '1980-04-22 18:16:23', '2008-09-12 04:15:45', '1995-06-22 11:17:08');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('22', 4, 1, '8', '2019-03-28 02:27:28', '1989-11-10 18:34:15', '1975-03-20 14:48:42', '2012-09-03 15:06:28');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('23', 5, 2, '8', '2013-11-11 07:07:21', '1973-02-17 20:19:24', '2020-02-23 01:04:48', '1984-02-17 00:40:55');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('24', 6, 3, '7', '1973-03-26 06:30:08', '2002-07-23 14:02:05', '2010-10-08 15:44:05', '1991-08-06 01:47:35');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('25', 1, 4, '9', '1994-08-06 08:03:50', '1981-10-10 13:01:41', '2004-06-28 00:25:08', '2005-05-15 18:32:12');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('26', 2, 5, '2', '2011-01-25 19:25:12', '1997-11-25 04:42:09', '1983-09-29 10:17:18', '1992-07-03 02:49:15');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('27', 3, 6, '2', '1983-08-28 12:29:50', '2009-11-09 21:03:44', '2011-04-13 01:24:46', '1998-02-23 10:56:41');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('28', 4, 7, '9', '1975-11-03 09:01:32', '1989-05-04 08:00:04', '2006-02-21 07:45:28', '1993-12-11 17:22:21');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('29', 5, 1, '2', '1972-08-31 00:13:17', '1977-06-15 22:40:20', '1998-06-22 08:10:46', '1991-04-15 05:22:18');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('30', 6, 2, '1', '1996-10-14 00:31:29', '1985-07-02 12:48:54', '1979-12-21 11:43:29', '2013-04-10 00:31:33');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('31', 1, 3, '5', '1985-11-28 08:46:25', '2004-06-21 16:03:51', '1992-11-20 12:28:33', '2015-10-01 23:50:57');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('32', 2, 4, '10', '1976-11-21 18:27:53', '1990-10-27 21:50:55', '2009-06-24 21:57:29', '2015-04-10 21:32:43');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('33', 3, 5, '10', '2015-05-27 21:34:07', '1981-11-27 14:56:38', '2011-01-28 15:11:36', '1998-03-10 10:05:35');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('34', 4, 6, '6', '2012-02-09 22:23:35', '2013-01-16 13:43:23', '1976-04-06 17:29:53', '1996-06-21 08:30:14');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('35', 5, 7, '8', '2008-01-18 08:45:41', '1983-09-02 22:42:19', '1991-11-18 09:16:28', '1999-10-11 03:30:08');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('36', 6, 1, '0', '1980-09-13 05:40:41', '1993-02-27 00:34:14', '2005-11-05 09:29:31', '2001-10-06 00:44:33');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('37', 1, 2, '5', '1996-02-18 12:30:55', '1991-07-31 01:01:17', '1975-09-27 12:20:24', '2014-03-30 02:37:52');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('38', 2, 3, '1', '1981-09-25 17:15:53', '1998-12-12 18:56:25', '2007-06-11 13:04:54', '1984-05-13 22:23:23');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('39', 3, 4, '3', '1978-04-11 18:55:02', '1998-01-07 17:17:09', '1975-08-23 20:29:52', '2006-12-29 00:04:23');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('40', 4, 5, '3', '1970-05-31 04:17:27', '2017-07-08 18:51:24', '1997-07-16 00:11:33', '2002-04-17 16:34:55');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('41', 5, 6, '1', '2011-12-11 22:10:03', '2003-06-21 23:47:31', '1990-04-06 19:32:10', '1982-12-17 18:57:00');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('42', 6, 7, '2', '1986-08-15 12:50:11', '2005-12-10 02:32:32', '1970-02-07 16:08:55', '2006-03-01 02:25:19');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('43', 1, 1, '8', '1993-07-27 01:22:11', '2015-06-11 14:44:21', '1976-12-16 16:22:39', '2016-12-18 13:31:11');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('44', 2, 2, '9', '2008-07-03 01:51:08', '1971-06-13 04:16:49', '2008-01-16 10:38:06', '2008-07-03 08:23:01');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('45', 3, 3, '10', '2014-08-07 21:12:16', '2020-06-28 07:02:19', '1998-11-30 13:20:52', '2009-10-21 12:56:09');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('46', 4, 4, '0', '2013-05-18 08:31:06', '1991-04-22 00:24:10', '2003-05-05 22:46:23', '1971-04-25 01:58:10');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('47', 5, 5, '2', '2001-04-08 06:18:52', '1988-04-04 17:39:59', '2020-03-08 07:55:16', '1989-04-17 02:41:39');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('48', 6, 6, '3', '1997-12-25 14:36:38', '2002-10-16 00:40:06', '2015-10-09 06:54:07', '2002-10-20 09:16:58');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('49', 1, 7, '2', '2018-06-22 10:58:01', '1981-02-08 07:18:00', '1997-07-27 19:13:21', '1985-05-10 13:56:48');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('50', 2, 1, '9', '1982-12-19 14:43:57', '2009-05-19 06:31:15', '1998-06-01 03:56:52', '2002-11-13 09:39:13');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('51', 3, 2, '9', '1998-08-01 21:52:21', '1970-11-04 02:34:26', '1976-08-10 23:32:36', '1999-07-13 05:09:15');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('52', 4, 3, '10', '1982-10-24 12:43:54', '1972-06-15 20:16:55', '1975-08-02 11:06:32', '1989-12-08 17:36:35');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('53', 5, 4, '5', '2007-10-26 15:11:24', '2011-08-30 11:58:15', '1985-03-28 21:48:04', '1983-04-10 02:43:26');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('54', 6, 5, '0', '1984-03-31 15:51:59', '2003-07-25 12:03:20', '2006-12-14 22:37:41', '1988-09-13 07:19:58');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('55', 1, 6, '6', '1989-10-13 04:30:41', '1987-02-20 11:50:45', '1979-01-16 10:00:29', '1970-12-05 13:28:25');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('56', 2, 7, '0', '2016-03-25 13:54:34', '2001-01-23 08:34:10', '2003-05-07 01:54:23', '1972-04-29 14:26:21');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('57', 3, 1, '1', '1981-09-06 02:15:33', '1981-09-10 17:41:45', '1988-01-26 11:21:48', '1988-08-30 19:50:39');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('58', 4, 2, '2', '2018-11-14 10:09:04', '1978-05-18 19:34:46', '1992-05-20 07:12:27', '1992-10-21 11:09:33');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('59', 5, 3, '8', '1987-08-02 00:38:28', '2019-07-21 01:01:29', '2001-08-27 01:24:17', '1971-10-29 08:49:30');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('60', 6, 4, '6', '1982-09-30 20:54:37', '2017-03-03 12:52:15', '2002-11-03 09:05:08', '2014-09-13 13:50:02');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('61', 1, 5, '6', '2017-07-04 16:17:54', '1994-01-03 08:36:22', '2018-02-04 23:10:23', '2014-09-28 19:35:16');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('62', 2, 6, '6', '2012-06-21 01:55:06', '1992-09-10 04:24:19', '1975-10-04 22:10:57', '1988-08-01 23:34:05');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('63', 3, 7, '8', '2001-09-23 15:51:01', '2018-03-04 09:37:08', '2013-12-24 21:32:34', '2013-12-26 05:57:51');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('64', 4, 1, '1', '1980-09-15 07:11:08', '1979-05-17 21:13:27', '1989-12-19 17:43:45', '1996-12-18 18:24:24');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('65', 5, 2, '5', '1978-02-09 04:44:23', '1975-12-12 20:40:37', '1994-11-02 21:49:41', '2002-07-04 07:47:27');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('66', 6, 3, '8', '1996-09-11 17:37:47', '1987-03-03 02:29:41', '1982-06-25 20:52:34', '2013-10-10 13:28:08');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('67', 1, 4, '10', '1978-12-18 04:22:03', '2016-06-12 01:06:17', '1981-11-21 04:07:34', '1973-01-21 19:26:34');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('68', 2, 5, '1', '2008-11-25 19:29:37', '2000-02-05 12:00:09', '1992-04-04 04:06:29', '1975-03-11 06:38:13');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('69', 3, 6, '8', '2016-08-21 03:12:38', '1976-06-09 02:36:54', '1977-04-15 15:54:40', '2009-04-14 18:02:54');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('70', 4, 7, '8', '1970-03-14 18:43:22', '1990-02-15 18:02:10', '2013-03-06 14:03:33', '1978-07-29 03:49:52');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('71', 5, 1, '6', '2001-08-25 17:54:15', '1974-01-01 10:38:10', '2013-08-30 16:19:46', '1974-03-27 06:29:10');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('72', 6, 2, '3', '1972-08-08 04:00:57', '2015-06-19 04:19:38', '2014-04-15 08:55:04', '1986-03-19 00:31:56');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('73', 1, 3, '9', '1976-08-16 15:38:27', '2016-07-07 18:30:11', '1976-03-07 06:49:05', '2001-03-27 03:04:05');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('74', 2, 4, '4', '2010-09-29 13:41:04', '2007-01-01 02:01:57', '2015-12-28 19:56:11', '2008-06-02 05:43:19');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('75', 3, 5, '2', '1977-09-21 12:29:08', '2006-02-28 18:18:36', '1980-07-20 02:20:07', '1993-12-20 08:39:23');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('76', 4, 6, '5', '2000-08-24 16:23:45', '1998-04-05 00:22:25', '2007-07-31 12:24:25', '2010-02-26 11:23:55');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('77', 5, 7, '9', '1975-10-20 08:47:55', '1995-10-31 15:45:24', '2014-04-19 10:58:21', '1970-12-23 15:53:44');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('78', 6, 1, '8', '2016-08-30 17:51:13', '2000-08-22 05:29:28', '2020-07-30 20:12:38', '1998-12-18 21:37:40');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('79', 1, 2, '4', '1999-06-04 19:04:51', '1980-07-04 00:41:29', '1982-01-08 00:55:35', '1987-03-31 06:10:31');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('80', 2, 3, '6', '1970-05-18 22:59:52', '2002-12-05 03:20:55', '1980-06-19 12:58:01', '2005-02-11 11:25:14');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('81', 3, 4, '7', '1979-02-19 08:49:46', '1989-07-06 18:45:34', '1981-09-26 13:19:16', '1978-01-01 09:10:37');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('82', 4, 5, '0', '1973-07-17 12:02:33', '2020-01-27 08:12:03', '2000-11-26 21:58:56', '2009-07-22 06:44:42');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('83', 5, 6, '7', '1982-11-16 17:33:18', '2004-06-01 06:17:04', '1982-04-06 17:02:55', '1998-08-23 21:20:16');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('84', 6, 7, '4', '1983-05-26 22:41:56', '1984-06-15 23:52:33', '1982-05-04 11:24:38', '1999-04-20 17:14:49');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('85', 1, 1, '3', '1982-10-27 21:08:54', '1990-08-09 13:17:13', '1974-10-07 01:05:08', '2009-06-30 06:33:09');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('86', 2, 2, '9', '1979-01-11 20:41:13', '1997-02-19 20:19:32', '1970-12-07 10:24:19', '2012-08-05 05:47:32');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('87', 3, 3, '3', '1970-01-08 21:59:45', '1977-08-26 07:56:46', '2018-04-04 13:51:26', '2000-04-25 06:48:08');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('88', 4, 4, '4', '1990-11-14 19:02:14', '2016-11-04 16:05:22', '2005-12-26 22:03:56', '1975-01-14 00:26:20');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('89', 5, 5, '4', '1990-11-03 03:36:01', '2009-05-17 15:21:45', '1997-05-31 23:37:14', '2006-04-14 03:35:04');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('90', 6, 6, '1', '1981-06-01 00:17:00', '2004-08-11 22:39:40', '1976-11-12 14:51:52', '1972-05-07 13:45:20');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('91', 1, 7, '10', '1990-12-04 03:01:00', '1991-04-20 14:06:41', '2007-01-23 18:58:00', '2010-02-27 04:36:23');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('92', 2, 1, '2', '1997-03-14 20:00:27', '2012-01-30 12:44:29', '1996-11-21 14:49:09', '2009-06-14 17:43:35');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('93', 3, 2, '4', '1982-03-13 23:39:56', '1979-04-23 16:24:07', '2019-09-05 05:35:54', '1970-05-30 10:37:45');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('94', 4, 3, '9', '1996-12-21 17:33:57', '2009-04-13 09:08:49', '2018-04-18 09:34:16', '1976-01-10 16:05:28');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('95', 5, 4, '0', '2011-02-19 03:35:31', '2006-05-20 10:27:35', '1974-07-19 06:47:04', '2006-08-24 15:30:43');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('96', 6, 5, '10', '1977-06-16 20:04:21', '1976-12-14 01:29:14', '1987-06-25 13:42:05', '2006-03-29 03:31:27');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('97', 1, 6, '5', '1993-04-14 07:45:06', '1989-02-07 01:17:53', '2017-07-07 04:51:52', '2010-10-24 06:06:31');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('98', 2, 7, '8', '2018-12-02 19:00:40', '1977-05-24 18:34:10', '1977-05-11 02:57:34', '1990-05-17 01:58:26');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('99', 3, 1, '1', '2011-01-14 08:13:16', '1984-08-06 17:31:16', '1979-08-01 23:19:49', '2008-10-24 10:07:07');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('100', 4, 2, '3', '2003-10-20 03:57:10', '2006-04-19 00:19:17', '1972-08-25 19:16:19', '2014-10-27 19:39:53');


#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', 1, '1985-01-06 03:33:00', '2000-03-15 08:06:25');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', 2, '1986-08-25 18:34:23', '2000-05-29 05:39:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', 3, '1999-01-14 07:32:12', '1980-02-03 14:35:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', 4, '1982-09-24 10:24:22', '2017-03-08 11:51:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', 5, '2009-03-12 13:37:09', '1996-05-14 00:31:05');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', 6, '2019-02-22 20:08:10', '1995-04-16 04:26:28');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', 1, '2010-09-16 13:30:19', '1988-12-02 15:10:12');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', 2, '1975-06-27 02:02:51', '1998-02-15 09:51:01');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', 3, '1971-03-09 04:47:07', '1980-08-04 10:43:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', 4, '2001-02-01 07:07:38', '1970-02-13 11:26:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('11', 5, '1983-02-06 02:51:47', '2020-02-05 03:41:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('12', 6, '2013-04-09 00:36:02', '1971-07-16 00:22:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('13', 1, '1983-10-22 04:41:05', '1993-06-06 12:34:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('14', 2, '1975-07-20 22:15:38', '2016-02-27 19:37:42');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('15', 3, '1982-03-23 14:17:02', '1981-03-25 07:48:23');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('16', 4, '2009-01-06 11:55:26', '1970-04-03 12:10:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('17', 5, '1978-05-08 19:42:43', '2002-05-18 21:12:30');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('18', 6, '2010-03-05 08:39:33', '2013-02-14 07:22:18');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('19', 1, '1980-12-22 14:16:15', '1989-05-22 13:00:36');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('20', 2, '2018-09-21 09:11:48', '1986-05-14 13:27:23');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('21', 3, '1995-01-30 01:21:02', '2011-02-15 21:14:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('22', 4, '2014-01-20 12:50:02', '2008-09-02 13:10:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('23', 5, '2002-05-27 22:06:45', '2000-02-25 09:22:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('24', 6, '1985-11-02 16:07:31', '1990-01-21 08:02:51');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('25', 1, '1991-07-19 06:44:22', '2010-11-26 07:21:42');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('26', 2, '1986-10-17 20:08:13', '1999-03-05 18:21:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('27', 3, '2001-03-18 12:56:59', '1993-05-22 23:34:47');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('28', 4, '2016-05-21 04:17:43', '1995-10-04 08:50:29');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('29', 5, '1970-11-21 04:55:43', '2020-01-24 22:32:23');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('30', 6, '2020-03-16 00:08:13', '1994-11-25 11:34:53');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('31', 1, '1997-05-16 22:06:47', '1994-04-05 14:11:39');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('32', 2, '1999-08-05 00:29:41', '2017-03-05 21:35:59');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('33', 3, '1980-09-15 16:11:10', '1984-03-29 08:36:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('34', 4, '1977-01-06 03:32:18', '2020-05-12 05:47:22');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('35', 5, '1977-01-04 03:40:25', '2006-09-19 10:44:41');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('36', 6, '2005-12-24 18:08:28', '2001-06-29 13:13:55');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('37', 1, '2007-12-14 17:03:49', '1975-06-29 16:42:00');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('38', 2, '1985-04-14 23:36:01', '2020-02-11 11:05:45');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('39', 3, '1973-01-02 08:42:17', '1979-02-04 17:38:54');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('40', 4, '1990-11-14 11:03:00', '2012-04-08 20:14:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('41', 5, '1987-01-03 14:39:57', '1979-10-17 21:38:11');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('42', 6, '2019-10-16 09:55:42', '1986-01-06 01:48:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('43', 1, '1975-10-20 16:46:00', '2015-10-02 20:35:54');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('44', 2, '2000-10-10 00:16:29', '1980-12-12 17:54:04');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('45', 3, '1976-04-15 21:25:04', '2000-02-22 14:31:48');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('46', 4, '2009-02-09 03:10:54', '1990-12-07 10:11:49');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('47', 5, '1978-01-17 02:37:11', '2003-12-02 19:16:30');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('48', 6, '1980-08-07 08:47:41', '2009-09-15 10:13:24');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('49', 1, '2000-05-22 06:45:39', '2005-04-04 02:56:30');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('50', 2, '1979-09-24 22:17:38', '2008-01-23 09:08:08');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('51', 3, '1994-06-12 19:17:56', '1975-03-09 11:34:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('52', 4, '2012-04-04 15:48:07', '1973-10-17 03:21:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('53', 5, '1975-02-13 22:04:57', '2020-04-16 05:18:37');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('54', 6, '1977-10-30 18:21:18', '1996-02-15 12:30:29');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('55', 1, '1973-09-20 15:48:53', '1993-04-08 19:31:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('56', 2, '1979-04-20 13:41:25', '2016-09-25 07:37:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('57', 3, '1999-01-13 16:21:02', '2009-03-04 01:25:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('58', 4, '1984-05-28 21:55:38', '2003-04-08 20:23:24');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('59', 5, '2014-09-20 05:33:06', '2019-01-11 15:22:21');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('60', 6, '2002-02-11 20:09:42', '1975-12-28 13:17:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('61', 1, '1986-08-14 01:08:29', '1986-11-20 10:23:42');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('62', 2, '1984-05-04 05:27:19', '2010-10-27 17:43:43');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('63', 3, '2014-11-30 19:02:47', '2006-03-01 00:49:07');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('64', 4, '1986-01-01 19:32:15', '1972-03-10 12:56:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('65', 5, '1987-01-03 07:15:06', '1972-03-15 17:59:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('66', 6, '2008-07-12 12:11:31', '1975-10-16 09:02:47');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('67', 1, '1989-05-13 01:59:13', '1993-06-11 02:54:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('68', 2, '1982-06-11 04:18:02', '2018-10-15 22:17:38');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('69', 3, '1995-08-10 00:09:09', '1981-01-15 09:52:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('70', 4, '1991-12-19 16:51:01', '1981-07-04 15:23:19');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('71', 5, '1998-11-01 23:45:48', '1995-09-21 11:58:29');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('72', 6, '1976-11-01 08:59:28', '1992-11-11 23:34:56');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('73', 1, '1981-01-11 19:09:47', '2013-05-23 11:08:11');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('74', 2, '1979-03-02 13:03:01', '1993-03-08 11:10:47');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('75', 3, '1979-10-29 03:11:19', '1974-09-14 22:32:57');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('76', 4, '2014-12-12 06:41:07', '1993-06-10 11:48:44');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('77', 5, '2002-07-20 04:34:07', '2003-03-11 00:30:07');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('78', 6, '1995-05-22 13:49:15', '2004-10-24 04:40:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('79', 1, '1970-02-24 23:57:55', '1972-09-07 03:35:06');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('80', 2, '2014-04-11 20:18:41', '2002-09-16 14:53:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('81', 3, '1971-01-15 23:03:49', '1987-07-27 08:58:35');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('82', 4, '1994-11-19 23:21:02', '1988-04-05 00:36:05');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('83', 5, '1981-05-18 00:30:14', '2012-05-23 22:45:52');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('84', 6, '2011-02-22 17:00:09', '2008-06-05 03:05:17');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('85', 1, '2017-10-08 06:19:21', '2012-03-13 13:45:33');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('86', 2, '1998-11-03 18:40:01', '1970-04-09 15:12:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('87', 3, '1974-12-08 05:55:42', '2011-09-07 08:58:16');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('88', 4, '1997-07-15 09:47:29', '1982-03-08 22:17:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('89', 5, '1974-03-23 12:47:15', '1986-12-14 12:30:19');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('90', 6, '1996-09-23 23:48:20', '1971-04-13 15:44:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('91', 1, '2005-01-04 12:55:35', '2017-05-10 00:46:27');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('92', 2, '2003-12-10 13:17:28', '2016-08-08 09:16:13');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('93', 3, '1992-10-29 10:45:24', '1987-02-07 08:12:30');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('94', 4, '1991-08-01 01:38:31', '1974-07-18 04:53:00');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('95', 5, '1992-02-12 04:06:05', '1984-12-29 10:36:55');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('96', 6, '2000-05-30 16:03:03', '1975-08-14 08:33:20');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('97', 1, '2001-08-11 22:45:44', '1978-09-07 06:01:24');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('98', 2, '2008-11-27 18:25:17', '1975-02-08 00:19:31');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('99', 3, '1979-09-09 13:05:01', '2003-05-18 23:15:14');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('100', 4, '2018-01-15 23:07:56', '2013-07-27 10:17:55');


#
# TABLE STRUCTURE FOR: orders_products
#

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Состав заказа';

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('1', 1, 1, 15, '1991-12-08 11:27:06', '1973-08-04 20:27:08');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('2', 2, 2, 3, '1975-04-24 21:55:33', '1990-08-29 09:03:59');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('3', 3, 3, 2, '2015-11-11 18:02:58', '2005-06-24 00:42:26');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('4', 4, 4, 5, '2007-12-25 13:27:09', '1984-01-02 14:32:41');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('5', 5, 5, 6, '1974-02-26 04:12:26', '1990-04-20 01:47:10');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('6', 6, 6, 12, '1987-05-07 05:16:13', '2019-06-08 06:09:07');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('7', 7, 7, 1, '2016-08-14 06:27:28', '1973-07-16 13:59:57');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('8', 8, 1, 1, '1970-12-21 23:30:51', '1988-05-23 03:03:58');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('9', 9, 2, 4, '2002-06-22 22:06:23', '1990-01-21 18:30:46');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('10', 10, 3, 17, '1993-09-01 07:23:10', '2009-12-11 02:41:17');


#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Товарные позиции';

INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('1', 'Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '7890.00', 1, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('2', 'Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', '12700.00', 1, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('3', 'AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '4780.00', 1, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('4', 'AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', '7120.00', 1, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('5', 'ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', '19310.00', 2, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('6', 'Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', '4790.00', 2, '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`) VALUES ('7', 'MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', '5060.00', 2, '2020-08-30 18:52:37', '2020-08-30 18:52:37');


#
# TABLE STRUCTURE FOR: storehouses
#

DROP TABLE IF EXISTS `storehouses`;

CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Склады';

INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'qui', '1994-11-02 01:44:26', '1993-12-21 13:21:32');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'repudiandae', '1995-09-25 18:43:07', '1996-07-22 23:21:39');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'ipsa', '2006-12-22 23:23:43', '2010-10-28 09:53:48');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'dignissimos', '1998-02-02 02:50:27', '2017-03-12 16:46:51');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'cum', '2018-10-28 20:32:10', '2007-07-22 14:18:16');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('6', 'consequatur', '2016-01-19 15:04:32', '2019-07-16 10:36:18');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('7', 'ea', '1998-05-05 03:42:52', '1996-10-03 22:29:42');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('8', 'velit', '1995-06-22 16:50:21', '2012-08-28 16:11:30');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('9', 'laudantium', '2016-06-16 16:45:40', '1981-11-16 23:56:48');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('10', 'vitae', '2005-01-11 15:58:06', '1978-06-01 17:41:53');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('11', 'blanditiis', '2001-10-21 11:17:47', '1991-04-19 08:24:25');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('12', 'ut', '1998-12-01 14:33:49', '2008-03-24 18:21:09');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('13', 'porro', '1998-07-29 21:19:16', '2004-10-27 03:13:25');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('14', 'nulla', '2001-11-16 07:25:59', '1970-02-25 23:52:26');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('15', 'dolorum', '2016-04-20 09:07:08', '1988-05-05 14:15:57');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('16', 'harum', '1974-05-02 14:29:46', '1985-11-25 00:41:59');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('17', 'odio', '1971-06-15 18:57:20', '1985-10-02 02:52:19');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('18', 'ut', '1995-03-21 18:04:31', '1975-06-22 13:23:45');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('19', 'doloremque', '1994-06-06 05:54:53', '2002-09-07 11:11:30');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('20', 'est', '2004-01-19 21:23:09', '1995-05-27 02:04:24');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('21', 'nesciunt', '1993-09-04 19:33:54', '1992-01-20 20:41:57');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('22', 'nisi', '2014-09-09 09:36:41', '1974-08-23 01:26:41');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('23', 'occaecati', '1996-08-08 18:19:52', '2013-06-03 02:54:47');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('24', 'est', '1993-11-11 23:08:24', '2017-06-14 14:36:57');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('25', 'ut', '1970-12-05 17:01:28', '2007-07-29 22:36:12');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('26', 'qui', '1987-03-16 06:25:18', '1987-05-17 05:30:37');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('27', 'eum', '2018-05-28 13:21:25', '1977-02-18 14:02:55');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('28', 'sint', '1979-01-13 10:15:13', '2009-10-03 15:55:10');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('29', 'impedit', '1994-04-16 14:55:08', '2014-11-06 05:34:03');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('30', 'dolorum', '2004-10-29 05:53:56', '2005-09-05 14:42:47');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('31', 'dolor', '1995-06-05 14:10:23', '1998-08-15 11:57:41');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('32', 'consectetur', '1990-09-15 10:05:11', '1976-06-25 16:06:14');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('33', 'ut', '1976-08-11 01:38:08', '2012-01-24 03:20:52');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('34', 'excepturi', '1993-07-30 23:28:14', '1989-12-06 23:18:29');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('35', 'blanditiis', '1987-10-04 18:55:34', '2002-05-16 12:47:56');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('36', 'nihil', '2007-09-05 00:05:01', '1996-11-18 09:53:52');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('37', 'officiis', '1994-01-04 14:50:06', '2020-07-27 11:58:30');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('38', 'ut', '1975-07-11 11:44:45', '2001-07-13 20:27:22');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('39', 'placeat', '1977-03-21 08:23:28', '2018-03-20 09:28:15');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('40', 'fugiat', '2019-05-30 09:25:42', '2003-05-03 23:44:16');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('41', 'occaecati', '2020-07-06 08:07:56', '1988-02-26 19:35:45');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('42', 'nulla', '1972-05-07 13:17:23', '2005-01-19 05:32:42');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('43', 'aliquid', '1999-02-11 03:06:05', '2000-12-26 23:19:46');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('44', 'eos', '1989-09-17 17:18:43', '1979-06-29 05:48:09');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('45', 'quis', '1984-12-24 15:02:19', '2012-02-10 16:50:28');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('46', 'placeat', '1978-12-28 12:37:49', '1985-12-12 23:31:15');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('47', 'reiciendis', '2004-12-25 17:53:15', '2010-04-17 13:38:26');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('48', 'tempore', '2008-10-03 09:11:42', '1990-02-26 07:41:32');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('49', 'soluta', '2004-08-26 15:33:26', '1991-11-19 04:08:53');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('50', 'aut', '2014-08-30 00:10:15', '1997-03-09 04:42:10');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('51', 'rerum', '1970-01-18 12:23:33', '2003-05-18 13:33:54');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('52', 'autem', '1983-11-28 06:19:14', '1971-12-22 20:17:20');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('53', 'officiis', '1972-07-10 00:14:35', '1972-11-04 17:16:40');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('54', 'provident', '2011-09-27 09:09:23', '1980-01-18 02:35:37');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('55', 'ipsum', '2009-02-11 20:56:12', '1995-12-01 23:52:52');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('56', 'aperiam', '2008-05-16 15:47:14', '2012-02-09 15:15:35');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('57', 'dignissimos', '2017-12-18 13:03:39', '2010-04-02 17:51:13');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('58', 'consequatur', '1988-03-05 01:06:02', '1978-12-07 12:55:05');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('59', 'culpa', '1989-04-26 03:11:38', '1981-05-21 21:13:01');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('60', 'reiciendis', '2020-05-03 10:27:22', '2003-05-18 18:09:54');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('61', 'voluptate', '2018-08-30 04:06:54', '2013-08-26 10:38:34');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('62', 'et', '2001-02-14 13:29:30', '1987-08-30 11:37:50');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('63', 'sint', '2018-01-29 09:12:30', '1991-08-07 06:39:50');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('64', 'doloribus', '2012-08-10 13:49:14', '2016-04-17 20:36:14');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('65', 'doloremque', '2008-08-04 00:57:20', '1982-04-28 20:26:18');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('66', 'ad', '1978-07-22 22:55:16', '1994-06-19 12:34:04');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('67', 'id', '2003-10-27 13:00:13', '2020-07-16 12:17:55');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('68', 'tenetur', '1987-08-30 09:20:18', '2001-09-10 05:40:53');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('69', 'voluptas', '1986-01-09 11:15:27', '2005-05-01 01:07:31');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('70', 'sed', '1972-11-21 16:47:34', '2010-12-29 12:37:27');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('71', 'tempora', '1976-10-24 04:02:21', '2002-08-13 20:05:07');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('72', 'quo', '1987-11-07 02:51:35', '1972-03-09 12:29:20');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('73', 'quibusdam', '2002-02-28 22:59:01', '1998-09-20 12:32:36');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('74', 'eveniet', '1997-09-02 15:17:59', '1986-03-04 11:27:19');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('75', 'cum', '2010-07-03 19:04:34', '1978-03-29 12:42:36');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('76', 'nemo', '2009-05-02 06:05:37', '1976-04-19 18:37:48');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('77', 'quod', '2020-01-26 04:25:49', '1985-10-16 09:04:31');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('78', 'at', '1974-06-15 15:39:00', '2018-11-13 06:59:04');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('79', 'eos', '1983-03-30 01:13:40', '1984-02-06 11:11:24');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('80', 'enim', '1971-12-08 12:39:18', '2014-09-02 10:51:29');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('81', 'quod', '2008-09-25 14:58:18', '1981-06-16 07:40:35');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('82', 'similique', '2002-04-04 06:37:54', '1992-02-11 09:52:43');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('83', 'necessitatibus', '2002-12-21 19:55:30', '1986-05-08 17:34:40');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('84', 'iste', '2005-06-21 19:59:07', '1979-03-03 21:41:22');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('85', 'et', '1977-06-25 10:58:03', '1972-05-21 06:28:57');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('86', 'quos', '1999-04-29 05:48:57', '1987-02-02 16:41:23');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('87', 'est', '1971-07-07 04:51:02', '2017-01-11 10:46:31');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('88', 'vel', '2015-06-04 07:48:41', '1973-06-24 19:52:28');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('89', 'repudiandae', '1993-10-13 22:11:01', '1984-05-19 00:05:16');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('90', 'suscipit', '1980-03-13 07:57:17', '1971-05-26 04:36:42');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('91', 'et', '2009-11-24 20:21:43', '1996-01-01 03:45:29');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('92', 'magni', '1990-08-20 04:36:52', '1992-09-10 18:22:43');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('93', 'omnis', '1989-12-31 04:49:22', '2007-09-09 14:23:25');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('94', 'occaecati', '1993-05-21 02:10:26', '2008-02-28 21:07:06');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('95', 'voluptas', '1971-01-23 23:04:51', '1984-05-26 03:13:50');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('96', 'quia', '1990-06-30 05:09:22', '2014-11-11 22:57:27');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('97', 'sed', '2006-01-11 19:51:35', '2000-05-01 02:52:59');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('98', 'inventore', '1982-05-03 14:20:57', '2013-04-09 15:52:38');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('99', 'tenetur', '2019-02-28 22:21:28', '1984-06-02 02:28:52');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('100', 'dolorem', '1994-06-29 07:27:42', '1987-04-21 18:44:20');


#
# TABLE STRUCTURE FOR: storehouses_products
#

DROP TABLE IF EXISTS `storehouses_products`;

CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Запасы на складе';

INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('1', 1, 1, 5, '1993-06-22 17:20:57', '2016-06-16 17:05:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('2', 2, 2, 4, '1974-09-19 16:38:42', '1998-03-30 06:32:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('3', 3, 3, 1, '1994-04-10 09:35:46', '2005-12-31 22:20:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('4', 4, 4, 10, '2012-06-17 05:15:48', '1978-04-01 17:45:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('5', 5, 5, 6, '2013-12-01 21:12:13', '1979-04-09 07:12:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('6', 6, 6, 7, '1994-07-11 05:26:23', '2018-10-10 12:20:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('7', 7, 7, 1, '1981-05-22 12:10:18', '1999-02-08 16:56:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('8', 8, 1, 7, '1982-05-19 09:35:13', '2009-05-14 09:41:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('9', 9, 2, 5, '1996-11-22 07:04:21', '1986-02-13 19:26:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('10', 10, 3, 3, '2015-05-21 00:20:45', '1997-08-14 02:42:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('11', 11, 4, 0, '2016-08-09 08:35:13', '2001-06-26 14:33:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('12', 12, 5, 3, '1977-02-10 15:33:54', '2008-07-28 18:17:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('13', 13, 6, 5, '2017-10-20 11:05:59', '2000-08-21 07:39:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('14', 14, 7, 10, '1974-08-02 02:51:36', '1994-01-15 11:39:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('15', 15, 1, 0, '2001-07-07 00:57:09', '2016-04-25 13:55:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('16', 16, 2, 3, '1970-03-16 16:57:17', '1997-08-09 15:22:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('17', 17, 3, 9, '1970-02-16 10:06:47', '1998-11-29 08:09:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('18', 18, 4, 2, '2003-07-06 18:47:15', '1972-09-06 09:11:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('19', 19, 5, 6, '2005-01-04 17:58:43', '2002-11-05 17:56:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('20', 20, 6, 6, '2010-01-29 02:27:26', '2009-05-18 00:15:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('21', 21, 7, 5, '2010-11-14 17:04:09', '2007-06-07 20:03:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('22', 22, 1, 1, '1996-11-18 06:22:54', '2003-05-02 14:25:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('23', 23, 2, 4, '2000-07-06 05:30:47', '1978-03-09 10:09:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('24', 24, 3, 5, '1973-10-05 12:40:51', '1988-01-09 10:11:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('25', 25, 4, 1, '2010-06-25 13:58:04', '1971-05-20 04:39:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('26', 26, 5, 3, '2020-05-17 00:03:32', '1978-01-19 22:22:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('27', 27, 6, 5, '2014-12-08 23:42:32', '2009-01-17 22:48:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('28', 28, 7, 0, '2010-08-17 16:21:16', '1977-02-14 22:25:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('29', 29, 1, 0, '2000-07-07 00:49:10', '2007-05-06 10:59:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('30', 30, 2, 0, '1972-07-05 07:28:03', '2002-07-31 18:07:11');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('31', 31, 3, 10, '1978-01-26 15:39:30', '2017-02-08 23:12:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('32', 32, 4, 4, '1976-09-13 17:16:31', '2003-07-14 02:03:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('33', 33, 5, 9, '2013-05-02 19:57:48', '2004-10-26 13:36:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('34', 34, 6, 3, '1990-03-25 07:07:37', '2016-05-13 13:54:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('35', 35, 7, 7, '2015-12-13 16:30:42', '1998-07-23 13:26:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('36', 36, 1, 9, '1974-12-21 07:04:28', '2004-08-10 11:05:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('37', 37, 2, 0, '2009-03-20 19:45:20', '2006-12-19 23:47:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('38', 38, 3, 6, '1997-05-12 22:41:25', '1984-12-23 17:21:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('39', 39, 4, 10, '1976-09-28 23:47:07', '1977-05-27 15:07:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('40', 40, 5, 3, '1993-07-29 06:52:17', '2010-07-18 14:00:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('41', 41, 6, 9, '2016-02-22 19:57:31', '1991-04-24 23:20:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('42', 42, 7, 9, '1986-10-07 23:42:25', '2013-09-07 13:19:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('43', 43, 1, 4, '1970-11-19 12:09:00', '1980-03-24 23:59:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('44', 44, 2, 4, '1980-08-27 18:18:50', '2008-09-16 19:10:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('45', 45, 3, 1, '2005-02-10 06:51:17', '1987-12-05 05:53:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('46', 46, 4, 4, '1978-11-11 05:09:55', '2004-11-09 11:13:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('47', 47, 5, 2, '2016-04-07 04:55:19', '2005-06-14 19:05:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('48', 48, 6, 6, '1984-04-28 18:07:27', '1997-11-05 00:42:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('49', 49, 7, 2, '2006-04-09 19:07:43', '2011-03-08 03:53:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('50', 50, 1, 8, '1985-03-25 09:09:30', '1997-07-22 10:44:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('51', 51, 2, 0, '2006-05-11 03:10:40', '2016-02-11 07:45:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('52', 52, 3, 10, '2018-08-13 10:48:41', '2008-06-30 18:37:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('53', 53, 4, 9, '1975-04-28 21:00:16', '1999-11-03 17:22:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('54', 54, 5, 4, '1983-07-22 17:30:13', '1978-03-04 10:31:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('55', 55, 6, 6, '1991-10-19 12:14:56', '2002-10-01 11:30:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('56', 56, 7, 10, '2013-09-01 07:40:08', '1980-05-27 01:46:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('57', 57, 1, 4, '2009-05-25 08:10:09', '2006-07-19 20:07:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('58', 58, 2, 10, '2006-07-04 07:18:50', '2015-01-08 14:34:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('59', 59, 3, 4, '2020-06-19 19:16:22', '1991-11-10 18:33:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('60', 60, 4, 10, '2002-04-23 20:22:02', '1976-10-11 12:47:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('61', 61, 5, 5, '2012-10-02 02:14:34', '2013-10-10 19:08:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('62', 62, 6, 7, '2016-11-12 10:21:53', '1997-10-28 23:34:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('63', 63, 7, 10, '1977-08-17 08:31:19', '1997-05-09 16:36:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('64', 64, 1, 7, '1984-07-30 02:40:02', '1984-01-11 03:59:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('65', 65, 2, 5, '2007-04-30 15:03:06', '1996-07-15 18:44:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('66', 66, 3, 10, '1991-10-28 13:57:49', '1993-06-16 18:20:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('67', 67, 4, 0, '2014-05-22 02:44:36', '2004-09-26 14:33:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('68', 68, 5, 6, '1981-02-01 04:32:19', '1974-08-07 00:06:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('69', 69, 6, 10, '1989-03-12 12:25:35', '2012-01-18 10:34:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('70', 70, 7, 10, '2007-11-10 13:01:30', '1984-10-24 04:43:36');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('71', 71, 1, 1, '2001-04-08 19:57:10', '2012-11-06 17:51:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('72', 72, 2, 4, '1973-09-12 01:46:18', '2006-09-01 20:35:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('73', 73, 3, 0, '1991-02-19 03:54:25', '2000-06-09 21:15:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('74', 74, 4, 0, '2019-01-18 06:11:07', '1993-05-18 15:55:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('75', 75, 5, 10, '1972-03-14 08:44:23', '2017-08-09 21:02:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('76', 76, 6, 9, '1984-04-09 05:17:17', '2002-11-14 17:13:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('77', 77, 7, 5, '2011-06-30 05:53:49', '1995-12-31 14:16:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('78', 78, 1, 5, '2005-01-14 18:14:11', '2005-12-31 05:42:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('79', 79, 2, 6, '1976-11-15 13:59:58', '2017-09-29 08:23:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('80', 80, 3, 9, '2003-05-29 00:38:35', '1993-11-14 00:16:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('81', 81, 4, 5, '1980-08-01 08:38:35', '2004-04-28 20:52:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('82', 82, 5, 1, '1994-09-06 09:01:32', '2003-08-27 13:03:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('83', 83, 6, 7, '1996-06-10 05:10:44', '1993-08-01 23:12:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('84', 84, 7, 8, '1978-06-23 05:12:05', '1990-09-15 20:12:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('85', 85, 1, 9, '2006-06-02 00:31:25', '1986-10-06 18:18:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('86', 86, 2, 1, '1989-11-27 23:08:22', '2003-08-25 21:26:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('87', 87, 3, 7, '2001-11-29 20:12:08', '2012-06-21 15:16:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('88', 88, 4, 8, '2003-03-28 09:46:05', '2003-02-27 06:54:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('89', 89, 5, 10, '1992-10-15 11:43:00', '2000-09-06 12:43:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('90', 90, 6, 2, '1993-09-26 17:01:38', '1975-02-28 12:38:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('91', 91, 7, 7, '2014-07-09 22:36:57', '2000-10-25 12:13:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('92', 92, 1, 6, '2018-11-24 06:28:02', '2015-05-12 04:42:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('93', 93, 2, 2, '2012-10-27 03:48:34', '1983-04-22 00:37:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('94', 94, 3, 0, '2020-02-25 12:43:31', '1982-01-19 09:10:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('95', 95, 4, 5, '2018-08-27 04:21:25', '2015-05-25 22:02:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('96', 96, 5, 8, '1990-09-01 01:59:20', '2018-05-01 08:46:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('97', 97, 6, 4, '1979-03-06 07:56:44', '1984-10-28 13:43:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('98', 98, 7, 1, '2008-05-25 06:57:23', '2008-06-18 18:07:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('99', 99, 1, 3, '2001-10-15 13:18:05', '1997-10-09 15:51:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('100', 100, 2, 4, '1996-10-26 08:26:13', '1983-08-22 10:01:28');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Покупатели';

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('1', 'Геннадий', '1990-10-05', '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('2', 'Наталья', '1984-11-12', '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('3', 'Александр', '1985-05-20', '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('4', 'Сергей', '1988-02-14', '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('5', 'Иван', '1998-01-12', '2020-08-30 18:52:37', '2020-08-30 18:52:37');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('6', 'Мария', '1992-08-29', '2020-08-30 18:52:37', '2020-08-30 18:52:37');


