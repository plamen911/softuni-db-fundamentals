SELECT
  `c`.`title`,
  `m`.`content`
FROM `chats` AS `c`
  LEFT JOIN `messages` AS `m` ON `c`.`id` = `m`.`chat_id`
WHERE `c`.`start_date` = (SELECT `start_date`
                          FROM `chats`
                          ORDER BY `start_date` DESC
                          LIMIT 1)
ORDER BY `m`.`sent_on`, `m`.`id`