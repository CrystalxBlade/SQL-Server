-- JOINS



-- INNER JOIN

-- Returns records that have matching values in both tables

-- The database takes each row from the first table.
-- It looks for rows in the second table where the ON condition is true.
-- Every matching pair is combined into one row in the result.
-- Rows with no match in either table are discarded.
-- `JOIN` on its own means the same as `INNER JOIN`.


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


-- LEFT JOIN

-- Returns all records from the left table, and the matched records from the right table