# Write your MySQL query statement below

WITH cum as (
SELECT
    turn,
    person_id,
    person_name,
    SUM(weight) OVER (ORDER BY turn ASC) as cumulative
FROM
    Queue
)

SELECT
    person_name
FROM
    cum
WHERE
    cumulative <= 1000
ORDER BY
    cumulative desc
LIMIT 
    1