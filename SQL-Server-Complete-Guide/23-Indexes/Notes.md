# Indexes

An index is a database structure that can **help SQL Server find rows faster**, especially when searching or sorting large amounts of data.

## Example
```sql
CREATE INDEX IX_student_name
ON student(name);
```

This creates an index on the `name` column.

## Advantages
- Can make searches faster
- Can improve some joins and sorting operations

## Disadvantages
- Uses storage
- Can make `INSERT`, `UPDATE`, and `DELETE` more expensive because indexes may also need to be maintained

Indexes should be created based on actual query and workload needs.
