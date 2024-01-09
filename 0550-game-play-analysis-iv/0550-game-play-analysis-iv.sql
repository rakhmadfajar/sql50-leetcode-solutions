WITH cte as (
    SELECT 
        player_id, MIN(event_date) as minevent
    FROM
        Activity
    GROUP BY 
        player_id
)

SELECT
    ROUND(SUM(CASE WHEN DATE_ADD(minevent, INTERVAL 1 DAY)= event_date THEN 1 ELSE 0 END) / COUNT(DISTINCT(a.player_id)), 2) as fraction
FROM
    Activity as a INNER JOIN cte as c ON a.player_id = c.player_id