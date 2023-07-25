-- DELETE Statement
USE Sakila;

-- Populate Sample Table
CREATE TABLE ActorSample (
  actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NULL,
  last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
					ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (actor_id)
);
INSERT INTO sakila.ActorSample (first_name,last_name,last_update)
SELECT first_name,last_name,last_update
FROM sakila.actor;

-- Delete Single Row
DELETE 
FROM	sakila.ActorSample
WHERE 	actor_id = 1;
-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Delete Multiple Rows
DELETE 
FROM	sakila.ActorSample
WHERE 	actor_id IN (3,4,5);
-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Update using SELECT Statement
DELETE 
FROM sakila.ActorSample
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = 1);
-- Check Data
SELECT *
FROM ActorSample;

-- Delete all Rows from Table
DELETE 
FROM sakila.ActorSample;
-- Check Data
SELECT *
FROM ActorSample;

-- Clean up
DROP TABLE ActorSample;



























