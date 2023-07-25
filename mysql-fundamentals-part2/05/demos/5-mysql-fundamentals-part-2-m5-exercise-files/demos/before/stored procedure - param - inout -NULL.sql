SELECT *
FROM language;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE InsertValue( 
IN NameofLang VARCHAR(100),
OUT LangID INT)
BEGIN

IF NameofLang IS NULL THEN
	SET NameofLang = 'NameNotSpecified';
END IF;

INSERT INTO language(name,last_update)
VALUES (NameofLang, NOW());

SET LangID = LAST_INSERT_ID();
END//
-- Change Delimiter again
DELIMITER ;

CALL InsertValue (NULL,@LangID);
SELECT CONCAT('Last Language_ID is ' , @LangID);

SELECT *
FROM language;

DROP PROCEDURE InsertValue;
