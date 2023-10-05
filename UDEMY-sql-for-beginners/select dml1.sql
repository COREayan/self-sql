USE coffee_store;

SELECT * FROM customers;

SELECT last_name FROM customers;

SELECT last_name, phone_number FROM customers;

SELECT * FROM products
WHERE price=3.00;

SELECT * FROM products
WHERE price=3.00
AND name='Americano';

SELECT * FROM products
WHERE price=3.50
OR id=1;

/*
	>   -greater than 
    >=  -greater than or equal to 
    <   -less than 
    <=  -less than or equal to
*/
SELECT * FROM products;

SELECT * FROM products
WHERE price<3.50;

/* NULL VALUES */
SELECT * FROM customers;

SELECT * FROM customers
WHERE phone_number IS NOT NULL;