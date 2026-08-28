# Subqueries

A subquery is a **query inside another SQL query**.

## Example
```sql
SELECT name, age
FROM student
WHERE age > (
    SELECT AVG(age)
    FROM student
);
```

The inner query:
```sql
SELECT AVG(age) FROM student
```
calculates the average age.

The outer query then finds students whose age is greater than that average.

Subqueries can appear in places such as `WHERE`, `FROM`, and `SELECT`, depending on the query.
