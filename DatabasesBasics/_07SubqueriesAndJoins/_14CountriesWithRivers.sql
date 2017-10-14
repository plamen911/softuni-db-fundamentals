SELECT
  c.country_name,
  i.river_name
FROM countries AS c
  LEFT JOIN continents AS o ON c.continent_code = o.continent_code
  LEFT JOIN mountains_countries AS m ON c.country_code = m.country_code
  LEFT JOIN countries_rivers AS r ON c.country_code = r.country_code
  LEFT JOIN rivers AS i ON r.river_id = i.id
WHERE o.continent_name LIKE 'Africa'
ORDER BY c.country_name
LIMIT 5

