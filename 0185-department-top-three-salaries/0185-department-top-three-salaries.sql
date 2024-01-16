WITH cte as(
SELECT
    D.name as Department,
    e.name as Employee,
    salary as Salary,
    DENSE_RANK() OVER(PARTITION BY D.name ORDER BY salary DESC) as d_rank
FROM    
    Employee as e INNER JOIN  Department as d ON departmentId = d.id
)

SELECT
    Department, Employee, Salary
FROM
    cte
WHERE
    d_rank < 4