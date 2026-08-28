# Transactions

A transaction lets you treat multiple database operations as **one unit of work**.

The main idea is:
- Do all required operations
- If everything succeeds, `COMMIT`
- If something goes wrong, `ROLLBACK`

## Example
```sql
BEGIN TRANSACTION;

UPDATE student
SET grade = 12
WHERE student_id = 1;

COMMIT;
```

## Rollback example
```sql
BEGIN TRANSACTION;

UPDATE student
SET grade = 12
WHERE student_id = 1;

ROLLBACK;
```

`ROLLBACK` undoes the changes made within the transaction that have not been committed.

Transactions are especially important when several changes must succeed or fail together.
