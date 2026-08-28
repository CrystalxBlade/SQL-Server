# Aggregate Functions

Aggregate functions **calculate a result using multiple rows**.

## COUNT()
Counts rows or non-NULL values depending on what is supplied.
```sql
SELECT COUNT(*)
FROM student;
```

## SUM()
Adds numeric values.
```sql
SELECT SUM(fee)
FROM student;
```

## AVG()
Calculates the average.
```sql
SELECT AVG(age)
FROM student;
```

## MIN()
Returns the smallest value.
```sql
SELECT MIN(age)
FROM student;
```

## MAX()
Returns the largest value.
```sql
SELECT MAX(age)
FROM student;
```

Aggregate functions are commonly combined with `GROUP BY`.
