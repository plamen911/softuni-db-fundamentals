SELECT
  description,
  open_date
FROM reports
WHERE employee_id IS NULL
ORDER BY open_date, description;