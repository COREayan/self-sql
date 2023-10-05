USE test;

/* SQL QUERY TO ADD A PRIMARY KEY TO A TABLE */
ALTER TABLE <tablename>
ADD PRIMARY KEY (columnname);

/* SQL QUERY TO REMOVE A PRIMARY KEY FROM A TABLE */
ALTER TABLE <tablename>
DROP PRIMARY KEY;

DESCRIBE addresses;

ALTER TABLE addresses
ADD PRIMARY KEY(id);

ALTER TABLE addresses
DROP PRIMARY KEY;