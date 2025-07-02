-- To fetch all rows (to get an overview of data)
SELECT 
TOP 5 * 
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To fetch particular column
SELECT
FirstName, LastName
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get distinct results
SELECT
DISTINCT Gender
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get count of values
SELECT
COUNT(Distinct Gender) as 'Number of Genders'
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get avg, max, min salary for each job title except HR
SELECT
    JobTitle,
    max(Salary) as 'Max Salary',
    avg(Salary) as 'Avg Salary',
    min(Salary) as 'Min Salary'
FROM SQLTutorial.dbo.EmployeeSalary
WHERE JobTitle <> 'HR'
group by JobTitle;

-- To get avg, max, min salary for each age
SELECT 
    d.age, 
    max(s.Salary) as 'Max Salary',
    avg(s.Salary) as 'Avg Salary',
    min(s.Salary) as 'Min Salary'
from
SQLTutorial.dbo.EmployeeDemographics as d inner join 
SQLTutorial.dbo.EmployeeSalary as s ON
d.employeeid = s.employeeid
GROUP BY d.Age

-- To get avg, max, min salary for a certain range
SELECT 
    d.age, 
    max(s.Salary) as 'Max Salary', 
    avg(s.Salary) as 'Avg Salary', 
    min(s.Salary) as 'Min Salary', 
    max(s.Salary) - min(s.Salary) as [Range]
from
SQLTutorial.dbo.EmployeeDemographics as d inner join 
SQLTutorial.dbo.EmployeeSalary as s ON
d.employeeid = s.employeeid
GROUP BY d.Age
HAVING max(s.Salary) - min(s.Salary) > 0;