USE cinema_booking_system;

/* COUNT() */
SELECT * FROM customers;

SELECT COUNT(*) FROM customers
WHERE first_name IS NULL;

/* SUM() */
SELECT * FROM rooms;

SELECT SUM(no_seats) FROM rooms;
/*
	SELECT SUM(*) FROM rooms;
    -- it will not work and give an error
*/

SELECT SUM(no_seats) FROM rooms
WHERE ID>1;

/* MAX() & MIN() */
SELECT * FROM films;

SELECT MAX(length_min) FROM films;

/*
	SELECT name, MAX(length_min) FROM films;
    --it will not work, will throw an error
    --because, name here is trying to show all the outputs, and MAX(length_min) is trying to return only 1 values
    --it can be solved only using GROUP BY statement
*/

SELECT MIN(length_min) FROM films;

/* AVG() */

SELECT * FROM films;

SELECT AVG(length_min) FROM films;

SELECT AVG(length_min) FROM films
WHERE length_min > 120;
