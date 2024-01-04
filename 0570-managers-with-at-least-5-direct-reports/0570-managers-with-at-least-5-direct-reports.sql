SELECT
    name
FROM 
    Employee INNER JOIN (
        SELECT
            managerId
        FROM
            Employee
        GROUP BY
            managerId
        HAVING
            COUNT(managerId) > 4) as a ON a.managerId = Employee.id