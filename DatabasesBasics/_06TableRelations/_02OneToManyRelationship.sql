CREATE TABLE `manufacturers` (
  `manufacturer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `established_on` date DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `models` (
  `model_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `manufacturer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `fk_manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `fk_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

INSERT INTO `manufacturers` (`manufacturer_id`, `name`, `established_on`)
VALUES
  (1,'BMW','1916-03-01'),
  (2,'Tesla','2003-01-01'),
  (3,'Lada','1966-05-01');

INSERT INTO `models` (`model_id`, `name`, `manufacturer_id`)
VALUES
  (101,'X1',1),
  (102,'i6',1),
  (103,'Model S',2),
  (104,'Model X',2),
  (105,'Model 3',2),
  (106,'Nova',3);