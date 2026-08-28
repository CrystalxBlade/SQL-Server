# Introduction to MS SQL Server

## What is SQL?
SQL (Structured Query Language) is a language used to communicate with relational databases. You use SQL to create databases and tables, insert data, retrieve data, update data, and delete data.

## What is Microsoft SQL Server?
Microsoft SQL Server is a relational database management system (RDBMS). It stores data in tables and provides SQL commands for working with that data.

## Important terms

### Database
A database is a container that holds related data and database objects such as tables, views, procedures, and indexes.

### Table
A table stores data in rows and columns.

### Row
A row represents one complete record.

### Column
A column represents one property/field of the records.

### SQL Server Instance
An instance is the SQL Server service you connect to. Multiple databases can exist inside the same instance.

## Example
```sql
SELECT name
FROM sys.databases;
```
This displays the databases available on the SQL Server instance.
