-- Change Delimiter
DELIMITER //

DROP PROCEDURE IF EXISTS GetLanguage//

-- Create Stored Procedure
CREATE PROCEDURE GetLanguage()
BEGIN
	SELECT * FROM language;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL GetLanguage();

DROP PROCEDURE GetLanguage;









