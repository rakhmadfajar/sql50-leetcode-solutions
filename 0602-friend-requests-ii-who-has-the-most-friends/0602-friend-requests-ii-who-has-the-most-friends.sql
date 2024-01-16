# Write your MySQL query statement below
WITH c as (
    SELECT
        requester_id, COUNT(requester_id) as total_req
    FROM
        RequestAccepted
    GROUP BY
        requester_id 
UNION ALL
    SELECT
        accepter_id, COUNT(accepter_id) as total_acc
    FROM
        RequestAccepted
    GROUP BY
        accepter_id
)

SELECT 
    requester_id as id, SUM(total_req) as num
FROM
    c
GROUP BY
    requester_id
ORDER BY
    num desc
LIMIT 
    1