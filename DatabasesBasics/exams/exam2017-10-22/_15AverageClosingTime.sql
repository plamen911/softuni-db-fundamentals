SELECT
  d.name AS department_name,
  IF(
      (
        SELECT FLOOR(AVG(TIMESTAMPDIFF(DAY, r.open_date, r.close_date)))
        FROM reports AS r
          LEFT JOIN categories AS c ON (c.id = r.category_id)
        WHERE c.department_id = d.id
              AND r.close_date IS NOT NULL
      ) IS NULL,
      'no info',
      (
        SELECT FLOOR(AVG(TIMESTAMPDIFF(DAY, r.open_date, r.close_date)))
        FROM reports AS r
          LEFT JOIN categories AS c ON (c.id = r.category_id)
        WHERE c.department_id = d.id
              AND r.close_date IS NOT NULL
      )

  ) AS average_duration

FROM departments AS d
  LEFT JOIN categories AS c1 ON (c1.department_id = d.id)
  LEFT JOIN reports AS r1 ON (r1.category_id = c1.id)
WHERE r1.open_date IS NOT NULL
GROUP BY d.id
ORDER BY d.name
