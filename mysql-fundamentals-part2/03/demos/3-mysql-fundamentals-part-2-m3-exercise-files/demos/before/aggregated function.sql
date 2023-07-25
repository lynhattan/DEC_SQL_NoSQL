USE sakila;

-- Counting number of retnals for each customer
SELECT COUNT(*) NoRentals, customer_id
FROM rental
GROUP BY customer_id;

-- Displaying latest rental of movie by customer
SELECT MAX(rental_date) LastRentalDate, customer_id
FROM rental
GROUP BY customer_id;

-- Displaying first rental of movie by customer
SELECT MIN(rental_date) FirstRentalDate, customer_id
FROM rental
GROUP BY customer_id;

-- Average payment by each customer
SELECT 	AVG(amount) AvgPayment, SUM(amount) TotPayment, 
		COUNT(rental_id) TotalRentals, customer_id
FROM Payment
GROUP BY customer_id;










