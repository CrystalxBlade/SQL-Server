# Views

A view is a **saved SQL query that behaves like a virtual table**.

It normally stores the query definition rather than a separate copy of the underlying data.

## Create a view
```sql
CREATE VIEW AdultStudents AS
SELECT student_id, name, age
FROM student
WHERE age >= 18;
```

## Use the view
```sql
SELECT *
FROM AdultStudents;
```

## Why use views?
- Simplify complex queries
- Reuse commonly needed queries
- Control which columns are exposed
- Provide a convenient abstraction over tables
