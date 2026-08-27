-- List down existing DB
EXEC sp_databases
SELECT name FROM sys.databases

-- Creating a DB
CREATE DATABASE school_db
CREATE DATABASE demo

-- Selecting a DB
USE school_db
SELECT DB_NAME()

-- Creating a table

CREATE TABLE student
(student_id INT, 
name VARCHAR(100), 
age INT, 
grade INT
);

-- Check existing table

EXEC sp_help 'student'

-- Inserting data 

INSERT INTO student(student_id, name, age, grade)
VALUES (101, 'Crystal', 23, 10)

INSERT INTO student(student_id, name, age, grade)
VALUES (102, 'Blade', 24, 11), (103, 'Knight', 25, 12)

INSERT INTO student
VALUES (104, 'Hornet', 26, 14)

-- Reading Data

SELECT * FROM student
SELECT name FROM student

-- Update 

UPDATE student
SET grade = 15
WHERE student_id = 103

-- Delete Data

DELETE FROM student
WHERE student_id = 104
