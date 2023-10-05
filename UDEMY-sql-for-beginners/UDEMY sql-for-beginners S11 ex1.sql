USE cinema_booking_system;

/* 1.    Select the film name and length for all films with a length greater than the average film length. */
SELECT * FROM films;

SELECT AVG(length_min) FROM films;

SELECT name, length_min FROM films 
WHERE length_min>(
	SELECT AVG(length_min) FROM films
)
ORDER BY length_min;

/* 2.    Select the maximum number and the minimum number of screenings for a particular film. */
SELECT * FROM films;
SELECT * FROM screenings;

SELECT COUNT(screenings.id), films.name FROM screenings 
JOIN films ON screenings.film_id=films.id
GROUP BY films.id;

SELECT MAX(id), MIN(id) FROM (
	SELECT film_id, COUNT(id) AS id FROM screenings 
    GROUP BY film_id
) a;

SELECT film_id, COUNT(id) AS id FROM screenings GROUP BY film_id;

/* 3.    Select each film name and the number of screenings for that film. */
SELECT name, (SELECT COUNT(id) FROM screenings WHERE film_id=f.id) FROM films f;
