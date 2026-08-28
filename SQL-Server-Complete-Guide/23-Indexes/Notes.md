# Indexes

Indexes improve the speed of data retrieval.

## Example
```sql
CREATE INDEX IX_student_name
ON student(name);
```

Indexes can improve reads but also require storage and can add overhead to data modifications.
