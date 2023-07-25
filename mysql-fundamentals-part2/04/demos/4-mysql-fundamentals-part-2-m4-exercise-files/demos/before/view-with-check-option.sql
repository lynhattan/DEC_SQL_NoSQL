USE sakila;
-- DML Operation Over View

SELECT language_id, name, last_update
FROM language;

CREATE VIEW DMLOperation
AS
SELECT language_id, name, last_update
FROM language
WHERE last_update = '2006-02-15 05:02:19'
WITH CHECK OPTION;

SELECT *
FROM DMLOperation;

-- Insert 
INSERT INTO DMLOperation 
		(name, last_update)
VALUES ('Hindi', '2013-02-15 05:02:19');

-- Insert 
INSERT INTO DMLOperation 
		(name, last_update)
VALUES ('Hindi', '2006-02-15 05:02:19');

SELECT *
FROM DMLOperation;

SELECT *
FROM language;

-- Update
UPDATE DMLOperation
SET last_update = '2013-02-15 05:02:19'
WHERE name = 'Hindi';

SELECT *
FROM DMLOperation;

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

-- Remember: Base Table DML
-- Insert 
INSERT INTO language 
		(name, last_update)
VALUES ('New Lang', '2013-02-15 05:02:19');

SELECT language_id, name, last_update
FROM language;

UPDATE language
SET last_update = '2013-02-15 05:02:19'
WHERE name = 'German';

SELECT language_id, name, last_update
FROM language;

-- 
DROP VIEW DMLOperation;











