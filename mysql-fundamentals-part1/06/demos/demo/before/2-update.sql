-- UPDATE Statement
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

-- Update Single Row Single Column
UPDATE 	sakila.ActorSample
SET 	first_name = 'Pinal'
WHERE 	actor_id = 1;
UPDATE 	sakila.ActorSample
SET 	last_name = 'Dave'
WHERE 	actor_id = 1;

-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Update Single Row Multiple Column
UPDATE 	sakila.ActorSample
SET 	first_name = 'Pinal',last_name = 'Dave'
WHERE 	actor_id = 2;

-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Update Multiple Rows Single Column
UPDATE 	sakila.ActorSample
SET 	first_name = 'Pinal' 
WHERE 	actor_id IN (3,4,5);

-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Update Multiple Rows Multiple Columns
UPDATE 	sakila.ActorSample
SET 	first_name = 'Pinal',
		last_name = 'Dave',
		last_update = DEFAULT 
WHERE 	actor_id IN (6,7,8);

-- Check Data
SELECT *
FROM sakila.ActorSample;

-- Update using SELECT Statement
UPDATE sakila.ActorSample
SET first_name = 'Nupur'
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = 1);

-- Check Data
SELECT *
FROM ActorSample;

-- Clean up
DROP TABLE ActorSample;



























