CREATE FUNCTION ufn_is_word_comprised(set_of_chars VARCHAR(255), word VARCHAR(255))
  RETURNS BOOL
  BEGIN
    DECLARE len INT DEFAULT CHAR_LENGTH(word);
    DECLARE idx INT DEFAULT 1;
    WHILE idx <= len
    DO
      IF locate(SUBSTRING(word, idx, 1), set_of_chars) < 1
      THEN
        RETURN FALSE;
      END IF;
      SET idx = idx + 1;
    END WHILE;
    RETURN TRUE;
  END