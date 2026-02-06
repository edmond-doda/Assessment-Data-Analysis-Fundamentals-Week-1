-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.

SELECT 
    s.company_name as supplier,
    c.category_name as category,
    AVG(p.unit_price)::INT as average_price
FROM products p
JOIN suppliers s
    USING(supplier_id)
JOIN categories c
    USING(category_id)
WHERE c.category_name ILIKE '%m%'
GROUP BY s.company_name, c.category_name
ORDER BY s.company_name, c.category_name;

