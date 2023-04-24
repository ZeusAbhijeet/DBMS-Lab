# Q1
CREATE TABLE Worker (
    WorkerID INTEGER PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(25),
    LName VARCHAR(25),
    Salary INTEGER,
    JoiningDate DATETIME,
    Department VARCHAR(20)
);
#Q2
CREATE TABLE Bonus (
    WorkerRefID INTEGER,
    BonusAmount INTEGER,
    BonusDate DATETIME,
    FOREIGN KEY (WorkerRefID) REFERENCES Worker(WorkerID)
                   ON DELETE CASCADE
);
#Q3
CREATE TABLE Title (
    WorkerRefID INTEGER,
    WorkerTitle VARCHAR(25),
    FOREIGN KEY (WorkerRefID) REFERENCES Worker(WorkerID)
                   ON DELETE CASCADE
);

INSERT INTO Worker (FName, LName, Salary, JoiningDate, Department) VALUES
    ('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    ('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    ('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    ('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    ('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    ('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    ('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    ('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
INSERT INTO Bonus VALUES
    (1, 5000, '2016-02-20 00:00:00'),
    (2, 3000, '2016-06-11 00:00:00'),
    (3, 4000, '2016-02-20 00:00:00'),
    (1, 4500, '2016-02-20 00:00:00'),
    (2, 3500, '2016-06-11 00:00:00');
INSERT INTO Title VALUES
    (1, 'Manager'),
    (2, 'Executive'),
    (8, 'Executive'),
    (5, 'Manager'),
    (4, 'Asst. Manager'),
    (7, 'Executive'),
    (6, 'Lead'),
    (3, 'Lead');

#Q4
SELECT w.WorkerID, w.FName, w.LName
FROM Worker w
JOIN Bonus B
ON w.WorkerID = B.WorkerRefID
UNION
SELECT w.WorkerID, w.FName, w.LName
FROM Worker w
JOIN Bonus B
ON w.WorkerID = B.WorkerRefID;

#Q5
SELECT w.WorkerID, w.FName, w.LName, w.Salary, w.JoiningDate, w.Department, t.WorkerTitle
FROM Worker w
JOIN Title t
ON w.WorkerID = t.WorkerRefID
WHERE t.WorkerTitle = 'Executive'
UNION
SELECT w.WorkerID, w.FName, w.LName, w.Salary, w.JoiningDate, w.Department, t.WorkerTitle
FROM Worker w
JOIN Title t
ON w.WorkerID = t.WorkerRefID
WHERE w.LName LIKE 'S%';

#Q6
SELECT WorkerID, FName, LName, Salary, JoiningDate, Department, WorkerTitle
FROM Worker
JOIN Title
ON Worker.WorkerID = Title.WorkerRefID
WHERE WorkerTitle = 'Manager'
UNION ALL
SELECT WorkerID, FName, LName, Salary, JoiningDate, Department, WorkerTitle
FROM Worker
JOIN Title
ON Worker.WorkerID = Title.WorkerRefID
WHERE Worker.Department = 'Admin';

#Q7
SELECT WorkerID, FName, LName, Salary, JoiningDate, Department, WorkerTitle
FROM Worker
JOIN Title
ON Worker.WorkerID = Title.WorkerRefID
WHERE Worker.Salary > 100000
INTERSECT
SELECT WorkerID, FName, LName, Salary, JoiningDate, Department, WorkerTitle
FROM Worker
JOIN Title
ON Worker.WorkerID = Title.WorkerRefID
WHERE Title.WorkerTitle = 'Lead';

SELECT w.WorkerID, w.FName, w.LName, w.Salary, w.JoiningDate, w.Department
FROM Worker w
EXCEPT
SELECT w.WorkerID, w.FName, w.LName, w.Salary, w.JoiningDate, w.Department
FROM Worker w
JOIN Bonus
on w.WorkerID = Bonus.WorkerRefID;
