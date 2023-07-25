USE db_project2;

SELECT 
    p.brand, ROUND(AVG(p.price_current), 2) AS total_by_brand
FROM
    products AS p
WHERE
    p.rating BETWEEN 4.5 AND 5.0
        AND p.brand IS NOT NULL
GROUP BY p.brand
HAVING total_by_brand > 500
ORDER BY 2 DESC
LIMIT 5
;

