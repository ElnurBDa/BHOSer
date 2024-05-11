# Week 6 - Partitions and Windows functions
## Exercises
```sql
-- tables

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) 
; 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) 
; 


-- Exercises
/*
A Note on Using Several Window Functions - Exercise --------------------------------------------------------

Exercise #1:
Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, 
refer to the "employees" database.
Use window functions to add the following two columns to the final output:
- a column containing the row number of each row from the obtained dataset, starting from 1.
- a column containing the sequential row numbers associated to the rows for each manager, where their highest 
salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
Finally, while presenting the output, make sure that the data has been ordered by the values in the first of 
the row number columns, and then by the salary values for each partition in ascending order.
*/

SELECT 
    emp.emp_no,
    sal.salary,
    ROW_NUMBER() OVER (ORDER BY sal.salary ASC) AS row_num,
    ROW_NUMBER() OVER (PARTITION BY emp.emp_no ORDER BY sal.salary ASC)
FROM 
    employees emp
JOIN 
    salaries sal ON emp.emp_no = sal.emp_no
ORDER BY 
    row_num, sal.salary ASC 
limit 20;


/*
Exercise #2:
Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, 
refer to the "employees" database.
Use window functions to add the following two columns to the final output:
- a column containing the row numbers associated to each manager, where their highest salary has been given 
a number equal to the number of rows in the given partition, and their lowest - the number 1.
- a column containing the row numbers associated to each manager, where their highest salary has been given 
the number of 1, and the lowest - a value equal to the number of rows in the given partition.
Let your output be ordered by the salary values associated to each manager in descending order.

Hint: Please note that you don't need to use an ORDER BY clause in your SELECT statement to retrieve the 
desired output.
*/

SELECT 
    emp.emp_no,
    sal.salary,
    ROW_NUMBER() OVER (PARTITION BY emp.emp_no ORDER BY sal.salary DESC) AS rn_highest_first,
    ROW_NUMBER() OVER (PARTITION BY emp.emp_no ORDER BY sal.salary ASC) AS rn_lowest_first
FROM 
    employees emp
JOIN 
    salaries sal ON emp.emp_no = sal.emp_no
LIMIT 19;

/*
The PARTITION BY Clause VS the GROUP BY Clause - Exercise ----------------------------------------------------

Exercise #1:
Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output, 
use a subquery containing a window function, as well as a window specification introduced with the help of the 
WINDOW keyword. Also, to obtain the desired result set, refer only to data from the “salaries” table.
*/
SELECT 
    DISTINCT emp_no,
    MIN(salary) OVER (PARTITION BY emp_no) AS lowest_salary
FROM 
    salaries
WINDOW w AS (PARTITION BY emp_no)
Limit 18;

SELECT 
    emp_no,
    MIN(salary) OVER (PARTITION BY emp_no) AS lowest_salary
FROM 
    salaries
WINDOW w AS (PARTITION BY emp_no)
Limit 18;



/*
Exercise #2:
Again, find out the lowest salary value each employee has ever signed a contract for. Once again, to obtain 
the desired output, use a subquery containing a window function. This time, however, introduce the window 
specification in the field list of the given subquery.

NOTE : To obtain the desired result set, refer only to data from the “salaries” table.

    SELECT 
        emp_no,
        salary,
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num
    FROM 
        salaries
*/
SELECT 
    DISTINCT emp_no,
    FIRST_VALUE(salary) OVER w AS lowest_salary
FROM (
    SELECT 
        emp_no,
        salary,
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num
    FROM 
        salaries
) AS subq
WINDOW w AS (PARTITION BY subq.emp_no ORDER BY subq.row_num)
LIMIT 20;



/*
The MySQL RANK() and DENSE_RANK() Window Functions - Exercise -----------------------------------------------

Exercise #1:
Write a query containing a window function to obtain all salary values that employee number 10560 has ever 
signed a contract for. Order and display the obtained salary values from highest to lowest.
*/
SELECT emp_no, salary,
DENSE_RANK() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS salary_rank
FROM salaries WHERE emp_no = 10560;

/*
Exercise #2:
Write a query that upon execution, displays the number of salary contracts that each manager has ever signed
while working in the company.
*/
-- each worker
SELECT emp_no AS manager_emp_no, 
COUNT(*) AS num_salary_contracts
FROM salaries
GROUP BY emp_no
limit 10;
-- each manager
SELECT dm.emp_no AS manager_emp_no, 
COUNT(*) AS num_salary_contracts
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

/*
Working with MySQL Ranking Window Functions and Joins Together - Exercise -------------------------------------

Exercise #1:
Write a query that ranks the salary values in descending order of all contracts signed by employees numbered 
between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. 
Also, allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.

*/
SELECT e.emp_no,
s.salary,
DENSE_RANK() OVER (ORDER BY s.salary DESC) AS salary_rank
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
ORDER BY s.salary DESC;


/*
MySQL Aggregate Functions in the Context of Window Functions - Part I-Exercise ------------------------------

Exercise #1:
Create a query that upon execution returns a result set containing the employee numbers, contract salary 
values, start, and end dates of the first ever contracts that each employee signed for the company.
To obtain the desired output, refer to the data stored in the "salaries" table.
*/
SELECT emp_no, salary, from_date, to_date, contract_rank
FROM (
SELECT 
    emp_no,
    salary,
    from_date,
    to_date,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date) AS contract_rank
FROM salaries
) AS ranked_salaries
WHERE contract_rank = 1
LIMIT 10;

```
# Data Science SQL - CTE and Temporary Tables
## Exercises
```sql
-- We use the classicmodels database as a MySQL sample database to help you work with MySQL quickly and effectively.
    -- customers: stores customer’s data.
    -- products: stores a list of scale model cars.
    -- productlines: stores a list of product lines.
    -- orders: stores sales orders placed by customers.
    -- orderdetails: stores sales order line items for every sales order.
    -- payments: stores payments made by customers based on their accounts.
    -- employees: stores employee information and the organization structure such as who reports to whom.
    -- offices: stores sales office data.

/*
EXERCISE 1 :
Use the customers and employees from the sample database.
• The following exercise should use multiple CTEs to map the customers with their respective sales
representatives;
• Create Temporary Table from combining 2 CTE’s by select statement
*/

create temporary table temp_table1 as
with cte1 as (
  select 
    customerNumber, 
    customerName, 
    salesRepEmployeeNumber 
  from 
    customers
),
cte2 as (
  select 
    employeeNumber, 
    concat(firstName, ' ', lastName) as employeeName 
  from 
    employees
)
select cte1.customerNumber, cte1.customerName, cte2.employeeName
from cte1 join cte2
on cte1.salesRepEmployeeNumber = cte2.employeeNumber; 

/*
EXERCISE 2 :
• Create Temporary Table by selecting (partition by) each productCode displaying with MIN price of
product, MAX price of product;
• Use select statement to display results by grouping productCode with MIN price and MAX price of
products
• Use select statement to select results from both Temporary Table and Permanent Table :
productCode, productName, MIN price and MAX price
*/

create temporary table temp_table2 as
select 
  distinct productCode, 
  min(priceEach) over (partition by productCode) as minPrice,
  max(priceEach) over (partition by productCode) as maxPrice,
  orderNumber
from
orderdetails;

select group_concat(productCode, ' (', minPrice,',',maxPrice,')'), orderNumber
from temp_table2 group by orderNumber;

select 
  distinct temp_table2.productCode, 
  products.productName, 
  temp_table2.minPrice, 
  temp_table2.maxPrice
from
products join temp_table2 
on products.productCode = temp_table2.productCode;


-- TASKS ----------------------------------------------------------------------------------------
-- 1. get sum of orders by each product code(name)
with cte as (
  select productCode,
  sum(quantityOrdered)
  from orderdetails group by productCode
) select * from cte;

-- 2. By each productLine to find count of products
with cte as (
  select productLine, count(productCode)
  from products group by productLine
) select * from cte;

-- 3. By each productCode to find min price of product, max price of product! (use window functions)
with cte as (
  select distinct products.productCode,
  min(priceEach) over (partition by productCode) as minPrice,
  max(priceEach) over (partition by productCode) as maxPrice
  from products join orderdetails
  on products.productCode = orderdetails.productCode
) select * from cte;

-- 4. By each productCode to display RANK and DENSE_RANK (use window functions)
with cte as (
  select products.productCode,
  rank() over (partition by productCode order by priceEach),
  dense_rank() over (partition by productCode order by priceEach)
  from products join orderdetails
  on products.productCode = orderdetails.productCode
) select * from cte;

-- 5. By each productLine to display RANK of buyPrice, MIN and MAX of buyPrices as well.
with cte as (
  select productLine,
  rank() over (partition by productLine order by buyPrice),
  min(buyPrice) over (partition by productLine),
  max(buyPrice) over (partition by productLine)
  from products
) select * from cte;

```
## Class
```sql
-- MySQL CTE (Common Table Expression) -----------------------------------------------------------------------------

-- We use the classicmodels database as a MySQL sample database to help you work with MySQL quickly and effectively.
    -- customers: stores customer’s data.
    -- products: stores a list of scale model cars.
    -- productlines: stores a list of product lines.
    -- orders: stores sales orders placed by customers.
    -- orderdetails: stores sales order line items for every sales order.
    -- payments: stores payments made by customers based on their accounts.
    -- employees: stores employee information and the organization structure such as who reports to whom.
    -- offices: stores sales office data.

-- EXAMPLE 1 : 
WITH customers_in_usa AS (
    SELECT 
        customerName, state
    FROM
        customers
    WHERE
        country = 'USA'
) SELECT 
    customerName
 FROM
    customers_in_usa
 WHERE
    state = 'CA'
 ORDER BY customerName;

    -- First, define a CTE with the name customers_in_usa that stores the customer name and state of customers in the USA. 
    -- The defining query retrieves data from the customers table.
    -- Second, select the customers located in California from the CTE.


-- EXAMPLE 2 ----------------------------------------------------------------------------------------------------
-- The following example uses a CTE to retrieve the top 5 sales representatives based on their total sales in the 
-- year 2003. We’ll use the orders, orderdetails, and employees from the sample database

WITH topsales2003 AS (
    SELECT 
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDate) = 2003
        AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT 
    employeeNumber, 
    firstName, 
    lastName, 
    sales
FROM
    employees
        JOIN
    topsales2003 USING (employeeNumber);


-- EXAMPLE 3 ----------------------------------------------------------------------------------------------------
-- Using multiple CTEs ------------------------------------------------------------------------------------------
-- We’ll use the customers and employees from the sample database:
-- The following example uses multiple CTEs to map the customers with their respective sales representatives

WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
customer_salesrep AS (
    SELECT 
        customerName, salesrepName
    FROM
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT 
    *
FROM
    customer_salesrep
ORDER BY customerName;


-- EXAMPLE 4 ----------------------------------------------------------------------------------------------------
-- Joining two CTEs example -------------------------------------------------------------------------------------
-- We’ll use the offices and employees tables from the sample database
-- The following example is creating two CTEs and joining them to get the Sales Representatives located in the USA, 
-- including their office information

WITH salesrep AS (
    SELECT 
        CONCAT(firstName, ' ', lastName) AS salesrepName,
        officeCode
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
office_salesrep AS (
    SELECT 
        officeCode, 
        city
    FROM
        offices
    WHERE
        country = 'USA'
)
SELECT 
    salesrepName, 
    city
FROM
    salesrep
        JOIN
    office_salesrep USING (officeCode)
ORDER BY city, salesrepName;



-- EXAMPLE 5 ----------------------------------------------------------------------------------------------------
-- get sum of orders by each customer
-- number of orders by each customer
-- also define list of products with productName

WITH customer_order AS (
    SELECT 
        customerNumber, 
        SUM(quantityOrdered * priceEach) total_order,
        COUNT(orderNumber) total_orders
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
    GROUP BY customerNumber
),
customer_product AS (
    SELECT 
        customerNumber, 
        GROUP_CONCAT(productName) product_list
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        products USING (productCode)
    GROUP BY customerNumber
)
SELECT 
    c.customerNumber, 
    c.customerName, 
    co.total_order, 
    co.total_orders, 
    cp.product_list
FROM
    customers c
        JOIN
    customer_order co USING (customerNumber)
        JOIN
    customer_product cp USING (customerNumber)
ORDER BY co.total_order DESC;



-- TASKS ----------------------------------------------------------------------------------------
-- get sum of orders by each product code(name)
-- By each productLine to find count of products
-- By each productCode to find min price of product, max price of product! (use window functions)
-- By each productCode to display RANK and DENSE_RANK (use window functions)
-- By each productLine to display RANK of buyPrice, MIN and MAX of buyPrices as well.



-------------------------------------------------------------------------------------------------
-- MySQL TEMPORARY TABLES -----------------------------------------------------------------------

-- EXAMPLE 1 ------------------------------------------------------------------------------------
-- First, create a new temporary table called credits that stores customers’ credits:
CREATE TEMPORARY TABLE credits(
  customerNumber INT PRIMARY KEY, 
  creditLimit DEC(10, 2)
);

-- Then, insert rows from the customers table into the temporary table credits:
INSERT INTO credits(customerNumber, creditLimit)
SELECT 
  customerNumber, 
  creditLimit 
FROM 
  customers 
WHERE 
  creditLimit > 0;


-- EXAMPLE 2 ------------------------------------------------------------------------------------
-- CASE 2 : Creating a temporary table whose structure is based on a query example:
-- The following example creates a temporary table that stores the top 10 customers by revenue. 
-- The structure of the temporary table is derived from a SELECT statement:

CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;

-- Now, you can query data from the top_customers temporary table like querying from a permanent table:
SELECT 
    customerNumber, 
    customerName, 
    sales
FROM
    top_customers
ORDER BY sales;

-- Checking if a temporary table exists
-- However, you can create a stored procedure that checks if a temporary table exists or not as follows:
DELIMITER //
CREATE PROCEDURE check_table_exists(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
    END IF;
END //
DELIMITER ;

-- In this procedure, we try to select data from a temporary table. If the temporary table exists, the @table_exists variable is set to 1, otherwise, it is set to 0.
-- This statement calls the check_table_exists stored procedure to check if the temporary table credits exists:
CALL check_table_exists('credits');
SELECT @table_exists;
```