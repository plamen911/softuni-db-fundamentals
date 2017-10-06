SELECT `user_name`,
  SUBSTR(`email`, POSITION('@' IN `email`) + 1) AS `Email Provider`
FROM users ORDER BY `Email Provider`, `user_name`;