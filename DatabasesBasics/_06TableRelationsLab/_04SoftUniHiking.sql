SELECT
  r.starting_point                       AS route_starting_point,
  r.end_point                            AS route_ending_point,
  r.leader_id                            AS leader_id,
  CONCAT(c.first_name, ' ', c.last_name) AS `leader_name`
FROM routes r
  LEFT JOIN campers c ON (c.id = r.leader_id)