-- ASCII - Return numeric value of left-most character
SELECT ASCII('a'), ASCII('A');

-- CHAR() - Return the character for each integer passed
SELECT CHAR(77,121,83,81,76);
SELECT CHAR(65);

-- LENGTH() - Return the length of a string in bytes
SELECT LENGTH('SQLAuthority'), LENGTH('SQLAuthority  ');

-- CONCAT() - Return concatenated string
SELECT CONCAT('SQL', 'Authori', 'ty');
SELECT CONCAT('SQL', NULL, 'ty');

-- LCASE() -Return the argument in lowercase - Synonym for LOWER()
SELECT LCASE('SQLAuthority'), LOWER('PlUrAlSigHt');

-- UCASE() -Return the argument in uppercase - Synonym for UPPER()
SELECT UCASE('SQLAuthority'), UPPER('PlUrAlSigHt');

-- LEFT() - Return the leftmost number of characters as specified
SELECT LEFT('SQLAuthority', 4), LEFT('PlUrAlSigHt', 3);

-- RIGHT()- Return the specified rightmost number of characters
SELECT RIGHT('SQLAuthority', 4), RIGHT('PlUrAlSigHt', 3);

-- RTRIM() - Remove trailing spaces
SELECT RTRIM('   SQLAuthority   '), LENGTH(RTRIM('   SQLAuthority   '));

-- LTRIM() - Remove leading spaces
SELECT LTRIM('   SQLAuthority   '), LENGTH(LTRIM('   SQLAuthority   '));

-- TRIM() - Remove leading and trailing spaces
SELECT TRIM('   SQLAuthority   '), LENGTH(TRIM('   SQLAuthority   '));

-- STRCMP() returns 0 if the strings are the same
-- -1 if the first argument is smaller than the second according to the current sort order
-- 1 if the first argument is larger than the second according to the current sort order
SELECT 	STRCMP('MySQLAuthority', 'SQLAuthority'), 
		STRCMP('SQLAuthority', 'MySQLAuthority'), 
		STRCMP('SQLAuthority', 'SQLAuthority');

-- REVERSE() - Reverse the characters in a string
SELECT REVERSE('SQLAuthority');

-- Table Column
SELECT 	CONCAT(first_name, ' ', last_name) AS Full_Name,
		REVERSE(CONCAT(first_name, ' ', last_name)) AS RFull_Name
FROM sakila.actor;























