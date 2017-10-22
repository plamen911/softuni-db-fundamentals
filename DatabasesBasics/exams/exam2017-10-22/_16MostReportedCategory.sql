SELECT
  d.name AS department_name, c.name AS category_name,

  ROUND(COUNT(c.id) / (
    SELECT COUNT(*) FROM reports r1
      LEFT JOIN categories c1 ON c1.id = r1.category_id
      LEFT JOIN departments d1 ON c1.department_id = d1.id
    WHERE d1.id = d.id
  ) * 100) AS percentage

FROM departments AS d
  LEFT JOIN categories AS c ON d.id = c.department_id
  LEFT JOIN reports AS r ON c.id = r.category_id
WHERE r.id IS NOT NULL
GROUP BY c.id
ORDER BY d.name, c.name, percentage DESC
