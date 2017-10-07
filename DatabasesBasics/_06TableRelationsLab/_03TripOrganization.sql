SELECT
  v.driver_id                            AS driver_id,
  v.vehicle_type                         AS vehicle_type,
  CONCAT(c.first_name, ' ', c.last_name) AS `driver_name`
FROM vehicles v
  LEFT JOIN campers c ON (c.id = v.driver_id)