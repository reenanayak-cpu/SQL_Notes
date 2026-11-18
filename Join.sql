Use school;
show tables;
drop table student;

create table student(
rollno int primary key,
name varchar(50)
);

insert into student values
(1,'A'),
(2, 'B'),
(3, 'C');

create table marks(
roll_no int,
marks float,
foreign key (roll_no) references student(rollno)
);

insert into marks values
(1,89),
(2,56),
(2,85);

select * from student;
select * from marks;

select student.name, marks.marks from student
inner join marks on student.rollno = marks.roll_no;    

select s.name, m.marks from student s
inner join marks m on s.rollno = m.roll_no;           

select s.name, m.marks from student s
left join marks m on s.rollno = m.roll_no;   

select s.name, m.marks from student s
right join marks m on s.rollno = m.roll_no;   

-- select s.name, m.marks from student s
-- full join marks m on s.rollno = m.roll_no;  -- Error

select s.name, m.marks from student s
cross join marks m;    

-- ------Self Join------------------
create table employees(
emp_id int,
emp_name varchar(50),
manager_id int
);

insert into employees values
(1,'Sneha', null),
(2, 'Rayyan', 1),
(3, 'Anurag', 1),
(4, 'Vansh', 2);

select * from employees;

select e.emp_name as employee, 
	   m.emp_name as Manager
       from employees e left join employees m
       on e.manager_id = m.emp_id;
       
       
       
       