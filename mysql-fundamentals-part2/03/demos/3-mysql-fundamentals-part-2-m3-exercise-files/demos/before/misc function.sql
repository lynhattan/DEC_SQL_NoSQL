-- RAND() - Return a random floating-point value
SELECT RAND() AS RandomValue;
SELECT LEFT(CEILING(RAND()*10),1) AS RandomValue;

-- SLEEP() - Sleep for a number of seconds
SELECT NOW();
SELECT SLEEP(1);
SELECT NOW(); 

-- UUID() - Return a Universal Unique Identifier (UUID)
SELECT UUID();