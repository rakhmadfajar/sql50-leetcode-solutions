# Write your MySQL query statement below


SELECT
    p.product_id, IF(SUM(units) IS NOT NULL, ROUND((SUM(units * price))/SUM(units), 2), 0) as average_price
FROM
    UnitsSold as u RIGHT JOIN Prices as p ON u.product_id = p.product_id AND  u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id