SELECT
  r.open_date,
  r.description,
  u.email AS reporter_email
FROM reports AS r
  LEFT JOIN categories AS c ON r.category_id = c.id
  LEFT JOIN departments AS d ON c.department_id = d.id
  LEFT JOIN users AS u ON r.user_id = u.id
WHERE r.close_date IS NULL

      AND r.category_id IS NOT NULL
      AND r.user_id IS NOT NULL

      AND CHAR_LENGTH(r.description) > 20
      AND r.description LIKE '%str%'
      AND d.id IN (1, 4, 5)
ORDER BY r.open_date, u.email, r.id


