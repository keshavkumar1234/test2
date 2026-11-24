-- 1. Safely recreate the database for clean practice runs
DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;

SET autocommit = 1;

-- 2. Create table with proper constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

-- 3. Insert sample records
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
    
    
--     01. Insert one employee
-- A new employee has joined. Write an INSERT statement with an explicit column list to add the following record to
-- employees. Supply all seven values.
-- 11, Karan Malhotra, IT, Noida, 41000.00, Active, 9000000011
select * from employees;
insert into employees(
employee_id,employee_name,department, city,salary,employment_status,phone)
values
("11", "Karan Malhotra" ,"IT", "Noida", "41000.00", "ACTIVE", "9000000011");


-- 02. Insert several employees in one statement
-- Add both employees below using a single INSERT statement. Do not write a separate INSERT for each employee.
-- 12, Simran Kaur, HR, Delhi, 35000.00, Active, 9000000012
-- 13, Rohan Das, Sales, Pune, 33000.00, Inactive, 9000000013
INSERT INTO EMPLOYEES(
employee_id,employee_name,department,city,salary,employment_status,phone)
VALUES
('12','Simran Kaur', 'HR', 'Delhi', '3500.00','Active', '9000000012'),
('13', 'Rohan Das', 'Sales', 'Pune', '33000.00', 'Inactive', '9000000013');


-- 03. Update two values in one row
-- Karan Malhotra, employee_id 11, has moved to Gurgaon and received a salary revision. Change his city to
-- Gurgaon and his salary to 46000.00 in one UPDATE statement. Leave every other employee unchanged.
UPDATE EMPLOYEES SET CITY = 'Gurgoan' 
where employee_id = 11; 
UPDATE EMPLOYEES SET SALARY = '46000.00'
WHERE EMPLOYEE_ID = 11;
SELECT * FROM EMPLOYEES;

-- 04. Apply a salary increase
-- Give employees 1, 4 and 7 a 10% increase on their current salary using one UPDATE statement. Calculate the
-- increase from the stored salary; do not enter three replacement salary amounts. Run the statement only once.
UPDATE EMPLOYEES 
SET SALARY =  SALARY+(SALARY*10/100)
WHERE EMPLOYEE_ID IN ('1','4','7');
SELECT * FROM EMPLOYEES;


-- 05. Delete selected employee records
-- Employees 3, 8 and 13 have left the company. Delete only these three records using one DELETE statement. Keep
-- the employees table and all other records.
-- For each task, check the affected row count
DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID IN ( 3, 8, 13);
SELECT * FROM EMPLOYEES;

-- 06. Add a new column
-- Use ALTER TABLE to add an email column with data type VARCHAR(100). Allow it to contain NULL. Existing
-- employees do not have email addresses yet, so do not fill the column with invented values.
alter table employees
add column email varchar(100) null;

-- 07. Change the size of a column
-- The phone column currently allows 15 characters. Use ALTER TABLE to increase it to VARCHAR(20), while keeping
-- the existing phone values. The column should still allow NULL.
ALTER TABLE employees
MODIFY COLUMN phone VARCHAR(20) NULL;

-- 08. Rename a column
-- Use ALTER TABLE to rename city to work_city. Keep its VARCHAR(40) data type and all existing city values. Use the
-- new column name in later questions.
alter table employees
change column city work_city varchar(40);

-- 09. Remove an unused column
-- The company decides not to store email addresses in this table. Use ALTER TABLE to remove only the email
-- column added in Question 6. Keep every other column and every employee record.
alter table employees 
drop column email;


-- 10. Rename the table
-- Use RENAME TABLE to change the table name from employees to staff. Keep the data and structure. Use staff for
-- Questions 11 to 15.
RENAME TABLE employees TO staff;
