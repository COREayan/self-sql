USE cinema_booking_system;

/* Non-Correlated Subqueries in WHERE Clause*/
SELECT id, start_time FROM screenings 
WHERE film_id IN (SELECT id FROM films WHERE length_min>120);

SELECT id FROM films WHERE length_min>120;

SELECT * FROM customers;
SELECT * FROM bookings;

SELECT first_name, last_name, email FROM customers  
WHERE id IN (
	SELECT customer_id FROM bookings 
    WHERE screening_id=1
);

SELECT customer_id FROM bookings WHERE screening_id=1;

/* Non-Correlated Subqueries in FROM */
SELECT * FROM reserved_seats;

SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seats 
GROUP BY booking_id;

SELECT  booking_id, MAX(no_seats) FROM 
(SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seats GROUP BY booking_id) b;

SELECT  AVG(no_seats), MAX(no_seats) FROM 
(SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seats GROUP BY booking_id) b;

SHOW TABLES;
DESCRIBE reserved_seats;
SELECT * FROM reserved_seats;

/* Correlated Subqueries */
SELECT screening_id, customer_id 
FROM bookings 
ORDER BY screening_id;

SELECT screening_id, customer_id, (SELECT COUNT(seat_id) FROM reserved_seats WHERE booking_id=b.id) 
FROM bookings b 
ORDER BY screening_id;