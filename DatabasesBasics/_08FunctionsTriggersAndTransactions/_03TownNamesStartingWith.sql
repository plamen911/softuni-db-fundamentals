CREATE PROCEDURE usp_get_towns_starting_with(keyword VARCHAR(40))
  BEGIN
    SELECT `name` AS `town_name`
    FROM towns
    WHERE SUBSTR(`name`, 1, LENGTH(keyword)) LIKE keyword
    ORDER BY `name`;
  END