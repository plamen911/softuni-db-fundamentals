SELECT
  `project_id`  AS `id`,
  `name`        AS `Name`,
  `description` AS `Description`,
  start_date,
  end_date
FROM projects
ORDER BY start_date,
  `name`,
  `id`
LIMIT 10