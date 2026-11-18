create database school;
use school;
show databases;

create table student
(
rollno int,
name varchar(50),
dob date,
marks decimal(4,2),
Age float,
enrolled boolean
);

desc student;

show tables;

insert into student values (1, 'Anisha', '2006-12-18', 85,21,true);

insert into student (name, dob, marks) values ('Yash', '2007-05-12',98);

set sql_safe_updates = 0;

update student set enrolled = false;

update student set enrolled = true where rollno = 1;

delete from student;
delete from student where name = 'yash';

select * from student;

truncate student;

drop table student;

show tables;

-- ------------------NOT NULL Constraint ----------------------------
use school;

create table student
(
rollno int not null,
name varchar(50) not null,
marks float
);

desc student;

insert into student values (1,'Anisha', 89);
insert into student (name, marks) values ('Jay', 90); -- Error
insert into student (rollno, marks) values (1, 90); -- Error
insert into student (marks) values (90); -- Error

select * from student;
-- ---------UNIQUE---------------------
drop table student;

create table student
(
rollno int unique,
name varchar(50) not null,
marks float
);

desc student;

insert into student values (1,'Anisha', 89);
insert into student values (1,'Anisha', 89); -- Error
insert into student (name, marks) values ('Yash', 9);

select * from student;

-- ---------Combine NOT NULL & UNIQUE ------------------
drop table student;

create table student
(
rollno int unique not null,
name varchar(50) not null unique,
marks float
);

desc student;

insert into student values (1,'Anisha', 89);
insert into student values (1,'Anisha', 89); -- Error
insert into student (name, marks) values ('Yash', 9); -- Error

select * from student;

-- ------------PRIMARY KEY-------------
drop table student;

create table student
(
rollno int primary key,
name varchar(50) not null unique,
marks float
);

desc student;

insert into student values (1,'Anisha', 89);
insert into student values (1,'Anisha', 89); -- Error
insert into student (name, marks) values ('Yash', 9); -- Error

select * from student;
-- ------------Composite PRIMARY KEY-----------------
create table teacher_lecture(
teacherId int,
classId int,
className varchar(50),
primary key(teacherId, classId)
);

desc teacher_lecture;

insert into teacher_lecture values (10,4, 'Python');
insert into teacher_lecture values (11,4, 'Python');
insert into teacher_lecture values (11,5, 'Java');

select * from teacher_lecture;
-- -------------CHECK----------------------------
drop table student;

create table student
(
rollno int primary key,
name varchar(50) not null,
marks float,
check (marks >=0)
);

desc student;

insert into student values (1,'Anisha', 89);
insert into student values (2,'Jay', -9); -- Error

select * from student;
-- ---------------------Foreign Key---------------
drop table student;
drop table course;

create table course(
cid int primary key,
cname varchar(50),
cduration int,
cfees float
);

insert into course values
(1, 'Java', 5, 50000),
(2, 'Python', 4, 40000),
(3, 'HTML', 2, 20000),
(4, 'SQL', 2, 30000);

select * from course;  

create table student (
rollno int primary key,
name varchar(50) not null,
courseId int,
foreign key (courseId) references course(cid)
);       

desc student;

insert into student values(1,'Siya', 4); 
insert into student values(2,'Amit', 5); -- 5 does not exists in cid 
insert into student values(2,'Amit', 4);
insert into student values(3,'Sumit', null);

select * from student;   

delete from student where rollno = 1;      

delete from course where cid = 4; -- can not delete as it is parent row

delete from course where cid = 1;

-- -----------Cascading Effect-------------------
select * from course;

drop table student;
											
create table student (
rollno int primary key,
name varchar(50) not null,
courseId int,
foreign key (courseId) references course(cid) on delete cascade
);       

desc student;

insert into student values(1,'Siya', 4); 
insert into student values(2,'Amit', 2); 
insert into student values(3,'Soham', 3);
insert into student values(4,'Sumit', 2);

select * from student;  

delete from course where cid = 4;

-- On delete set null---------------------
use school;

select * from course;

drop table student;
											
create table student (
rollno int primary key,
name varchar(50) not null,
courseId int,
foreign key (courseId) references course(cid) on delete set null
);       

desc student;

insert into student values
(1,'Siya', 4),
(2,'Amit', 2),
(3,'Soham', 3),
(4,'Sumit', 2);

select * from student;  

delete from course where cid = 4;
-- ----------DEFAULT--------------------
drop table student;

create table student(
sid int,
sname varchar(50),
marks float default 0
);

desc student;

insert into student (sid, sname) values (1, 'Anish');

select * from student;
-- ------------------Auto-Increment-------------------
create table teacher(
tnumber int primary key auto_increment,
tname varchar(50) not null,
salary float default 15000
);

desc teacher;

insert into teacher (tname, salary) values ('Maneshree', 30000);
insert into teacher (tname) values ('Prince');

select * from teacher;
















