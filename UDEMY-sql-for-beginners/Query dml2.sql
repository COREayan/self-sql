USE coffe_store;

SELECT * FROM products;

/* SQL query to Updating Data in Tables */
UPDATE <table_name> 
SET <column_name> = 'value'
WHERE <column_name> = 'value';

UPDATE products
SET name = 'Chai'
WHERE id= 6;

SET SQL_SAFE_UPDATES=0;

UPDATE products
SET price=3.25
WHERE id=7;

SELECT * FROM products;

UPDATE products 
SET name = 'coffee'
WHERE name = 'Filter';

SELECT * FROM products;