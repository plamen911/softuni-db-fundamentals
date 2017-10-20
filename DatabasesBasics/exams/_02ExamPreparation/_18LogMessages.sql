CREATE TABLE `messages_log` (
  `id`      INT(11) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200)     DEFAULT NULL,
  `sent_on` DATE             DEFAULT NULL,
  `chat_id` INT(11)          DEFAULT NULL,
  `user_id` INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;

CREATE TRIGGER tr_deleted_messages
AFTER DELETE ON messages
FOR EACH ROW
  BEGIN
    INSERT INTO messages_log (id, content, sent_on, chat_id, user_id)
    VALUES (OLD.id, OLD.content, OLD.sent_on, OLD.chat_id, OLD.user_id);
  END;