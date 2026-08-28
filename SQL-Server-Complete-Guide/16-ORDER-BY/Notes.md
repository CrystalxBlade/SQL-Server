# ORDER BY

`ORDER BY` **sorts the rows returned by a query**.

## Ascending
```sql
SELECT *
FROM student
ORDER BY age ASC;
```
`ASC` means smallest to largest / A to Z. It is the default.

## Descending
```sql
SELECT *
FROM student
ORDER BY age DESC;
```
`DESC` means largest to smallest / Z to A.

## Multiple columns
```sql
SELECT *
FROM student
ORDER BY grade DESC, name ASC;
```
SQL Server sorts by `grade` first, then `name` when grades are equal.
