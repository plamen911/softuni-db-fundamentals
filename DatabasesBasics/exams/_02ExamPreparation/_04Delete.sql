DELETE FROM locations
WHERE id NOT IN (
  SELECT users.location_id
  FROM users
  WHERE users.location_id IS NOT NULL
)