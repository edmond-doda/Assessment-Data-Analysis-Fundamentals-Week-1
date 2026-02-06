-- A query that creates or replaces a VIEW, customer_summary, containing an overview of all customers with more than 15 orders

-- The view should have columns company, city, and total_orders only

-- Rows should be sorted in ascending order by the date of the customer's earliest order


CREATE OR REPLACE VIEW customer_summary AS (
    SELECT
        c.company_name AS company,
        c.city AS city,
        COUNT(o.order_id) AS total_orders
    FROM customers c 
    JOIN orders o 
        USING(customer_id)
    GROUP BY c.customer_id
    HAVING COUNT(o.order_id) > 15
    ORDER BY MIN(o.order_date) ASC
);

SELECT * FROM customer_summary;