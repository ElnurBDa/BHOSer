to connect
```cmd
cd c:\Program Files\MySQL\MySQL Server 8.0\bin
mysql -h localhost -u root -p 
31051966
```

Some commands
```mysql
show databases; -- see sb
use sakila; -- choose db
show tables; -- see tables from there
describe city; -- see some table from there

select * from city; -- get all data
```

or from vscode after creating smth.sql file
```sql
-- select * from country limit 10;
select * from city limit 10;
```

then execute it on console
```mysql
source C:\Users\99451\OneDrive\Desktop\data\smth.sql
```

some other things
```sql
create database mydata;
use mydata;

create table mytable (
    id int(7) auto_increment primary key, -- 7 length 
    name varchar(50) not null, -- not null is constraint
    age int,
    email varchar(100)
);

INSERT INTO mytable (name, age, email) VALUES ('John Doe', 30, 'johndoe@example.com');
select * from mytable

INSERT INTO mytable (name, age, email) VALUES 
('John Doe', 30, 'johndoe@example.com'),
('Jane Smith', 25, 'janesmith@example.com'),
('Bob Johnson', 40, 'bobjohnson@example.com');

drop table mytable; -- delete table

ALTER TABLE mytable ADD gender varchar(10) after age;

UPDATE mytable SET gender = 'male' WHERE id = 1;
UPDATE mytable SET gender = 'female' WHERE id = 2;
UPDATE mytable SET gender = 'male' WHERE id = 3;

ALTER TABLE mytable ADD CONSTRAINT chk_age CHECK (age >= 15); 

DELETE FROM mytable where id = 1;

SELECT * FROM mytable WHERE email LIKE '%s%'; -- with s character in

SELECT * FROM mytable LIMIT 2 OFFSET 3; -- from 3rd position 2 rows 
```
# Playing with Azerbaijani table
```sql
-- mysql> describe administrative_divisions;
-- +------------------+--------------+------+-----+---------+----------------+
-- | Field            | Type         | Null | Key | Default | Extra          |
-- +------------------+--------------+------+-----+---------+----------------+
-- | division_id      | int unsigned | NO   | PRI | NULL    | auto_increment |
-- | division_name    | varchar(40)  | NO   |     | NULL    |                |
-- | azerbaijani_name | varchar(40)  | NO   |     | NULL    |                |
-- | capital          | varchar(40)  | YES  |     | NULL    |                |
-- | area             | float(10,2)  | NO   |     | NULL    |                |
-- | population       | int          | NO   |     | NULL    |                |
-- | region           | varchar(40)  | NO   |     | NULL    |                |
-- | notes            | varchar(255) | YES  |     | NULL    |                |
-- +------------------+--------------+------+-----+---------+----------------+

-- mysql> describe regions;
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | region_id   | int unsigned | NO   | PRI | NULL    | auto_increment |
-- | region_name | varchar(50)  | NO   |     | NULL    |                |
-- | area        | float(10,2)  | NO   |     | NULL    |                |
-- | population  | int          | NO   |     | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+

SELECT * FROM administrative_divisions;
SELECT division_name, population FROM administrative_divisions WHERE capital = "Siazan";
SELECT division_name, population FROM administrative_divisions WHERE region IN ("Aran", "Quba-Khachmaz") AND population BETWEEN 100000 AND 200000; 
SELECT MIN(population), MAX(population), AVG(population) FROM administrative_divisions WHERE region = "Quba-Khachmaz";
SELECT COUNT(division_name), region FROM administrative_divisions GROUP BY region;
SELECT SUM(population), region FROM administrative_divisions GROUP BY region;
SELECT SUM(population), SUM(area), 'Azerbaijan' FROM administrative_divisions;
SELECT COUNT(division_name), region FROM administrative_divisions GROUP BY region ORDER BY COUNT(division_name) DESC;
SELECT region, COUNT(*) AS count, GROUP_CONCAT(division_name) AS bolgeler FROM administrative_divisions GROUP BY region;
SELECT CONCAT(division_name, ' is located in ', region, ' with a population of ', population) AS location FROM administrative_divisions;
SELECT CONCAT_WS(' - ', division_name, region, population) AS location_info FROM administrative_divisions;
SELECT SUBSTRING(division_name, 1, 3) AS short_name, region FROM administrative_divisions;
SELECT CONCAT(SUBSTRING(division_name, 1, 3), '-', region) AS short_name_region FROM administrative_divisions;
SELECT REPLACE(region_name, 'A', 'Abrikos') AS new_region_name, area, population FROM regions;
SELECT UPPER(region) AS upper_region, LOWER(division_name) AS lower_division_name FROM administrative_divisions;
SELECT region, IF(population > 100000, 'Large', 'Small') AS size FROM administrative_divisions;
SELECT division_name, population,
    CASE
        WHEN population > 1000000 THEN 'Large'
        WHEN population > 500000 THEN 'Medium'
        ELSE 'Small'
    END AS size
FROM administrative_divisions;
SELECT RIGHT(division_name, 3) AS last_three_chars FROM administrative_divisions;
```
# Student task
```sql
create database uni;
use uni;
create table students (
    id int(10) auto_increment primary key,
    name varchar(50),
    surname varchar(50),
    age int(10),
    department varchar(50),
    gpa int(10),
    birth_city varchar(50) 
); 
CREATE INDEX index_name ON students(birth_city);


INSERT INTO students (name, surname, age, department, gpa, birth_city)
VALUES 
    ('John', 'Doe', 22, 'Computer Science', 3.7, 'New York'),
    ('Jane', 'Smith', 21, 'Mathematics', 3.5, 'Los Angeles'),
    ('Michael', 'Johnson', 23, 'Physics', 3.2, 'Chicago'),
    ('Emily', 'Brown', 20, 'Biology', 3.8, 'San Francisco'),
    ('William', 'Wilson', 22, 'History', 3.4, 'Boston'),
    ('Olivia', 'Lee', 24, 'Chemistry', 3.9, 'Houston'),
    ('James', 'Martin', 21, 'English', 3.6, 'Dallas'),
    ('Sophia', 'Davis', 22, 'Economics', 3.3, 'Miami'),
    ('Daniel', 'Garcia', 23, 'Engineering', 3.5, 'Phoenix'),
    ('Ava', 'Rodriguez', 20, 'Psychology', 3.7, 'Seattle'),
    ('Ethan', 'Lopez', 22, 'Political Science', 3.1, 'Denver'),
    ('Isabella', 'Hernandez', 21, 'Sociology', 3.2, 'Atlanta'),
    ('Mason', 'Martinez', 23, 'Music', 3.6, 'Philadelphia'),
    ('Mia', 'Gonzalez', 22, 'Art', 3.8, 'Detroit'),
    ('Noah', 'Perez', 24, 'Chemical Engineering', 3.9, 'San Diego'),
    ('Liam', 'Sanchez', 20, 'Electrical Engineering', 3.4, 'Austin'),
    ('Emma', 'Ramirez', 22, 'Civil Engineering', 3.3, 'San Antonio'),
    ('Oliver', 'Flores', 23, 'Mechanical Engineering', 3.5, 'Portland'),
    ('Charlotte', 'Nguyen', 21, 'Computer Engineering', 3.7, 'Raleigh'),
    ('Benjamin', 'Kim', 22, 'Biomedical Engineering', 3.6, 'Minneapolis');

/* 1. Display (name, surname) as concatted string, age, birthcity from STUDENTS ;
2. Display (surname (1 character), name, age) as concatted string, birthcity from STUDENTS ;
3. Display (surname (1 character), name) as concatted string, birthcity fileds and group records by birthcity;
4. Display (surname (1 character), name, age) as concatted string, department fileds and group records by department;
5. Display minimum, maximum and average gpa’s of students
6. Display students where students gpa is higher than the average gpa
7. Display count of students for each department;
8. Display average gpa of students for each birtcity;
9. Display (name, surname) as concatted string, department, and gpa (like: A(gpa>=91), B(gpa>=81), C(gpa>=71), D(gpa>=61) */

select * from students;
-- 1
select concat(name, ' ', surname) as fullname, age, birth_city from students;
-- 2
select concat(substring(surname, 1, 1), ' ', name, ' ', age) as fullname_age, birth_city from students;
-- 3
select group_concat(substring(surname, 1, 1), ' ', name) as fullname, birth_city from students group by birth_city;
-- 4
select group_concat(substring(surname, 1, 1), ' ', name, ' ', age) as fullname, department from students group by department;
-- 5
select min(gpa), max(gpa), avg(gpa) from students;
-- 6
select * from students where gpa > (select avg(gpa) from students);
-- 7
select count(*), department from students group by department;
-- 8
select avg(gpa), birth_city from students group by birth_city;
-- 9
select concat(name, ' ', surname) as fullname, department, 
    case
        when gpa >= 91 then 'A'
        when gpa >= 81 then 'B'
        when gpa >= 71 then 'C'
        when gpa >= 61 then 'D'
    end as grade
from students;

drop table students;
```
# Special Data Types, ENUM, BOOLEAN, JSON
```sql
CREATE database dtypes;
use dtypes;

create table tickets(
    id int primary key auto_increment,
    title varchar(255) not null,
    priority ENUM('low', 'medium', 'high') not null,
    status BOOLEAN not null
);

insert into tickets(title, priority, status) values('ticket 1', 'low', true),
('ticket 2', 'medium', false),
('ticket 3', 'high', true);

alter table tickets add completed BOOLEAN after priority default false;
update tickets set completed = true where id = 1 or id = 2;

select * from tickets;
drop table tickets;

create table events(
    id int auto_increment primary key,
    event_name varchar(255) not null,
    visitor varchar(255) not null,
    properties JSON,
    browser JSON
);

insert into events(event_name, visitor, properties, browser) values('pageview', 'user 1', '{"page": "home"}', '{"name": "chrome"}'),
('click', 'user 2', '{"button": "buy"}', '{"name": "firefox"}'),
('click', 'user 3', '{"button": "buy"}', '{"name": "chrome"}');

select id,browser->'$.name' as browser from events; -- with ""
select id,browser->>'$.name' as browser from events; -- no ""

select * from events;
drop table events;
```
# Joins
```sql
SELECT * FROM `movies` CROSS JOIN `members`
SELECT members.`first_name` , members.`last_name` , movies.`title` FROM members,movies WHERE movies.`id` = members.`movie_id`
-- or
SELECT A.`first_name` , A.`last_name` , B.`title` FROM `members` AS A INNER JOIN `movies` AS B ON B.`id` = A.`movie_id`
SELECT A.`title` , B.`first_name` , B.`last_name` FROM `movies` AS A LEFT JOIN `members` AS B ON B.`movie_id` = A.`id`
SELECT A.`first_name` , A.`last_name`, B.`title` FROM `members` AS A RIGHT JOIN `movies` AS B ON B.`id` = A.`movie_id`
SELECT A.`title` , B.`first_name` , B.`last_name` FROM `movies` AS A LEFT JOIN `members` AS B USING ( `movie_id` ) -- if two columns with the same names
```
- JOINS allow us to combine data from more than one table into a single result set.
- JOINS have better performance compared to sub queries
- INNER JOINS only return rows that meet the given criteria.
- OUTER JOINS can also return rows where no matches have been found. The unmatched rows are returned with the NULL keyword.
- The major JOIN types include Inner, Left Outer, Right Outer, Cross JOINS etc.
- The frequently used clause in JOIN operations is "ON". "USING" clause requires that matching columns be of the same name.
- JOINS can also be used in other clauses such as GROUP BY, WHERE, SUB QUERIES, AGGREGATE FUNCTIONS etc.
# Foreign keys
- CASCADE: if a row from the parent table is deleted or updated, the values of the matching rows in the child table automatically deleted or updated. 
- SET NULL: if a row from the parent table is deleted or updated, the values of the foreign key column (or columns) in the child table are set to NULL. 
- RESTRICT: if a row from the parent table has a matching row in the child table, MySQL rejects deleting or updating rows in the parent table. 
- NO ACTION: is the same as RESTRICT.
- SET DEFAULT: is recognized by the MySQL parser. However, this action is rejected by both InnoDB and NDB tables.
```sql
CREATE DATABASE fkdemo; 
USE fkdemo;


-- RESTRICT & NO ACTION
CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;
CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName varchar(100) not null, 
  categoryId INT, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
) ENGINE = INNODB;



INSERT INTO categories(categoryName) VALUES ('Smartphone'), ('Smartwatch');
SELECT * FROM categories;
INSERT INTO products(productName, categoryId) VALUES('iPhone',1); -- 1 is smartphone
INSERT INTO products(productName, categoryId) VALUES('iPad',3); -- ERROR because does not exist

UPDATE categories SET categoryId = 100 WHERE categoryId = 1; -- ERROR


-- cascade
DROP TABLE products;
CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName varchar(100) not null, 
  categoryId INT NOT NULL, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories(categoryId) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB;

INSERT INTO products(productName, categoryId) VALUES ('iPhone', 1), ('Galaxy Note',1), ('Apple Watch',2), ('Samsung Galary Watch',2);
SELECT * FROM products;
UPDATE categories SET categoryId = 100 WHERE categoryId = 1;
SELECT * FROM categories;
SELECT * FROM products; -- evverything is updated
DELETE FROM categories WHERE categoryId = 2;
SELECT * FROM categories;
SELECT * FROM products; -- is deleted

-- set null
DROP TABLE IF EXISTS categories; 
DROP TABLE IF EXISTS products;


CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;
CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName varchar(100) not null, 
  categoryId INT, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories(categoryId) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = INNODB;

INSERT INTO categories(categoryName) VALUES ('Smartphone'), ('Smartwatch');
INSERT INTO products(productName, categoryId) VALUES ('iPhone', 1), ('Galaxy Note',1), ('Apple Watch',2), ('Samsung Galary Watch',2);
SELECT * FROM categories;
DELETE FROM categories WHERE categoryId = 2;
SELECT * FROM products; -- shows null


-- drop foreign key
ALTER TABLE table_name DROP FOREIGN KEY constraint_name;
SHOW CREATE TABLE table_name;

```


