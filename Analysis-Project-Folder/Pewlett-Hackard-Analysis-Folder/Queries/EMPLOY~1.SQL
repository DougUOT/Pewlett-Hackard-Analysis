-- Deliverable 1: The Number of Retiring Employees by Title 
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
order by e.emp_no;

-- Confirm the table related to retirement_titles.csv
SELECT * FROM retirement_titles

-- Using Dictinct with order by to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

--Retrieve the number of employees by their most recent job title who are about to retire
SELECT count(ru.emp_no), ru.title
INTO retiring_titles
FROM unique_titles as ru
GROUP BY ru.title
ORDER BY COUNT (ru.emp_no) DESC;

SELECT * FROM retiring_titles;

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
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

-- The Number of Employees eligible for the mentorship program by Title 

SELECT COUNT(title), title
INTO mentorship_eligibility_counts
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

SELECT * FROM mentorship_eligibility_counts;
		