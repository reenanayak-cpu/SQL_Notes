use School;

create table dept(
dept_Id int primary key,
dept_name varchar(50)
);

create table emp(
emp_id int primary key,
emp_name varchar (50),
dept_Id int,
Salary float,
foreign key (dept_Id) references dept(dept_Id)
);

desc emp;
desc dept;

insert into dept values (10, 'IT'),(20,'HR'),(30, 'Sales');

insert into emp values 
(1, 'Dhanvi', 10, 60000),
(2,'Pandey',20, 45000),
(3,'Mishra', 10, 80000),
(4,'Aniket', 30, 50000),
(5,'Soham', 20, 55000),
(6,'Nishant', 30, 40000);

select * from emp;
select * from dept;

-- ------------Single-Row Subquery----------------------
select avg(Salary) from emp;

select emp_name, Salary from emp where Salary > (select avg(Salary) from emp);

-- ------------Multi-Row Subquery----------------------
-- Find emplyees who belong to IT and Sales
select emp_name, dept_id from emp 
where dept_id in (select dept_id from dept where dept_name in ('IT', 'Sales'));

select e.emp_name, d.dept_name from emp e 
join dept d on e.dept_id = d.dept_id;

-- ------------------------Correlated Subquery----------------------
-- Find employees whose Salary is greater than the average Salary 
-- on their own department.
select e1.emp_name, e1.Salary,e1.dept_id from emp e1 where e1.Salary > 
(select avg(e2.Salary) from emp e2 where e2.dept_id = e1.dept_id);

-- -----------------Nested Subquery------------------------------
-- Find employees whose Salary is greater than the average Salary 
-- on the IT department.

select emp_name, Salary from emp 
where Salary > (select avg(Salary) from emp 
where dept_id = (select dept_id from dept where dept_name = 'IT'));



