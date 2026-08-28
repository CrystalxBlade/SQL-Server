# INSERT

`INSERT` is used to **add new rows of data into a table**.

## Insert one row
```sql
INSERT INTO student (student_id, name, age, grade)
VALUES (1, 'Blade', 20, 12);
```

### Explanation
- `INSERT INTO student` says which table receives the data.
- `(student_id, name, age, grade)` specifies the columns.
- `VALUES (...)` provides the values.
- The values correspond to the columns in the same order.

## Insert multiple rows
```sql
INSERT INTO student (student_id, name, age, grade)
VALUES
(2, 'Crystal', 21, 12),
(3, 'Knight', 20, 11);
```

## Check the inserted data
```sql
SELECT *
FROM student;
```
