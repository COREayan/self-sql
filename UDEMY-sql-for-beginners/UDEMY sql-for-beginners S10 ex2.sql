USE cinema_booking_system;

SHOW TABLES;

DESCRIBE customers;
DESCRIBE reserved_seats;
DESCRIBE bookings;

/* 1.    Select the customer id and count the number of reserved seats grouped by customer for October 2017. */
SELECT bookings.customer_id, COUNT(reserved_seats.id) FROM reserved_seats 
RIGHT JOIN bookings ON reserved_seats.booking_id=bookings.id
GROUP BY bookings.customer_id;

/* 2.    Select the film name and count the number of screenings for each film that is over 2 hours long. */
SELECT films.name, films.length_min, COUNT(screenings.id) FROM screenings 
JOIN films ON screenings.film_id = films.id
GROUP BY films.name, films.length_min
HAVING films.length_min>120;