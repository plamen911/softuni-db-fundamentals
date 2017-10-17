CREATE PROCEDURE usp_withdraw_money(IN account_id INTEGER, IN money_amount DECIMAL(19, 4))
  BEGIN
    DECLARE current_balance DECIMAL(19, 4);

    START TRANSACTION;

    UPDATE accounts
    SET accounts.balance = accounts.balance - money_amount
    WHERE accounts.id = account_id;

    SET current_balance := (
      SELECT balance
      FROM accounts
      WHERE id = account_id
    );

    IF (current_balance < 0)
    THEN ROLLBACK;
    ELSEIF (money_amount < 0)
      THEN ROLLBACK;
    ELSE
      COMMIT;
    END IF;
  END;