-- A query that displays the five most expensive products supplied by suppliers based in London or Tokyo.

-- The columns should be product_name and unit_price only.

-- Results should be sorted in descending order of price

SELECT
    p.product_name,
    p.unit_price
FROM products p 
JOIN suppliers s
    USING(supplier_id)
WHERE s.city = 'London'
    OR s.city = 'Tokyo'
ORDER BY p.unit_price DESC
LIMIT 5;
