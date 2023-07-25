-- WHERE clause Comparison Operators

-- IN
SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY','JOE','VIVIEN');

SELECT *
FROM sakila.actor
WHERE actor_id IN (1,2,3,4,5,6,7,8);

SELECT *
FROM sakila.actor
WHERE (actor_id = 1 OR 
		actor_id = 2 OR 
		actor_id = 3 OR 
		actor_id = 4 OR 
		actor_id = 5 OR 
		actor_id = 6 OR 
		actor_id = 7 OR 
		actor_id = 8);

-- NOT IN
SELECT *
FROM sakila.actor
WHERE actor_id NOT IN (1,2,3,4,5,6,7);

-- In Subquery
SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY','JOE','VIVIEN')
-- 		OR actor_id IN (41, 107, 166)
		AND actor_id IN 
					(SELECT actor_id 
					FROM sakila.actor
					WHERE last_name = 'DEGENERES');

-- BETWEEN
SELECT *
FROM sakila.actor
WHERE actor_id >= 10 AND actor_id <= 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 10 AND 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 11 AND 19;

SELECT *
FROM sakila.actor
WHERE actor_id NOT BETWEEN 11 AND 19;


-- LIKE
SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'AL%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A__E';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A__E%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A%E%';

SELECT *
FROM sakila.actor
WHERE NOT (first_name LIKE 'A%E%' AND first_name LIKE 'A%');

-- -----------------------------------------------------
-- NULL 
-- -----------------------------------------------------
SELECT * 
FROM sakila.address;

SELECT * 
FROM sakila.address
WHERE address2 IS NULL;

SELECT * 
FROM sakila.address
WHERE address2 IS NOT NULL;






























































