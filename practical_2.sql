INSERT INTO student VALUES(10,'nidhi',18,'delhi',123456);
INSERT INTO student VALUES(11,'ankit',19,'gurugram',18756);
INSERT INTO student VALUES(12,'chetan',20,'noida',156234);

ALTER TABLE department ADD location varchar(20);

INSERT INTO department VALUES(1,'VSIT','Block A');
INSERT INTO department VALUES(2,'VJMC','Block B');
INSERT INTO department VALUES(3,'VSBS','Block B');
INSERT INTO department VALUES(4,'DSB','Block A');
INSERT INTO department VALUES(5,'SCIENCE','Block A');

INSERT INTO faculty VALUES(1,'Vidhi Kapoor','1990-01-15','Delhi','F');
INSERT INTO faculty VALUES(2,'Ansh Juneja','1994-10-13','Gurugram','M');
INSERT INTO faculty VALUES(3,'Sourabh Singh','1987-03-19','Noida','M');

SELECT * FROM student;

SELECT * FROM faculty;

SELECT * FROM department;

SELECT * FROM student
WHERE age=18;

DELETE FROM department WHERE dept_num =5;

SELECT * FROM faculty WHERE gender='M';