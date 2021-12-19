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

Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, be sure to exclude those employees who have already left the company.

Writing the SQL code. Creating a table called retirement_titles.csv, filtering the data on the birth_date column to retrieve employees who were born between 1952 and 1955 and order by the employee number.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img1_codeSQL.PNG)

The result on the retirement_titles.csv show that this table has 133,776 rows, with some duplicate lines. It happens because some employees highlighted in the table below have changed their job position (title) during their career at the Pewlett-Hackard company.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img7_duplicate%20emp_no.PNG)

For example, the employee name Sumant Peac has changed three times of their job position, this worker started as a Assistant Engineer in 1985-02-18, in 1990-02-18 this employee changed to Engineer and 5 years after that this employee changed to Senior Engineer. Note that the employee number keept the same, after changed on their job position.

Follow below the SQL Code developed to remove the duplicates and keep only the recent title of each employee. Also, we exclude those employees who have already left the company by filtering on to_date to keep only those dates equal to '9999-01-01' and order by employee number. We create a table called unique_titles.csv.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img3_codeSQL.PNG)

After running the SQL code above, we got a table without duplicate data with 72,458 rows, a 54% reduction compared to the previous table. Note below that the employee name Sumant Peac has just one line with the most recent title

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img4_DataOutput.PNG)

We wrote another SQL Code to retrieve the number of employees by their most recent job title who are about to retire and group by title and sort the count column in descending order. The results of this Data Output were saved on the table called retiring_titles.csv.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img5_codeSQL.PNG)

As a result related to the table retiring_titles, we do have the number of Retiring Employees by Title, that as 25,916 Senior Engineer (36% of the total), 24,926 Senior Staff (34% of the total), 9285 Engineer, followed by Staff (7636), Technique Leader (3603), Assistant Leader (1090) and two managers.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img6_DataOutput.PNG)

### 2) Objective 2: The Employees Eligible for the Mentorship Program 

Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

In order to follow the mentorship program, we create a SQL Code below. Applying the filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965, and December 31, 1965, order by employee number. The Data Output was saved in the file called mentorship_eligibility.csv.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del2_Img1_codeSQL.PNG)

The result obtained was the list of 1549 employees eligible for the mentorship program at Pewlett-Hackard company.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del2_Img2_Output.PNG)
