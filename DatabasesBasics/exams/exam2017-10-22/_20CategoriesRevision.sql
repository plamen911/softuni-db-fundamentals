SELECT
  c.name      AS category_name,
  COUNT(r.id) AS reports_number,

  (
    CASE WHEN (
                SELECT COUNT(r1.id) AS cnt
                FROM reports r1
                WHERE r1.status_id = 1
                      AND r1.category_id = c.id
              ) > (
                SELECT COUNT(r1.id) AS cnt
                FROM reports r1
                WHERE r1.status_id = 1
                      AND r1.category_id = c.id
              )
      THEN 'waiting'

    WHEN (
           SELECT COUNT(r1.id) AS cnt
           FROM reports r1
           WHERE r1.status_id = 1
                 AND r1.category_id = c.id
         ) < (
           SELECT COUNT(r1.id) AS cnt
           FROM reports r1
           WHERE r1.status_id = 1
                 AND r1.category_id = c.id
         )
      THEN 'in progress'

    ELSE 'equal'
    END
  ) AS 'main_status'

FROM categories AS c
  LEFT JOIN reports AS r ON c.id = r.category_id
WHERE r.status_id IN (1, 2)
GROUP BY c.id
ORDER BY c.name