CREATE FUNCTION udf_get_reports_count(employee_id INT, status_id INT)
  RETURNS INT
  BEGIN
    DECLARE reports_cnt INT;
    SET reports_cnt := (
      SELECT COUNT(*) AS cnt
      FROM reports AS r
      WHERE r.employee_id = employee_id AND r.status_id = status_id
    );
    RETURN reports_cnt;
  END;