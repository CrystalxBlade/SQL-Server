# HAVING

`HAVING` filters groups created by `GROUP BY`.

## Example
```sql
SELECT grade, COUNT(*) AS student_count
FROM student
GROUP BY grade
HAVING COUNT(*) > 1;
```

`WHERE` filters rows before grouping, while `HAVING` filters groups after grouping.
