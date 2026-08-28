# JOINS

Joins combine rows from multiple tables.

## Types
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- `CROSS JOIN`

## Example
```sql
SELECT s.name, c.course_name
FROM student AS s
INNER JOIN course AS c
    ON s.student_id = c.student_id;
```
