SELECT DISTINCT c.name AS category_name
FROM categories AS c
  LEFT JOIN reports AS r ON c.id = r.category_id
  LEFT JOIN users AS u ON r.user_id = u.id
WHERE substr(u.birthdate, 6) = substr(r.open_date, 6)
ORDER BY c.name