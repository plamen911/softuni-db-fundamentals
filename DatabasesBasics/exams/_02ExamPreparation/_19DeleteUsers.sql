CREATE TRIGGER tr_delete_user
  BEFORE DELETE ON users
  FOR EACH ROW
  BEGIN
    DECLARE user_id INT;
    SET user_id := OLD.id;
    DELETE FROM messages_log WHERE messages_log.user_id = user_id;
    DELETE FROM messages WHERE messages.user_id = user_id;
    DELETE FROM users_chats WHERE users_chats.user_id = user_id;
  END;