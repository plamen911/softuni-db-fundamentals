SELECT
  c.id    AS id,
  c.title AS tittle,
  m.id    AS id
FROM chats AS c
  LEFT JOIN messages AS m ON c.id = m.chat_id
WHERE m.sent_on < '2012-03-26'
      AND c.title LIKE '%x'
ORDER BY c.id,
  m.id

