SELECT u.username
FROM users AS u
  LEFT JOIN reports AS r ON u.id = r.user_id
WHERE (
        u.username REGEXP '^[0-9]+'
        AND r.category_id = substr(u.username, 1, 1)
      )
      OR
      (
        u.username REGEXP '[0-9]$'
        AND r.category_id = substr(u.username, -1)
      )
ORDER BY u.username