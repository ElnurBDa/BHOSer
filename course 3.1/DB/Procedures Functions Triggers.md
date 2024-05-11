# Procedure
```sql
DELIMETER //

CREATE PROCEDURE procedure_name (
[IN|OUT|INOUT] parameter_name data_type
)

BEGIN
	decletarion/executable section
END//
DELIMETER ;
```

IN - variables that passed in to the procedure
OUT - variables that taken out of procedure
INOUT - both

```sql
DELIMETER //

CREATE PROCEDURE GetOfficeByCountry(
	IN countryName VARCHAR(255)
)
BEGIN 
	SELECT *
	FROM Offices
	WHERE country = countryName
END //
DELIMETER ;


CALL GetOfficeByCountry('USA')
```

it shows the the row where country = USA
```sql
DELIMETER $$
CREATE procedure GetOrderCountByStatus(
	IN orderStatus VARCHAR(25)
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber) INTO total
	FROM orders
	WHERE status = orderStatus;
END $$
DELIMETER ;


CALL GetOrderCountByStatus('shipped', @total);
SELECT @total;
```

in SQL we print single variables with @var_name

```sql
DROP PROCEDURE [IF EXISTS] stored_procedure_name;
```

to delete the procedure "if exists" - optional

```sql
SHOW PROCEDURE STATUS;
```
To list all the procedures

```sql
SHOW PROCEDURE STATUS LIKE 'pattern'
SHOW PROCEDURE STATUS WHERE search_condition
```
'pattern':  %Order%
# Function

```sql
DELIMETER $$
CREATE FUNCTION function_name(
	param1,
	param2,...
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
--statements
END $$
DELIMETER ;


SELECT function_name(p1,p2) from sometable;
```

DETERMINISTIC - with same parameters result is same; NOT  -  result may be different with same parameters (random)

```sql
CREATE FUNCTION CustomerLevel(
	credit DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE customerLevel VARCHAR(20);
	IF credit > 5000 THEN SET customerLevel = 'PLATINUM';
	ELSEIF (credit<=5000 AND credit>=10000) THEN SET customerLevel = 'GOLD';
	ELSEIF credit<10000 THEN SET customerLevel = 'SILVER';
	END IF;
	RETURN (customerLevel)
END $$
DELIMETER ; 
```

DECIMAL(size, r) - size: all digits, r: digits after decimal

here we take customer's credit as parameter, by compairing deciding the customer level and return it as output

calling this function:
```sql
SELECT
	customerName,
	CustomerLevel(creditLimit)
FROM 
	csutomers
ORDER BY 
	customerName;
```


# Trigger

```sql
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;
```

You can access the value of the description before the update ```OLD.description``` and the new value ```NEW.description.```

```sql
CREATE TABLE employees_audit (
	id INT AUTO_INCREMENT PRIMARY KEY,
	employeeNumber INT NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	changedat DATETIME DEFAULT NULL,
	action VARCHAR(50) DEFAULT NULL
);
```

We created audit table, to save the changes made to employees table.
Next, create a BEFORE UPDATE trigger that is invoked before a change is made to the employees table.

```sql
CREATE TRIGGER before_employee_update
	BEFORE UPDATE ON employees
	FOR EACH ROW
INSERT INTO employees_audit
SET action = 'update',
	employeeNumber = OLD.employeeNumber,
	lastname = OLD.lastname,
	changedat = NOW();
```


```sql
SHOW TRIGGERS;
```
To show all the triggers


Now, we update employees table to see if trigger works:
```sql
UPDATE employees
SET
	lastName = 'Phan'
WHERE
	employeeNumber = 1056;
```

And we check the triggers file to see if old data is saved: 
```sql
SELECT * FROM employees_audit;
```


