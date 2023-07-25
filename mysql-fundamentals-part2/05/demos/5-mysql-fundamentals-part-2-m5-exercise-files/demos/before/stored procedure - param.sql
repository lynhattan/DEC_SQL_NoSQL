-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE ConcatName(FirstName VARCHAR(100), LastName VARCHAR(100))
BEGIN
	DECLARE FullName VARCHAR(200);
	SET FullName = CONCAT(FirstName,' ',LastName);
	SELECT FullName;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL ConcatName('Pinal', 'Dave');
CALL ConcatName('Aaron', 'Skonnard');
CALL ConcatName('Fritz', 'Onion');

DROP PROCEDURE ConcatName;