
-- ========================================
-- 1. CREATE DATABASE
-- ========================================
CREATE DATABASE joins_practice;
USE joins_practice;

-- ========================================
-- 2. CREATE TABLES
-- ========================================

CREATE TABLE dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);

-- ========================================
-- 3. INSERT RECORDS
-- ========================================

INSERT INTO dept VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Marketing'),
(104, 'Finance');

INSERT INTO emp VALUES
(1, 'Tanmay', 30000, 101, NULL),
(2, 'Sahil', 40000, 102, 1),
(3, 'Amit', 25000, 101, 1),
(4, 'Rahul', 35000, 103, 2),
(5, 'Priya', 45000, NULL, 2);

-- View Tables
SELECT * FROM emp;
SELECT * FROM dept;

-- ========================================
-- 4. INNER JOIN
-- Returns matching records from both tables
-- ========================================

SELECT emp.emp_id, emp.emp_name, dept.dept_name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.dept_id;

-- ========================================
-- 5. LEFT JOIN
-- Returns all employees and matching departments
-- ========================================

SELECT emp.emp_name, dept.dept_name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.dept_id;

-- ========================================
-- 6. RIGHT JOIN
-- Returns all departments and matching employees
-- ========================================

SELECT emp.emp_name, dept.dept_name
FROM emp
RIGHT JOIN dept
ON emp.dept_id = dept.dept_id;

-- ========================================
-- 7. CROSS JOIN
-- Returns every possible combination
-- ========================================

SELECT emp.emp_name, dept.dept_name
FROM emp
CROSS JOIN dept;

-- ========================================
-- 8. SELF JOIN
-- Employee with their manager
-- ========================================

SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM emp e
LEFT JOIN emp m
ON e.manager_id = m.emp_id;

-- ========================================
-- 9. FULL OUTER JOIN
-- Simulated using LEFT JOIN + RIGHT JOIN
-- ========================================

SELECT emp.emp_name, dept.dept_name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.dept_id

UNION

SELECT emp.emp_name, dept.dept_name
FROM emp
RIGHT JOIN dept
ON emp.dept_id = dept.dept_id;

-- ========================================
-- 10. LEFT ANTI JOIN
-- Employees without a matching department
-- ========================================

SELECT emp.emp_name, emp.dept_id
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.dept_id
WHERE dept.dept_id IS NULL;

-- ========================================
-- 11. RIGHT ANTI JOIN
-- Departments without matching employees
-- ========================================

SELECT dept.dept_name
FROM dept
LEFT JOIN emp
ON dept.dept_id = emp.dept_id
WHERE emp.emp_id IS NULL;

-- ========================================
-- 12. JOIN WITH WHERE CONDITION
-- Employees earning more than 30000
-- ========================================

SELECT emp.emp_name, emp.salary, dept.dept_name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.dept_id
WHERE emp.salary > 30000;

-- ========================================
-- 13. JOIN WITH GROUP BY
-- Count employees in each department
-- ========================================

SELECT dept.dept_name, COUNT(emp.emp_id) AS total_employees
FROM dept
LEFT JOIN emp
ON dept.dept_id = emp.dept_id
GROUP BY dept.dept_name;

-- ========================================
-- 14. JOIN WITH ORDER BY
-- Employees sorted by salary
-- ========================================

SELECT emp.emp_name, emp.salary, dept.dept_name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.dept_id
ORDER BY emp.salary DESC;