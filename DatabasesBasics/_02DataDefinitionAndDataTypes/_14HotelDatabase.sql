DROP TABLE IF EXISTS `bed_types`;

CREATE TABLE `bed_types` (
  `bed_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`bed_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `bed_types` WRITE;
/*!40000 ALTER TABLE `bed_types` DISABLE KEYS */;

INSERT INTO `bed_types` (`bed_type`, `notes`)
VALUES
  ('bed type 1','bed type 1'),
  ('bed type 2','bed type 2'),
  ('bed type 3','bed type 3');

/*!40000 ALTER TABLE `bed_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `account_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`account_number`, `first_name`, `last_name`, `phone_number`, `emergency_name`, `notes`)
VALUES
  ('1','Bruce','Lee','123','Bruce',NULL),
  ('2','Arnold','Shcwarzenegger','123','Arni',NULL),
  ('3','Silvester','Stallone','123','Sly',NULL);

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `title`, `notes`)
VALUES
  (1,'John','Doe','Mr.',NULL),
  (2,'Alain','Delon','Mr.',NULL),
  (3,'Maria','Shriver','Mrs.',NULL);

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table occupancies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `occupancies`;

CREATE TABLE `occupancies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date_occupied` date DEFAULT NULL,
  `account_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_applied` float(10,2) DEFAULT NULL,
  `phone_charge` float(10,2) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `occupancies` WRITE;
/*!40000 ALTER TABLE `occupancies` DISABLE KEYS */;

INSERT INTO `occupancies` (`id`, `employee_id`, `date_occupied`, `account_number`, `room_number`, `rate_applied`, `phone_charge`, `notes`)
VALUES
  (1,1,'2017-09-30','1','1',200.00,31.00,NULL),
  (2,2,'2017-09-30','2','2',42.00,1.00,NULL),
  (3,1,'2017-09-30','1','1',4000.00,560.00,NULL);

/*!40000 ALTER TABLE `occupancies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `account_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_date_occupied` date DEFAULT NULL,
  `last_date_occupied` date DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL,
  `amount_charged` float(10,2) DEFAULT NULL,
  `tax_rate` float(10,2) DEFAULT NULL,
  `tax_amount` float(10,2) DEFAULT NULL,
  `payment_total` float(10,2) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;

INSERT INTO `payments` (`id`, `employee_id`, `payment_date`, `account_number`, `first_date_occupied`, `last_date_occupied`, `total_days`, `amount_charged`, `tax_rate`, `tax_amount`, `payment_total`, `notes`)
VALUES
  (1,1,'2017-09-30','1','2017-09-01','2017-09-01',0,200.00,300.00,400.00,500.00,NULL),
  (2,1,'2017-09-30','1','2017-09-01','2017-09-01',0,200.00,300.00,400.00,500.00,NULL),
  (3,1,'2017-09-30','1','2017-09-01','2017-09-01',0,200.00,300.00,400.00,500.00,NULL);

/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_status`;

CREATE TABLE `room_status` (
  `room_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`room_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;

INSERT INTO `room_status` (`room_status`, `notes`)
VALUES
  ('1','vacant'),
  ('2','closed'),
  ('3','reserved');

/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_types`;

CREATE TABLE `room_types` (
  `room_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`room_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;

INSERT INTO `room_types` (`room_type`, `notes`)
VALUES
  ('1','type 1'),
  ('2','type 2'),
  ('3','type 3');

/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `room_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `room_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bed_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `room_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;

INSERT INTO `rooms` (`room_number`, `room_type`, `bed_type`, `rate`, `room_status`, `notes`)
VALUES
  ('1','1','bed type 1',200,'1',NULL),
  ('2','1','bed type 2',300,'1',NULL),
  ('3','1','bed type 3',400,'1',NULL);

/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;