-- To fetch all rows (to get an overview of data)
SELECT 
    TOP 5 * 
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To fetch particular column
SELECT
    FirstName, 
    LastName
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get Employee IDs that have a valid last name
SELECT
    EmployeeID
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE LastName is not NULL AND RTRIM(LTRIM(LastName)) <> '';

-- To get distinct results
SELECT
    DISTINCT FirstName
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get count of values
SELECT
    COUNT(Distinct Gender) as 'Number of Genders'
FROM SQLTutorial.dbo.EmployeeDemographics;

-- To get avg, max, min salary for each job title with min salary more than 40k
SELECT
    JobTitle,
    max(Salary) as 'Max Salary',
    avg(Salary) as 'Avg Salary',
    min(Salary) as 'Min Salary'
FROM SQLTutorial.dbo.EmployeeSalary
WHERE Salary IS NOT NULL
GROUP BY JobTitle
HAVING min(Salary) > 40000;

-- To get avg, max, min salary for each age more than 30
SELECT 
    d.age, 
    max(s.Salary) as 'Max Salary',
    avg(s.Salary) as 'Avg Salary',
    min(s.Salary) as 'Min Salary'
FROM
SQLTutorial.dbo.EmployeeDemographics as d INNER JOIN 
SQLTutorial.dbo.EmployeeSalary as s ON
d.employeeid = s.employeeid
WHERE d.Age > 30
GROUP BY d.Age

-- To get avg, max, min salary for each gender
SELECT 
    d.Gender, 
    max(s.Salary) as 'Max Salary', 
    avg(s.Salary) as 'Avg Salary', 
    min(s.Salary) as 'Min Salary', 
    max(s.Salary) - min(s.Salary) as [Range]
FROM
SQLTutorial.dbo.EmployeeDemographics as d inner join 
SQLTutorial.dbo.EmployeeSalary as s ON
d.employeeid = s.employeeid
GROUP BY d.Gender
ORDER BY max(s.Salary) - min(s.Salary) DESC;

-- To cluster age into some brackets
with clustered_data as (
SELECT
    d.*,
    s.salary,
    CASE 
        WHEN age <= 30 THEN 'Young'
        WHEN age > 30 and age <= 35 THEN 'Mid'
        WHEN age > 35 THEN 'Old'
    END as 'Age Bracket'
FROM SQLTutorial.dbo.EmployeeDemographics d
LEFT JOIN SQLTutorial.dbo.EmployeeSalary s
ON d.EmployeeID = s.EmployeeID)
SELECT 
    [Age Bracket],
    max(Salary) as 'Max Salary', 
    avg(Salary) as 'Avg Salary', 
    min(Salary) as 'Min Salary'
FROM clustered_data
GROUP BY [Age Bracket];

-- Using window function to calculate the running sum of salary
SELECT
    d.EmployeeID,
    d.FirstName,
    d.Age,
    d.Gender,
    s.Salary,
    sum(s.Salary) OVER (
        PARTITION BY d.Gender
        ORDER BY d.employeeid
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as [Running Total]
FROM SQLTutorial.dbo.EmployeeDemographics d
LEFT JOIN SQLTutorial.dbo.EmployeeSalary s
ON d.EmployeeID = s.EmployeeID