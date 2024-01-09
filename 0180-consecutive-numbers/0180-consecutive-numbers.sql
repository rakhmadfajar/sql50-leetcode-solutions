# Write your MySQL query statement below

SELECT 
    DISTINCT(A.num) as ConsecutiveNums
FROM
    Logs A, Logs B, Logs C
WHERE
    A.id = B.id - 1 AND
    A.id = C.id - 2 AND
    A.num = B.num AND
    C.num = B.num
