-- A query that returns details on the difference in price between individual orders (including discount) and the standard warehouse price

-- Products have a standard price, but an additional percentage discount may be applied to the product total

-- The columns should be order_id, expected_price, actual_price, and price_difference

-- Only the top five rows (in descending order of price_difference) should be displayed

-- All values should be rounded to 2 d.p. for display (but otherwise kept at full precision)

WITH CTE AS (
    SELECT
        od.order_id,
        ROUND(SUM(p.unit_price * od.quantity)::NUMERIC, 2) AS expected_price,
        ROUND(SUM((od.unit_price * od.quantity) * (1 - od.discount))::NUMERIC, 2) AS actual_price
    FROM order_details od
    JOIN products p 
        USING(product_id)
    GROUP BY od.order_id
)
SELECT
    *,
    expected_price - actual_price AS price_difference
FROM CTE
ORDER BY price_difference DESC
LIMIT 5;
