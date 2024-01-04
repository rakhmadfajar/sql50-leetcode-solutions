WITH TMP AS (
    SELECT
        *
    FROM
        Delivery
    GROUP BY
        customer_id
    HAVING
        MIN(order_date) = MIN(customer_pref_delivery_date)
)

SELECT 
    ROUND(((SELECT COUNT(*) FROM TMP) / COUNT(DISTINCT(customer_id)) * 100) , 2) as immediate_percentage
FROM
    Delivery
    