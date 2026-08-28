# GROUP BY

`GROUP BY` groups rows with the same values so aggregate functions can be applied to each group.

## Example
```sql
SELECT grade, COUNT(*) AS student_count
FROM student
GROUP BY grade;
```
