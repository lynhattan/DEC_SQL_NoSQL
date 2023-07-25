SELECT *
FROM language;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE InsertValue( 
IN NameofLang VARCHAR(100),
OUT LangID INT)
BEGIN

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
