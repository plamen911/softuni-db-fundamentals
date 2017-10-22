SELECT
  CONCAT(e1.first_name, ' ', e1.last_name) AS `name`,

  CONCAT((SELECT COUNT(*) AS closed_reports
          FROM reports AS r
            LEFT JOIN employees AS e ON r.employee_id = e.id
          WHERE (
                  r.close_date IS NOT NULL
                  OR (
                    r.open_date < '2016-01-01 00:00:00'
                    AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
                  )
                )
                AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
                AND e.id = e1.id
         ),
         '/',

         (
           SELECT COUNT(*) AS open_reports
           FROM reports AS r
             LEFT JOIN employees AS e ON r.employee_id = e.id
           WHERE r.open_date >= '2016-01-01 00:00:00'
                 AND r.open_date <= '2016-12-31 23:59:59'
                 AND r.close_date IS NULL
                 AND e.id = e1.id
         )
  )                                        AS closed_open_reports

FROM employees AS e1
WHERE
  (SELECT COUNT(*) AS closed_reports
   FROM reports AS r
     LEFT JOIN employees AS e ON r.employee_id = e.id
   WHERE (
           r.close_date IS NOT NULL
           OR (
             r.open_date < '2016-01-01 00:00:00'
             AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
           )
         )
         AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
         AND e.id = e1.id
  )
  OR
  (
    SELECT COUNT(*) AS open_reports
    FROM reports AS r
      LEFT JOIN employees AS e ON r.employee_id = e.id
    WHERE r.open_date >= '2016-01-01 00:00:00'
          AND r.open_date <= '2016-12-31 23:59:59'
          AND r.close_date IS NULL
          AND e.id = e1.id
  )

ORDER BY `name`;

DECLARE DELIMITER $$
CREATE FUNCTION ufn_closed_reports(employee_id INT)
  RETURNS INT
  BEGIN
    RETURN (SELECT COUNT(*) AS closed_reports
            FROM reports AS r
              LEFT JOIN employees AS e ON r.employee_id = e.id
            WHERE (
                    r.close_date IS NOT NULL
                    OR (
                      r.open_date < '2016-01-01 00:00:00'
                      AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
                    )
                  )
                  AND r.close_date >= '2016-01-01 00:00:00' AND r.close_date <= '2016-12-31 23:59:59'
                  AND e.id = employee_id
    );
  END $$
DECLARE DELIMITER $$
CREATE FUNCTION ufn_open_reports(employee_id INT)
  RETURNS INT
  BEGIN
    RETURN (
      SELECT COUNT(*) AS open_reports
      FROM reports AS r
        LEFT JOIN employees AS e ON r.employee_id = e.id
      WHERE r.open_date >= '2016-01-01 00:00:00'
            AND r.open_date <= '2016-12-31 23:59:59'
            AND r.close_date IS NULL
            AND e.id = employee_id
    );
  END $$