use sakila;
select * from customer;

-- Create a table rentals_may to store the data from rental table with information for the month of May.
DROP TABLE IF EXISTS rentals_may;
CREATE TABLE rentals_may(
rental_id INT UNIQUE NOT NULL,
rental_date DATETIME,
inventory_id INT DEFAULT NULL,
customer_id INT DEFAULT NULL,
return_date DATETIME,
staff_id INT DEFAULT NULL,
last_update DATETIME,

CONSTRAINT PRIMARY KEY (rental_id));

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
select * from rentals_may;
select * from rental;

INSERT INTO rentals_may
SELECT *
FROM rental
WHERE (extract(month from rental_date) = 05);

-- Create a table rentals_june to store the data from rental table with information for the month of June.
DROP TABLE IF EXISTS rentals_june;
CREATE TABLE rentals_june(
rental_id INT UNIQUE NOT NULL,
rental_date DATETIME,
inventory_id INT DEFAULT NULL,
customer_id INT DEFAULT NULL,
return_date DATETIME,
staff_id INT DEFAULT NULL,
last_update DATETIME,

CONSTRAINT PRIMARY KEY (rental_id));

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
select * from rentals_june;
select * from rental;

INSERT INTO rentals_june
SELECT *
FROM rental
WHERE (extract(month from rental_date) = 06);

-- Check the number of rentals for each customer for May.
select * from rentals_may;
select customer_id, count(rental_id) from rentals_may
 group by customer_id 
 order by customer_id;
 
 -- Check the number of rentals for each customer for June.
select * from rentals_june;
select customer_id, count(rental_id) from rentals_june
 group by customer_id 
 order by customer_id;
 
 -- Create a Python connection with SQL database and 
 -- retrieve the results of the last two queries (also mentioned below) as dataframes:
 
 -- Write a function that checks if customer borrowed more or less films in the month of June as compared to May