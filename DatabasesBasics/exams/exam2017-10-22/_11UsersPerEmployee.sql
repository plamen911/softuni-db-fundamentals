SELECT CONCAT(e.first_name, ' ', e.last_name) AS `name`,
       COUNT(DISTINCT(r.user_id)) AS users_number
FROM employees AS e
  LEFT JOIN reports AS r ON r.employee_id = e.id
GROUP BY e.id
ORDER BY users_number DESC, `name`
