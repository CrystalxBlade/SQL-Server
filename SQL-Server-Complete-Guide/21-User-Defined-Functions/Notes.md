# User-Defined Functions

A user-defined function (UDF) is a function **you create yourself to perform reusable logic and return a value or table**.

## Scalar function example
```sql
CREATE FUNCTION dbo.AddNumbers
(
    @a INT,
    @b INT
)
RETURNS INT
AS
BEGIN
    RETURN @a + @b;
END;
```

Use it:
```sql
SELECT dbo.AddNumbers(10, 20);
```

The function receives two numbers and returns their sum.

SQL Server also supports table-valued functions, which return a table.
