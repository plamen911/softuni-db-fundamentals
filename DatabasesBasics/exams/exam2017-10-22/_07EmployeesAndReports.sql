SELECT
  e.first_name,
  e.last_name,
  r.description,
  LEFT(r.open_date, 10) AS open_date
FROM reports AS r
  LEFT JOIN employees AS e ON r.employee_id = e.id
WHERE e.id IS NOT NULL
      AND r.open_date IS NOT NULL
ORDER BY r.employee_id, r.open_date, r.id