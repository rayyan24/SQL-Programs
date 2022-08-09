CREATE TABLE supplier
(
    supplier_no VARCHAR(5) PRIMARY KEY,
    s_name VARCHAR(25) NOT NULL ,
    status INTEGER NOT NULL,
    city VARCHAR(20) NOT NULL
);
CREATE TABLE part
(
    part_no VARCHAR(6)  PRIMARY KEY,
    part_name VARCHAR(25) NOT NULL ,
    color VARCHAR(10) NOT NULL ,
    weight NUMERIC (5,1) NOT NULL ,
    city VARCHAR(20) NOT NULL
);
CREATE TABLE project
(
    project_no VARCHAR(6) PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    city VARCHAR(20) NOT NULL
);
DROP TABLE shipment;
DROP TABLE project;
DROP TABLE supplier;
CREATE TABLE SHIPMENT
(
    supplier_no VARchar(5) not null,foreign key (supplier_no) references supplier(supplier_no),
    part_no VARchar(6) not null,foreign key (part_no) references part(part_no),
    project_no VARchar(6) not null,foreign key (project_no) references project(project_no),
    QTY INT NOT NULL
);
-- CROSS JOIN
SELECT name,age,order_date FROM customers,orders;
-- LEFT JOIN 
SELECT name,salary,order_date FROM customers LEFT JOIN orders ON orders.cust_id=customers.id;
-- RIGHT JOIN 
SELECT name,salary,order_date FROM customers RIGHT JOIN orders ON orders.cust_id=customers.id;

