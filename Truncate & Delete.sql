use school;

drop table emp;

set autocommit = false;

create table emp(
id int,
name varchar(50)
);

select * from emp;

insert into emp values (1, 'Aryan');

rollback; -- undo the operation till the data is not committed

commit;

truncate table emp;

start transaction;

insert into emp values (1, 'Aryan');
insert into emp values (2, 'Sneha');

select * from emp;

delete from emp where id = 2;

rollback;

commit;
-- ---------------------- enum and set ------------------------
-- ENUM stores one value from a list, while SET stores multiple values from a list.

create table student_subject(
rollno int,
subject enum('English', 'Maths', 'Science', 'Hindi', 'Marathi', 'Geography')
);

desc student_subject;

select * from student_subject;

insert into student_subject values (1, 'English');
insert into student_subject values (1, 'History'); -- Error
insert into student_subject values (3, 'English, Hindi'); -- Error

drop table student_subject;
 
create table student_subject(
rollno int,
subject set('English', 'Maths', 'Science', 'Hindi', 'Marathi', 'Geography')
);

desc student_subject;

select * from student_subject;

insert into student_subject values (1, 'English');
insert into student_subject values (1, 'History'); -- Error
insert into student_subject values (3, "English,Hindi");












