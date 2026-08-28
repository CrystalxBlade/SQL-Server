# Clauses

A **clause is a part of a SQL statement that performs a specific job**.

## WHERE
Filters rows based on a condition.
```sql
SELECT *
FROM student
WHERE age >= 18;
```

## ORDER BY
Sorts the result.
```sql
SELECT *
FROM student
ORDER BY age DESC;
```

## GROUP BY
Groups rows with the same values, usually for aggregate calculations.
```sql
SELECT grade, COUNT(*)
FROM student
GROUP BY grade;
```

## HAVING
Filters groups after `GROUP BY`.
```sql
SELECT grade, COUNT(*)
FROM student
GROUP BY grade
HAVING COUNT(*) > 1;
```

## TOP
Returns a specified number of rows.
```sql
SELECT TOP 5 *
FROM student;
```

## DISTINCT
Removes duplicate values from the result.
```sql
SELECT DISTINCT grade
FROM student;
```
