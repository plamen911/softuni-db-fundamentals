SELECT p.peak_name AS peak_name, r.river_name AS river_name,
  LOWER(CONCAT(p.peak_name, r.river_name)) AS mix
FROM peaks p, rivers r
WHERE SUBSTR(p.peak_name, -1) = SUBSTR(r.river_name, 1, 1)
ORDER BY mix;