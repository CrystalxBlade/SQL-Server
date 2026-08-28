# SELECT

`SELECT` is used to **retrieve/read data from a database**.

## Select all columns
```sql
SELECT *
FROM student;
```
`*` means all columns.

## Select specific columns
```sql
SELECT name, age
FROM student;
```
Only the `name` and `age` columns are returned.

## Give a column an alias
```sql
SELECT name AS student_name
FROM student;
```
`AS` gives the returned column a temporary display name.
