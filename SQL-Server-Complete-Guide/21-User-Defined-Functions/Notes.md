# User-Defined Functions

SQL Server allows you to create your own functions.

## Example
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
