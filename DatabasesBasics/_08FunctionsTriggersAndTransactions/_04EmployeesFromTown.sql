CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(60))
  BEGIN
    SELECT
      first_name,
      last_name
    FROM employees
    WHERE address_id IN (
      SELECT addresses.address_id
      FROM addresses
        LEFT JOIN towns ON addresses.town_id = towns.town_id
      WHERE towns.name LIKE town_name
    )
    ORDER BY first_name, last_name, employee_id;
  END