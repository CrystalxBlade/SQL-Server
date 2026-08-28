# Common Table Expressions (CTE)

A Common Table Expression (CTE) is a **temporary named result set that exists for the duration of a single statement**.

## Example
```sql
WITH AdultStudents AS
(
    SELECT *
    FROM student
    WHERE age >= 18
)
SELECT *
FROM AdultStudents;
```

The CTE gives a name, `AdultStudents`, to the query inside the parentheses.

## Why use CTEs?
- Make complex queries easier to read
- Break a large query into logical steps
- Support recursive queries
