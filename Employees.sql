CREATE DATABASE EMP

USE EMP

CREATE TABLE employee
(
emp_id INT IDENTITY(101,1) PRIMARY KEY, 
fname VARCHAR(50) NOT NULL, 
lname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
job_title VARCHAR(50) NOT NULL,
department VARCHAR(50),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CONVERT(date, GETDATE()),
city VARCHAR(50)
);

INSERT INTO employee
(fname, lname, email, job_title, department, salary, hire_date, city)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 'Mumbai'),
('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),
('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 'Bengaluru'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 'Mumbai'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 'Hyderabad'),
('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 'Delhi'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 'Mumbai'),
('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 'Pune'),
('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 'Mumbai'),
('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 'Bengaluru'),
('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),
('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 'Hyderabad'),
('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 'Delhi'),
('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),
('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');


SELECT * FROM employee

INSERT INTO employee
(fname, lname, email, job_title, department, city)
VALUES 
('Crystal','Blade','crystalxblade@gmail.com', 'Game Dev', 'Tech', 'Noida');


-- WHERE Clause --

SELECT * FROM employee WHERE emp_id = 105
SELECT * FROM employee WHERE department = 'Sales'
SELECT * FROM employee WHERE department != 'Sales'
SELECT * FROM employee WHERE salary > 85000
SELECT * FROM employee WHERE hire_date > '2020-12-31'


-- Distinct --

SELECT DISTINCT department FROM employee 


-- ORDER BY -- 

SELECT * FROM employee ORDER BY salary DESC
SELECT * FROM employee ORDER BY hire_date
SELECT * FROM employee ORDER BY fname
SELECT department, fname FROM employee ORDER BY department, fname


-- LIKE --

SELECT * FROM employee WHERE department LIKE '%Human%'
SELECT * FROM employee WHERE fname LIKE 'A%'
SELECT * FROM employee WHERE fname LIKE '%n'
SELECT * FROM employee WHERE fname LIKE '[ADRZ]%'
SELECT * FROM employee WHERE fname LIKE '[^A]%'
SELECT * FROM employee WHERE fname LIKE '_a%'
SELECT * FROM employee WHERE fname LIKE '____'


-- TOP --

SELECT TOP 3 * FROM employee
SELECT TOP 3 * FROM employee ORDER BY salary DESC
SELECT TOP 5 * FROM employee ORDER BY hire_date DESC
SELECT TOP 1 * FROM employee WHERE department = 'Marketing'


-- AND --

SELECT * FROM employee WHERE salary >= 75000 AND department = 'Sales'


-- OR --

SELECT * FROM employee WHERE salary = 75000 OR department = 'Design'
SELECT * FROM employee WHERE salary = 75000 OR department = 'TECH' OR city = 'Banglore'


-- IN --

SELECT * FROM employee WHERE department IN ('Design', 'Management', 'Human Resources')


-- NOT IN --

SELECT * FROM employee WHERE department NOT IN ('Design', 'Management', 'Human Resources')

-- BETWEEEN --

SELECT * FROM employee WHERE salary BETWEEN 70000 AND 90000


-- CASE -- 

SELECT fname, lname, salary,

CASE
    WHEN salary > 100000 THEN 'High Earner'
    WHEN salary BETWEEN 80000 AND 100000 THEN 'Medium Earner'
    ELSE 'Standard Earner'
END as sal_cat
FROM employee


-- Calculate Bonus --

SELECT fname, lname, department, salary,
CASE
    WHEN department IN ('Sales', 'Marketing') THEN salary * 0.10
    WHEN department = 'Tech' THEN salary * 0.12
    ELSE salary * 0.05
END as bonus

FROM employee


-- Aggregate Functions -- 

SELECT COUNT(emp_id) FROM employee
SELECT MIN(salary) FROM employee
SELECT MAX(salary) FROM employee
SELECT AVG(salary) FROM employee
SELECT SUM(salary) FROM employee


-- GROUP BY --

SELECT department FROM employee GROUP BY department
SELECT department, COUNT(emp_id) as employees FROM employee GROUP BY department
SELECT city, COUNT(emp_id) as emp FROM employee GROUP BY city
SELECT department, SUM(salary) FROM employee GROUP BY department
SELECT department, AVG(salary) as amount FROM employee GROUP BY department


-- Multi Level Grouping -- 

SELECT department, city, COUNT(emp_id) as workers FROM employee GROUP BY department, City 


-- GROUP BY ROLLUP --

SELECT department, COUNT(emp_id) as emp 
FROM employee 
GROUP BY ROLLUP(department)

SELECT department, SUM(salary)
FROM employee 
GROUP BY ROLLUP(department)


-- HAVING Clause --

SELECT department, COUNT(emp_id) 
FROM employee 
GROUP BY department HAVING COUNT(emp_id) > 2


SELECT job_title, AVG(salary)
FROM employee 
GROUP BY job_title HAVING AVG(salary) > 90000

SELECT department, SUM(salary) as total
FROM employee 
GROUP BY department HAVING SUM(salary) > 200000


-- COALESCE --

SELECT department, COALESCE(city,'Total') as city, COUNT(emp_id)
FROM employee
GROUP BY ROLLUP (department, city)
ORDER BY department


-- SUB QUERIES --


-- 1 Single row --
SELECT emp_id, fname, lname, salary 
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)

-- 2 Multiple row --
SELECT * FROM employee 
WHERE department IN 
(SELECT department FROM employee WHERE city = 'Mumbai')


-- 3 Correlated --
SELECT * FROM employee e1
WHERE salary = (
SELECT MAX(salary) FROM employee e2
WHERE e2.department = e1.department
)


-- INLINE SUB QUERIES -- 

SELECT department, avg_salary
FROM (
     SELECT department, AVG(salary) as avg_salary FROM employee
     GROUP BY department
) AS dept_avg
WHERE avg_salary > 90000 


-- CONCAT -- 

SELECT CONCAT(fname,' ', lname) as full_name FROM employee

-- CONCAT_WS --

SELECT CONCAT_WS(' : ', 'One', 'Two', 'Three', 'Four', 'Five', 'Six')
SELECT CONCAT_WS(' , ', emp_id, lname, department) FROM employee


-- SUBSTRING --

SELECT SUBSTRING('Crystal x Blade',2,5)


-- REPLACE --

SELECT REPLACE('Crystal x Blade','Crystal','Skull')
SELECT REPLACE(department, 'Human Resources', 'HR') as dept FROM employee

