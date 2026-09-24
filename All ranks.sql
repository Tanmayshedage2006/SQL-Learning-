
-- ========================================
-- 1. CREATE DATABASE
-- ========================================

CREATE DATABASE rank_practice;
USE rank_practice;

-- ========================================
-- 2. CREATE TABLE
-- ========================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);

-- ========================================
-- 3. INSERT RECORDS
-- ========================================

INSERT INTO students VALUES
(1, 'Tanmay', 90),
(2, 'Sahil', 85),
(3, 'Amit', 85),
(4, 'Rahul', 75),
(5, 'Priya', 70),
(6, 'Neha', 70),
(7, 'Rohit', 60);

-- ========================================
-- 4. VIEW STUDENT RECORDS
-- ========================================

SELECT * FROM students;

-- ========================================
-- 5. ROW_NUMBER()
-- Gives each row a unique number
-- ========================================

SELECT
    student_name,
    marks,
    ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_num
FROM students;

-- ========================================
-- 6. RANK()
-- Tied marks get the same rank; gaps occur
-- ========================================

SELECT
    student_name,
    marks,
    RANK() OVER (ORDER BY marks DESC) AS student_rank
FROM students;

-- ========================================
-- 7. DENSE_RANK()
-- Tied marks get the same rank; no gaps
-- ========================================

SELECT
    student_name,
    marks,
    DENSE_RANK() OVER (ORDER BY marks DESC) AS dense_rank_num
FROM students;

-- ========================================
-- 8. NTILE()
-- Divides rows into 3 groups
-- ========================================

SELECT
    student_name,
    marks,
    NTILE(3) OVER (ORDER BY marks DESC) AS group_num
FROM students;

-- ========================================
-- 9. PERCENT_RANK()
-- Relative rank between 0 and 1
-- ========================================

SELECT
    student_name,
    marks,
    PERCENT_RANK() OVER (ORDER BY marks DESC) AS percent_rank_num
FROM students;

-- ========================================
-- 10. CUME_DIST()
-- Cumulative distribution between 0 and 1
-- ========================================

SELECT
    student_name,
    marks,
    CUME_DIST() OVER (ORDER BY marks DESC) AS cumulative_dist
FROM students;

-- ========================================
-- 11. ALL RANKING FUNCTIONS IN ONE QUERY
-- ========================================

SELECT
    student_name,
    marks,
    ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_num,
    RANK() OVER (ORDER BY marks DESC) AS student_rank,
    DENSE_RANK() OVER (ORDER BY marks DESC) AS dense_rank_num,
    NTILE(3) OVER (ORDER BY marks DESC) AS group_num,
    PERCENT_RANK() OVER (ORDER BY marks DESC) AS percent_rank_num,
    CUME_DIST() OVER (ORDER BY marks DESC) AS cumulative_dist
FROM students;