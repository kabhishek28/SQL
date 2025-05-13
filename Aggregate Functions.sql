create database company;


CREATE TABLE Employee (
    emp_id INT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    join_date DATE,
    city VARCHAR(50)
);


INSERT INTO Employee VALUES
(101, 'Alice', 30, 'Female', 'HR', 55000.00, '2020-05-15', 'Mumbai'),
(102, 'Bob', 28, 'Male', 'Finance', 60000.00, '2019-07-10', 'Delhi'),
(103, 'Charlie', 35, 'Male', 'IT', 75000.00, '2018-03-22', 'Bangalore'),
(104, 'Diana', 26, 'Female', 'Marketing', 50000.00, '2021-01-17', 'Chennai'),
(105, 'Ethan', 32, 'Male', 'IT', 72000.00, '2020-08-01', 'Hyderabad'),
(106, 'Fiona', 29, 'Female', 'Finance', 61000.00, '2019-11-30', 'Pune'),
(107, 'George', 31, 'Male', 'HR', 54000.00, '2020-02-25', 'Kolkata'),
(108, 'Hannah', 27, 'Female', 'Operations', 58000.00, '2021-04-12', 'Jaipur'),
(109, 'Ivan', 34, 'Male', 'IT', 80000.00, '2017-09-18', 'Ahmedabad'),
(110, 'Julia', 25, 'Female', 'Marketing', 49000.00, '2022-06-05', 'Nagpur');


INSERT INTO Employee VALUES
(111, 'Kevin', 33, 'Male', 'Operations', 59000.00, '2020-10-01', 'Surat'),
(112, 'Laura', 29, 'Female', 'HR', 56000.00, '2021-03-20', 'Lucknow'),
(113, 'Michael', 38, 'Male', 'IT', 82000.00, '2016-12-05', 'Bhopal'),
(114, 'Nina', 27, 'Female', 'Finance', 62000.00, '2022-01-15', 'Thane'),
(115, 'Oscar', 36, 'Male', 'Marketing', 53000.00, '2018-07-23', 'Patna'),
(116, 'Priya', 28, 'Female', 'Operations', 60000.00, '2020-06-18', 'Indore'),
(117, 'Ravi', 31, 'Male', 'Finance', 63000.00, '2019-09-25', 'Vadodara'),
(118, 'Sara', 26, 'Female', 'HR', 51000.00, '2021-11-30', 'Amritsar'),
(119, 'Tom', 40, 'Male', 'IT', 85000.00, '2015-04-12', 'Coimbatore'),
(120, 'Uma', 30, 'Female', 'Marketing', 57000.00, '2022-03-27', 'Ranchi');



select * from employee;

Aggregate Functions:
1) COUNT: No of rows in a table.

SELECT count(*) from table_name;

SELECT COUNT(*) as no_of_rows FROM employee_info;

2) SUM:

SELECT sum(salary) as total_sal from employee_info;

3)MAX:

SELECT MAX(age) as max_age from employee_info;

SELECT name, max(salary) as max_sal from employee_info;

min: 
SELECT min(salary) as min_sal from employee_info;

avg: 
select avg(salary) as avg_sal from employee_info;


select count(*) from employee;
select count(age) as Row_of_age from employee


select sum(salary) as Sum_Salary from employee;


select * from employee;

alter table employee
rename column names to emp_name;


SELECT emp_name,count(emp_name) from employee group by emp_name;

select emp_name, max(salary) as max_salarys from Employee;


SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

SELECT @@sql_mode;