SELECT
  c.country_code,
  COUNT(o.mountain_range) AS mountain_range
FROM countries AS c
  LEFT JOIN mountains_countries AS m ON c.country_code = m.country_code
  LEFT JOIN mountains AS o ON m.mountain_id = o.id
WHERE c.country_name IN ('United States', 'Russia', 'Bulgaria')
GROUP BY c.country_code
ORDER BY mountain_range DESC