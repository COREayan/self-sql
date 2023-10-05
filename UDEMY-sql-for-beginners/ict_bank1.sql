CREATE DATABASE bank;
DROP DATABASE bank;

USE bank;

CREATE TABLE customer_master(
	customer_number VARCHAR(255),
	firstname VARCHAR(30),
	middlename VARCHAR(30),
	lastname VARCHAR(30),
	customer_city VARCHAR(15),
	customer_contact_no VARCHAR(10),
	occupation VARCHAR(10),
	customer_dob DATE,
	CONSTRAINT customer_custid_pk PRIMARY KEY (customer_number)
); 

CREATE TABLE branch_master(
	branch_id VARCHAR(255),
	branch_name VARCHAR(30),
	branch_city VARCHAR(30),
	CONSTRAINT branch_bid_pk PRIMARY KEY (branch_id)
);

CREATE TABLE account_master(
	account_number VARCHAR(255),
	customer_number VARCHAR(255),
	branch_id VARCHAR(255),
	opening_balance INT,
	account_opening_date DATE,
	account_type VARCHAR(10),
	account_status VARCHAR(10),
	PRIMARY KEY (account_number),
	FOREIGN KEY (customer_number) REFERENCES customer_master(customer_number),
	FOREIGN KEY (branch_id) REFERENCES branch_master(branch_id)
);

SHOW TABLES;
DESCRIBE account_master;
DROP TABLE account_master;

CREATE TABLE transaction_details(
	transaction_number VARCHAR(6),
	account_number VARCHAR(6),
	date_of_transaction DATE,
	medium_of_transaction VARCHAR(20),
	transaction_type VARCHAR(20),
	transaction_amount INT,
	CONSTRAINT transaction_details_tnumber_pk PRIMARY KEY (transaction_number),
	CONSTRAINT transaction_details_acnumber_fk FOREIGN KEY (account_number)
	REFERENCES account_master (account_number)
);

DESCRIBE transaction_details;
DROP TABLE transaction_details;

CREATE TABLE loan_details(
	customer_number VARCHAR(255),
	branch_id VARCHAR(255),
	loan_amount BIGINT,
	FOREIGN KEY(customer_number) REFERENCES customer_master(customer_number)
);

INSERT INTO customer_master 
VALUES('C00001',	'RAMESH',	'CHANDRA',	'SHARMA',	'DELHI',	'9543198345',	'SERVICE'	,'1976-12-06'),
	('C00002',	'AVINASH',	'SUNDER',	'MINHA',	'DELHI',	'9876532109'	,'SERVICE',	'1974-10-16'),
	('C00003',	'RAHUL',	'NULL',	'RASTOGI',	'DELHI',	'9765178901',	'STUDENT',	'1981-09-26'),
	('C00004',	'PARUL',	'NULL',	'GANDHI',	'DELHI',	'9876532109'	,'HOUSEWIFE','1976-11-03'),
	('C00005',	'NAVEEN'	,'CHANDRA',	'AEDEKAR',	'MUMBAI',	'8976523190',	'SERVICE'	,'1976-09-19'),
	('C00006',	'CHITRESH',	'NULL',	'BARWE',	'MUMBAI',	'7651298321',	'STUDENT'	,'1992-11-06'),
	('C00007',	'AMIT'	,'KUMAR',	'BORKAR',	'MUMBAI',	'9875189761',	'STUDENT',	'1981-09-06'),
	('C00008',	'NISHA',	NULL,	'DAMLE',	'MUMBAI',	'7954198761',	'SERVICE',	'1975-12-03'),
	('C00009',	'ABHISHEK',	NULL,	'DUTTA',	'KOLKATA'	,'9856198761',	'SERVICE'	,'1973-05-22'),
	('C00010','SHANKAR'	,NULL,	'NAIR',	'CHENNAI',	'8765489076',	'SERVICE',	'1976-07-12');
    
SELECT * FROM customer_master;

INSERT INTO branch_master 
VALUES('B00001',	'ASAF ALI ROAD','DELHI'),
	('B00002','NEW DELHI MAIN BRANCH','DELHI'),
	('B00003'	,'DELHI CANTT',	'DELHI'),
	('B00004'	,'JASOLA',	'DELHI'),
	('B00005'	,'MAHIM'	,'MUMBAI'),
	('B00006'	,'VILE PARLE',	'MUMBAI'),
	('B00007',	'MANDVI'	,'MUMBAI'),
	('B00008'	,'JADAVPUR',	'KOLKATA'),
	('B00009'	,'KODAMBAKKAM',	'CHENNAI');
    
