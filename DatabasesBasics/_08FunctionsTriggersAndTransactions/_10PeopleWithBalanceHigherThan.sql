CREATE PROCEDURE usp_get_holders_with_balance_higher_than(amount DECIMAL(19, 4))
  BEGIN
    SELECT
      ah.first_name,
      ah.last_name
    FROM accounts AS a
      INNER JOIN account_holders AS ah
        ON a.account_holder_id = ah.id
    GROUP BY ah.first_name, ah.last_name
    HAVING SUM(a.balance) > amount
    ORDER BY a.id;
  END