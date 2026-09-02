select * from emp;
create view emp1 as Select * from emp;
select * from emp1;
update emp1 set emp_name="Sakhsi" where emp_id=2;
delete from emp1 where emp_id=2;

select * from student;
create view std as select student_id,city from student;
select * from std;
update std set city="Delhi" where student_id=103;