-- Introduction to View

USE sakila;

SELECT *
FROM actor;

CREATE VIEW vw_AllActor
AS 
SELECT *
FROM actor;

SELECT *
FROM vw_AllActor;

SELECT *
FROM vw_AllActor
WHERE first_name LIKE 'A%';

CREATE VIEW vw_ActorA
AS
SELECT *
FROM actor
WHERE first_name LIKE 'A%';

SELECT *
FROM vw_ActorA;

SELECT *
FROM vw_ActorA
WHERE last_name LIKE '%A%';

CREATE VIEW vw_ActorAnA
AS
SELECT *
FROM vw_ActorA
WHERE last_name LIKE '%A%';

SELECT *
FROM vw_ActorAnA;

SELECT *
FROM vw_ActorAnA
ORDER BY last_name;

DROP VIEW vw_AllActor;
DROP VIEW vw_ActorA;
DROP VIEW vw_ActorAnA;













