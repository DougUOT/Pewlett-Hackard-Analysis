# Pewlett-Hackard-Analysis
Data Analysis using SQL, Data modelling and Data engineering

## Overview of Project

Pewlett Hackard is a large company with thousands of employees, many of these employees were born in the 1950s and are approaching their retirement age. This project will apply our data analysis knowledge, create entity relationship diagrams (ERD's), and build an employee database with SQL applying data modelling, engineering, and data analysis skills on PgAdmin. The company made the database available in 6 CSV files in the data folder. Our main objective is to review and deliver a list of all employees eligible for the retirement package to the Human Resources analyst. Furthermore, after the data analysis, we will deliver findings and results that will help the company to make better decisions regarding the job positions that will need to be filled in the near future in order to cover the vacancies.

Follow below the goals for this project:

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

Follow below the SQL Code in order to retrieve the information of the number of employees eligible for the mentorship program grouped by title and sort by count (largest to smallest)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del2_Img3_codeSQL.PNG)

Follow below the result of the SQL Code above. The result was saved on the table mentorship_eligibility_counts. For those employees eligible for the mentorship program, 403 are Senior Staff, 402 are Engineer, followed by Staff (321), Senior Engineer (287), Technique Leader (77) and 59 Assistant Engineer.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del2_Img4_Output.PNG)

### 3) Objective 3: A written report on the employee database analysis:

We need write a report to help the manager prepare for the upcoming "silver tsunami."

The analysis should contain the following:

 * 3.1) Overview of the analysis: Explain the purpose of this analysis.
 * 3.2) Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
 * 3.3) Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
    * How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    * Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

####  * 3.1) Overview of the analysis: Explain the purpose of this analysis.

he Pewlett-Hackard company has 240,124 current employees, and 38% are eligible for retirement. This group is related to those employees born between 1952 and 1955, known as baby boomers, who begin to retire rapidly. So the company is looking for the future and will work in two ways, the first offering a retirement bundle for the people who meet the particular measures. The second one is that the company is starting to think about which position will need to be filled soon, who will retire in the next few years and how many positions the company needs to fill.

So, the results and findings after a Data Analysis using PostgreSQL will provide information that will help the company, and all stakeholders make a better decision or even prepare a strategic plan to see how many positions and which ones must be filled in the near future.

Follow below the number of current employees by title (Code SQL & Figure)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img1_Curr_emp_title_codeSQL.PNG)

The company has 85,939 Senior Engineer, 82,024 Senior Staff and 30983 Engineer as the most of the titles as current employees, all these titles together represent around 83% of the total current employee at Pewlett-Hackard.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img2_Curr_emp_title.PNG)

Follow below the number of current employees by department (Code SQL & Figure)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img3_Curr_emp_dept_codeSQL.PNG)

The company has 61,386 employees working in the Development Department, followed by 53,304 in Production and 37,701 in Sales. All these departments together represent around 63% of the total current employee at Pewlett-Hackard.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img4_Curr_emp_dept_.PNG)

####  * 3.2) Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

1) One of the significant points from the two analysis deliverables is the importance of Data Analysis and cleaning data to deliver accurate information. The company had 61,318 duplicate rows; before the cleaning data on the retirement_titles table, we had 133,776 rows; after the analysis and cleaning data applying the SQL code, the final result on the unique_titles was 72,458 rows. Based on these results, we move forward and create in the following steps the mentorship_eligibility one of the objectives of this project. 

Follow below the SQL code & Figure (before data cleaning):

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img5_before%20cleaning%20data_codeSQL.PNG)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img6_before%20cleaning%20data_Output.PNG)

Follow below the SQL code & figure (After data cleaning, removing the duplicates rows)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img7_after%20cleaning%20data_codeSQL.PNG)

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img6_DataOutput.PNG)

2) Considering the number as a current employee as 240,124 and 72,458 (table unique_titles) as eligible to retire shortly, the Pewlett-Hackard has 30% of the workforce that will become vacancies in a few years. This result means that for every 100 employees, 30 are close to retirement. 

3) Related to the number of senior employees that will retire soon (table unique_titles) by title, we have 50842 employees, representing around 70% of the employee working in the senior position at the company. Senior positions mean that these employees have considerable experience. It is not easy to replace them internally in the company quickly, even hiring new employees, because new employees have a learning curve. 

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del1_Img6_DataOutput.PNG)

4) Due to the number of employees that are eligible to retire (72,458 employees), even with the mentorship program offered by the company, just 1549 employees met the company's criteria. It represents just over 2% percent.

![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del2_Img4_Output.PNG)

####  * 3.3) Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
    * How many roles will need to be filled as the "silver tsunami" begins to make an impact?
   
    
 We are considering as the tsunumi silver for the next 10 years, an huge impact if the company will not take any actions in order to filled the roles on the company. Follow below the SQL code in order to get this information. 
 
 ![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img8_tsunami_silver_codeSQL.PNG)
 
 So, according to the filter selected on the SQL above, considering ten years ahead (between 1956 and 1966), for the employees hired between 1985 and 1988, the company will have a gap of 39,644 roles to be filled. The senior position such as Senior Staff and Senior Engineer will represent around 56% of the roles should be filled in the future.
 
 ![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img9_tsunami_silver_Output.PNG)

    * Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  
  The Pewlett Hackard has a significant number of senior employees, which could be considered a strength that could be used just for the short term to develop a mentorship program for training and coaching in order to develop some potential employees for filling some internal roles. 
  
  ![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img10_mentor_codeSQL.PNG)
  
  Despite that, 26,139 employees will be eligible for retirement for the next five years, and 14,560 are related to senior positions such as Senior Staff and Senior Engineer.
  The Pewlett Hackard has a big challenge ahead and has to implement a concrete action plan as soon as possible to mitigate any issue in the face of the risk of not having employees fill the vacancies positions.
  
  ![](https://github.com/DougUOT/Pewlett-Hackard-Analysis/blob/main/Analysis-Project-Folder/Pewlett-Hackard-Analysis-Folder/Data/Resources/Del3_Img11_mentor_Output.PNG)
  

### Others recommendations for the Pewlett Hackard as an Action Plan
  
 Due to the short term to fill the roles shortly, the company should consider immediately taking four extra action plans.

1) Develop an extensive internship program with partnerships with Universities surrounding the company, especially in Engineer.
2) As the base of the last performance review of the employees, create an internal development plan, working together with the senior position to coach and promote potential employees to fill the roles.
3) Develop cross-function roles creating incentives for employees to apply for a new career plan in departments with high needs to fill the roles.
4) Criar um plano educacional para melhorar os skills necessarios para ocupar as posicoes mais senior.
  
## Recommendations for future Analysis

In order to improve this project, write a SQL code to complement this project, analyzing the employee's turnover by department, considering the company's start date and company departure date. Also, develop an analysis looking at the millennial generation and the z generation to determine if the Pewlett-Hackard company will have a balanced workforce or prepare for the coming decades.
  

