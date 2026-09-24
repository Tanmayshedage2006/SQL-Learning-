CREATE DATABASE trigger_practice;
USE trigger_practice;

-- 1. Create Employee Table
CREATE TABLE emp (
    empId INT PRIMARY KEY AUTO_INCREMENT,
    empName VARCHAR(50),
    salary DECIMAL(10,2)
);

-- 2. Create Log Table
CREATE TABLE emp_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    empId INT,
    empName VARCHAR(50),
    action_type VARCHAR(30),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. BEFORE INSERT Trigger
DELIMITER $$

CREATE TRIGGER before_emp_insert
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
    IF NEW.salary = 0 THEN
        SET NEW.salary = 15000;
    END IF;
END$$

-- 4. AFTER INSERT Trigger
CREATE TRIGGER after_emp_insert
AFTER INSERT ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_log (empId, empName, action_type, new_salary)
    VALUES (NEW.empId, NEW.empName, 'INSERT', NEW.salary);
END$$

-- 5. BEFORE UPDATE Trigger
CREATE TRIGGER before_emp_update
BEFORE UPDATE ON emp
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END$$

-- 6. AFTER UPDATE Trigger
CREATE TRIGGER after_emp_update
AFTER UPDATE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_log
        (empId, empName, action_type, old_salary, new_salary)
    VALUES
        (NEW.empId, NEW.empName, 'UPDATE', OLD.salary, NEW.salary);
END$$

-- 7. BEFORE DELETE Trigger
CREATE TRIGGER before_emp_delete
BEFORE DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_log
        (empId, empName, action_type, old_salary)
    VALUES
        (OLD.empId, OLD.empName, 'BEFORE DELETE', OLD.salary);
END$$

-- 8. AFTER DELETE Trigger
CREATE TRIGGER after_emp_delete
AFTER DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_log
        (empId, empName, action_type, old_salary)
    VALUES
        (OLD.empId, OLD.empName, 'DELETE', OLD.salary);
END$$

DELIMITER ;

-- 9. Insert Records
INSERT INTO emp (empName, salary)
VALUES
    ('Tanmay', 25000),
    ('Sahil', 30000),
    ('Amit', 0);

-- 10. View Employee Records
SELECT * FROM emp;

-- 11. Update Employee Salary
UPDATE emp
SET salary = 35000
WHERE empId = 1;

-- 12. Delete Employee
DELETE FROM emp
WHERE empId = 2;

-- 13. View All Trigger Logs
SELECT * FROM emp_log;

-- 14. Show All Triggers
SHOW TRIGGERS;