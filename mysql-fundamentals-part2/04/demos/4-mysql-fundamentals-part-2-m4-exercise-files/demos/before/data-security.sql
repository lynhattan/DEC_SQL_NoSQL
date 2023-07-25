
-- Data Security

SELECT 	pt.payment_id, pt.rental_id,
		cust.first_name, cust.last_name, amount
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE payment_id > 100;

CREATE VIEW DataSecure
AS
SELECT 	pt.payment_id, pt.rental_id,
		cust.first_name, cust.last_name, amount
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE payment_id > 100;

SELECT *
FROM DataSecure;

SELECT payment_id, rental_id
FROM DataSecure
WHERE payment_id > 200;

-- 0 rows
SELECT payment_id, rental_id
FROM DataSecure
WHERE payment_id = 10;

-- error
SELECT email
FROM DataSecure
WHERE payment_id = 1;

DROP VIEW DataSecure;





