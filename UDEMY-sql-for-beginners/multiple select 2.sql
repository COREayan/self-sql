USE coffee_store;

/*
UPDATE orders
SET customer_id = 1
WHERE id = 1;
*/

SELECT * FROM customers;
SELECT * FROM orders;

UPDATE orders
SET customer_id = NULL
WHERE id=103;

/* LEFT JOIN */
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time
LIMIT 10;

SELECT o.id, c.phone_number, c.last_name, o.order_time FROM customers c 
LEFT JOIN orders o ON c.id = o.customer_id 
ORDER BY o.order_time 
LIMIT 10;

/* RIGHT JOIN */
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time
LIMIT 10;

SELECT o.id, c.phone_number, c.last_name, o.order_time FROM customers c 
RIGHT JOIN orders o ON c.id = o.customer_id 
ORDER BY o.order_time 
LIMIT 10;