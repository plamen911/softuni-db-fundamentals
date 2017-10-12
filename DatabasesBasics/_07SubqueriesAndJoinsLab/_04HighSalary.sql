SELECT COUNT(*) AS cnt
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
)