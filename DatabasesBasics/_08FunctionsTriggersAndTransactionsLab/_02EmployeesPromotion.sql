DELIMITER //
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
  BEGIN
    UPDATE employees
    SET salary = salary + employees.salary * 0.05
    WHERE employees.department_id = (
      SELECT departments.department_id
      FROM departments
      WHERE departments.name LIKE department_name
    );
  END //