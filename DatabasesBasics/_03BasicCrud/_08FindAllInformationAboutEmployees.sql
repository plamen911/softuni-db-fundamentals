SELECT
  employee_id   AS id,
  first_name    AS `First Name`,
  last_name     AS `Last Name`,
  middle_name   AS `Middle Name`,
  job_title     AS `Job Title`,
  department_id AS `DeptID`,
  manager_id    AS `MngrID`,
  hire_date     AS `HireDate`,
  salary        AS `salary`,
  address_id
FROM employees
WHERE job_title LIKE 'Sales Representative'
ORDER BY employee_id