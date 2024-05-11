create 4 tables 
- staff
	- staff_id
	- dep_id fk
- department
	- dep_id
	- dep_name
- project
	- pr_id
	- pr_name
	- pr_duration
- project_collaboration
	- staff_id fk
	- pr_id fk
	- pyament 
insert data - 35 points
add constraints - 15 points
queries - 8 8
- sum
- inner join
- count
- group by
1 function - 8
- function version of sum query above
2 procedure - 8 8
- in project_name
- out some data related to project staff
1 trigger - 10
- audit table
- before update

```sql
CREATE DATABASE quiz;
use quiz;

CREATE TABLE suppliers (
        supplierID  INT UNSIGNED  NOT NULL AUTO_INCREMENT, 
        name        VARCHAR(30)   NOT NULL DEFAULT '', 
        phone       CHAR(8)       NOT NULL DEFAULT '',
        PRIMARY KEY (supplierID)
       );

CREATE TABLE products (
        productID    INT UNSIGNED  NOT NULL AUTO_INCREMENT,
        productCode  CHAR(3)       NOT NULL DEFAULT '',
        name         VARCHAR(30)   NOT NULL DEFAULT '',
        supplierID   INT UNSIGNED  NOT NULL,
        quantity     INT UNSIGNED  NOT NULL DEFAULT 0,
        price        DECIMAL(7,2)  NOT NULL DEFAULT 99999.99,
        PRIMARY KEY  (productID)
);

ALTER TABLE products
       ADD FOREIGN KEY (supplierID) REFERENCES suppliers (supplierID);

INSERT INTO suppliers VALUES
        (1, 'ABC Traders', '88881111'), 
        (2, 'OYAL', '99442222'), 
        (3, 'MR Fix', '90055333'),
        (4, 'Coloritm', '99455333');

INSERT INTO products (productCode, name, supplierID, quantity, price) VALUES
        ('PEC', 'Pencil 2B', 1, 10000, 0.48),
        ('PEC', 'Pencil 2H', 1, 8000, 0.49),
        ('PEN', 'Pen Red', 1, 12000, 1.20),
        ('PEN', 'Pen Blue', 2, 12500, 1.15),
        ('PEN', 'Pen Black', 2, 13000, 1.00),
        ('PPR', 'A4', 4, 500, 4.50),
        ('PPR', 'A5', 4, 800, 5.50),
        ('PPR', 'A3', 2, 740, 8.00),
        ('PPR', 'A2', 2, 250, 10.00),
        ('PEC', 'Pencil Color Set N50', 3, 1000, 25.50),
        ('PEC', 'Pencil Color Set N25', 1, 1100, 20.50),
        ('PEC', 'Pencil Color Set N10', 1, 700, 10.00),
        ('BLK', 'Blackboard 2 x 1.5', 2, 210, 20.00),
        ('BLK', 'Blackboard 1 x 0.5', 3, 200, 12.00),
        ('BLK', 'Blackboard 0.5 x 0.2', 2, 400, 6.00);

-- TASK 0: all joins: inner left right

-- TASK 1: Create procedure, to get total sum of quantities of all products by product code

-- TASK 2: Create procedure, to get total sum of quantities of all products by product code (use IN, OUT)

-- TASK 3:Create procedure, to count of all products and total sum of all (quantities)products by each suppliers (use IN, OUT)

-- TASK 4:Create a procedure to group products by productCode and displaying all products in a line, separating by comma, and displaying counts of products

-- TASK 5:Create function, which will return high price or low price according to (if total price > average(price) ). Write a simple query to use the function

-- TASK 6:Create function, which will return (display) total cost of each product by percentage;Write a simple query to use the function

-- TASK 7:Create after delete trigger to store (OLD) deleted product record with the current datetime

-- TASK 8:Create before insert trigger to signal state and highlight error, if product price is higher than 100 and smaller than 0.2
```


