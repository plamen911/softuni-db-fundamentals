UPDATE employees
SET salary = salary + salary * 0.12
WHERE department_id IN (1, 2, 4, 11);

SELECT salary AS `Salary`
FROM employees
ORDER BY employee_id;