-- A query that displays the category_name and total count of products (num_products) for each category.

-- Results should be sorted  in descending order by count, with any ties sorted by descending order of category name.

SELECT 
    c.category_name,
    COUNT(*) as num_products
FROM categories c
JOIN products p 
    USING(category_id)
GROUP BY c.category_name
ORDER BY num_products DESC, category_name DESC;