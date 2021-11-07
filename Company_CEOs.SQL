--To create the tables and load the csv data to populate the table created
CREATE TABLE CEOs_Table (
	record_id INTEGER,
	date DATE, 
	ceo_id INTEGER,
	first_name TEXT,
	last_name TEXT,
	date_of_birth DATE,
	total_revenue REAL,
	total_expenses REAL,
	state VARCHAR(14),
	postal_codes CHAR(5),
	compani_name TEXT,
	industry TEXT,
	email TEXT,
PRIMARY KEY(record_id));
	
--To view the entire table data
SELECT *
FROM CEOs_Table;

--To view the data types for each column on records_sep21
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'CEOs_Table';

--Task 1
ALTER TABLE CEOs_Table
RENAME compani_name TO company_name; /* This statement alters the wrong 
column spelling (compani_name) to the correct one (company_name)*/

--To view the corrected column
SELECT company_name
FROM CEOs_Table;

--Task 2
SELECT COUNT(record_id)
FROM CEOs_Table; /*This statement returns the total count of the entire table.
Our data output shows 1800 as the total count*/

--Task 3
DELETE FROM CEOs_Table
WHERE ceo_id = 430 /*This statement corrects the wrong data that is
on the records_sep21 table*/

--To view the corrected column
SELECT ceo_id
FROM CEOs_Table;

--Task 4
INSERT INTO CEOs_Table (
	record_id,
	date, 
	ceo_id,
	first_name,
	last_name,
	date_of_birth,
	total_revenue,
	total_expenses,
	state,
	postal_codes,
	company_name,
	industry,
	email)
	VALUES ('430',
		   '2020-10-31',
			1012,
		   'Franklin',
		   'Ortiz',
		   '1973-07-16',
		   499.83,
		   190.5,
		   'Pennsylvania',
		   33677,
		   'Meyer-Miles',
		   'Oil and Gas',
		   'franklin.ortiz@Meyer.com');
/*This statement adds a new row to the CEOs table. This SELECT 
statement can be used to view the added row*/
		   
SELECT *
FROM CEOs_Table
WHERE record_id = 430;

--Task 5
UPDATE CEOs_Table
SET state = 'Texas'
WHERE state IS NULL;

/*This statement corrects a wrong data on the Table from 'NULL' to 'Texas'. 
This SELECT statement can be used to view the added row*/

SELECT *
FROM CEOs_Table
WHERE state = 'Texas';

--Task 6
SELECT DISTINCT(state)
FROM CEOs_Table;
--This statement shows the distinct states on the table

--Task 7
UPDATE CEOs_Table
SET state = 'New York'
WHERE state = 'New Yoke';
--This statement corrects a wrong data on the Table from 'New Yoke' to 'New York'. 

--Task 8
SELECT SUM(total_revenue-total_expenses) AS profit
FROM CEOs_Table;
/*This statement returns the sum of profits made over 3 years.
Our data output shows 538,751 million dollars as the total profits*/

--Task 9
SELECT (total_revenue-total_expenses) AS minimum_profit
FROM CEOs_Table
ORDER BY minimum_profit ASC
LIMIT 1;
/*This statement returns the ceo with the minimum profit in the 3 years.
Our data output shows 257.76 million dollars as the minimum profit*/

--Task 10
SELECT state, AVG(total_revenue-total_expenses) AS average_profit
FROM CEOs_Table
GROUP BY state
ORDER BY average_profit DESC
LIMIT 1;
/*This statement returns the state where the highest mean profit was generated in 
3 years. Our data output shows 300.19 million dollars as the maximum profit*/

-Task 11
SELECT first_name, last_name, ceo_id, date_of_birth
FROM CEOs_Table
ORDER BY date_of_birth DESC
LIMIT 1;
/*This statement returns the youngest CEO. our output shows Crystal Burgess as
the youngest CEO*/

--Task 12
SELECT (first_name), state
FROM CEOs_Table
WHERE INDUSTRY = 'IT' AND STATE = 'California';
/*This statement returns the CEO whose INDUSTRY is the IT Industry 
and STATE is California. Our output shows Jessica as the answer.*/

--Task 13
SELECT postal_codes,
		total_revenue,  
		state
FROM CEOs_Table
WHERE STATE = 'New York'
ORDER BY total_revenue DESC
LIMIT 1;
/*This statement returns the Postal code in New York with the highest revenue.
Our output shows postal code 33013 has the highest revenue*/

--Task 14
SELECT COUNT(DISTINCT(ceo_id))
FROM CEOs_Table
WHERE email LIKE '%.com';
/* This statement returns the count of how many CEO(s) have their email
addresses as .com. The output shows that a total of 14 CEO(s) use email
ending with .com

The statement below can be used to display the ceo id & their emails*/

SELECT DISTINCT(ceo_id), email
FROM CEOs_Table
WHERE email LIKE '%.com';
-- right (email, 4) = ('.com')  

--Task 15
SELECT first_name, COUNT(DISTINCT(ceo_id)) AS ceo_count
FROM CEOs_Table
GROUP BY first_name
ORDER BY ceo_count DESC
LIMIT 1;
/*This statement returns Which first name(s) 
is bore by most number of CEOs. Our output shows that Jason
was bore by 2 CEOs*/
