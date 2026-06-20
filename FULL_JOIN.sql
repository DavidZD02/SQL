SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    Ev.Score,
    Ev.Comments
FROM Employees E
FULL JOIN Evaluations Ev
ON E.EmployeeID = Ev.EmployeeID