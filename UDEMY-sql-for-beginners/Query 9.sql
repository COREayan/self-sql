USE test;

/* HOW TO CHANGE A COLUMNS DATA TYPE */
ALTER TABLE <tablename> MODIFY <columnname> <data type>;

DESCRIBE addresses;

ALTER TABLE addresses MODIFY city VARCHAR(30);

DESCRIBE addresses;

ALTER TABLE addresses MODIFY city  CHAR(25);

DESCRIBE addresses;