SELECT
  `m`.`id`,
  `m`.`chat_id`,
  `m`.`user_id`
FROM `messages` AS `m`
  LEFT JOIN `users_chats` AS `uc`
    ON `uc`.`user_id` = `m`.`user_id` AND `uc`.`chat_id` = `m`.`chat_id`
WHERE `uc`.`user_id` IS NULL AND `m`.`chat_id` = 17
ORDER BY `m`.`id` DESC