CREATE DATABASE test;
CREATE TABLE Employee
(
    EmpID VARCHAR(4) PRIMARY KEY,
    EmpName VARCHAR(30),
    EmpDept VARCHAR(30),
    EmpSalary INTEGER,
    Branch VARCHAR(25)
);
INSERT INTO Employee
VALUES
    ('E101', 'Amit', 'Production', 45000, 'Bangalore'),
    ('E102', 'Amit', 'HR', 70000, 'Mysore'),
    ('E103', 'Sunita', 'Management', 120000, 'Bangalore'),
    ('E104', 'Sunita', 'IT', 67000, 'Mumbai'),
    ('E105', 'Mahesh', 'Civil', 145000, 'Mysore'),
    ('E106', 'Supriya', NULL, 35000, 'Mumbai');
SELECT * FROM Employee;
SELECT EmpID, EmpSalary FROM Employee;
SELECT DISTINCT EmpName FROM Employee;
SELECT EmpName FROM Employee WHERE Branch = 'Mumbai';
SELECT EmpName, EmpDept, EmpSalary FROM Employee WHERE EmpID NOT IN ('E104');
SELECT * FROM Employee WHERE EmpSalary > 40000;
SELECT * FROM Employee ORDER BY EmpSalary DESC;
SELECT * FROM Employee ORDER BY EmpSalary DESC LIMIT 2;
SELECT * FROM Employee WHERE EmpName LIKE '%i%';
SELECT * FROM Employee WHERE Branch LIKE 'M%';
SELECT * FROM Employee WHERE Branch IN ('Bangalore', 'Mysore');
SELECT * FROM Employee WHERE Branch = 'Bangalore' OR Branch = 'Mysore';
SELECT * FROM Employee WHERE EmpSalary BETWEEN 30000 AND 100000 ORDER BY EmpName;
SELECT * FROM Employee WHERE EmpDept NOT IN ('HR') AND EmpSalary BETWEEN 30000 AND 100000;