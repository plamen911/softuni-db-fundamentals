SELECT
  c.name   AS category_name,
  COUNT(*) AS employees_number
FROM employees AS e
  LEFT JOIN departments AS d ON e.department_id = d.id
  LEFT JOIN categories AS c ON d.id = c.department_id
WHERE c.id IS NOT NULL
GROUP BY c.id
ORDER BY c.name
