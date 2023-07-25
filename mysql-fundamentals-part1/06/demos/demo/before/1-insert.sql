-- INSERT Statement
USE Sakila;

CREATE TABLE ActorSample (
  actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NULL,
  last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
		ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (actor_id)
);

-- Insert Single Row
INSERT INTO sakila.actorsample (first_name,last_name,last_update)
VALUES ('Pinal','Dave','2013-04-15');
-- Check Data
SELECT *
FROM ActorSample;

-- Insert Single Row
INSERT INTO sakila.actorsample 
VALUES (DEFAULT,'Nupur','Dave','2013-04-16');
-- Check Data
SELECT *
FROM ActorSample;


-- Insert Single Row
INSERT INTO sakila.actorsample (first_name,last_name)
VALUES ('Pinal','Dave');
-- Check Data
SELECT *
FROM ActorSample;

-- Insert Single Row
INSERT INTO sakila.actorsample (first_name)
VALUES ('Pinal');
-- Check Data
SELECT *
FROM ActorSample;

-- Insert Single Row
-- Error
INSERT INTO sakila.actorsample (last_name)
VALUES ('Dave');
-- Check Data
SELECT *
FROM ActorSample;

-- Insert Single Row
INSERT INTO sakila.actorsample (first_name,last_name,last_update)
VALUES ('Pinal',NULL,DEFAULT);
-- Check Data
SELECT *
FROM ActorSample;


-- --------------------------------------
-- Insert Multiple Values
-- --------------------------------------
INSERT INTO sakila.actorsample (first_name,last_name,last_update)
VALUES 	('Pinal','Dave','2013-04-17'),
		('Nupur','Dave','2013-04-18'),
		('Shaivi','Dave','2013-04-19');
-- Check Data
SELECT *
FROM ActorSample;

-- Subquery

INSERT INTO sakila.actorsample (first_name,last_name,last_update)
SELECT first_name,last_name,last_update
FROM actor
WHERE first_name = 'Nick';
-- Check Data
SELECT *
FROM ActorSample;

-- Clean up
DROP TABLE ActorSample;





















