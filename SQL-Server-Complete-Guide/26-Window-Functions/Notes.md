# Window Functions

A window function calculates a value using a set of related rows **without collapsing those rows into one result row per group**.

## ROW_NUMBER()
Gives each row a sequential number.
```sql
SELECT
    name,
    grade,
    ROW_NUMBER() OVER (ORDER BY grade DESC) AS row_num
FROM student;
```

## RANK()
Assigns rankings. Tied values receive the same rank, and later ranks can have gaps.

## DENSE_RANK()
Also gives tied values the same rank, but does not leave gaps after ties.

## SUM() OVER()
Can calculate a running or windowed total while keeping individual rows.

Window functions are especially useful for rankings, running totals, comparisons with neighboring rows, and reporting.
