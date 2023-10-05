USE cinema_booking_system;

/* Grouping Data */
SELECT * FROM bookings;

SELECT COUNT(id) FROM bookings;

SELECT customer_id, COUNT(id) FROM bookings
GROUP BY customer_id;

SELECT * FROM bookings;

SELECT customer_id, screening_id, COUNT(id) FROM bookings 
GROUP BY customer_id, screening_id;

SELECT customer_id, screening_id, COUNT(id) FROM bookings 
GROUP BY customer_id, screening_id
ORDER BY customer_id;

SELECT customer_id, screening_id, COUNT(id) FROM bookings 
GROUP BY customer_id, screening_id
ORDER BY screening_id;

SELECT f.name, s.start_time, c.first_name, c.last_name, COUNT(b.id) FROM films f
JOIN screenings s ON f.id=s.film_id 
JOIN bookings b ON s.id=b.screening_id 
JOIN customers c ON b.customer_id=c.id 
GROUP BY f.name, c.last_name, c.first_name, s.start_time
ORDER BY s.start_time;

/* Having Clause */
SELECT * FROM bookings;

/*
	SELECT customer_id, screening_id, COUNT(id) FROM bookings 
	GROUP BY customer_id, screening_id
	WHERE customer_id=10;
	-- it will not work, WHERE clause do not work with group by statement
*/
SELECT customer_id, screening_id, COUNT(id) FROM bookings 
GROUP BY customer_id, screening_id
HAVING customer_id=10;