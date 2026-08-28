# Stored Procedures

A stored procedure is a **named collection of SQL statements stored in the database that can be executed when needed**.

## Example
```sql
CREATE PROCEDURE GetStudents
AS
BEGIN
    SELECT *
    FROM student;
END;
```

## Execute it
```sql
EXEC GetStudents;
```

## With a parameter
```sql
CREATE PROCEDURE GetStudentById
    @student_id INT
AS
BEGIN
    SELECT *
    FROM student
    WHERE student_id = @student_id;
END;
```

Execute:
```sql
EXEC GetStudentById @student_id = 1;
```

Stored procedures are useful for reusable database operations and can accept parameters.
