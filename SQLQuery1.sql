-- List down existing DB
EXEC sp_databases
SELECT name FROM sys.databases

-- Creating a DB
CREATE DATABASE school_db
CREATE DATABASE demo

-- Selecting a DB
USE school_db
SELECT DB_NAME()