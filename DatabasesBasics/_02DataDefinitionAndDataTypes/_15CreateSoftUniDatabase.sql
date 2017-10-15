CREATE TABLE `towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_text` varchar(50) NOT NULL DEFAULT '',
  `town_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_town_id` (`town_id`),
  CONSTRAINT `fk_town_id` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `job_title` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_id` (`department_id`),
  KEY `fk_address_id` (`address_id`),
  CONSTRAINT `fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;