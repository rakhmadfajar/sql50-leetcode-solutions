WITH e2 as (SELECT
    *
FROM
    Employees
WHERE
    reports_to IS NOT null)

SELECT
    e.employee_id, 
    e.name,
    COUNT(e2.employee_id) as reports_count,
    ROUND(AVG(e2.age), 0) as average_age
FROM
    Employees as e INNER JOIN e2 ON e.employee_id = e2.reports_to
GROUP BY
    e.employee_id
ORDER BY
    e.employee_id