-- A query that displays the total count of customers under the column "total_customers".

SELECT
    COUNT(DISTINCT customer_id) as total_customers
FROM customers;
