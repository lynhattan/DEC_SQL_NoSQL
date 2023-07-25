USE contacts;
/* SELECT p.person_last_name 
/*SELECT p.person_last_name 
/*SELECT p.person_last_name 
FROM 
person p
WHERE p.person_first_name 
LIKE 'J%';*/
/*SELECT p.person_last_name
FROM person p
WHERE p.person_first_name
IN ('Jon','Fritz');*/
/*SELECT p.person_last_name
FROM
person p 
WHERE p.person_contacted_number 
IS NULL;*/

SELECT e.email_address_person_id, e.email_address
FROM
email_address e
WHERE
e.email_address_person_id IS NOT NULL;

