CREATE PROCEDURE udp_change_password(IN email VARCHAR(30), IN password VARCHAR(20))
  BEGIN
    IF (1 <> (SELECT COUNT(*)
              FROM credentials
              WHERE credentials.`email` LIKE email))
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The email does''t exist!';
    END IF;
    UPDATE credentials
    SET credentials.password = password
    WHERE credentials.email LIKE email;
  END;


