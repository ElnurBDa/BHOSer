# CTE
A Common Table Expression (CTE) is the result set of a query which exists temporarily and for use only within the context of a larger query. Much like a derived table, the result of a CTE is not stored and exists only for the duration of the query.
```sql
WITH cte_name (column_list) AS (
	query
	)
SELECT * FROM cte_name;
```
Get examples from [[Data Science SQL Examples]]
# SQL Temporary Tables
In SQL, a temporary table is a special type of table that allows you to store a temporary result set, which you can reuse several times in a single session. It is reset after you end session (close terminal). 
```sql
CREATE TEMPORARY TABLE table_name(
	column1 datatype constraints,
	column1 datatype constraints,
	...,
	table_constraints
) ;
```

```sql
CREATE TEMPORARY TABLE temp_table_name
SELECT * FROM original_table
LIMIT 0 ;
```

```sql
DROP TEMPORARY TABLE table_name;
```