SELECT
  c.country_code,
  o.mountain_range,
  p.peak_name,
  p.elevation
FROM countries AS c
  LEFT JOIN mountains_countries AS m ON c.country_code = m.country_code
  LEFT JOIN mountains AS o ON m.mountain_id = o.id
  LEFT JOIN peaks AS p ON o.id = p.mountain_id
WHERE c.country_name LIKE 'Bulgaria'
      AND p.elevation > 2835
ORDER BY p.elevation DESC