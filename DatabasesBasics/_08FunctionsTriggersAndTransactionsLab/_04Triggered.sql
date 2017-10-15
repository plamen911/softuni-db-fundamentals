CREATE TABLE `deleted_employees` (
  `employee_id`  INT(11) NOT NULL AUTO_INCREMENT,
  `first_name`   VARCHAR(50)      DEFAULT NULL,
  `last_name`    VARCHAR(50)      DEFAULT NULL,
  `middle_name`  VARCHAR(50)      DEFAULT NULL,
  `job_title`    VARCHAR(50)      DEFAULT NULL,
  `department_id` INT(11)          DEFAULT NULL,
  `salary`       DECIMAL(8, 2)    DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
);

CREATE TRIGGER tr_deleted_employees
AFTER DELETE ON employees
FOR EACH ROW
  BEGIN
    INSERT INTO deleted_employees (first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES
      (OLD.first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
  END