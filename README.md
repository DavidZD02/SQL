# Práctica de JOINs y Subconsultas en SQL

Este repositorio contiene ejercicios prácticos de SQL Server (T-SQL) sobre los 
distintos tipos de JOIN y el uso de subconsultas, usando una base de datos de 
ejemplo con empleados, departamentos, proyectos y evaluaciones.

## Estructura

- `schema.sql` — Script de creación de tablas y carga de datos de prueba.
- `INNER_JOIN.sql` — Empleados con el nombre de su departamento.
- `LEFT_JOIN.sql` — Todos los empleados y los proyectos que lideran (NULL si no lideran ninguno).
- `RIGHT_JOIN.sql` — Todos los proyectos y sus líderes, incluyendo proyectos sin líder.
- `FULL_JOIN.sql` — Todos los empleados y todas las evaluaciones, con o sin coincidencia.
- `SUBCONSULTA.sql` — Empleados que trabajan en departamentos con más de 10 empleados 
  (resuelto con subconsulta y también con JOIN equivalente, ver comparación abajo).

## Cómo ejecutar

1. Ejecutar `schema.sql` en SQL Server Management Studio o Azure Data Studio para 
   crear la base `PracticeJoinSubqueries`.
2. Ejecutar cada archivo de consulta sobre esa base.

## Comparación: Subconsulta vs JOIN

Para el ejercicio de "empleados en departamentos con más de 10 empleados", 
existen dos enfoques válidos:

**Con subconsulta (IN + HAVING):**
\`\`\`sql
SELECT EmployeeID, FirstName, LastName, DepartmentID
FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID FROM Employees
    GROUP BY DepartmentID HAVING COUNT(*) > 10
);
\`\`\`

**Con JOIN equivalente:**
\`\`\`sql
SELECT E.EmployeeID, E.FirstName, E.LastName, E.DepartmentID
FROM Employees E
INNER JOIN (
    SELECT DepartmentID FROM Employees
    GROUP BY DepartmentID HAVING COUNT(*) > 10
) grandes ON E.DepartmentID = grandes.DepartmentID;
\`\`\`

**¿Cuál prefiero y por qué:** la subconsulta con `IN` es más legible para este caso, 
porque el propósito es claramente "filtrar empleados según una condición sobre 
departamentos", mientras que el JOIN equivalente es útil si además se necesitaran 
columnas del subconjunto agregado (por ejemplo, mostrar también el conteo de 
empleados por departamento). En términos de rendimiento, SQL Server suele optimizar 
ambos de forma similar, así que la elección aquí es principalmente de legibilidad.
