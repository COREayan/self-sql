USE coffee_store;

/* DISTINCT */
SELECT price FROM products;

SELECT DISTINCT price FROM products;

SELECT DISTINCT customer_id, product_id FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28';

/* LIMIT */
SELECT * FROM customers;

SELECT * FROM customers LIMIT 5;

SELECT * FROM customers LIMIT 5 OFFSET 5;

SELECT * FROM customers
ORDER BY last_name
LIMIT 10;

/* COLUMN NAME ALIAS */
SELECT name AS coffee FROM products;