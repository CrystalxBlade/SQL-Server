# Data Types

A data type tells SQL Server **what kind of value a column is allowed to store**.

Choosing an appropriate data type helps control the data and storage requirements.

## Numeric data types

### INT
Stores whole numbers.
```sql
age INT
```
Examples: `18`, `25`, `100`

### BIGINT
Stores much larger whole numbers than `INT`.

### DECIMAL(p,s)
Stores exact decimal numbers.

- `p` = total number of digits
- `s` = number of digits after the decimal point

```sql
price DECIMAL(10,2)
```
This can store values such as `99999999.99`.

### FLOAT
Stores approximate decimal numbers. It is useful when exact decimal precision is not required.

## Character data types

### CHAR(n)
Stores fixed-length character data.

### VARCHAR(n)
Stores variable-length character data.
```sql
name VARCHAR(100)
```
Useful when the text can have different lengths.

### NCHAR(n) and NVARCHAR(n)
Store Unicode text. `NVARCHAR` is useful when text may contain characters from many languages.

## Date and time

### DATE
Stores a date only.
```sql
birth_date DATE
```

### TIME
Stores a time only.

### DATETIME / DATETIME2
Store date and time. `DATETIME2` is generally preferred for newer SQL Server work because it provides greater precision and a wider range.

## BIT
Stores `0`, `1`, or `NULL`. It is commonly used for true/false-style values.

## Example
```sql
CREATE TABLE student
(
    student_id INT,
    name VARCHAR(100),
    age INT,
    fee DECIMAL(10,2),
    birth_date DATE,
    is_active BIT
);
```
