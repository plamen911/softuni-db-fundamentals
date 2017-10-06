SELECT `name`, LEFT(`start`, 10) AS `start`
FROM games
WHERE `start` BETWEEN '2011-01-01 00:00:00' AND '2012-12-31 23:59:59'
ORDER BY `start`, `name` LIMIT 50