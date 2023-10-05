/* 1.    Select the order id and customers phone number for all orders of product id 4. */
SELECT orders.id, customers.phone_number FROM orders 
JOIN customers ON orders.customer_id=customers.id 
WHERE orders.product_id=4;

/* 2.    Select product name and order time for filter coffees sold between January 15th 2017 and February 14th 2017. */
SELECT products.name, orders.order_time FROM orders 
JOIN products ON orders.product_id=products.id 
WHERE products.name='Chai' AND orders.order_time BETWEEN '2017-01-15' AND '2017-02-14';

/* self tryouts */
SELECT * from products join orders on orders.product_id=products.id
ORDER BY orders.order_time;

/* 3.    Select the product name and price and order time for all orders from females in January 2017.*/
SELECT products.name, products.price, orders.order_time FROM orders
JOIN customers ON orders.customer_id=customers.id 
JOIN products ON orders.product_id=products.id
WHERE customers.gender IN ('F')
AND orders.order_time BETWEEN '2017-01-01' AND '2017-01-31';

/* self tryouts */
SELECT * FROM customers;