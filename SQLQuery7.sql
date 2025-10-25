------------------ FirstQuery

Select A.*, B.Name as ManagerName from 
Employees A Join Employees B 
ON  A.ManagerID = B.EmployeeID

-- Get all employees that have manager along with Manager's name.
-- this will select all data from employees that are managed by someone along with their manager name, 
-- employees that have no manager will not be selected because we used inner join 
-- Note we used inner join on the same table with diffrent alliace.

SELECT        Employees.Name, Employees.ManagerID, Employees.Salary, Managers.Name AS ManagerName
FROM            Employees INNER JOIN
                         Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID



--------------------------------------2nd Query
SELECT        Employees.*, Mananger.Name AS ManagerName
FROM            Employees Left JOIN
                         Employees AS Mananger ON Employees.ManagerID = Mananger.EmployeeID



-- Get all employees that have manager or does not have manager along with Manager's name, incase no manager name show null
-- this will select all data from employees regardless if they have manager or not, note here we used left outer join 
SELECT        Employees.Name, Employees.ManagerID, Employees.Salary, Managers.Name AS ManagerName
FROM            Employees Left JOIN
                         Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID


----------------------------------3rd Query
SELECT        Employees.*, 
ManagerName = 
Case 
when Employees.ManagerID  is null then Employees.Name
else Mananger.Name
end
FROM            Employees Left JOIN
                         Employees AS Mananger ON Employees.ManagerID = Mananger.EmployeeID

						 
-- Get all employees that have manager or does not have manager along with Manager's name, incase no manager name the same employee name as manager to himself
-- this will select all data from employees regardless if they have manager or not, note here we used left outer join 
SELECT        Employees.Name, Employees.ManagerID, Employees.Salary,  
  CASE
    WHEN Managers.Name is Null  THEN Employees.Name
    ELSE Managers.Name
END as ManagerName
FROM            Employees Left JOIN
                         Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID


---------------------------4th Query
Select * from
(
SELECT        Employees.Name, Employees.ManagerID, Employees.Salary,  
  CASE
    WHEN Managers.Name is Null  THEN Employees.Name
    ELSE Managers.Name
END as ManagerName
FROM            Employees Left JOIN
                         Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID) as R1
Where ManagerName = 'Mohammed'

-- Get All Employees managed by 'Mohammed'

SELECT        Employees.Name, Employees.ManagerID, Employees.Salary, Managers.Name AS ManagerName
FROM            Employees INNER JOIN
                         Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID
where Managers.Name='Mohammed'


