```
SELECT TIMESTAMPDIFF(YEAR, '1972-10-19', CURDATE()) AS `age`;
```

```
DELIMITER $$
CREATE PROCEDURE udp_submit_review(customer_id INT, review_content VARCHAR(255), review_grade INT, airline_name VARCHAR(30))
BEGIN
    DECLARE airline_id INT;
    SET airline_id := (SELECT a.airline_id FROM airlines AS a WHERE a.airline_name = airline_name);
    IF (airline_id IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Airline does not exist.';
    END IF;
    INSERT INTO customer_reviews (review_content, review_grade, airline_id, customer_id) 
    VALUES (review_content, review_grade, airline_id, customer_id);
END $$
```