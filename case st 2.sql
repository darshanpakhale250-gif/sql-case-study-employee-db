create database case2

use case2



CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

CREATE TABLE JOB69
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB69 VALues
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB69(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

select*from JOb69
select*from EMPLOYEE
select*from DEPARTMENT
select*from LOCATION
select LAST_NAME, FIRST_NAME,SALARY ,COMM from EMPLOYEE
select employee_id as [ID of employee] , last_name as [name of employee] ,DEPARTMENT_ID as dep_id
from EMPLOYEE

select first_name ,salary from EMPLOYEE

--where condition

select*from EMPLOYEE
select *from EMPLOYEE where LAST_NAME = 'smith'
select *from employee where DEPARTMENT_ID = 20
select *from employee where salary  between 2000 and 3000
select *from DEPARTMENT where DEPARTMENT_ID  = 10 or DEPARTMENT_ID =  20
--no department_di 10 exist
select*from DEPARTMENT where Department_Id not in(10,30)
select*from employee where FIRST_NAME like 'L%'
select*from employee where FIRST_NAME like 'L%E'
select*from employee where FIRST_NAME like 'J___'
select *from EMPLOYEE where Department_Id = 30 and salary >2500
select*from EMPLOYEE where comm is null


--order by clause
1. List out the Employee ID and Last Name in ascending order based on the
Employee ID.
2. List out the Employee ID and Name in descending order based on salary.
3. List out the employee details according to their Last Name in ascending-order.
4. List out the employee details according to their Last Name in ascending
order and then Department ID in descending order.

select employee_id , last_name from EMPLOYEE order by EMPLOYEE_ID 
select employee_id , first_name , SALARY from EMPLOYEE order by SALARY
select*from EMPLOYEE order by LAST_NAME
select*from EMPLOYEE order by LAST_NAME asc , department_id desc

--group by and having clause
1. List out the department wise maximum salary, minimum salary and
average salary of the employees.
2. List out the job wise maximum salary, minimum salary and average
salary of the employees.
3. List out the number of employees who joined each month in ascending order.
4. List out the number of employees for each month and year in
ascending order based on the year and month.
5. List out the Department ID having at least four employees.
6. How many employees joined in February month.
7. How many employees joined in May or June month.
8. How many employees joined in 1985?
9. How many employees joined each month in 1985?
10. How many employees were joined in April 1985?
11. Which is the Department ID having greater than or equal to 3 employ
select max(salary) as max_salary , min(salary) as min_salary , avg(salary) as avg_salary , DEPARTMENT_ID
from EMPLOYEE group by DEPARTMENT_ID

select max(salary) as max_salary , min(salary) as min_salary , avg(salary) as avg_salary 
from EMPLOYEE group by  JOB_ID

--q3
select datepart(year, hire_date) as hire_year, datepart(month, hire_date) as hire_month, count(*) as num_employees
from employee
group by datepart(year, hire_date), datepart(month, hire_date)
order by hire_year asc, hire_month asc;



select datepart(year , hire_date) as year,
datepart(month , hire_date) as month,
count(*) as employee_count
from employee
group by datepart(year, hire_date) , datepart(month , hire_date)
order by year asc , month asc

select count( distinct department_id) as emp_atleast4 ,department_id from employee
group by department_id 
having count(employee_id) >=4

select datepart(month , hire_date) as join_month,
count(*) as employee_join_in_february
from employee
group by datepart(month ,hire_date)
having datepart(month ,hire_date) = 2

select datepart(month ,hire_date) as join_month ,
count(*) as emm_join_in_feb_june
from employee
group by datepart(month , hire_date)
having datepart(month ,hire_date) = 2 or datepart(month ,hire_date) =6

select count(*) as no_of_employees  from employee group by datepart(year , hire_date) 
having datepart(year , hire_date) = 1985

select datepart(year ,hire_date) as year , datepart(month , hire_date) as month , 
count(*) as emp_join_each_month 
from employee
group by datepart(year , hire_date) , datepart(month , hire_date)
having datepart(year , hire_date) = 1985
order by month


select datepart(year ,hire_date) as year , datepart(month , hire_date) as month , 
count(*) as emp_join_each_month 
from employee
group by datepart(year , hire_date) , datepart(month , hire_date)
having datepart(year , hire_date) = 1985 and datepart(month , hire_date) = 4

SELECT department_id 
FROM employee
WHERE DATEPART(year, hire_date) = 1985 
  AND DATEPART(month, hire_date) = 4
GROUP BY department_id
HAVING COUNT(employee_id) >= 3;

--join
1. List out employees with their department names.
2. Display employees with their designations.
3. Display the employees with their department names and city.
4. How many employees are working in different departments? Display with
department names.
5. How many employees are working in the sales department?
6. Which is the department having greater than or equal to 3
employees and display the department names in
ascending order.
7. How many employees are working in 'Dallas'?
8. Display all employees in sales or operation departments
--q1
SELECT e.employee_id, e.first_name , d.department_id
FROM employee e
JOIN department d
ON e.department_id = d.department_id;

--q2
SELECT e.job_id, e.first_name , e.employee_id , j.designation
FROM employee e
JOIN job69 j 
ON e.job_id =  j.job_id

select*from employee
select*from location
select*from job69
select*from department
--q3
SELECT e.employee_id, 
       e.first_name, 
       d.name as department_name, 
       l.city
FROM employee e
JOIN department d
  ON e.department_id = d.department_id
JOIN location l
  ON d.location_id = l.location_id;
--q4
select d.name as department_name, count(e.employee_id) as num_employees
from department d
left join employee e on d.department_id = e.department_id
group by d.name
order by num_employees desc

--q5
select count(*) as num_employees_in_sales
from employee e
join department d on e.department_id = d.department_id
where d.name = 'Sales'




--q8
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.Name AS Department_Name, l.City AS Location
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.Department_Id
JOIN LOCATION l
ON d.Location_Id = l.Location_ID
WHERE d.Name IN ('Sales', 'Operations')
ORDER BY e.LAST_NAME ASC

--q7
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, l.City AS Location ,d.department_id
FROM EMPLOYEE e
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id
where l.city  = 'Dallas'
order by e.last_name

--q6
SELECT d.Name AS Department_Name, COUNT(e.EMPLOYEE_ID) AS Employee_Count
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.Name
HAVING COUNT(e.EMPLOYEE_ID) >= 3
ORDER BY d.Name ASC;

--conditional statements
1. Display the employee details with salary grades. Use conditional statement to
create a grade column.
2. List out the number of employees grade wise. Use conditional statement to
create a grade column.
3. Display the employee salary grades and the number of employees between
2000 to 5000 range of salary.

select  *, 
case 
when salary > 2000 then 'grade a'
when salary > 1000 then 'grade b'
when salary <1000 then ' grade c'
else 'no comments'
end as salary_grade
from employee
go

select *from employee

SELECT Salary_Grade, COUNT(*) AS Employee_Count
FROM (
SELECT  
CASE 
WHEN SALARY > 2000 THEN 'Grade A'
WHEN SALARY > 1000 THEN 'Grade B'
WHEN SALARY < 1000 THEN 'Grade C'
ELSE 'No Comments'
END AS Salary_Grade
FROM EMPLOYEE
) AS Grade_Subquery
GROUP BY Salary_Grade
ORDER BY Salary_Grade ASC

-- Display the employee salary grades and the number of employees between
2000 to 5000 range of salary.


SELECT Salary_Grade, COUNT(*) AS Employee_Count
FROM (
SELECT  
CASE 
WHEN SALARY > 2000 THEN 'Grade A'
WHEN SALARY > 1000 THEN 'Grade B'
WHEN SALARY < 1000 THEN 'Grade C'
ELSE 'No Comments'
END AS Salary_Grade
FROM EMPLOYEE
where salary between 2000 and 5000
) AS Grade_Subquery
GROUP BY Salary_Grade
ORDER BY Salary_Grade ASC

--subqueries
1. Display the employees list who got the maximum salary.
select * from employee where salary = (select max(salary) from employee) 
2. Display the employees who are working in the sales department.
select e.employee_id , e.first_name  ,d.department_id ,d.name as depart_name
from employee e
join department d
on e.department_id = d.department_id
where d.name = 'sales'

3. Display the employees who are working as 'Clerk'.
select e.employee_id , e.first_name , e.job_id,j.designation
from employee e
join job69 j
on e.job_id = j.job_id
where j.designation = 'clerk'

4. Display the list of employees 
who are living in 'Boston'.
select e.employee_id , e.first_name , e.department_id,l.location_id,
l.city from employee e
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id
where l.city = 'boston'

5. Find out the number 
of employees working in the
sales department.
SELECT COUNT(e.employee_id) AS Employee_Count
FROM employee e
JOIN department d
ON e.department_id = d.department_id
WHERE d.name = 'Sales'

6. Update the salaries of employees
who are working as clerks on the basis of
10%.
UPDATE employee
SET salary = salary * 1.10
WHERE job_id = (
    SELECT job_id
    FROM job69
    WHERE designation = 'CLERK'
);


7. Display the second highest 
salary drawing employee details
WITH RankedSalaries AS (
    SELECT employee_id, first_name, last_name, salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM employee
)
SELECT employee_id, first_name, last_name, salary
FROM RankedSalaries
WHERE rank = 2;

8. List out the employees who earn more than every employee in department 30.
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (
    SELECT MAX(SALARY)
    FROM EMPLOYEE
    WHERE DEPARTMENT_ID = 30
);
9. Find out which department has no employees.
SELECT D.Department_Id, D.Name
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Department_Id = E.Department_ID
WHERE E.Employee_ID IS NULL

10. Find out the employees who earn greater than the average salary for
their department
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEE E
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEE
    WHERE DEPARTMENT_ID = E.DEPARTMENT_ID
)
