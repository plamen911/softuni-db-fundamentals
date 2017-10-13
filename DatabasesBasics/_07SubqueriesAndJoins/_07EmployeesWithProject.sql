SELECT
  e.employee_id,
  e.first_name,
  p.name AS project_name
FROM employees e
  LEFT JOIN employees_projects AS m ON e.employee_id = m.employee_id
  LEFT JOIN projects AS p ON m.project_id = p.project_id
WHERE p.start_date > '2002-08-13 23:59:59'
      AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5
