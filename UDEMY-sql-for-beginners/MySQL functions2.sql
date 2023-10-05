USE cinema_booking_system;

SELECT DATE('2018-06-05');

SELECT DATE('2018-06-05 07:45:32');

SELECT start_time FROM screenings;

SELECT DATE(start_time) FROM screenings;

SELECT * FROM screenings 
WHERE DATE(start_time)='2017-10-03';

/*
	SELECT * FROM screenings 
    WHERE start='2017-10-03'
    -- It will throw an error!
*/

SELECT * FROM screenings 
WHERE DATE(start_time) BETWEEN '2017-10-03' AND '2017-10-05';

/* If DATE() function is removed from start_time, data from '2017-10-05' will not be returned */
SELECT * FROM screenings 
WHERE start_time BETWEEN '2017-10-03' AND '2017-10-05';

/* MONTH() function return the month from DATETIME datatype */
SELECT MONTH('2018-06-05');
SELECT MONTH('2018-06-05 07:45:32');

SELECT start_time FROM screenings;

SELECT MONTH(start_time) FROM screenings;
SELECT * FROM screenings 
WHERE MONTH(start_time)='10';

/* YEAR() */
SELECT start_time FROM screenings;
SELECT YEAR(start_time) FROM screenings;

SELECT * FROM screenings 
WHERE YEAR(start_time)='2017';