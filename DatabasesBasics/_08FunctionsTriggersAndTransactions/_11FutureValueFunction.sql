CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(16, 2), yearly_interest_rate DECIMAL(16, 2), years DECIMAL(16, 2))
  RETURNS DECIMAL(16, 2)
  BEGIN
    DECLARE future_value DECIMAL(16, 2);
    SET future_value = (sum * POW(1.00 + yearly_interest_rate, years));
    RETURN future_value;
  END

