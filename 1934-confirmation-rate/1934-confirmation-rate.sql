# Write your MySQL query statement below

SELECT 
    Signups.user_id, ROUND(AVG(IF(Confirmations.action = 'confirmed', 1, 0)), 2) as confirmation_rate
FROM
    Confirmations RIGHT JOIN Signups USING(user_id)
GROUP BY
    Signups.user_id
