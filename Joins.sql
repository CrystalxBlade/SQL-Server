------------ JOINS ------------


CREATE DATABASE shop
USE shop

CREATE TABLE customer (
customer_id BIGINT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
address_id BIGINT
)

CREATE TABLE payment (
customer_id BIGINT PRIMARY KEY,
amount BIGINT,
mode VARCHAR(50),
payment_date DATE
)

INSERT INTO customer VALUES
(1, 'Mary', 'Smith', 5),
(3, 'Linda', 'Williams', 7),
(4, 'Barbara', 'Jones', 8),
(2, 'Madan', 'Mohan', 6)

INSERT INTO payment VALUES
(1, 60, 'Cash', '2020-09-24'),
(2, 30, 'Credit Card', '2020-04-27'), 
(8, 110, 'Cash', '2021-01-26'),
(10, 70, 'mobile payment', '2021-02-28'),
(11, 80, 'Cash', '2021-03-01')


                   ----------------- INNER JOIN -----------------


-- Returns records that have matching values in both tables

------ How it works

-- The database takes each row from the first table.
-- It looks for rows in the second table where the ON condition is true.
-- Every matching pair is combined into one row in the result.
-- Rows with no match in either table are discarded.
-- `JOIN` on its own means the same as `INNER JOIN`.


SELECT * 
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id


-- Customers 1 and 2 exist in both tables, so they appear in the result.
-- Customers 3 and 4 have no payment, so they are excluded.
-- Payments for customer IDs 8, 10 and 11 have no matching customer, so they are exclude


--- Key points

-- INNER JOIN returns the intersection of the two tables.
-- The ON clause defines how the tables are related.
-- Table aliases (`c`, `p`) make queries shorter and easier to read.
-- Use LEFT JOIN instead if you also want unmatched rows from the first table.


                   ----------------- LEFT / RIGHT JOIN -----------------

/*

A LEFT JOIN (also called LEFT OUTER JOIN) returns all rows from the left table, plus the 
matching rows from the right table. If a row in the left table has no match in the right table, 
it is still included, and the columns from the right table are filled with NULL.

*/

------ How it works

-- The database takes every row from the left table (the one after `FROM`).
-- For each row, it looks for matching rows in the right table using the ON condition.
-- If a match is found, the two rows are combined.
-- If no match is found, the left row is still kept and the right table's columns show NULL.
-- Rows that exist only in the right table are discarded.


SELECT * 
FROM customer AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id

-- Customers 1 and 2 have payments, so their payment details are filled in.
-- Customers 3 and 4 have no payment, but they are kept because they are in the left table. Their payment columns are NULL.
-- Payments for customer IDs 8, 10 and 11 have no matching customer, so they do not appear.


--- Key points

-- LEFT JOIN keeps all rows from the left table, whether or not they match.
-- Unmatched rows get NULL in the right table's columns.
-- The order of tables matters: `customer LEFT JOIN payment` gives different results from `payment LEFT JOIN customer`.
-- Use `IS NULL` in the WHERE clause to find unmatched rows.
-- INNER JOIN would return only customers 1 and 2.


                   ----------------- FULL JOIN -----------------

/*

A FULL OUTER JOIN (also called FULL JOIN) returns all rows from both tables. 
Rows that match are combined into one row. Rows that have no match on either side are still included, 
with NULL in the columns of the table that has no match.

*/


------ How it works

-- The database matches rows from both tables using the ON condition.
-- Matching rows are combined into one row.
-- Rows from the left table with no match are kept, with NULL in the right table's columns.
-- Rows from the right table with no match are kept, with NULL in the left table's columns.
-- In effect, it is a LEFT JOIN and a RIGHT JOIN combined.


SELECT *
FROM customer AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id


------ Why 7 rows?

-- Customers 1 and 2 exist in both tables, so they are combined (2 rows).
-- Customers 3 and 4 have no payment, so their payment columns are NULL (2 rows).
-- Payments for IDs 8, 10 and 11 have no customer, so their customer columns are NULL (3 rows).


--- Key points

-- FULL OUTER JOIN keeps every row from both tables.
-- Unmatched rows get NULL for the other table's columns.
-- Use it when you need to compare two tables and find records missing on either side.
-- Compared with the other joins on this data: INNER JOIN returns 2 rows, LEFT JOIN returns 4, and FULL OUTER JOIN returns 7.



----------------------------------------------------------------------------------


CREATE TABLE company(
emp_id BIGINT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id BIGINT
)

INSERT INTO company VALUES
(1, 'Agni', 3),
(2, 'Akash', 4),
(3, 'Dharti', 2),
(4, 'Vayu', 3)

                   ----------------- SELF JOIN -----------------


/*

A SELF JOIN is a regular join where a table is joined with itself. It is used when rows 
in a table are related to other rows in the same table, for example an employee and their 
manager, where both are stored in one table. There is no special SELF JOIN keyword. 
You use INNER JOIN or LEFT JOIN and write the same table twice with different aliases.

*/


SELECT t1.emp_name as employee_name, t2.emp_name as manager_name
FROM company as t1
JOIN company as t2
ON t1.manager_id = t2.emp_id


----- How it works

-- The same table is treated as two separate copies, given different aliases (for example `t1` and `t2`).
-- One copy plays the role of the employee, the other plays the role of the manager.
-- The ON condition links a column of one copy to a column of the other (`manager_id` to `emp_id`).
-- Aliases are required, otherwise SQL cannot tell which copy a column belongs to.


----- How to read the join condition

-- `t1` is the employee copy, and `t1.manager_id` holds the manager's ID.
-- `t2` is the manager copy, and `t2.emp_id` is matched against that ID.
-- Pattern to remember: `employee.manager_id = manager.emp_id`.
-- If the condition is written the other way round (`t1.emp_id = t2.manager_id`), the roles swap, so the column labels must be swapped too.


------ Key points

/*

-- A self join joins a table to itself, using two aliases for the same table.
-- It is used for hierarchical or related data, such as employee and manager or category and parent category.
-- Aliases are mandatory.
-- Use LEFT JOIN if you need to keep rows that have no match, such as the top-level manager.
-- The sample data forms a loop (Dharti reports to Akash, Akash to Vayu, Vayu to Dharti), 
   so no one is at the top. In real data the top person has a NULL manager.

*/


                   ----------------- UNION -----------------

CREATE TABLE custA(
cust_name VARCHAR(30),
cust_amount BIGINT
)

INSERT INTO custA VALUES
('Blade', 2100),
('Hornet', 1200),
('Knight', 5000)

CREATE TABLE custB(
cust_name VARCHAR(30),
cust_amount BIGINT
)

INSERT INTO custB VALUES
('Crystal', 1500),
('Blade', 2100);

/*

UNION combines the results of two or more SELECT queries into a single result set and removes 
duplicate rows. UNION ALL does the same but keeps duplicates.

*/

SELECT cust_name, cust_amount
FROM custA
UNION
SELECT cust_name, cust_amount
FROM custB



SELECT cust_name, cust_amount
FROM custA
UNION ALL
SELECT cust_name, cust_amount
FROM custB


----- Rules

-- Both queries must return the same number of columns.
-- The matching columns must have compatible data types.
-- The column names in the result come from the first query.
-- UNION is not a join. It stacks rows from one query on top of the other, while a join places columns side by side.


----- Key points

-- UNION stacks the results of two queries vertically.
-- Duplicate rows are compared across all selected columns, so a row is a duplicate only if every column matches.
-- Use UNION ALL when duplicates don't matter, because it is faster.
-- Column count and data types must match in every query.