SELECT * FROM branch_master;

INSERT INTO account_master 
VALUES('A00001' ,'C00001','B00001',1000	,'2012-12-15',	'SAVING',	'ACTIVE'),
	('A00002'	,'C00002','B00001',1000	,'2012-06-12'	,'SAVING',	'ACTIVE'),
	('A00003'	,'C00003',	'B00002',	1000	,'2012-05-17'	,'SAVING',	'ACTIVE'),
	('A00004'	,'C00002',	'B00005',	1000	,'2013-01-27'	,'SAVING	','ACTIVE'),
	('A00005'	,'C00006',	'B00006',	1000	,'2012-12-17'	,'SAVING','ACTIVE'),
	('A00006'	,'C00007',	'B00007',	1000	,'2010-08-12'	,'SAVING	','SUSPENDED'),
	('A00007'	,'C00007',	'B00001',	1000	,'2012-10-02'	,'SAVING	','ACTIVE'),
	('A00008'	,'C00001','B00003',	1000	,'2009-11-09'	,'SAVING	','TERMINATED'),
	('A00009'	,'C00003',	'B00007',	1000	,'2008-11-30'	,'SAVING',	'TERMINATED'),
	('A00010'	,'C00004',	'B00002',	1000	,'2013-03-01'	,'SAVING',	'ACTIVE');

SELECT * FROM account_master;

INSERT INTO transaction_details  
VALUES('T00001',	'A00001',	'2013-01-01',	'CHEQUE',	'DEPOSIT',		2000),
	('T00002',		'A00001',	'2013-02-01',	'CASH',		'WITHDRAWAL',	1000),
	('T00003',		'A00002', 	'2013-01-01',	'CASH',		'DEPOSIT',		2000),
	('T00004',		'A00002',	'2013-02-01', 	'CASH',		'DEPOSIT',		3000),
	('T00005',		'A00007',	'2013-01-11',	'CASH',		'DEPOSIT',		7000),
	('T00006',		'A00007',	'2013-01-13',	'CASH',		'DEPOSIT',		9000),
	('T00007',		'A00001',	'2013-03-13',	'CASH',		'DEPOSIT',		4000),
	('T00008',		'A00001',	'2013-03-14',	'CHEQUE',	'DEPOSIT',		3000),
	('T00009',		'A00001',	'2013-03-21',	'CASH',		'WITHDRAWAL',	9000),
	('T00010',		'A00001',	'2013-03-22',	'CASH',		'WITHDRAWAL',	2000),
	('T00011',		'A00002',	'2013-03-25',	'CASH',		'WITHDRAWAL',	7000),
	('T00012',		'A00007',	'2013-03-26',	'CASH',		'WITHDRAWAL',	2000);

SELECT * FROM transaction_details;

INSERT INTO Loan_details  
VALUES	('C00001',	'B00001',	100000),
		('C00002',	'B00002',	200000),
		('C00009',	'B00008',	400000),
		('C00010',	'B00009',	500000),
		('C00001',	'B00003',	600000),
		('C00002',	'B00001',	600000);

SELECT * FROM loan_details;

/* 
	Q1.	Write a query to display account number, customer’s number, customer’s firstname, lastname, account opening date. 
		Display the records sorted in ascending order based on account number.
*/
DESCRIBE account_master;
DESCRIBE customer_master;

#ALTER TABLE customer_master RENAME 'CUSTOMER_NUMBER' TO 'customer_number';

SELECT a.account_number, a.customer_number, c.firstname, c.lastname, a.account_opening_date 
FROM customer_master c JOIN account_master a 
ON c.customer_number = a.customer_number
ORDER BY account_number;

/*
	Q2.	Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.
*/
SHOW TABLES;
DESCRIBE customer_master;

SELECT COUNT(customer_number) AS Cust_Count FROM customer_master
WHERE LOWER(LTRIM(RTRIM(customer_city))) = 'delhi';

/*
	Q3.	Write a query to display the customer number, customer firstname, account number for the customer’s whose accounts were created after 15th of any month. 
    Display the records sorted in ascending order based on customer number and then by account number.
*/
DESCRIBE account_master;

SELECT a.customer_number, c.firstname, a.account_number 
FROM customer_master c JOIN account_master a 
ON c.customer_number = a.customer_number
WHERE DAY(a.account_opening_date)>15;

/*
	Q4.	Write a query to display customer number, customer's first name, account number where the account status is terminated. 
    Display the records sorted in ascending order based on customer number and then by account number.
*/
DESCRIBE account_master;

