SELECT
  e.employee_id,
  e.first_name,
  IF(p.start_date >= '2005-01-01 00:00:00', NULL, p.name) AS project_name
FROM employees e
  LEFT JOIN employees_projects AS m ON e.employee_id = m.employee_id
  LEFT JOIN projects AS p ON m.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY p.name
LIMIT 5
