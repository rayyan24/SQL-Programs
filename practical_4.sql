DROP TABLE employee;
CREATE TABLE employee 
(
emp_no NUMERIC(4) PRIMARY KEY,
name	VARCHAR(20) NOT NULL,
job CHAR(10),
manager NUMERIC(4),
hire_date DATETIME,
salary NUMERIC(9,2),
commission NUMERIC(7,2),
dept_no NUMERIC(2) 
);
CREATE TABLE department 
(
    dept_no NUMERIC (2) PRIMARY KEY,
    d_name VARCHAR(20) NOT NULL,
    location VARCHAR(10)
);
SELECT * FROM employee;
INSERT INTO employee VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO employee VALUES (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO employee VALUES (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO employee VALUES (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO employee VALUES (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO employee VALUES (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO employee VALUES (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO employee VALUES (7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO employee VALUES (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO employee VALUES (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO employee VALUES (7876,'ADAMS','CLERK',7788,'1987-05-03',1100,NULL,20);
INSERT INTO employee VALUES (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO employee VALUES (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO employee VALUES (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

INSERT INTO department VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO department VALUES (20,'RESEARCH','DALLAS');
INSERT INTO department VALUES (30,'SALES ','CHICAGO');
INSERT INTO department VALUES (40,'OPERATIONS','BOSTON');
-- 1.	Select all the records from emp table.
SELECT * FROM employee;
-- 2.	Select all the records from dept table.
SELECT * FROM department;
-- 3.	Find the employee name, salary who is working in dept no 20.
SELECT name,salary FROM employee WHERE dept_no=20;
-- 4.	Find the name, job, salary of the employee who is manager.
SELECT name,job,salary from employee WHERE job='MANAGER';
-- 5.	Find the name, job, salary of the employee who is not a manager.
SELECT name,job,salary from employee WHERE job<>'MANAGER';
-- 6.	Find those employees who were hired between 1 mar 1981 and 1 jun 1983.
SELECT * FROM employee WHERE hire_date BETWEEN '1981-03-01' AND '1983-06-01';
-- 7.	Find employee name who were hired in 1981.
SELECT * FROM employee WHERE hire_date LIKE '1981%';
-- 8.	Find employee name whose name starts with ‘s’.
SELECT * FROM employee WHERE name LIKE 's%';
-- 9.	Find employee name whose name ends with ‘s’.
SELECT * FROM employee WHERE name LIKE '%s';
-- 10.	Find employee name who is working in dept no 20 & 40.
SELECT name,dept_no FROM employee WHERE dept_no=20 AND dept_no=20;  
-- 11.	Find employee name, job and deptno who are clerk & salesman.
SELECT name,job,dept_no FROM employee WHERE job='CLERK' OR job='SALESMAN';
-- 12.	Find enames who are manager and getting salary more than 2000.
SELECT * FROM employee  WHERE job='MANAGER' AND salary > 2000; 
-- 13.	Find ename who are working in deptno 30 order by salary in desc order.
SELECT name FROM employee WHERE dept_no=30 ORDER BY salary DESC ; 
-- SELECT name,dept_no FROM employee WHERE dept_no=30 ORDER BY salary DESC ;
-- 14.	Find out the total salary of all the employees.
SELECT SUM(salary) AS total_salary from employee;
-- 15.	Find out avgerage salary of all the employees who are working in deptno 30.
SELECT AVG(salary) AS average_salary from employee;
-- 16.	Find out the minimum salary of dept no 20.
SELECT MIN(salary) AS min_salary FROM employee WHERE dept_no=20;
-- 17.	Find out the maximum hiredate.
SELECT name,MAX(hire_date) from employee;
-- 18.	Find out the total number of employees who are working in dept no 10.
SELECT name,COUNT(emp_no) FROM employee WHERE dept_no=10;
-- 19.	Find out deptno, total salary of those dept where there is no salesman and total salary of dept is more than 8500.
-- 20.	Find ename who was hired first.
SELECT name,MIN(hire_date) FROM employee;
-- 21.	Find total salary for those who are not manager.
SELECT SUM(salary) as total_salary FROM employee WHERE job<>'MANAGER';
-- 22.	Find out job and average salary for all the job types with more than 2 employees.
SELECT job,AVG(salary) FROM employee GROUP BY job HAVING COUNT(job)>2;
-- 23.	Find out the ename having maximum salary in each dept.
SELECT dept_no,MAX(salary),dept_no FROM employee GROUP BY dept_no;
-- 24.	Find the square root of the salary in emp table.
SELECT name,SQRT(salary) FROM employee;
-- Delete complete record of employee SCOTT.
DELETE FROM employee WHERE name='scott';
-- Find avg salary for those employees whose job=’clerk’.
SELECT AVG(salary) AS avg_salary from employee WHERE job='CLERK';
-- Find total salary for those employees who were hired in 1981.
SELECT SUM(salary) AS total_salary from employee WHERE hire_date LIKE '1981%';
-- Change the job, deptno, salary whose empno=7566.
UPDATE employee set salary=2000,job='abc',dept_no=5 WHERE emp_no=7566;
SELECT * FROM customers;
-- Create table new using all records from emp.
CREATE table new_emp as select * from employee;
-- Change the job of table new to ‘sales’.
UPDATE new_emp SET job='SALES';
-- Select all records from new.
SELECT * FROM new_emp;
-- Add a new column address varchar(10) to table new.
ALTER TABLE new_emp ADD COLUMN address varchar(10);
-- Insert the value to address column in table new.
UPDATE new_emp SET address='DELHI';
-- Update the size of address column from 10 to 4.
AFTER TABLE new_emp MODIFY COLUMN address VARCHAR(4);
-- AFTER TABLE new_emp CHANGE COLUMN address address VARCHAR(7);

UPDATE new_emp set name='hello' where emp_no=7839;
UPDATE new_emp set name='world' where emp_no=7844;
UPDATE new_emp set name='good' where emp_no=7876;
UPDATE new_emp set name='morning' where emp_no=7900;
-- UNION
SELECT name,salary FROM employee UNION  SELECT name,salary FROM new_emp;
-- JOIN
SELECT * FROM customers;
SELECT * FROM orders;
SELECT customers.name,customers.salary,orders.order_date FROM customers INNER JOIN orders on orders.cust_id=customers.id;

-- Find out the total number of employees who are working in dept no 
-- 10.Find out deptno, total salary of those dept where there is no salesman and total salary of dept is more than 8500.
-- Find out job and average salary for all the job types with more than 2 employees.
SELECT COUNT(*) FROM employee GROUP BY dept_no HAVING dept_no=10;

SELECT COUNT(distinct(job)) FROM employee; 
SELECT * FROM employee WHERE commission IS NULL;
SELECT * FROM employee WHERE commission IS NOT NULL;
SELECT AVG(salary) as average_salary FROM employee WHERE job='CLERK';
DROP TABLE new_emp;
DESC new_emp;