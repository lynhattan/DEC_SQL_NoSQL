-- Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;

CREATE TABLE Event_Audit
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

-- Change Delimiter
DELIMITER //

CREATE EVENT recurring_time_event
ON SCHEDULE EVERY 2 SECOND
STARTS NOW()
DO BEGIN
	INSERT INTO Event_Audit(Last_Update)
	VALUES (NOW());
END//

-- Change Delimiter
DELIMITER ;

-- Select Data
SELECT *
FROM Event_Audit
ORDER BY ID DESC;

-- Clean up
DROP TABLE Event_Audit;
DROP EVENT recurring_time_event;














