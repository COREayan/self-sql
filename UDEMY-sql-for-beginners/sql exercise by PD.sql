SHOW DATABASES;

CREATE DATABASE test1;

SHOW DATABASES;

USE test1;

CREATE TABLE employee(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
	employee_name VARCHAR(30),
    street VARCHAR(50),
    city VARCHAR(20)
);

SHOW TABLES;

CREATE TABLE works(
	emp_id INT,
    company_id INT,
    salary DECIMAL(6,2),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) 
);

SHOW TABLES;

CREATE TABLE company(
	company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(30),
    city VARCHAR(20)
);

SHOW TABLES;

DESCRIBE company;
DESCRIBE employee;
DESCRIBE works;

DROP TABLE works;

CREATE TABLE works (
	emp_id INT,
    company_id INT,
    salary DECIMAL(6,2),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE manages(
	emp_id INT,
    manager_name VARCHAR(30),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

SHOW TABLES;

DESCRIBE employee;
DESCRIBE works;
DESCRIBE company;
DESCRIBE manages;

#insert few records in each table with relevant data
INSERT INTO employee(employee_name, street, city) 
VALUES ('abhranil','serampore','kolkata'),
	('chandra','birati','kolkata'),
    ('anujit','agartala','tripura'),
    ('arghya','berhampore','kolkata'),
    ('arindam','kaikhali','kolkata');
    
SELECT * FROM employee;

INSERT INTO company(company_name, city)
VALUES ('Accenture','Kolkata'),
	('Accenture','Chennai'),
    ('Infosys','Hyderabad'),
    ('Cognizant','Hyderabad'),
    ('Cognizant', 'Kolkata');
    
SELECT * FROM company;
SELECT * FROM works;

INSERT INTO works (emp_id, company_id, salary) 
VALUES (1, 2, 3000.0),
	(2, 1, 2500.0),
	(3, 3, 2600.0),
    (4, 4, 2000.0),
    (5, 1, 2800.0);
    
SELECT * FROM works;

# insert a column "date_of_joining" as date column in work table.
ALTER TABLE works
ADD COLUMN date_of_joining DATE;

DESCRIBE works;
SELECT * FROM works;

# insert few records in employee table but do not add correspoinding records in work table
SELECT * FROM employee;
INSERT INTO employee (employee_name, street, city) 
VALUES ('sayan', 'naihati', 'kolkata'),
	('sayantan', 'haldia', 'kolkata'),
    ('rupam', 'naihati', 'kolkata');
    
## Q1. 
SELECT e.employee_name, e.street, e.city, w.salary FROM employee e
JOIN works w ON e.emp_id = w.emp_id
JOIN company c ON w.company_id = c.company_id
WHERE w.salary>10000 AND UPPER(LTRIM(RTRIM(c.company_name)))='FIRST BANK CORPORATION';
#WHERE c.company_name='Accenture' AND w.salary>2700;

## Q2. 
SELECT e.name FROM employee e
JOIN works w ON e.emp_id = w.emp_id 
JOIN company c ON w.comapny_id = c.company_id 
WHERE LOWER(LTRIM(RTRIM(e.city)))=LOWER(LTRIM(RTRIM(c.city)));

## Q3. 
SELECT e.name FROM employee emp ,
manages mgr, 
employee m
WHERE emp.emp_id = m.emp_id 
AND LOWER(m.manager_name);


## Q4. 
SELECT e.name FROM employee e
JOIN works w ON e.emp_id = w.emp_id 
JOIN company c ON w.comapny_id = c.company_id 
WHERE c.company_name NOT IN ('First Bank Corporation');

## Q5. 
SELECT e.name FROM employee e
JOIN works w ON e.emp_id = w.emp_id 
JOIN company c ON w.comapny_id = c.company_id 
WHERE w.salary>ALL()