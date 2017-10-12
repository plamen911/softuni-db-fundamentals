CREATE TABLE `cities` (
  `city_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `item_types` (
  `item_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `items` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `item_type_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_type_id` (`item_type_id`),
  CONSTRAINT `fk_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_types` (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `orders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `order_items` (
  `order_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customers` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `city_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `orders` ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
ALTER TABLE `order_items` ADD CONSTRAINT `fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);
ALTER TABLE `order_items` ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
ALTER TABLE `customers` ADD CONSTRAINT `fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);
ALTER TABLE `order_items` ADD PRIMARY KEY (`order_id`, `item_id`);


