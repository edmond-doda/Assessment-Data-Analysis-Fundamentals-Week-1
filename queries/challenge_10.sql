-- A query that displays the name of the third most expensive product(s) for each category.

-- The columns should be category_name, product_name.

-- Results should be sorted alphabetically by category.

WITH CTE AS  (
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY c.category_name ORDER BY p.unit_price DESC)AS row,
        c.category_name,
        p.product_name
    FROM products p 
    JOIN categories c 
        USING(category_id)
    ORDER BY c.category_name
)
SELECT
    category_name,
    product_name
FROM CTE
WHERE row = 3;

