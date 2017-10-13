SELECT
  e.first_name,
  e.last_name,
  t.name,
  a.address_text
FROM towns AS t
  LEFT JOIN addresses AS a ON t.town_id = a.town_id
  RIGHT JOIN employees AS e ON a.address_id = e.address_id
ORDER BY e.first_name, e.last_name
LIMIT 5