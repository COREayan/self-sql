USE cinema_booking_system;

###    CHALLENGE ONE    ###
/* 1. Which films are over 2 hours long? */
DESCRIBE films;
SELECT * FROM films;

SELECT name,length_min FROM films 
WHERE length_min>=120;

###    CHALLENGE TWO    ###
/* 1. Which film had the most screenings in October 2017? */
DESCRIBE screenings;
DESCRIBE films;

SELECT films.name, COUNT(screenings.id) FROM screenings 
LEFT JOIN films ON screenings.film_id=films.id
WHERE MONTH(start_time)='10' AND YEAR(start_time)='2017'
GROUP BY films.id;

#video_sol
SELECT * FROM screenings;

SELECT COUNT(film_id) FROM screenings 
GROUP BY film_id;

SELECT f.name, COUNT(s.film_id) AS showings FROM screenings s 
JOIN films f ON f.id=s.film_id 
GROUP BY film_id
ORDER BY showings DESC
LIMIT 1;

###    CHALLENGE THREE    ###
/* How many bookings did the film 'Jigsaw' have in October 2017. */
DESCRIBE films;
DESCRIBE bookings;

SELECT COUNT(*) AS no_bookings FROM bookings
WHERE screening_id IN(
	SELECT id FROM screenings 
	WHERE film_id=5
);

###    CHALLENGE FOUR    ###
/* Which 5 customers made the most bookings in October 2017. */
DESCRIBE bookings;
DESCRIBE customers;

SELECT customer_id, COUNT(id) AS booking_count FROM bookings 
GROUP BY customer_id
ORDER BY booking_count DESC
LIMIT 5;

SELECT customer_id FROM bookings 
GROUP BY customer_id
ORDER BY COUNT(id) DESC
LIMIT 5;


SELECT SUBSTRING(first_name," ",last_name) FROM customers 
WHERE id IN (
	SELECT customer_id FROM bookings 
	GROUP BY customer_id
	ORDER BY COUNT(id) DESC
)
LIMIT 5;

#video_sol
SELECT c.first_name, c.last_name, b.id FROM bookings b 
JOIN customers c ON c.id=customer_id;

SELECT c.first_name, c.last_name, COUNT(b.id) AS no_bookings FROM bookings b 
JOIN customers c ON c.id=customer_id
GROUP BY c.id 
ORDER BY no_bookings DESC
LIMIT 5;

###    CHALLENGE FIVE    ###
/* Which film was show in the Chaplin room most often in October 2017. */
SELECT * FROM films;
SELECT * FROM rooms;
SELECT * FROM screenings;

SELECT f.name, r.name FROM films f 
JOIN screenings s ON f.id=s.film_id 
JOIN rooms r ON r.id=s.room_id;

SELECT f.name, COUNT(r.name) AS no_screenings FROM films f 
JOIN screenings s ON f.id=s.film_id 
JOIN rooms r ON r.id=s.room_id
WHERE r.id=1
GROUP BY f.name
ORDER BY no_screenings DESC
LIMIT 1;

###    CHALLENGE SIX    ###
/* How many of the customers made a booking in October 2017 */
DESCRIBE bookings;
DESCRIBE customers;

SELECT c.first_name, c.last_name, COUNT(b.id) FROM customers c
JOIN bookings b ON b.customer_id=c.id
GROUP BY c.id;

#video sol
SELECT COUNT(*) FROM customers;

SELECT * FROM bookings;

SELECT COUNT(DISTINCT(customer_id)) AS no_of_customers FROM bookings;
