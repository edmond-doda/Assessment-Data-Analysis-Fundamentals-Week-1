-- A query that displays the total integer value of all products in stock as "stock_value".

SELECT
    SUM(units_in_stock*unit_price::INT) as stock_value
FROM products;