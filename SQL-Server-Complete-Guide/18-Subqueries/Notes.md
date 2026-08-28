# Subqueries

A subquery is a query nested inside another query.

## Example
```sql
SELECT name, age
FROM student
WHERE age > (
    SELECT AVG(age)
    FROM student
);
```
