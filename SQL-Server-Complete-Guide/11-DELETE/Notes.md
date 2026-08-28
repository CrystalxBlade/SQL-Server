# DELETE

`DELETE` is used to **remove rows from a table**.

## Delete one row
```sql
DELETE FROM student
WHERE student_id = 1;
```

The row matching `student_id = 1` is removed.

## Important warning
```sql
DELETE FROM student;
```
Without `WHERE`, all rows in the table can be deleted.

`DELETE` removes rows but keeps the table itself.
`DROP TABLE` removes the table itself.
