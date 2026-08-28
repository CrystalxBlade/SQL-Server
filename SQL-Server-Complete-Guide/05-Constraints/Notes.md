# Constraints

A **constraint is a rule that controls what data can be stored in a table**.

Constraints help prevent invalid, duplicate, or unwanted data.

## 1. PRIMARY KEY

A primary key **uniquely identifies each row in a table**.

A primary key:
- cannot contain duplicate values
- cannot contain `NULL`
- identifies one record from another

```sql
student_id INT PRIMARY KEY
```

Example:
```text
student_id
1
2
3
```
You cannot have two students with `student_id = 1`.

## 2. NOT NULL

`NOT NULL` means the column **must have a value**. SQL Server will not allow `NULL` in that column.

```sql
name VARCHAR(100) NOT NULL
```

This means every student must have a name.

## 3. UNIQUE

`UNIQUE` prevents duplicate values in a column or combination of columns.

```sql
email VARCHAR(150) UNIQUE
```

Two students cannot have the same email address.

Unlike a primary key, a table can have multiple `UNIQUE` constraints.

## 4. FOREIGN KEY

A foreign key creates a relationship between tables. It requires a value in one table to correspond to a value in another table's referenced key.

```sql
student_id INT,
FOREIGN KEY (student_id) REFERENCES student(student_id)
```

For example, if `student_id = 10` does not exist in the `student` table, a related row using that value can be rejected.

## 5. CHECK

`CHECK` allows you to define a condition that values must satisfy.

```sql
age INT CHECK (age >= 0)
```

This prevents negative ages.

Another example:
```sql
grade INT CHECK (grade BETWEEN 1 AND 12)
```

## 6. DEFAULT

`DEFAULT` supplies a value automatically when an `INSERT` does not provide a value for that column.

```sql
grade INT DEFAULT 1
```

If you insert a student without specifying `grade`, SQL Server can use `1`.

## Complete example
```sql
CREATE TABLE student
(
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INT CHECK (age >= 0),
    grade INT DEFAULT 1
);
```

## Quick summary

| Constraint | What it does |
|---|---|
| PRIMARY KEY | Uniquely identifies each row |
| NOT NULL | Requires a value |
| UNIQUE | Prevents duplicate values |
| FOREIGN KEY | Connects tables and enforces a relationship |
| CHECK | Requires a condition to be true |
| DEFAULT | Provides a value when one is not supplied |
