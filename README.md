# Pewlett-Hackard-Analysis
Data Analysis using SQL, Data modelling and Data engineering

## Overview of Project

Pewlett Hackard is a large company with thousands of employees, many of these employees were born in the 1950s and are approaching their retirement age. This project will apply our data analysis knowledge, create entity relationship diagrams (ERD's), and build an employee database with SQL applying data modelling, engineering, and data analysis skills on PgAdmin. The company made the database available in 6 CSV files in the data folder. Our main objective is to review and deliver a list of all employees eligible for the retirement package to the Human Resources analyst. Furthermore, after the data analysis, we will deliver findings and results that will help the company to make better decisions regarding the job positions that will need to be filled in the near future in order to cover the vacancies.

This assignment is related to the Bootcamp Data Analytics from the University of Toronto and comprises the goals below for this module: 

Follow below the goals for this module:

1) Objective 1: The Number of Retiring Employees by Title
2) Objective 2: The Employees Eligible for the Mentorship Program 
3) Objective 3: A written report on the employee database analysis:

  * Overview of the analysis: Explain the purpose of this analysis.
  * Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
  * Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
  How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?  
  
  ## Resources

* Data Source: [Employee_Database_challenge.sql](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Employee_Database_challenge.sql), [retirement_titles.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/retirement_titles.csv), [unique_titles.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/unique_titles.csv), [retiring_titles.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/retiring_titles.csv) and [mentorship_eligibility.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/mentorship_eligibility.csv)
* Data Files: [departments.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/departments.csv), [employees.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/employees.csv), [salaries.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/salaries.csv), [dept_manage.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/dept_manage.csv), [dept_emp.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/dept_emp.csv) and [titles.csv](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/titles.csv)
* Software: PgAdmin 4, version 5.7, PostgreSQL X64 11

## (ERD's) Entity Relationship Diagrams 

An entity-relationship diagram (ERD) is a flowchart that features various tables and their connections to one another, such as primary and foreign keys, and the data types for each column such as string, integers and booleans.

We use a diagram called Quick DBD to create our ERD. Follow below the image and final results of the tables and their relationship with each other and the data types we selected. 

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png)

We use varchar in these columns because the fields contain characters of fluctuating lengths. A key image shows up close to the dept_no line, demonstrating that it is the table's primary key, and varchar shows its sort.

## Results

### 1) Objective 1: The Number of Retiring Employees by Title


