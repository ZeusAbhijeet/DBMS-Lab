CREATE TABLE Employee (
    EmpID INTEGER PRIMARY KEY AUTO_INCREMENT,
    EmpFName VARCHAR(30),
    EmpLName VARCHAR(30),
    EmpAge INTEGER,
    EmpEmail VARCHAR(50),
    EmpAddress VARCHAR(25)
);
CREATE TABLE Project (
    ProjID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProjName VARCHAR(50),
    E_ID INTEGER
);
INSERT INTO Employee (EmpFName, EmpLName, EmpAge, EmpEmail, EmpAddress) VALUES
    ('Vardhan', 'Kumar', 22, 'vardhan@gmail.com', 'Delhi'),
    ('Himani', 'Sharma', 32, 'himani@yahoo.com', 'Mumbai'),
    ('Ayushi', 'Shreshth', 24, 'ayushi@4chan.org', 'Kolkata'),
    ('Hemant', 'Sharma', 25, 'hemant@twitter.com', 'Bangalore'),
    ('Swati', 'Kapoor', 32, 'swati@roblox.com', 'Hyderabad');
INSERT INTO Project (ProjName, E_ID) VALUES
    ('Task Track', 1),
    ('CLP', 2),
    ('Survey Management', 3),
    ('HR Management', 3),
    ('Task Track', 5),
    ('GRS', 9),
    ('DDS', 7),
    ('GL Management', 8);

SELECT * FROM Employee E
INNER JOIN
    Project P
ON E.EmpID = P.E_ID;

SELECT * FROM Employee E
LEFT JOIN
    Project P
ON E.EmpID = P.E_ID;

SELECT * FROM Employee E
RIGHT JOIN
    Project P
ON E.EmpID = P.E_ID;

SELECT *
FROM Employee E1
LEFT JOIN Project P1
ON P1.E_ID = E1.EmpID
UNION
SELECT * FROM Employee E2
RIGHT JOIN Project P2
ON P2.E_ID = E2.EmpID;

SELECT e.EmpID, e.EmpFName
FROM Employee e
LEFT JOIN Project p
    ON e.EmpID = p.E_ID
WHERE p.E_ID IS NULL;

SELECT e.EmpID, e.EmpFName, e.EmpAddress, COUNT(p.E_ID) AS Proj_Count
FROM Employee e
INNER JOIN Project p
ON e.EmpID = p.E_ID
GROUP BY e.EmpID
HAVING Proj_Count > 1;

SELECT e.EmpFName, p.ProjName
FROM Employee e
INNER JOIN Project p
ON p.E_ID = e.EmpID;

SELECT p.ProjName, IFNULL(e.EmpID, 'No Employee Assigned') AS Assigned
FROM Project p
LEFT JOIN Employee e
ON p.E_ID = e.EmpID
WHERE e.EmpID IS NULL;

