# HAVING

`HAVING` **filters groups created by `GROUP BY`**.

## Example
```sql
SELECT grade, COUNT(*) AS student_count
FROM student
GROUP BY grade
HAVING COUNT(*) > 1;
```

This returns only grades that have more than one student.

## WHERE vs HAVING

`WHERE` filters individual rows **before grouping**.

`HAVING` filters groups **after grouping**.

Example:
```sql
SELECT grade, COUNT(*)
FROM student
WHERE age >= 18
GROUP BY grade
HAVING COUNT(*) > 1;
```
