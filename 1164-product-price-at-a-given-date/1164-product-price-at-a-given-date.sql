WITH tmp as (SELECT
                product_id, MAX(change_date) as change_date, new_price
             FROM
                 Products
            WHERE
                change_date < '2019-08-17'
            GROUP BY
                product_id
            )
SELECT 
    product_id,
    new_price as price
FROM
    Products
WHERE 
    (product_id, change_date) IN (SELECT product_id, change_date FROM tmp)

UNION

SELECT
    product_id,
    10 price
FROM
    Products
WHERE 
    product_id NOT IN (SELECT product_id FROM tmp)
