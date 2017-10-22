CREATE TRIGGER tr_close_reports
BEFORE UPDATE ON reports
FOR EACH ROW
  BEGIN
    DECLARE report_id INT;
    SET report_id := OLD.id;

    IF (OLD.close_date IS NOT NULL)
    THEN
      SET NEW.status_id = 3;
    END IF;
  END