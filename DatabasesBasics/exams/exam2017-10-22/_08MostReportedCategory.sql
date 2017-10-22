SELECT
  c.name               AS category_name,
  COUNT(r.category_id) AS reports_number
FROM reports AS r
  LEFT JOIN categories AS c ON r.category_id = c.id
GROUP BY r.category_id
ORDER BY reports_number, c.name
