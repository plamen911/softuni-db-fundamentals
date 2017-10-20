INSERT INTO messages (`content`, `sent_on`, `chat_id`, `user_id`)
  SELECT
    CONCAT(u.`age`, '-', u.`gender`, '-', L.`latitude`, '-', L.longitude)         AS `content`,
    '2016-12-15'                                                                  AS `sent_on`,
    IF(u.`gender` LIKE 'F', CEIL(SQRT(u.`age` * 2)), ROUND(POW(u.`age` / 18, 3))) AS `chat_id`,
    u.`id`                                                                        AS `user_id`
  FROM `users` AS u
    LEFT JOIN locations AS L ON u.location_id = L.id
  WHERE u.`id` >= 10 AND u.`id` <= 20
        AND L.id IS NOT NULL
