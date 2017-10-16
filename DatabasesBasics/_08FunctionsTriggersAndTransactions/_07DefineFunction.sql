CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
  RETURNS TINYINT(1)
  BEGIN
    DECLARE result TINYINT(1);
    SET result = (SELECT word REGEXP CONCAT('^[', set_of_letters, ']+$'));
    RETURN result;
  END
