# Constraints

Constraints are rules applied to columns to control the data stored in a table.

## Main constraints
- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `UNIQUE`
- `CHECK`
- `DEFAULT`

## Example
```sql
CREATE TABLE student
(
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0),
    grade INT DEFAULT 1
);
```
