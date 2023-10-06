-- select max and min age
-- Q3. count the age values
-- Q4. calculate avg age
-- Q5. calculate total amount of salaries
-- Q6. name starting FROM c and ending with n
-- Q7. name having a at second position
-- Q8. find the custcomers with address either Delhi or Bhopal or MP
-- Q9. find the custcomers with address in cities other then Delhi or Bhopal or MP
-- Q10. customers of age between 25 and 30
-- Q11. customers of age except between 25 and 30
-- Q12. Display all records by sorting them on the basis of alphabetic order on Customer Name.
CREATE TABLE customers
(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    name varchar(20),
    age int,
    address varchar(30),
    salary int 
);
INSERT INTO customers(name,age,address,salary) VALUES ('Nidhi',38,'Delhi',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Ankit',25,'Mumbai',1500);
INSERT INTO customers(name,age,address,salary) VALUES ('Chetan',31,'Noida',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Hardik',22,'MP',6500);
INSERT INTO customers(name,age,address,salary) VALUES ('Komal',23,'Bhopal',8500);
INSERT INTO customers(name,age,address,salary) VALUES ('Muffy',27,'Kota',4500);
INSERT INTO customers(name,age,address,salary) VALUES ('Kaushik',21,'Indore',10000);
INSERT INTO customers(name,age,address,salary) VALUES ('Kaushik',21,'1234567891',10000);

SELECT * FROM customers;

SELECT MIN(age) FROM customers;

SELECT MAX(age) FROM customers;

SELECT COUNT(age) FROM customers;

SELECT AVG(age) FROM customers;

SELECT SUM(salary) FROM customers;

SELECT name FROM customers WHERE name like'c%n';

SELECT name FROM customers WHERE name like'_a%';

SELECT * FROM customers WHERE address IN ('Delhi','Bhopal','MP');

SELECT * FROM customers WHERE address ='Delhi' OR address ='Bhopal' OR address ='MP';

SELECT * FROM customers WHERE address NOT IN ('Delhi','Bhopal','MP');

SELECT * FROM customers WHERE age BETWEEN 25 AND 30;

SELECT * FROM customers WHERE age NOT BETWEEN 25 AND 30;

select * FROM customers ORDER BY name ASC; 

SELECT * FROM customers ORDER BY name DESC; 

SELECT name as cst_name FROM customers ;

SELECT DISTINCT salary FROM customers;

SELECT * FROM customers;

SELECT salary,2*salary as double_salary FROM customers;

SELECT age,5+age as new_age FROM customers;

CREATE TABLE new_salary as SELECT name,salary*2 FROM customers;

SELECT * FROM new_salary;

ALTER TABLE new_salary ADD constraint PRIMARY KEY (name);

UPDATE customers SET address ='MP' WHERE id=1;

ALTER TABLE  customers add check (age>=18);

INSERT INTO customers VALUES (8,'AASSA',14,'daffdewrfew',32423);

INSERT INTO customers(name,age,address,salary) VALUES ('Nitin',34,'Delhi',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Aniket',25,'Mumbai',1500);
INSERT INTO customers(name,age,address,salary) VALUES ('Chintan',31,'Noida',2000);
INSERT INTO customers(name,age,address,salary) VALUES ('Hardika',19,'MP',6500);
DROP TABLE orders;
CREATE TABLE orders
(
    ID INT PRIMARY KEY ,
    cust_id INT,
    order_date DATE ,
    FOREIGN KEY (cust_id) REFERENCES customers(id)
);
DESCRIBE TABLE orders;
SELECT * FROM orders;
SELECT SUM(salary) as total_sal FROM customers 
WHERE address='MP' GROUP BY address;
INSERT INTO orders VALUES (10308,2,'1996-09-18');
INSERT INTO orders VALUES (10309,3,'1996-09-19');
INSERT INTO orders VALUES (10310,7,'1996-09-20');