# Transactions

Transactions allow multiple SQL operations to be treated as one unit of work.

## Example
```sql
BEGIN TRANSACTION;

UPDATE student
SET grade = 12
WHERE student_id = 1;

COMMIT;
```

If something goes wrong, a transaction can be rolled back:
```sql
ROLLBACK;
```
