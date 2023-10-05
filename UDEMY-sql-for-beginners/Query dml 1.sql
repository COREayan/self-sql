USE coffee_store;

SELECT * FROM products;

/* Query to insert data into Tables */
INSERT INTO <table_name> (<column1>,<column2>,<column3>)
VALUES ('value1','value2','value3');

DESCRIBE products;

INSERT INTO products(name, price)
VALUES('Espresso',2.50);

SELECT * FROM products;

INSERT INTO products(name, price)
VALUES('Macchiato',3.00), ('Cappuccino',3.50);

SELECT * FROM products;

INSERT INTO products(name, price)
VALUES('Latte','3.50'), ('Americano',3.00), ('Flat White',3.50), ('Filter','3.00');

SELECT * FROM products;