# Data Types

Common SQL Server data types:

### Numeric
- `INT`
- `BIGINT`
- `DECIMAL(p,s)`
- `FLOAT`

### Character
- `CHAR(n)`
- `VARCHAR(n)`
- `NCHAR(n)`
- `NVARCHAR(n)`

### Date and time
- `DATE`
- `TIME`
- `DATETIME`
- `DATETIME2`

### Boolean-like
SQL Server commonly uses `BIT` for true/false-style values.

## Example
```sql
CREATE TABLE student
(
    student_id INT,
    name VARCHAR(100),
    age INT,
    fee DECIMAL(10,2),
    birth_date DATE
);
```
