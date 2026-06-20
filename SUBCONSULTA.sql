SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    DepartmentID
FROM Employees E
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 10
)