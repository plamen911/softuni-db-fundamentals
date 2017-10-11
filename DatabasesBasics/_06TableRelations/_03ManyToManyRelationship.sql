CREATE TABLE `exams` (
  `exam_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `exams` (`exam_id`, `name`)
VALUES
  (101,'Spring MVC'),
  (102,'Neo4j'),
  (103,'Oracle 11g');

CREATE TABLE `students` (
  `student_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `students` (`student_id`, `name`)
VALUES
  (1,'Mila'),
  (2,'Toni'),
  (3,'Ron');

CREATE TABLE `students_exams` (
  `student_id` int(11) unsigned NOT NULL,
  `exam_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  CONSTRAINT `fk_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `students_exams` (`student_id`, `exam_id`)
VALUES
  (1,101),
  (1,102),
  (2,101),
  (2,102),
  (2,103),
  (3,103);



