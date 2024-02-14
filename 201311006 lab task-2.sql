--Ahmed Mostakim Fahim
--ID: 201311006

create database ADBMS_LAB2;
use ADBMS_LAB2;

-- Create the Tbl_Teacher table
CREATE TABLE Tbl_Teacher (
    TID varchar(7) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    DeptID INT,
    Salary DECIMAL(10, 2)
);
-- Insert values into Tbl_Teacher
INSERT INTO Tbl_Teacher (TID, FirstName, LastName, Age, DeptID, Salary)
VALUES
    ('T-0101', 'Sayeed', 'Chowdhury', 25, 1, 25000),
    ('T-0103', 'Faruk', 'Alam', 35, 1, 33000),
    ('T-0105', 'Hamin', 'Ahmed', 32, 2, 30000),
    ('T-0106', 'Imran', 'Ali', 31, 2, 32000),
    ('T-0111', 'Saiful', 'Alam', 32, 1, 40000),
    ('T-0210', 'Imtiaz', 'Ahmed', 35, 3, 35000),
    ('T-0222', 'Tapan', 'Chowdhury', 25, 1, 25000),
    ('T-0224', 'Faruk', 'Khan', 30, 4, 35000),
    ('T-0300', 'Asif', 'Akbar', 30, 1, 35000);


-- Create the Tbl_Dept table
CREATE TABLE Tbl_Dept (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert values into Tbl_Dept
INSERT INTO Tbl_Dept (DeptID, DeptName, Location)
VALUES
    (1, 'CSE', 'Talaimari'),
    (2, 'EEE', 'Talaimari'),
    (3, 'English', 'Kazla'),
    (4, 'BBA', 'Vodra');


-- Create the Tbl_Course table
CREATE TABLE Tbl_Course (
    Course_Code varchar(8) PRIMARY KEY,
    Course_Title VARCHAR(50),
    Credit INT,
    TID CHAR(7)
);

-- Insert values into Tbl_Course
INSERT INTO Tbl_Course (Course_Code, Course_Title, Credit, TID)
VALUES
    ('ACC-311', 'Accounting', 3, 'T-0224'),
    ('CSE-121', 'Electrical Circuits', 3, 'T-0105'),
    ('CSE-123', 'Structured Programming Language', 4, 'T-0103'),
    ('CSE-211', 'Data Structure', 4, 'T-0300'),
    ('CSE-231', 'Digital Logic Design', 3, 'T-0111'),
    ('CSE-311', 'Numerical Methods', 2, 'T-0111'),
    ('CSE-313', 'Database Management System', 4, 'T-0101'),
    ('CSE-333', 'Microprocessor', 3, 'T-0222'),
    ('CSE-421', 'Computer Graphics', 3, 'T-0103'),
    ('ENG-111', 'English Fundamentals', 3, 'T-0210');

select * from Tbl_Teacher;
select * from Tbl_Dept;
select * from Tbl_Course

-- Write a query to display the total information of the teachers who are in the EEE department.

select * from Tbl_Teacher inner join Tbl_Dept
on Tbl_Teacher.DeptID = Tbl_Dept.DeptID where Tbl_Dept.DeptName ='EEE';

--Write a query to find the total number of teachers for each department in descending order.select DeptName as Departmentname, count(TID) as Total_Teacher from Tbl_Teacher inner join Tbl_Depton Tbl_Teacher.DeptID = Tbl_Dept.DeptID group by DeptName order by Total_Teacher desc;-- Write a query to find the name of the teacher who teaches more than one course.select FirstName, LastName from Tbl_Teacher join Tbl_Course on Tbl_Teacher.TID = Tbl_Course.TIDgroup by Tbl_Teacher.TID, Tbl_Teacher.FirstName, Tbl_Teacher.LastName having count(Tbl_Course.Course_Code)>1;-- Write a query to find the first name, and salary for all the teachers of CSE who have a higher 
--salary than Faruk Alam.select FirstName, Salary from Tbl_Teacher inner join Tbl_Dept on Tbl_Teacher.DeptID = Tbl_Dept.DeptIDwhere Tbl_Dept.DeptName='CSE' and Tbl_Teacher.Salary>(select Salary from Tbl_Teacher where TID ='T-0103');-- Write a query to find the minimum salary of a Teacher for each department where the salary is 
--less than the average salary.SELECT D.DeptName AS Department, MIN(T.Salary) AS MinimumSalary FROM Tbl_Teacher T JOIN Tbl_Dept D ON T.DeptID = D.DeptID
GROUP BY D.DeptName

HAVING MIN(T.Salary) < (
    SELECT AVG(Salary)
    FROM Tbl_Teacher
);
--Write a query to find the top 2 departments with the highest total salaries of teachers. Display 
--the department name and total salary in descending order.SELECT TOP 2 D.DeptName AS DepartmentName, SUM(T.Salary) AS TotalSalary
FROM Tbl_Teacher T
JOIN Tbl_Dept D ON T.DeptID = D.DeptID
GROUP BY D.DeptName
ORDER BY TotalSalary DESC;

-- Write a query to find the teachers who do not teach any course.
SELECT T.FirstName, T.LastName
FROM Tbl_Teacher T
LEFT JOIN Tbl_Course C ON T.TID = C.TID
WHERE C.Course_Code IS NULL;

--Update the Salary of the Teacher by 15% whose DeptName is ‘CSE’, otherwise update by 10% 
--Salary.

UPDATE Tbl_Teacher
SET Salary = CASE
    WHEN DeptID = (SELECT DeptID FROM Tbl_Dept WHERE DeptName = 'CSE') THEN Salary * 1.15
    ELSE Salary * 1.10
    END
WHERE DeptID = (SELECT DeptID FROM Tbl_Dept WHERE DeptName = 'CSE');

select* from Tbl_Teacher;

