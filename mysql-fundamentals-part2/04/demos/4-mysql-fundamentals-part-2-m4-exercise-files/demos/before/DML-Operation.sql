USE sakila;
-- DML Operation Over View

SELECT language_id, name, last_update
FROM sakila.language;

CREATE VIEW DMLOperation
AS
SELECT language_id, name, last_update
FROM sakila.language;

SELECT *
FROM DMLOperation;

-- Insert 
INSERT INTO DMLOperation 
		(name, last_update)
VALUES ('Hindi', '2013-07-30 05:02:19');

SELECT *
FROM DMLOperation;

SELECT *
FROM sakila.language;

-- Update
UPDATE DMLOperation
SET name = 'Spanish'
WHERE name = 'Hindi';

SELECT *
FROM DMLOperation;

-- Delete
DELETE
FROM DMLOperation
WHERE name = 'Spanish';

SELECT *
FROM DMLOperation;

-- 
DROP VIEW DMLOperation;











