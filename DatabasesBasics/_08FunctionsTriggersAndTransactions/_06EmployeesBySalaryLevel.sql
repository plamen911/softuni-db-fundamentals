CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(20))
  BEGIN
    IF LOWER(salary_level) LIKE 'low'
    THEN
      SELECT first_name, last_name
      FROM employees
      WHERE salary < 30000
      ORDER BY first_name DESC, last_name DESC;

    ELSEIF LOWER(salary_level) LIKE 'average'
      THEN
        SELECT first_name, last_name
        FROM employees
        WHERE salary >= 30000 AND salary <= 50000
        ORDER BY first_name DESC, last_name DESC;

    ELSEIF LOWER(salary_level) LIKE 'high'
      THEN
        SELECT first_name, last_name
        FROM employees
        WHERE salary > 50000
        ORDER BY first_name DESC, last_name DESC;

    END IF;
  END