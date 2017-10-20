CREATE PROCEDURE udp_send_message(IN user_id INT, IN chat_id INT, IN content VARCHAR(200))
  BEGIN
    IF (0 = (SELECT COUNT(*)
             FROM users_chats
             WHERE users_chats.`user_id` = user_id))
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'There is no chat with that user!';
    END IF;

    INSERT INTO messages (content, sent_on, chat_id, user_id) VALUES (content, '2016-12-15', chat_id, user_id);
  END;