CREATE FUNCTION ufn_calculate_future_value(sum DOUBLE, yearly_interest_rate DOUBLE, years DOUBLE)
  RETURNS VARCHAR(20)
  BEGIN
    DECLARE future_value DECIMAL(16, 2);
    SET future_value = (sum * POW(1.0 + yearly_interest_rate, years));
    RETURN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM future_value));
  END

