-- Table 1
INSERT INTO SQLTutorial.dbo.EmployeeDemographics (EmployeeID ,FirstName, LastName, Age, Gender)
VALUES (1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Halpert', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, ' Stanley ', '', 38, 'Male'),
(1009, 'Kevin', NULL, 31, 'Male'),
(1010, 'KeviN', 'Heart', 40, 'Male');

-- Table 2 (second method of inserting without mentioning the columns)
INSERT INTO SQLTutorial.dbo.EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', NULL)