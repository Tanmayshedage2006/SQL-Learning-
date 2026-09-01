CREATE TABLE departments (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Table: employees
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Sample Data
INSERT INTO departments VALUES (4, 'Sales'), (2, 'Finance'), (3, 'IT');

INSERT INTO employees VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', NULL),
(104, 'David', 3),
(105, 'Emma', NULL);



select * from departments;
select * from employees;


SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

SELECT e.name, d.dept_name
FROM employees e
left JOIN departments d ON e.dept_id = d.id;

SELECT e.name, d.dept_name
FROM employees e
right JOIN departments d ON e.dept_id = d.id;


SELECT e.name, d.dept_name
FROM employees e
left JOIN departments d ON e.dept_id = d.id
union
SELECT e.name, d.dept_name
FROM employees e
right JOIN departments d ON e.dept_id = d.id;


SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;



CREATE TABLE employees_self (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

select * from employees_self;
INSERT INTO employees_self VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Carol', 1),
(4, 'David', 2),
(5, 'Emma', 3);

-- Self Join Query
SELECT e.name AS Employee, m.name AS Manager
FROM employees_self e
LEFT JOIN employees_self m ON e.manager_id = m.id;