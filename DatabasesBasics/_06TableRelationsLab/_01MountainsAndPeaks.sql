CREATE TABLE `mountains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `peaks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mountain_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_peaks_mountains` (`mountain_id`),
  CONSTRAINT `fk_peaks_mountains` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;