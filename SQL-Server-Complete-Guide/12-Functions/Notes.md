# Functions

A function performs an operation and returns a value.

SQL Server has many built-in functions.

## String functions

### LEN()
Returns the number of characters in a string.
```sql
SELECT LEN('Blade');
```

### UPPER()
Converts text to uppercase.
```sql
SELECT UPPER(name)
FROM student;
```

### LOWER()
Converts text to lowercase.
```sql
SELECT LOWER(name)
FROM student;
```

## Date function

### GETDATE()
Returns the current SQL Server date and time.
```sql
SELECT GETDATE();
```

## NULL-handling functions

### ISNULL()
Returns a replacement value when an expression is `NULL`.
```sql
SELECT ISNULL(email, 'No Email')
FROM student;
```

### COALESCE()
Returns the first non-NULL expression.
```sql
SELECT COALESCE(email, phone, 'No Contact')
FROM student;
```
