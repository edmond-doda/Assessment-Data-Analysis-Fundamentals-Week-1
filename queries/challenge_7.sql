-- A query that displays the number of orders that involved 2 or more products

-- The column should be called count_of_multiple_orders

WITH multiple_product_orders AS (
    SELECT od.order_id
    FROM order_details od
    GROUP BY od.order_id
    HAVING COUNT(*) >= 2
)
SELECT
    COUNT(*) AS count_of_multiple_orders
FROM multiple_product_orders;