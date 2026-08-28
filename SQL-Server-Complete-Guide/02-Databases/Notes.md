# Databases

A database is a container used to organize and store related data.

## Create a database
```sql
CREATE DATABASE school_db;
```

`CREATE DATABASE` creates a new database named `school_db`.

## Select a database
```sql
USE school_db;
```

`USE` changes the database in which subsequent statements are executed.

## List databases
```sql
SELECT name
FROM sys.databases;
```

This retrieves the names of databases known to the SQL Server instance.

## Delete a database
```sql
DROP DATABASE school_db;
```

`DROP DATABASE` permanently removes the database and its objects.

## Important
Your SQL Server connection and your database are different things. You normally keep one connection to your SQL Server instance and use `USE database_name` to work with different databases.
