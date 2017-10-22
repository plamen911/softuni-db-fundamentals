CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `departments` (`id`, `name`)
VALUES
  (1,'Infrastructure'),
  (2,'Aged Care'),
  (3,'Legal'),
  (4,'Emergency'),
  (5,'Roads Maintenance'),
  (6,'Animals Care'),
  (7,'Forestry Office'),
  (8,'Property Management'),
  (9,'Event Management'),
  (10,'Environment');

CREATE PROCEDURE usp_assign_employee_to_report(employee_id INT, report_id INT)
  BEGIN
    DECLARE employee_department_id INT;
    DECLARE report_department_id INT;

    SET employee_department_id := (SELECT e.department_id FROM employees AS e WHERE e.id = employee_id);
    SET report_department_id := (
      SELECT d.id
      FROM reports AS r
        LEFT JOIN categories AS c ON r.category_id = c.id
        LEFT JOIN departments AS d ON c.department_id = d.id
      WHERE r.id = report_id
    );
    IF (employee_department_id <> report_department_id) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee doesn''t belong to the appropriate department!';
    END IF;

    UPDATE reports AS r SET r.employee_id = employee_id WHERE r.id = report_id;
  END;