```sql
DROP DATABASE final;
CREATE DATABASE final;
USE final;
show tables;

CREATE TABLE product (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    releaseDate VARCHAR(255) NOT NULL,
    expirationDate VARCHAR(255) NOT NULL,
    companyID INT NOT NULL
);

CREATE TABLE company (
    companyID INT PRIMARY KEY AUTO_INCREMENT,
    companyName VARCHAR(255) NOT NULL,
    madeIN VARCHAR(255) NOT NULL
);

CREATE TABLE customer (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE sales (
    saleID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT NOT NULL,
    productID INT NOT NULL,
    saleDate VARCHAR(255) NOT NULL
);

ALTER TABLE product
ADD CONSTRAINT product_company_01 FOREIGN KEY (companyID)
REFERENCES company(companyID)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE sales
ADD CONSTRAINT sales_customer_01 FOREIGN KEY (customerID)
REFERENCES customer(customerID)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE sales
ADD CONSTRAINT sales_product_01 FOREIGN KEY (productID)
REFERENCES product(productID)
ON UPDATE CASCADE ON DELETE SET NULL;

1. List all proudcts of each company (group by company) in line comma separated, and count of products
2. Find out count of all sales of each company (if no sale, display null)

INSERT INTO company (companyName, madeIN) VALUES 
('Apple', 'USA'), 
('Samsung', 'Korea'), 
('LG', 'China'), 
('Whirlpool', 'UK'), 
('Bosch', 'Germany');

INSERT INTO product (productName, releaseDate, expirationDate, companyID) VALUES 
('iPhone 11', '2020-09-01', '2021-09-01', 1), 
('Samsung Galaxy S20', '2020-10-01', '2021-10-01', 2), 
('LG Washer', '2020-11-01', '2021-11-01', 3), 
('Vacum', '2020-12-01', '2021-12-01', 4), 
('Refrigerator', '2020-12-15', '2021-12-15', 5),
('iPhone 12', '2020-11-15', '2022-09-01', 2), 
('Xiapomi Note 5', '2020-09-07', '2023-07-07', 3), 
('Air conditioner', '2020-02-05', '2021-08-08', 4), 
('New Phone', '2020-11-20', '2024-09-01', 5), 
('Cleaner', '2020-10-12', '2025-10-11', 1);

INSERT INTO customer (customerName, gender, age) VALUES 
('John Doe', 'Male', 25), 
('Alexandr Jerry', 'Female', 30), 
('Bob Johnson', 'Male', 40), 
('Hiyonda Cruise', 'Female', 35), 
('Tom Wilson', 'Male', 28);
('Sherlok Holmes', 'Female', 35), 
('Minis Ellie', 'Male', 28);

INSERT INTO sales (customerID, productID, saleDate) VALUES 
(1, 2, '2020-09-15'), 
(2, 2, '2020-10-16'), 
(3, 3, '2020-11-17'), 
(4, 4, '2020-12-05'), 
(5, 5, '2020-12-30'),
(1, 5, '2020-08-15'), 
(2, 4, '2020-07-15'), 
(3, 3, '2020-06-15'), 
(4, 2, '2020-05-15'), 
(5, 1, '2020-04-30'),
(2, 2, '2020-03-17'), 
(2, 5, '2020-02-15'), 
(3, 1, '2020-02-01'), 
(1, 4, '2020-01-15'), 
(5, 5, '2020-05-30'),
(5, 1, '2020-10-21'), 
(2, 3, '2020-11-15'), 
(4, 1, '2020-11-23'), 
(4, 4, '2020-06-10'), 
(2, 5, '2020-12-30');

-- Testing relations:
UPDATE company SET companyName = 'New Company Name' WHERE companyID = 1;
SELECT * FROM product WHERE companyID = 1;

DELETE FROM company WHERE companyID = 1;
SELECT * FROM product WHERE companyID = 1;

UPDATE customer SET age = 30 WHERE customerID = 1;
SELECT * FROM sales WHERE customerID = 1;


1. list ll products of each company (group by company), in line comma separated, and count of all products.
2. find out count of all sales of each company, if no sale display none,
3. create a function to display all product names and product state (if products not expireed display "fresh", else "expired").
4. create a procedure to find out total amount of sales (IN - company name , OUT - total sum of sales)
5. create a procedure to find out customer expenses (IN- customer name)
6. create a trigger: create before delete trigger by choice. store old data, current time and process name (delete). at the end prove it written delete query.
```