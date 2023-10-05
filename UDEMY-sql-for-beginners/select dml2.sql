USE coffee_store;

SELECT * FROM customers 
WHERE last_name IN ('Taylor','Bluth','Armstrong');

SELECT * FROM customers
WHERE first_name NOT IN ('Katie','John','George');

/* BETWEEN */
SELECT * FROM orders;
SELECT * FROM customers;

SELECT product_id,customer_id,order_time FROM orders
WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07';

SELECT product_id, customer_id, order_time FROM orders
WHERE customer_id BETWEEN 5 AND 10;

SELECT * FROM customers
WHERE last_name BETWEEN 'A' AND 'L';

/* LIKE */
SELECT * FROM customers;
SELECT * FROM products;

SELECT * FROM customers
WHERE last_name LIKE 'W%';

SELECT * FROM customers
WHERE last_name LIKE '%o%';

SELECT * FROM customers
WHERE first_name LIKE '_o_';

SELECT * FROM products
WHERE price LIKE '3%';

/* ORDER BY */
SELECT * FROM products
ORDER BY price ASC;

SELECT * FROM products
ORDER BY price DESC;

SELECT * FROM customers
ORDER BY last_name ASC;

SELECT * FROM customers 
ORDER BY last_name DESC;

SELECT * FROM orders 
WHERE customer_id = 1
ORDER BY order_time ASC;

SELECT * FROM orders 
WHERE customer_id = 1
ORDER BY order_time DESC;
