create table emp 
	empId PK AI NN int
	empName varchar(45)
	designation varchar(45)
	salary int
	address varchar(45)
	mobile int
create table emp_salary1
	id INT PRIMARY KEY,
	total salary int

DELIMITER $$
CREATE TRIGGER before_emp_insert1
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
    UPDATE emp_salary
    SET total_salary = total_salary + NEW.salary
    WHERE id = 1;
END$$

DELIMITER ;

select * from emp;
select * from emp_salary;