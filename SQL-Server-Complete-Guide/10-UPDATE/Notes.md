# UPDATE

`UPDATE` is used to **change existing data in a table**.

## Example
```sql
UPDATE student
SET grade = 12
WHERE student_id = 1;
```

### Explanation
- `UPDATE student` chooses the table.
- `SET grade = 12` changes the grade.
- `WHERE student_id = 1` identifies which row should change.

## Important warning
```sql
UPDATE student
SET grade = 12;
```
Without `WHERE`, SQL Server can update the grade for **every row** in the table.
