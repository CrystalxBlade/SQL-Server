# Operators

Operators are symbols or keywords used to **compare, calculate, or combine values**.

## Comparison operators

- `=` equal to
- `<>` not equal to
- `!=` not equal to
- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

Example:
```sql
SELECT *
FROM student
WHERE age >= 18;
```

## Logical operators

### AND
Both conditions must be true.
```sql
WHERE age >= 18 AND grade = 12
```

### OR
At least one condition must be true.
```sql
WHERE grade = 11 OR grade = 12
```

### NOT
Reverses a condition.
```sql
WHERE NOT grade = 12
```

## BETWEEN
Checks whether a value falls within a range.
```sql
WHERE age BETWEEN 18 AND 25
```

## IN
Checks whether a value matches one of several values.
```sql
WHERE grade IN (10, 11, 12)
```

## LIKE
Searches for a pattern.
```sql
WHERE name LIKE 'B%'
```
`%` represents zero or more characters.

## IS NULL
Checks whether a value is `NULL`.
```sql
WHERE email IS NULL
```
Do not use `= NULL`; use `IS NULL`.
