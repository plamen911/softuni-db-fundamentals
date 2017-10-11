CREATE TABLE `passports` (
  `passport_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passport_number` varchar(40) NOT NULL,
  PRIMARY KEY (`passport_id`),
  UNIQUE KEY `passport_number` (`passport_number`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

CREATE TABLE `persons` (
  `person_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `salary` DECIMAL(10,2) DEFAULT '0.00',
  `passport_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `passport_id` (`passport_id`),
  KEY `passport_id_2` (`passport_id`),
  CONSTRAINT `fk_password_id` FOREIGN KEY (`passport_id`) REFERENCES `passports` (`passport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*
CREATE TABLE `passports` (
  `passport_id` INT PRIMARY KEY AUTO_INCREMENT,
  `passport_number` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `persons` (
  `person_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(60),
  `salary` DECIMAL(10,2),
  `passport_id` INT UNIQUE,
  CONSTRAINT fk_password_id
  FOREIGN KEY (passport_id) REFERENCES passports (passport_id)
);
*/

INSERT INTO `passports` (`passport_id`, `passport_number`)
VALUES
  (102,'K65LO4R7'),
  (101,'N34FG21B'),
  (103,'ZE657QP2');

INSERT INTO `persons` (`person_id`, `first_name`, `salary`, `passport_id`)
VALUES
  (1,'Roberto',43300.00,102),
  (2,'Tom',56100.00,103),
  (3,'Yana',60200.00,101);