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



-- INNER JOIN returns the intersection of the two tables.
-- The ON clause defines how the tables are related.
-- Table aliases (`c`, `p`) make queries shorter and easier to read.
-- Use LEFT JOIN instead if you also want unmatched rows from the first table.


                   ----------------- LEFT JOIN -----------------

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


-- LEFT JOIN keeps all rows from the left table, whether or not they match.
-- Unmatched rows get NULL in the right table's columns.
-- The order of tables matters: `customer LEFT JOIN payment` gives different results from `payment LEFT JOIN customer`.
-- Use `IS NULL` in the WHERE clause to find unmatched rows.
-- INNER JOIN would return only customers 1 and 2.