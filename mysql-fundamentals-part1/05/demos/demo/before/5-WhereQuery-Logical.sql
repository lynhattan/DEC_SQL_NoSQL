-- WHERE clause Comparison Operators

-- AND
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 AND last_name = 'TORN';


-- OR
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100; 

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100 OR last_name = 'TEMPLE';


-- NOT
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT actor_id = 5;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 5;


-- All together

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR last_name = 'TEMPLE' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE (first_name = 'KENNETH' AND actor_id < 100) OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 OR last_name = 'TEMPLE');

SELECT *
FROM sakila.actor
WHERE (first_name = 'KENNETH' OR last_name = 'TEMPLE') AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR (last_name = 'TEMPLE' AND actor_id < 100);

SELECT *
FROM sakila.actor
WHERE NOT (first_name = 'KENNETH' OR (last_name = 'TEMPLE' AND actor_id < 100));

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR NOT(last_name = 'TEMPLE' AND actor_id < 100);


































