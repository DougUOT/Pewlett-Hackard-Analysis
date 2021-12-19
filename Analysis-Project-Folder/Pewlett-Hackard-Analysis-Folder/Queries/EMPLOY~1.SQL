-- Creating tables for PH-EmployeesDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- Creating table for employees
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
-- Creating table for dept_manager
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Creating table for Salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
-- Creating table for dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
-- Creating table for titles
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

-- Determine Retirement Eligibility (between 1952 and 1955)
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Refine List looking how many employees were born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Refine List looking how many employees were born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Refine List looking how many employees were born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Refine List looking how many employees were born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Determine Retirement Eligibility (between 1952 and 1955) ADD one line on the code block
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring also with the second condition that they were hired between 1985 and 1988.
SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;


-- Creating a new table for retiring employees for the Pewlett-Hackard
-- Join retirement_info & dept_manager

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Join retirement_info & dept_emp

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;


-- Finding the current employee who are eligible for retirement

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_counts
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- The most recent date on this list is. Sort that column in descending order

SELECT * FROM salaries
ORDER BY to_date DESC;

--- Export Data to emp_info table

SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Join the salaries table to add the to_date and Salary columns to the query

DROP TABLE emp_info;

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	      AND (de.to_date = '9999-01-01');


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT * FROM manager_info;

--The Dept_Emp and Departments tables each have a portion of the data we'll need, so we'll need to perform two more joins in the next query.

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- SKILL DRILL

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development')
ORDER BY dept_name;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Deliverable 1: The Number of Retiring Employees by Title ------------------------------
-- Filter the data on the birth_date colunm to retrieve the employees who were born between 1952 and 1955. Order by the employee number.

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND to_date = '9999-01-01'
order by e.emp_no ASC;

-- Confirm the table related to retirement_titles.csv
SELECT * FROM retirement_titles;

-- Using Dictinct with order by to remove duplicate rows and apply filtering on to_date to keep only those dates that are equal to '9999-01-01'
-- Create a table unique_titles. Order by Employee number

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC;

SELECT * FROM unique_titles;

--Retrieve the number of employees by their most recent job title who are about to retire

SELECT count(ru.title), ru.title
INTO retiring_titles
FROM unique_titles as ru
GROUP BY ru.title
ORDER BY COUNT (ru.emp_no) DESC;

SELECT * FROM retiring_titles;

-- The Number of Retiring Employees by Title (another way to get the same result above)

SELECT COUNT(title), title
INTO retiring_title_counts
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_title_counts;

-- Deliverable 2: The Employees Eligible for the Mentorship Program  --
-- create a Mentorship Eligibility table 


SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
LEFT OUTER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
LEFT OUTER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM mentorship_eligibility;

-- The Number of Employees eligible for the mentorship program by Title 

SELECT COUNT(title), title
INTO mentorship_eligibility_counts
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

SELECT * FROM mentorship_eligibility_counts;


------- DELIVERABLE 3 ---------
--- Number of current employee on the company

SELECT DISTINCT ON (emp_no) emp_no,
dept_no,
from_date,
to_date
INTO current_employees
FROM dept_emp
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC;

SELECT * FROM current_employees;

-- Join dept_name into current_employees

SELECT departments.dept_name,
current_employees.emp_no,
current_employees.from_date
INTO current_employees_dept
FROM departments
INNER JOIN current_employees
ON departments.dept_no = current_employees.dept_no;

SELECT * FROM current_employees_dept;

-- COUNT number of current employee by department name

SELECT COUNT (dept_name), dept_name
INTO current_employees_dept_count
FROM current_employees_dept
GROUP BY dept_name
ORDER BY count DESC;

SELECT * FROM current_employees_dept_count;

-- Creating a current_employees_joined 

SELECT employees.first_name,
employees.last_name,
employees.gender,
t.title,
current_employees.dept_no,
current_employees_dept.dept_name,
current_employees.from_date,
t.to_date,
employees.birth_date
INTO current_employees_joined
FROM employees
INNER JOIN current_employees
ON employees.emp_no = current_employees.emp_no
INNER JOIN current_employees_dept
ON current_employees_dept.emp_no = current_employees.emp_no
INNER JOIN titles as t
ON t.emp_no = current_employees.emp_no
WHERE t.to_date = '9999-01-01';

SELECT * FROM current_employees_joined;

----- Determine the current employees on the campany by title

SELECT COUNT (title), title
FROM current_employees_joined
GROUP BY title
ORDER BY count DESC;


----- Determine the current employees on the campany by dept

SELECT COUNT (dept_name), dept_name
FROM current_employees_joined
GROUP BY dept_name
ORDER BY count DESC;

--------- Count number of employees on Retirement_titles file (before cleaning data, such as removing the duplicate lines)

SELECT COUNT (title), title
FROM retirement_titles
GROUP BY title
ORDER BY count DESC;

---------- Count number of employees on unique_titles file (after cleaning data, removing the duplicate lines)

SELECT COUNT (title), title
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

------ How many roles will need to be filled as the silver tsunami begins to make an impact

SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO qty_roles_needed
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1956-01-01' AND '1966-12-31')
	AND (de.from_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no;

---------- Count many roles will need to be filled as the silver tsunami begins to make an impact

SELECT COUNT (title), title
FROM qty_roles_needed
GROUP BY title
ORDER BY count DESC;
--39644

---- Check the info if the company has enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.

SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO staff_leaving_by_dept
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1956-01-01' AND '1961-12-31')
	AND (de.from_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no;

SELECT COUNT (title), title
FROM staff_leaving_by_dept
GROUP BY title
ORDER BY count DESC;