## Partition By
We use **SQL PARTITION** BY to divide the result set into partitions and perform computation on each subset of partitioned data.
```sql
SELECT fiscal_year, sales_employee,
	sale,
	SUM(sale) OVER (PARTITION BY fiscal_year)
	total_sales
FROM
	sales;
```
Suppose there is n rows in table, while **group by** returns one row for each group of m rows (1<=m<=n), **partition by** returns n rows for each group of m rows, but in an order. Example:
![[Pasted image 20240327212128.png]]
## Window Functions
**Aggregate Window Functions** - calculates the aggregated values of a group of rows from the table(SUM, AVG, MIN, MAX etc). **Analytical Window Functions** - calculate some analytical data. (RANK, DENSE_RANK,  CUME_DIST, RANK, LEAD, LAG, etc.)
```sql
window_function_name(expression) OVER (
[partition_defintion]
[order_definition]
[frame_definition]
)
```
Note: Window is the partition selected from a table, like in the image. 
### List
**CUME_DIST** - Calculates the cumulative distribution of a value in a set of values.
**DENSE_RANK** - Assigns a rank to every row within its partition based on the ORDER BY clause. It assigns the same rank to the rows with equal values.
**RANK** - Similar to the DENSE_RANK() function except that there are gaps in the sequence of ranked values when two or more rows have the same rank.
**PERCENT_RANK**- Calculates the percentile rank of a row in a partition or result set
**FIRST_VALUE** - Returns the value of the specified expression with respect to the first row in the window frame.
**LAST_VALUE** - Returns the value of the specified expression with respect to the last row in the window frame.
**ROW_NUMBER** - Assigns a sequential integer to every row within its partition
**LAG** - Returns the value of the Nth row before the current row in a partition. It returns NULL if no preceding row exists.
**LEAD** - Returns the value of the Nth row after the current row in a partition. It returns NULL if no subsequent row exists
### ROW_NUMBER
The ROW_NUMBER() is a window function or analytic function that assigns a sequential number to each row in the result set. The first number begins with one.
```sql
ROW_NUMBER() OVER (<partition_definition> <order_definition>)

SELECT fiscal_year, sales_employee, sale,
	ROW_NUMBER() OVER(PARTITION BY fiscal_year)
	as row_num
FROM
	sales;


SELECT fiscal_year, sales_employee, sale,
	ROW_NUMBER() OVER W as row_num
FROM
	sales
WINDOW W as(PARTITION BY fiscal_year order by sale desc);
```
![[Pasted image 20240327214337.png]]
### DENSE_RANK
The DENSE_RANK() is a window function or analytic function that assigns a rank to each row within a partition or result set with no gaps in ranking values.
```sql
DENSE_RANK() OVER (<partition_definition> <order_definition[ASC][DESC]>)

SELECT sales_employee, fiscal_year, sale,
	DENSE_RANK() OVER (
	PARTITION BY fiscal_year
	ORDER BY sale DESC
	) sales_rank
FROM
	sales;
```
![[Pasted image 20240327214928.png]]
gives number based on position in ranking. If two or more same values then the same rank number. 
### RANK
The RANK() function assigns a rank to each row within the partition of a result set. The rank of a row is specified by one plus the number of ranks that come before it.
```sql
RANK() OVER (<partition_definition> <order_definition[ASC][DESC]>)

SELECT sales_employee, fiscal_year, sale,
	DENSE_RANK() OVER (
	PARTITION BY fiscal_year
	ORDER BY sale DESC
	) DenseR,
	RANK() OVER (
	PARTITION BY fiscal_year
	ORDER BY sale DESC
	) Rank
FROM
	sales;
```
![[Pasted image 20240327215204.png]]
similar to dense rank, but the rank is number of places above + 1. For example, two same value then the third has other value, then first two are 1 and 1, then 3. 
### PERCENT_RANK
The PERCENT_RANK() is a window function that calculates the percentile rank of a row within a partition or result set.
```sql
PERCENT_RANK() OVER (<partition_definition> <order_definition[ASC][DESC]>)

SELECT sales_employee, fiscal_year, sale,
	PERCENT_RANK() OVER (
	PARTITION BY fiscal_year
	ORDER BY sale
	) percentile
FROM
	sales;
```
![[Pasted image 20240327215424.png]]
```
100 - 0 - minimum
150 - 0.5 = (200-150)/(200-100)
200 - 1 - maximum
```
### Lag
The LAG() function is a window function that allows you to access data from a previous row in a result set from the current row without using a self-join.
```sql
LAG(expression, offset, default_value)
	OVER (
	PARTITION BY partition_expression
	ORDER BY order_expresion ASC|DESC
)
```
expression is column name or expression, offset is how much go back, default_value - default value.
```sql
SELECT sales_employee, fiscal_year, sale,
	LAG(sale, 1, 0) OVER (
	PARTITION BY sales_employee
	ORDER BY fiscal_year
	) 'Pr_Y_sale'
FROM
	sales;
```
![[Pasted image 20240327215942.png]]
Multiple Lags
```sql
SELECT sales_employee, fiscal_year, sale,
	LAG(sale, 1, 0) OVER (
	PARTITION BY sales_employee
	ORDER BY fiscal_year
	) AS Pr_Y_sale,
	sale - LAG(sale, 1, 0) OVER (
	PARTITION BY sales_employee
	ORDER BY fiscal_year
	) AS vs_Pr_year
FROM
sales;
```
![[Pasted image 20240327220111.png]]
### LEAD
The LEAD() f unction is a window function that allows you to access data from the next row in a result set.
```sql
LEAD(expression, offset, default_value)
	OVER (
	PARTITION BY partition_expression
	ORDER BY order_expresion ASC|DESC
)
```

```sql
SELECT 	sales_employee, fiscal_year,sale,
	LEAD(sale) OVER (
	PARTITION BY sales_employee
	ORDER BY fiscal_year
	) 'Nx_Y_sale'
FROM
sales;
```
![[Pasted image 20240327220301.png]]
### FIRST_VALUE
The FIRST_VALUE() is a window function that allows you to select the first row of a window frame, partition, or result set.
```sql
FIRST_VALUE(expression)
	OVER (
	[partition_clause]
	[order_clause]
	[frame_clause]
)
```

```sql
SELECT sales_employee, fiscal_year, sale,
	FIRST_VALUE(sales_employee) OVER (
	PARTITION BY fiscal_year
	ORDER BY sales_employee
	) 'min_sale'
FROM
	sales;
```
![[Pasted image 20240327220436.png]]
# get more examples from
[[Data Science SQL Examples]]