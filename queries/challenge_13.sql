-- A query that returns full employee names and a list of their assigned territories

-- Columns should be employee and assigned_territories only

-- Only territories with single-word descriptions should be included

-- Rows should be ordered by number of territories in descending order

-- Territory lists should be in alphabetical order

-- Territory lists should be lists, not concatenated strings

SELECT
    e.first_name || ' ' || e.last_name AS employee,
    ARRAY_AGG(t.territory_description ORDER BY t.territory_description) AS assigned_territories
FROM employees e
JOIN employee_territories et 
    USING(employee_id)
JOIN territories t 
    USING(territory_id)
WHERE t.territory_description NOT LIKE '% %'
GROUP BY e.employee_id
ORDER BY COUNT(t.territory_id) DESC, LENGTH(e.first_name || ' ' || e.last_name) DESC;