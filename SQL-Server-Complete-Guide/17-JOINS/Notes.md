# JOINS

A `JOIN` combines related rows from two or more tables.

Suppose we have:

```text
student
student_id | name

course
course_id | student_id | course_name
```

The `student_id` can connect the two tables.

## INNER JOIN
Returns only rows that have a match in both tables.
```sql
SELECT s.name, c.course_name
FROM student AS s
INNER JOIN course AS c
    ON s.student_id = c.student_id;
```

## LEFT JOIN
Returns all rows from the left table and matching rows from the right table. If there is no match, right-side columns can be `NULL`.

## RIGHT JOIN
Returns all rows from the right table and matching rows from the left table.

## FULL OUTER JOIN
Returns matching rows plus unmatched rows from both tables.

## CROSS JOIN
Produces every possible combination of rows from both tables.

## Important
`ON` specifies **how the rows from the tables are related**.
