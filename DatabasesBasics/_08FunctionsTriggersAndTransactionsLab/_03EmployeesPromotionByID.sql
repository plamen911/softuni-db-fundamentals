DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
  BEGIN
    START TRANSACTION;
    IF ((SELECT COUNT(employee_id)
         FROM employees
         WHERE employee_id = id) <> 1)
    THEN ROLLBACK;
    ELSE
      UPDATE employees
      SET salary = salary + employees.salary * 0.05
      WHERE employee_id = id;
    END IF;
  END $$