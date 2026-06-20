SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    P.ProjectName
FROM Employees E
LEFT JOIN Projects P
    ON P.LeaderEmployeeID = E.EmployeeID;