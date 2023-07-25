-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE WhileLoop()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE  i < 6 DO
		SELECT POW(i,i);
		SET i = i + 1;
	END WHILE;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL WhileLoop();

DROP PROCEDURE WhileLoop;













