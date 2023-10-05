USE cinema_booking_system;
SHOW TABLES;
DESCRIBE bookings;
DESCRIBE customers;
DESCRIBE films;
DESCRIBE reserved_seats;
DESCRIBE rooms;
DESCRIBE screenings;
DESCRIBE seats;

SELECT * FROM films;

/* 1.    How many bookings did customer id 10 make in October 2017. */
SELECT COUNT(bookings.id) FROM bookings 
LEFT JOIN screenings ON bookings.screening_id=screenings.id
WHERE bookings.customer_id=10 AND screenings.start_time BETWEEN '2017-10-01' AND '2017-10-31';

/* 2.    Count the number of screenings for Blade Runner 2049 in October 2017. */
SELECT COUNT(screenings.id) FROM screenings 
LEFT JOIN films ON screenings.film_id=films.id 
WHERE films.name='Blade Runner 2049';

/* 3.    Count the number of unique customers who made a booking for october 2017. */
SELECT COUNT(DISTINCT(customers.id)) FROM bookings 
LEFT JOIN customers ON bookings.customer_id=customers.id
LEFT JOIN screenings ON bookings.screening_id=screenings.id
WHERE screenings.start_time BETWEEN '2017-10-01' AND '2017-10-31';