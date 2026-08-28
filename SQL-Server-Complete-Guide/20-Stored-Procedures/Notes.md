# Stored Procedures

A stored procedure is a reusable set of SQL statements stored in the database.

## Example
```sql
CREATE PROCEDURE GetStudents
AS
BEGIN
    SELECT *
    FROM student;
END;
```

## Execute
```sql
EXEC GetStudents;
```
