-- Table 1
CREATE TABLE SQLTutorial.dbo.EmployeeDemographics
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NULL,
    Age INT NOT NULL,
    Gender VARCHAR (50) NOT NULL
);

-- Table 2
CREATE TABLE SQLTutorial.dbo.EmployeeSalary
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    JobTitle VARCHAR (50),
    Salary INT,
    FOREIGN KEY (EmployeeID) REFERENCES SQLTutorial.dbo.EmployeeDemographics(EmployeeID)
);