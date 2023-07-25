SELECT *
FROM language

-- Change Delimiter
DELIMITER //

CREATE TRIGGER Language_Before_Insert
BEFORE INSERT on language
FOR EACH ROW
BEGIN
	SET NEW.name = CONCAT(UPPER(SUBSTRING(NEW.name,1,1)),
						LOWER(SUBSTRING(NEW.name FROM 2)));
END//

-- Change Delimiter
DELIMITER ;

-- Insert Data
INSERT INTO language (name)
VALUES ('spanish');
INSERT INTO language (name)
VALUES ('HINDI');
INSERT INTO language (name)
VALUES ('gUJARATI');
-- Select Data
SELECT *
FROM language;

-- Clean up
DROP TRIGGER Language_Before_Insert;