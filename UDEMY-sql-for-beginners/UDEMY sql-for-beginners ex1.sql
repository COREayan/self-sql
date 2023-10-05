USE test;
/* a)    Add a primary key to the id fields in the pets and people tables. */
DESCRIBE people;
ALTER TABLE people 
ADD PRIMARY KEY (id);

DESCRIBE pets;
ALTER TABLE pets
ADD PRIMARY KEY (id);

/* b)    Add a foreign key to the owner_id field in the pets table referencing the id field in the people table. */
DESCRIBE pets;
ALTER TABLE pets
ADD CONSTRAINT FK_PetsOwner
FOREIGN KEY (owner_id) REFERENCES people(id);

/* c)    Add a column named email to the people table. */
DESCRIBE people;
ALTER TABLE people
ADD COLUMN email varchar(30);

/* d)    Add a unique constraint to the email column in the people table. */
DESCRIBE people;
ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE (email);

/* e)    Rename the name column in the pets table to 'first_name'. */
DESCRIBE pets;
ALTER TABLE pets
CHANGE `name` `first_name` VARCHAR(30);

/* f)    change the postcode data type to CHAR(7) in the addresses table. */
DESCRIBE addresses;
ALTER TABLE addresses MODIFY postcode CHAR(7);