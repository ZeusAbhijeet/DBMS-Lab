CREATE TABLE Employee (
  EmpID VARCHAR(4) PRIMARY KEY,
  EmpName VARCHAR(15),
  EmpDept VARCHAR(25),
  Salary INTEGER,
  DOI DATE,
  Branch VARCHAR(20),
  EmpAge INTEGER
);
INSERT INTO Employee VALUES
	('E101', 'Amit', 'Production', 45000, '2000-03-13', 'Bangalore', 28),
    ('E102', 'Amit', 'Production', 70000, '2002-01-03', 'Mumbai', 25),
    ('E103', 'Sunita', 'HR', 120000, '2001-01-11', 'Bangalore', 26),
    ('E104', 'Sunita', 'Management', 67000, '2001-08-01', 'Pune', 27),
    ('E105', 'Mahesh', 'IT', 145000, '2003-09-02', 'Bangalore', 27),
    ('E106', 'Suriya', 'Civil', 77000, '2003-09-02', 'Mumbai', 25)
;

SELECT Branch, COUNT(Branch) AS NumberOfEmployees
FROM Employee
GROUP BY Branch;
SELECT MAX(Salary) AS MaxSalary FROM Employee;
SELECT MIN(Salary) AS MinSalary FROM Employee;
SELECT SUM(Salary) AS TotalSalary FROM Employee;
SELECT Branch, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY Branch;
SELECT Branch, MIN(Salary) AS MinSalary
FROM Employee
GROUP BY Branch;
SELECT Branch, COUNT(Branch) AS NumberOfEmployees
FROM Employee
GROUP BY Branch
HAVING NumberOfEmployees > 1;
SELECT Branch, AVG(EmpAge) AS AverageAge
FROM Employee
GROUP BY Branch;
INSERT INTO Employee VALUES ('E107', 'Jatin', 'Production', 45000, '2000-03-13', 'Bangalore', 27);
SELECT Branch, EmpDept, COUNT(EmpDept) AS NumberOfEmployees
FROM Employee
GROUP BY Branch, EmpDept
ORDER BY NumberOfEmployees;