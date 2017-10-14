CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
  RETURNS DOUBLE
  BEGIN
    DECLARE e_count DOUBLE;
    SET e_count := (
      SELECT COUNT(e.employee_id)
      FROM employees AS e
        LEFT JOIN addresses AS a ON e.address_id = a.address_id
        LEFT JOIN towns AS t ON a.town_id = t.town_id
      WHERE t.name LIKE town_name
    );
    RETURN e_count;
  END