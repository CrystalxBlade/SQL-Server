# Window Functions

Window functions calculate values across related rows without collapsing them into one row per group.

Common functions:
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `SUM() OVER()`
- `AVG() OVER()`

## Example
```sql
SELECT
    name,
    grade,
    ROW_NUMBER() OVER (ORDER BY grade DESC) AS row_num
FROM student;
```
