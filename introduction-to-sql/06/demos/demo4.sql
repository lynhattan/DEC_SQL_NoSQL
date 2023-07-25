USE contacts;

/*SELECT p.person_first_name,p.person_last_name
FROM person p
ORDER BY p.person_last_name;*/
/*  SET FUNCTIONS

-- COUNT
SELECT COUNT(p.person_first_name)
FROM person p
WHERE p.person_last_name = 'Ahern';
-- MAX
SELECT MAX(p.person_contacted_number)
FROM person p;
-- MIN
SELECT MIN(p.person_contacted_number)
FROM person p;
-- AVG
SELECT AVG(p.person_contacted_number)
FROM person p;
-- SUM
SELECT SUM(p.person_contacted_number)
FROM person p;*/

/* SET FUNCTIONS WITH QUALIFIERS*/
SELECT 
COUNT( p.person_first_name),
p.person_first_name
FROM person p
GROUP BY p.person_first_name;