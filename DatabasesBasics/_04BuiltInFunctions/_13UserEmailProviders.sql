SELECT `user_name`,

  `email` AS `Email Provider`,
  POSITION('@' IN `email`) AS pos

FROM users ORDER BY `email`, `user_name`;