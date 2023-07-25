USE sakila;

-- Change Delimiter 
DELIMITER //

-- Create Function
CREATE FUNCTION GetLanguage(lang_id INT)
RETURNS VARCHAR(100)
BEGIN

DECLARE LangName VARCHAR(100);

SELECT name
INTO LangName
FROM language
WHERE language_id = lang_id;

RETURN(LangName);

END//

-- Change Delimiter 
DELIMITER ;

-- Call Function
SELECT GetLanguage(1);
SELECT GetLanguage(2);
SELECT GetLanguage(3);
SELECT GetLanguage(4);

SELECT title, language_id, GetLanguage(language_id)
FROM film;

SELECT title, language_id, GetLanguage(language_id)
FROM film
WHERE GetLanguage(language_id) = 'Italian';

DROP FUNCTION GetLanguage;




















