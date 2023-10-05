

# CONCATENATE
# SELECT CONCAT(column1, column2) AS new_column_name FROM table;

SELECT CONCAT(first_name," ", last_name) AS full_name FROM customers;
SELECT CONCAT("This is ",first_name," ",last_name,"'s email: ",email) AS customers_email FROM customers;

# SUBSTRING 
# SELECT SUBSTRING (string,start,length)

SELECT SUBSTRING("Example",3,3) AS Sub;
SELECT SUBSTRING("Example",3) AS Sub;
SELECT name FROM films;
SELECT SUBSTRING(name,5,4) AS short_name FROM films;
SELECT SUBSTRING(name,-2,2) AS short_name FROM films;
SELECT SUBSTRING(name,-6,5) AS short_name FROM films;

# UPPER AND LOWER CASE 
#SELECT UPPER(column1) AS new_column_name FROM table1;
#SELECT lower(column1) AS new_column_name FROM table1;

SELECT name FROM rooms;
SELECT UPPER(name) AS name FROM rooms;
SELECT LOWER(name) AS name FROM rooms;

 