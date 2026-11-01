             ------------------------  Practice  ------------------------


CREATE DATABASE Practice

CREATE TABLE payment (
customer_id BIGINT PRIMARY KEY,
amount BIGINT,
mode VARCHAR(50),
payment_date DATE
)

INSERT INTO payment VALUES
(1, 60, 'Cash', '2020-09-24'),
(2, 30, 'Credit Card', '2020-04-27'),
(3, 90, 'Credit Card', '2020-07-07'),
(4, 50, 'Debit Card', '2020-02-12'),
(5, 40, 'Mobile Payment', '2020-11-20'),
(6, 40, 'Debit Card', '2021-06-28'),
(7, 10, 'Cash', '2021-08-25')

SELECT mode, SUM(amount) as Total 
FROM payment 
GROUP BY mode
ORDER BY Total

SELECT * FROM payment