# Views

A view is a virtual table based on a query.

## Create a view
```sql
CREATE VIEW AdultStudents AS
SELECT student_id, name, age
FROM student
WHERE age >= 18;
```

## Use a view
```sql
SELECT *
FROM AdultStudents;
```
