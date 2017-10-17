CREATE PROCEDURE usp_deposit_money(IN account_id INTEGER, IN money_amount DECIMAL(19, 4))
  BEGIN
    START TRANSACTION;
    UPDATE accounts
    SET accounts.balance = accounts.balance + money_amount
    WHERE accounts.id = account_id;

    IF money_amount <= 0
    THEN
      ROLLBACK;
    ELSE
      COMMIT;
    END IF;
  END;