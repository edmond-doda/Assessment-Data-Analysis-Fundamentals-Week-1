-- A query that displays the percentage of orders that had *any* discount applied.

-- The only column should be 'percentage_discounted'

-- The percentage should be rounded to 2 d.p.


WITH CTE AS (
    SELECT
        COUNT(DISTINCT od.order_id) AS total_orders,
        COUNT(DISTINCT CASE WHEN od.discount > 0 THEN od.order_id END) AS total_discounted_orders
    FROM order_details od
)
SELECT
    ROUND(total_discounted_orders*100.0/ total_orders, 2) AS percentage_discounted
FROM CTE;