
--DROP TABLES IF NEEDED
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_managers;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--CREATE ALL TABLES TO READ CSV FILES
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no));

CREATE TABLE dept_managers (
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY (dept_no,emp_no));

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE);
	
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT);
	
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR );

--DOUBLE CHECK IF CSV WERE IMPORTED PROPERLY
SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_managers;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW "Employee Details" AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON 
e.emp_no = s.emp_no
--1. FINDINGS
SELECT *
FROM "Employee Details";


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW "Employees Hired in 1986" AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--2. FINDINGS
SELECT *
FROM "Employees Hired in 1986"

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

CREATE VIEW "Department Manager Details" AS
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_managers AS dm
LEFT JOIN employees AS e 
ON e.emp_no = dm.emp_no
LEFT JOIN departments AS d
ON dm.dept_no = d.dept_no;
--3. FINDINGS
SELECT *
FROM "Department Manager Details";

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
CREATE VIEW "Employee Department Details" AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no;
--4. FINDINGS
SELECT *
FROM "Employee Department Details";

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."



-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.



-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.



-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
