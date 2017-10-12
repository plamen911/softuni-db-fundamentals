SELECT
  m.mountain_range AS mountain_range,
  p.peak_name      AS peak_name,
  p.elevation      AS peak_elevation
FROM peaks AS p
  LEFT JOIN mountains AS m ON (m.id = p.mountain_id)
  WHERE p.mountain_id = 17
ORDER BY p.elevation DESC