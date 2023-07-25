SELECT *
FROM language;

CREATE TABLE Audit_Language
(language_id TINYINT(3), name CHAR(20), 
	last_update TIMESTAMP, RowValue CHAR(20));


-- Change Delimiter
DELIMITER //

CREATE TRIGGER Language_After_Update
AFTER UPDATE on language
FOR EACH ROW
BEGIN
	-- Insert Old Value
	INSERT INTO Audit_Language (language_id, name, last_update, RowValue)
	VALUES(OLD.language_id, OLD.name, OLD.last_update, 'Before Update');

	-- Insert New Value
	INSERT INTO Audit_Language (language_id, name, last_update, RowValue)
	VALUES(NEW.language_id, NEW.name, NEW.last_update, 'After Update');
END//

-- Change Delimiter
DELIMITER ;

-- Update Value
UPDATE language
SET name = 'Spanish-New'
WHERE language_id = 10;
UPDATE language
SET name = 'Hindi-New'
WHERE language_id = 11;

-- Select Data
SELECT *
FROM language;
SELECT *
FROM Audit_Language;

-- Clean up
DROP TRIGGER Language_After_Update;
DROP TABLE Audit_Language;