SELECT u.nickname, c.email, c.password
FROM users AS u
LEFT JOIN credentials AS c ON u.credential_id = c.id
WHERE c.email LIKE '%co.uk'
ORDER BY c.email;