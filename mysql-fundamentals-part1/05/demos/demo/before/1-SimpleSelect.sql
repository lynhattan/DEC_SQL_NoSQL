-- Retrieve static value

SELECT 'MyFirstValue' AS SomeValue;

SELECT 1+1 AS TWO;

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

SELECT PI();

SELECT MOD(45,7);

SELECT SQRT(25);



-- Retrieve all the data from table

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.city;

USE sakila;
SELECT *
FROM city;


-- Retrieve all the data ordered by single column

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.actor
ORDER BY first_name;

SELECT *
FROM sakila.actor
ORDER BY last_name;

SELECT *
FROM sakila.actor
ORDER BY first_name DESC;

SELECT *
FROM sakila.actor
ORDER BY last_name DESC;



-- Retrieve selected columns from table

SELECT *
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor
ORDER BY first_name DESC;



-- Retrieve the data with filter condition

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.actor
WHERE actor_id > 100;

SELECT *
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';


-- Retrieve the data with filter condition and ordered by columns
SELECT *
FROM sakila.actor
WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick'
ORDER BY actor_id DESC;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100
ORDER BY first_name, last_name DESC;



-- Retrieve empty result set

SELECT *
FROM sakila.actor
WHERE 1 = 2;

































