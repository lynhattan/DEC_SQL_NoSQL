 -- Retrieve results based on function

SELECT * 
FROM sakila.actor;

SELECT * 
FROM sakila.payment;

-- ------------------------------------
-- Integer Operations
-- ------------------------------------

SELECT 	amount, 
		ROUND(amount) Amnt, ROUND(amount,1) Amnt1, 
		FLOOR(amount) FloorAmnt, CEILING(amount) CeilingAmnt
FROM sakila.payment;

SELECT ROUND(4.44,1);

-- ------------------------------------
-- String Operations
-- ------------------------------------
-- Concat
SELECT CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor;

-- LEFT function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		CONCAT(LEFT(first_name,2),  LEFT(last_name,2)) AS FirstInitial
FROM sakila.actor;

-- LENGTH function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		LENGTH(CONCAT(first_name, ' ', last_name)) AS Length,
		CONCAT(LEFT(first_name,1), ' ', LEFT(last_name,1)) AS FirstInitial
FROM sakila.actor;

-- Various function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		REVERSE(CONCAT(first_name, ' ', last_name)) AS ReverseFullName,
		REPLACE(CONCAT(first_name, ' ', last_name),'S','$') AS ReplaceExample
FROM sakila.actor;


-- ------------------------------------
-- Date Operations
-- ------------------------------------
-- DATE_FORMAT function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdated1,
		DATE_FORMAT(last_update, '%d-%m-%Y') AS LastUpdated2,
		DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdated3
FROM sakila.actor;

-- DATE_FORMAT with GET_FORMAT function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		DATE_FORMAT(last_update, GET_FORMAT(DATE,'EUR')) AS LastUpdated1,
		DATE_FORMAT(last_update, GET_FORMAT(DATE,'ISO')) AS LastUpdated2,
		DATE_FORMAT(last_update, GET_FORMAT(DATE,'USA')) AS LastUpdated3
FROM sakila.actor;


-- Other function
SELECT 	rental_date,
		DAYOFWEEK(rental_date) AS DayOfWeek,
		QUARTER(rental_date) AS Quarter,
		WEEK(rental_date) AS Week,
		MONTHNAME(rental_date) AS MonthName		
FROM sakila.rental;



-- ------------------------------------
-- DISTINCT Operations
-- ------------------------------------

SELECT first_name
FROM sakila.actor;

SELECT DISTINCT first_name
FROM sakila.actor;

SELECT last_name
FROM sakila.actor;

SELECT DISTINCT last_name
FROM sakila.actor;

