SELECT a.customer_number, c.firstname, a.account_number 
FROM customer_master c JOIN account_master a 
ON c.customer_number = a.customer_number
WHERE LOWER(RTRIM(LTRIM(a.account_status))) = 'terminated'
ORDER BY c.customer_number, a.account_number; 

/*
	Q5.	Write a query to display the total number of withdrawals and total number of deposits being done by customer whose customer number ends with 001. 
    The query should display transaction type and the number of transactions. 
    Give an alias name as Trans_Count for number of transactions. Display the records sorted in ascending order based on transaction type.
*/
SHOW TABLES;
DESCRIBE transaction_details;
DESCRIBE account_master;

SELECT t.transaction_type, COUNT(t.transaction_number) AS Trans_Count 
FROM account_master a JOIN transaction_details t 
ON a.account_number = t.account_number 
WHERE a.customer_number LIKE '%001' 
GROUP BY t.transaction_type
ORDER BY t.transaction_type;


/*
	Q6. Write a query to display the number of customers who have registration but no account in the bank. Give the alias name as Count_Customer for number of customers.
*/
DESCRIBE customer_master;
SELECT  COUNT(customer_number) AS Count_Customer FROM customer_master 
WHERE customer_number NOT IN (
	SELECT customer_number FROM account_master 
);

/*
	Q7. Write a query to display account number and total amount deposited by each account holder (Including the opening balance). 
    Give the total amount deposited an alias name of Deposit_Amount.  Display the records in sorted order based on account number.
*/
DESCRIBE account_master;
DESCRIBE transaction_details;

SELECT a.account_number, a.opening_balance+SUM(t.transaction_amount) AS Deposit_Amount FROM account_master a
JOIN transaction_details t ON a.account_number = t.account_number
WHERE LOWER(LTRIM(RTRIM(t.transaction_type))) = 'deposit'
GROUP BY a.account_number
ORDER BY a.account_number;

/*
	Q8. Write a query to display the number of accounts opened in each city .The Query should display Branch City and number of accounts as No_of_Accounts.
    For the branch city where we don’t have any accounts opened display 0. Display the records in sorted order based on branch city.
*/
SELECT b.branch_city, COUNT(a.account_number) AS No_of_Accounts FROM branch_master b
LEFT JOIN account_master a ON b.branch_id = a.branch_id 
GROUP BY b.branch_city 
ORDER BY b.branch_city;

/*
	Q9. Write  a query to display the firstname of the customers who have more than 1 account. Display the records in sorted order based on firstname.
*/
SELECT c.firstname FROM account_master a 
LEFT JOIN customer_master c ON a.customer_number = c.customer_number 
GROUP BY c.firstname
HAVING COUNT(a.account_number)>1
ORDER BY c.firstname;

/*
	Q10. Write a query to display the customer number, customer firstname, customer lastname who has taken loan from more than 1 branch. 
    Display the records sorted in order based on customer number.
*/
DESCRIBE loan_details;

SELECT c.customer_number, c.firstname, c.lastname FROM loan_details l 
JOIN customer_master c ON l.customer_number=c.customer_number
GROUP BY  l.customer_number HAVING COUNT(l.branch_id)>1
ORDER BY c.customer_number;

/*SELECT c.customer_number,c.firstname,c.lastname FROM
customer_master c JOIN loan_details l ON c.customer_number=l.customer_number
GROUP BY l.customer_number HAVING count(l.branch_id)>1
ORDER BY c.customer_number;*/ 

/*
	Q11. Write a query to display the customer’s number, customer’s firstname, customer’s city and branch city where the city of the customer and city of the branch 
		is different. Display the records sorted in ascending order based on customer number.
*/
SELECT c.customer_number, c.firstname, c.customer_city, b.branch_city 
FROM customer_master c JOIN account_master a ON c.customer_number = a.customer_number 
JOIN branch_master b ON b.branch_id = a.branch_id
WHERE LOWER(LTRIM(RTRIM(c.customer_city))) <> LOWER(LTRIM(RTRIM(b.branch_city)))
ORDER BY c.customer_number;

/*
	Q12. Write a query to display the number of clients who have asked for loans but they don’t have any account in the bank though they are registered customers. 
    Give the count an alias name of Count.
*/
SELECT  COUNT(customer_number) FROM customer_master 
WHERE customer_number NOT IN (
	SELECT DISTINCT customer_number FROM account_master 
) AND customer_number IN (
	SELECT DISTINCT customer_number FROM loan_details
);

