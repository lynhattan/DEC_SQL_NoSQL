USE contacts;

-- DO NOT DO THIS AT HOME OR WORK OR ANYWHERE
SELECT 
p.person_first_name,
p.person_last_name,
e.email_address
FROM 
person p,
email_address e