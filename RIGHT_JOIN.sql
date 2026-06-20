SELECT 
    P.ProjectName,
    E.FirstName,
    E.LastName
FROM Employees E
RIGHT JOIN Projects P
    ON P.LeaderEmployeeID = E.EmployeeID;