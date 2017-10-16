CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
  RETURNS TINYINT
  BEGIN
    DECLARE counter INT;
    DECLARE ch VARCHAR(255);
    SET counter = 1;
    WHILE counter < CHAR_LENGTH(word)
    DO
      SET ch = SUBSTRING(word, counter, 1);
      IF (LOCATE(ch, set_of_letters, 1) = 0)
      THEN
        RETURN 0;
      END IF;

      SET counter = counter + 1;
    END WHILE;
    RETURN 1;
  END