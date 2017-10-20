SELECT
  title,
  is_active
FROM chats
WHERE
  (is_active = 0 AND char_length(title) < 5)
  OR
  (substr(title, 3, 2) LIKE 'tl')
ORDER BY title DESC