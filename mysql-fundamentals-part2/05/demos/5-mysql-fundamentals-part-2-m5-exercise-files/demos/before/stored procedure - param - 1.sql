SELECT *
FROM language;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE InsertValue(NameofLang VARCHAR(100))
BEGIN

INSERT INTO language(name,last_update)
VALUES (NameofLang, NOW());

SELECT  LAST_INSERT_ID();
END//
-- Change Delimiter again
DELIMITER ;

CALL InsertValue ('Gujarati');
CALL InsertValue ('Hindi');

SELECT *
FROM language;

DROP PROCEDURE InsertValue;
