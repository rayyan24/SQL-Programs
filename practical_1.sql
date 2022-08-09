-- -- CREATE database DB_1; 
-- CREATE TABLE student 
-- (
-- roll_num INT,
-- f_name VARCHAR(20),
-- mobile_num INT NOT NULL,
-- marks DECIMAL(5,2),
-- PRIMARY KEY(roll_num)
-- );

-- INSERT INTO student VALUES(1,'RAYYAN',844781,86.50);
-- INSERT INTO student VALUES(2,'RAYYAN',844782,86.50);
-- SELECT * from student;
CREATE DATABASE abc;
CREATE TABLE student 
(
roll_num INT,
name VARCHAR(20) NOT NULL,
age INT,
city VARCHAR(20),
PRIMARY KEY(roll_num)
);
CREATE TABLE dept
(
    dept_no NUMERIC(2) PRIMARY KEY ,
    d_name VARCHAR(20) NOT NULL
);
CREATE TABLE faculty
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    date_of_birth DATETIME, 
    address VARCHAR(20),
    gender CHAR(1) 
);
SELECT * FROM student;
SELECT * FROM dept;
SELECT * FROM faculty;
ALTER TABLE student ADD  mobile_num INT;
ALTER TABLE department ADD location varchar(20);    
ALTER TABLE faculty MODIFY name varchar(50);