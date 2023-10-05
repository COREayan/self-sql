CREATE DATABASE example;

USE example;

CREATE TABLE test (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30), 
    age INT
);

SELECT * FROM test;
SHOW tables;

DROP TABLE test;

SELECT * FROM test;
SHOW tables;