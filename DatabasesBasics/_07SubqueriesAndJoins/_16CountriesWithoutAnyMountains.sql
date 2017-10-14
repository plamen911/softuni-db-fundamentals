SELECT COUNT(*) AS country_count
FROM countries AS c
  LEFT JOIN mountains_countries AS m ON c.country_code = m.country_code
  LEFT JOIN mountains AS o ON m.mountain_id = o.id
WHERE o.id IS NULL