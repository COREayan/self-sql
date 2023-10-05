USE test;

ALTER TABLE <tablename> CHANGE 'old_column_name' 'new_column_name' <data type>;

SELECT * FROM pets;

ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);

ALTER TABLE pets RENAME COLUMN animal_type TO species;