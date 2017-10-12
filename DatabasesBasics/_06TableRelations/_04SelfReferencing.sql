CREATE TABLE `teachers` (
  `teacher_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

INSERT INTO `teachers` (`teacher_id`, `name`, `manager_id`)
VALUES
  (101,'John',NULL),
  (102,'Maya',106),
  (103,'Silvia',106),
  (104,'Ted',105),
  (105,'Mark',101),
  (106,'Greta',101);

ALTER TABLE `teachers` ADD CONSTRAINT `fk_teacher_id` FOREIGN KEY (`manager_id`) REFERENCES `teachers` (`teacher_id`);
