# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: minions
# Generation Time: 2017-10-27 17:22:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table minions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `minions`;

CREATE TABLE `minions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `town_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `town_id` (`town_id`),
  CONSTRAINT `fk_town_id` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `minions` WRITE;
/*!40000 ALTER TABLE `minions` DISABLE KEYS */;

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUES
	(1,'Patrick',12,1),
	(2,'Murdock',16,2),
	(3,'Cassandra',42,3),
	(4,'Rumpy',42,4),
	(5,'Pesho',22,4),
	(6,'Bob',14,6),
	(7,'Cathleen',20,7);

/*!40000 ALTER TABLE `minions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table minions_villains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `minions_villains`;

CREATE TABLE `minions_villains` (
  `minion_id` int(11) unsigned NOT NULL,
  `villain_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`minion_id`,`villain_id`),
  KEY `fk_villain_id` (`villain_id`),
  CONSTRAINT `fk_villain_id` FOREIGN KEY (`villain_id`) REFERENCES `villains` (`id`),
  CONSTRAINT `fk_minion_id` FOREIGN KEY (`minion_id`) REFERENCES `minions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `minions_villains` WRITE;
/*!40000 ALTER TABLE `minions_villains` DISABLE KEYS */;

INSERT INTO `minions_villains` (`minion_id`, `villain_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(3,2),
	(2,3),
	(5,4),
	(1,5),
	(2,5),
	(4,5),
	(5,5),
	(6,7),
	(7,7);

/*!40000 ALTER TABLE `minions_villains` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table towns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `towns`;

CREATE TABLE `towns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `towns` WRITE;
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;

INSERT INTO `towns` (`id`, `name`, `country`)
VALUES
	(1,'PLEVEN','Bulgaria'),
	(2,'New York','USA'),
	(3,'Paris','France'),
	(4,'London','UK'),
	(5,'Berlin','Germany'),
	(6,'Berlin ',NULL),
	(7,'Liverpool ',NULL),
	(8,'YAMBOL','Bulgaria');

/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table villains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `villains`;

CREATE TABLE `villains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `evilness` enum('good','bad','evil','super evil') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `villains` WRITE;
/*!40000 ALTER TABLE `villains` DISABLE KEYS */;

INSERT INTO `villains` (`id`, `name`, `evilness`)
VALUES
	(1,'Gosho','bad'),
	(2,'Andrei','good'),
	(3,'Luke','super evil'),
	(4,'Paul','evil'),
	(5,'Leonsio','evil'),
	(6,'No minions','good'),
	(7,'Gru','evil');

/*!40000 ALTER TABLE `villains` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
