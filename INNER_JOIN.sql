SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D 
    ON E.DepartmentID = D.DepartmentID;