CREATE FUNCTION ufn_get_salary_level(salary DOUBLE)
  RETURNS VARCHAR(20)
  BEGIN
    DECLARE salary_level VARCHAR(20);

    IF salary < 30000
    THEN
      SET salary_level := 'Low';

    ELSEIF salary >= 30000 AND salary <= 50000
      THEN
        SET salary_level = 'Average';

    ELSE SET salary_level = 'High';

    END IF;

    RETURN salary_level;
  END