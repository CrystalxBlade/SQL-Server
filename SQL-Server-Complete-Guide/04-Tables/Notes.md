# Tables

A table stores data in **rows and columns**.

## Create a table
```sql
CREATE TABLE student
(
    student_id INT,
    name VARCHAR(100),
    age INT,
    grade INT
);
```

### What happens here?
- `CREATE TABLE` tells SQL Server to create a table.
- `student` is the table name.
- `student_id`, `name`, `age`, and `grade` are columns.
- `INT` and `VARCHAR(100)` are data types.

## View table information
```sql
EXEC sp_help 'student';
```
`sp_help` displays information about a database object, including its columns and data types.

## Delete a table
```sql
DROP TABLE student;
```
`DROP TABLE` removes the table itself and the data stored in it.

## Important
A table belongs to a database. For example:
`SQL Server instance -> school_db -> student table`