/*
	Q13. Write a query to display the account number who has done the highest transaction. For example the account A00023 has done 5 transactions 
    i.e. suppose 3 withdrawal and 2 deposits. Whereas the account A00024 has done 3 transactions i.e. suppose 2 withdrawals and 1 deposit. 
    So account number of A00023 should be displayed. In case of multiple records, display the records sorted in ascending order based on account number.
*/
SELECT account_number FROM transaction_details
GROUP BY account_number 
HAVING COUNT(transaction_number)>=ALL(
	SELECT COUNT(transaction_number) FROM transaction_details 
	GROUP BY account_number
)
ORDER BY account_number;

/*
	Q14. Write a query to show the branch name,branch city where we have the maximum customers. For example the branch B00019 has 3 customers, 
    B00020 has 7 and B00021 has 10. So branch id B00021 is having maximum customers. If B00021 is Koramangla branch Bangalore, Koramangla branch should be 
    displayed along with city name Bangalore. In case of multiple records, display the records sorted in ascending order based on branch name.
*/
SELECT b.branch_name, b.branch_city FROM branch_master b 
JOIN account_master a ON b.branch_id = a.branch_id
GROUP BY a.branch_id
HAVING COUNT(a.customer_number) >= ALL(
	SELECT COUNT(customer_number) FROM account_master 
    GROUP BY branch_id
)
ORDER BY b.branch_name;

/*
	Q15. Write a query to display all those account number, deposit, withdrawal where withdrawal is more than deposit amount. 
    Hint: Deposit should include opening balance as well. For example A00011 account opened with Opening Balance 1000 and  A00011 deposited 2000 
    rupees on 2012-12-01 and 3000 rupees on 2012-12-02. The same account i.e A00011 withdrawn 3000 rupees on 2013-01-01 and 7000 rupees on 2013-01-03.
    So the total deposited amount is 6000 and total withdrawal amount is 10000. So withdrawal amount is more than deposited amount for account number A00011. 
    Display the records sorted in ascending order based on account number.
*/



/*
	Q16. Write a query to show the balance amount for account number that ends with 001. Note: Balance amount includes account opening balance also. 
    Give alias name as Balance_Amount. For example A00015 is having an opening balance of 1000. A00015 has deposited 2000 on 2012-06-12 and deposited 3000 on 2012-07-13. 
    The same account has drawn money of 500 on 2012-08-12 , 500 on 2012-09-15, 1000 on 2012-12-17. So balance amount is 4000 
    i.e (1000 (opening balance)+2000+3000 ) – (500+500+1000).
*/



/*
	Q17. Display the customer number, customer's first name, account number and number of transactions  being made by the customers from each account. 
    Give the alias name for number of transactions as Count_Trans. Display the records sorted in ascending order based on customer number and then by account number.
*/



/*
	Q18. Write a query to display the customer’s firstname who have multiple accounts (atleast  2 accounts). 
    Display the records sorted in ascending order based on customer's firstname.
*/



/*
	Q19. Write a query to display the customer number, firstname, lastname for those client where total loan amount taken is maximum and at least taken from 2 branches. 
    For example the customer C00012 took a loan of 100000 from bank branch with id B00009 and C00012 Took a loan of 500000 from bank branch with id B00010.
    So total loan amount for customer C00012 is 600000. C00013 took a loan of 100000 from bank branch B00009 and 200000 from bank branch B00011.
    So total loan taken is 300000. So loan taken by C00012 is more then C00013.
*/



/*
	Q20. Write a query to display the customer’s number, customer’s firstname, branch id and loan amount for people who have taken loans. Display the records sorted 
    in ascending order based on customer number and then by branch id and then by loan amount.
*/




/*
	Q21. Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch. 
    Display the records sorted in ascending order based on city name.
*/



/*
	Q22. Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose account is Active. 
    Display the records sorted in ascending order based on account id /account number.
*/



/*
	Q23. Write a query to display customer’s number, first name and middle name. For the customers who don’t have middle name, 
    display their last name as middle name. Give the alias name as Middle_Name.  Display the records sorted in ascending order based on customer number.
*/



/*
	Q24. Write a query to display the customer number , firstname, customer’s date of birth . Display the records sorted in ascending order of date of birth year 
    and within that sort by firstname in ascending order.
*/



/*
	Q25. Write a query to display the customers firstname, city and account number whose occupation are not into Business, Service or Student. Display the records 
    sorted in ascending order based on customer first name and then by account number.
*/