INSERT INTO supplier VALUES ('s1','SMITH',20,'LONDON');
INSERT INTO supplier VALUES ('s2','JONES',10,'PARIS');
INSERT INTO supplier VALUES ('s3','BLAKE',30,'PARIS');
INSERT INTO supplier VALUES ('s4','CLARK',20,'LONDON');
INSERT INTO supplier VALUES ('s5','ADAMS',30,'ATHENS');
INSERT INTO part VALUES ('p1','NUT','RED',12,'LONDON');
INSERT INTO part VALUES ('p2','BOLT','GREEN',17 ,'PARIS');
INSERT INTO part VALUES ('p3','SCREW','BLUE',17,'ROME');
INSERT INTO part VALUES ('p4','SCREW','RED',14,'LONDON');
INSERT INTO part VALUES ('p5','CAM','BLUE',12,'PARIS');
INSERT INTO part VALUES ('p6','COG','RED',19,'LONDON');
INSERT INTO project VALUES ('j1','SORTER','PARIS');
INSERT INTO project VALUES ('j2','DISPLAY','ROME');
INSERT INTO project VALUES ('j3','OCR','ATHENS');
INSERT INTO project VALUES ('j4','CONSOLE','ATHENS');
INSERT INTO project VALUES ('j5','RAID','LONDON');
INSERT INTO project VALUES ('j6','EDS','OSLO');
INSERT INTO project VALUES ('j7','TAPE','LONDON');
INSERT INTO shipment VALUES('s1','p1','j1',200);
INSERT INTO shipment VALUES('s1','p1','j4',700);
INSERT INTO shipment VALUES('s2','p3','j1',400);
INSERT INTO shipment VALUES('s2','p3','j2',200);
INSERT INTO shipment VALUES('s2','p3','j3',200);
INSERT INTO shipment VALUES('s2','p3','j4',500);
INSERT INTO shipment VALUES('s2','p3','j5',600);
INSERT INTO shipment VALUES('s2','p3','j6',400);
INSERT INTO shipment VALUES('s2','p3','j7',800);
INSERT INTO shipment VALUES('s2','p5','j2',100);
INSERT INTO shipment VALUES('s3','p3','j1',200);
INSERT INTO shipment VALUES('s3','p4','j2',500);
INSERT INTO shipment VALUES('s4','p6','j3',300);
INSERT INTO shipment VALUES('s4','p6','j7',300);
INSERT INTO shipment VALUES('s5','p2','j2',200);
INSERT INTO shipment VALUES('s5','p2','j4',100);
INSERT INTO shipment VALUES('s5','p5','j5',500);
INSERT INTO shipment VALUES('s5','p5','j7',100);
INSERT INTO shipment VALUES('s5','p6','j2',200);
INSERT INTO shipment VALUES('s5','p1','j4',100);
INSERT INTO shipment VALUES('s5','p3','j4',200);
INSERT INTO shipment VALUES('s5','p4','j4',800);
INSERT INTO shipment VALUES('s5','p5','j4',400);
INSERT INTO shipment VALUES('s5','p6','j4',500);
DELETE FROM shipment;
SET FOREIGN_KEY_CHECKS=0;
DESC employee;
-- Get the full details of the suppliers.
SELECT * FROM supplier;
-- Get the full details of the parts.
SELECT * FROM part;
-- Get the full details of the projects.
SELECT * FROM project;
-- Get the full details of the shipments.
SELECT * FROM shipment;
-- Get the full details of the projects in London.
SELECT * FROM project WHERE city='LONDON';
-- Get all shipments where the quantity is in the range 300 to 750 inclusive
SELECT * FROM shipment WHERE QTY BETWEEN 300 AND 750;
-- Get supplier no and status for suppliers in PARIS, in descending order of status.
SELECT supplier_no,status FROM supplier WHERE city='PARIS' ORDER BY status DESC;
-- Get part nos. for red parts and weight is greater than equals to 14.
SELECT part_no from part WHERE color='RED' and weight >= 14;
-- Get the supplier numbers for suppliers who supply project J1.
SELECT supplier_no FROM shipment WHERE project_no ='j1';
-- Get supplier numbers for suppliers who supply project J1, in supplier number order.
SELECT supplier_no FROM shipment WHERE project_no='j1' ORDER BY supplier_no;
-- Get the total no. of suppliers.
SELECT COUNT(supplier_no) FROM supplier;
-- Get the maximum and minimum quantity for each part.
SELECT part_no,MAX(QTY),MIN(QTY) FROM shipment GROUP BY part_no;
-- Get the maximum and minimum quantity for part p2.
SELECT part_no,MAX(QTY),MIN(QTY) FROM shipment GROUP BY part_no='p2';
-- Get part numbers of parts supplied to some project in an average quantity of more than 350.
SELECT part_no FROM shipment GROUP BY part_no HAVING AVG(QTY)>350;
-- Get the total number of projects supplied by S1.
SELECT COUNT(project_no) FROM shipment WHERE supplier_no='s1'; 
-- Get the total quantity of part p1 supplied to supplier S1.
SELECT SUM(QTY) FROM shipment WHERE part_no='p1' AND supplier_no='s1';
-- For each part supplied, get the part no and the total shipment quantity.
SELECT part_no,SUM(QTY) FROM shipment GROUP BY part_no;
-- For each part being supplied to a project, get the part no, project no.  and the corresponding total shipment quantity.
SELECT part_no,project_no ,SUM(QTY) FROM shipment GROUP BY part_no;
-- Get the part no. and the total no. of supplier supplied to the shipment.
SELECT part_no,COUNT(supplier_no) FROM shipment GROUP BY part_no;
-- Get the part no. and the total no. of supplier supplied to the shipment having more than 2 supplier.
SELECT part_no,COUNT(supplier_no) FROM shipment GROUP BY supplier_no HAVING COUNT(supplier_no)>2;
-- Get suppliers names who supply part p3
SELECT (supplier.s_name) FROM supplier,shipment WHERE part_no='p3';
-- Get distinct suppliers names who supply part p3.
SELECT DISTINCT (supplier.s_name) FROM supplier,shipment WHERE part_no='p3';
-- Get the supplier number, supplier names for suppliers who supply project J1.
SELECT supplier.supplier_no,supplier.s_name FROM supplier WHERE supplier.supplier_no IN (SELECT shipment.supplier_no FROM shipment WHERE project_no='j1'); 
-- Get part numbers of parts supplied by a supplier in London.
SELECT DISTINCT (part.part_no) FROM supplier,part WHERE supplier.city='LONDON';
SELECT part.part_no FROM part WHERE part.part_no IN (SELECT shipment.part_no FROM shipment WHERE  )
-- Get part numbers of parts supplied by a supplier in London to a project in London.
-- Get project names for project supplied by supplier S1
SELECT project.name FROM project WHERE project_no IN (SELECT project_no FROM shipment WHERE supplier_no='s1');
-- get the colors for parts supplied by supplier s1
SELECT color FROM part WHERE part_no IN (SELECT part_no FROM shipment WHERE supplier_no='s1');
-- 26 get all shipment where quantity is not null
SELECT * FROM shipment WHERE QTY IS NOT NULL;
-- 27 get project number and cities where city has an "o" as the second letter of its name
SELECT project_no,city FROM project WHERE city LIKE '_O%'; 
-- get part number for part supplied to project in london
SELECT DISTINCT (part.part_no) FROM part WHERE part.part_no IN (SELECT shipment.part_no );
-- Change the color of all red parts to orange.
UPDATE part SET color='RED' WHERE color='ORANGE'; 
-- 38.  Insert a new supplier (S10) into table S. The name and city are Smith and New York,respectively the status is yet known.
INSERT INTO supplier VALUES ('s10','SMITH',00,'New YORK');
-- 39. Get all the red parts rows in P and insert the result into a table named RedParts.Assume the table exists
CREATE TABLE orange_parts AS SELECT * FROM part WHERE color='ORANGE';
CREATE TABLE blue_part
(
    part_no VARCHAR(6)  PRIMARY KEY,
    part_name VARCHAR(25) NOT NULL ,
    color VARCHAR(10) NOT NULL ,
    weight NUMERIC (5,1) NOT NULL ,
    city VARCHAR(20) NOT NULL
);
INSERT INTO blue_part (SELECT * FROM part WHERE color='ORANGE');
-- Get project numbers for project using at least one part available from supplier S1.
-- Get supplier numbers for suppliers supplying at least one part supplied by at least one supplier who supplies at least one red part.
-- Get supplier numbers for suppliers with status lower than that of supplier S1