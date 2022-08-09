CREATE TABLE customers
(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    name varchar(20),
    age int,
    address varchar(30),
    salary int 
);

SELECT * FROM customers;

INSERT INTO customers(name,age,address,salary) VALUES ('Nidhi',38,'Delhi',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Ankit',25,'Mumbai',1500);
INSERT INTO customers(name,age,address,salary) VALUES ('Chetan',31,'Noida',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Hardik',22,'MP',6500);
INSERT INTO customers(name,age,address,salary) VALUES ('Komal',23,'Bhopal',8500);
INSERT INTO customers(name,age,address,salary) VALUES ('Muffy',27,'Kota',4500);
INSERT INTO customers(name,age,address,salary) VALUES ('Kaushik',21,'Indore',10000);
INSERT INTO customers(name,age,address,salary) VALUES ('Kaushik',21,'1234567891',10000);

SELECT * FROM customers WHERE salary>5000;
SELECT * FROM customers WHERE salary=2000;
SELECT * FROM customers WHERE salary<>2000;
SELECT * FROM customers WHERE salary>=6500;
SELECT * FROM customers WHERE age>=25 AND salary>=6500 ;
SELECT * FROM customers WHERE age>=25 AND salary>=2000 ;
SELECT * FROM customers WHERE age>=25 OR salary>=6500 ;

SELECT name,age,salary FROM customers WHERE age>=25;