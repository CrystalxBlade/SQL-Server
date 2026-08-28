# GROUP BY

`GROUP BY` **combines rows that have the same value into groups**.

It is commonly used with aggregate functions.

## Example
```sql
SELECT grade, COUNT(*) AS student_count
FROM student
GROUP BY grade;
```

If several students have grade 12, they are placed into one group and `COUNT(*)` counts the students in that group.

## Think of it as
Instead of asking:
> How many students are there?

You can ask:
> How many students are there in each grade?

