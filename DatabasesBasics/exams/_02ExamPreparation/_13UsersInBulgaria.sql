SELECT
  u.nickname,
  c.title,
  L.latitude,
  L.longitude
FROM users AS u
  JOIN `locations` AS `L` ON `L`.`id` = `u`.`location_id`
  JOIN `users_chats` AS `uc` ON `uc`.`user_id` = `u`.`id`
  JOIN `chats` AS `c` ON `c`.`id` = `uc`.`chat_id`
WHERE L.latitude >= 41.139999 AND L.latitude <= 44.129999
      AND L.longitude BETWEEN 22.209999 AND 28.359999
ORDER BY c.title
