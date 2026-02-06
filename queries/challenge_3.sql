-- A query that displays category_name and product_name only for each product where the product name begins with "S".

-- Results should be ordered alphabetically by category_name and product_name

SELECT
    c.category_name,
    p.product_name
FROM products p
JOIN categories c
    USING(category_id)
WHERE p.product_name LIKE 'S%'
ORDER BY c.category_name, p.product_name;
