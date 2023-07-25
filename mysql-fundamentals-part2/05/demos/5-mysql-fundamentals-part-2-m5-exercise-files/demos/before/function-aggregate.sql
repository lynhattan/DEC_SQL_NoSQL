USE sakila;

-- Change Delimiter 
DELIMITER //

-- Create Function
CREATE FUNCTION RentalCountsbyCust(cust_id INT)
RETURNS INT
BEGIN

DECLARE RentalCounts INT;

SELECT COUNT(*) NoRentals
INTO RentalCounts
FROM rental
WHERE customer_id = cust_id;

RETURN(RentalCounts);

END//

-- Change Delimiter 
DELIMITER ;

-- Call Function
SELECT first_name, last_name, 
		RentalCountsbyCust(customer_id) TotalMovieRented
FROM customer;

DROP FUNCTION RentalCountsbyCust;




















