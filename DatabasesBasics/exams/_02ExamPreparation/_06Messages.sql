SELECT
  content,
  sent_on
FROM messages
WHERE sent_on > '2014-05-12'
      AND content LIKE '%just%'
ORDER BY id DESC