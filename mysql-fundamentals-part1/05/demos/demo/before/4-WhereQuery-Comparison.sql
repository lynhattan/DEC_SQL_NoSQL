-- WHERE clause Comparison Operators

-- Equal (=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';

-- Less than (<)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name < 'Nick';

-- Greater than (>)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name > 'Nick';

-- Less than or Equal to (<=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <= 'Nick';

-- Greater than or Equal to (>=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id >= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name >= 'Nick';

-- Not equal (<> or !=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name != 'Nick';
















































