# Common Table Expressions (CTE)

A CTE creates a temporary named result set that can be referenced by the following statement.

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
