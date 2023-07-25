-- Limit Keyword

SELECT *
FROM sakila.actor
ORDER BY actor_id;

SELECT *
FROM sakila.actor
ORDER BY actor_id
LIMIT 12;

SELECT *
FROM sakila.actor
ORDER BY actor_id
LIMIT 25, 5;
