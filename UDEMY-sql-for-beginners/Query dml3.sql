USE example;

CREATE TABLE people (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    gender ENUM('M','F')
);

SELECT * FROM people;

INSERT INTO people(name, age, gender)
VALUES ('Emma',21,'F'), ('John',30,'M'), ('Thomas',27,'M'), ('Chris',44,'M'), ('Sally',23,'F'), ('Frank',55,'M');

DELETE FROM people
WHERE name='John';

/*
DELETE FROM people 
WHERE gender='F';
*/

