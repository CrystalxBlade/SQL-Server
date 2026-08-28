# Tables

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

## View table information
```sql
EXEC sp_help 'student';
```

## Delete a table
```sql
DROP TABLE student;
```
