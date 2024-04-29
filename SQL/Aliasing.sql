/*
Aliasing - useful for readability
*/

SELECT firstname AS FName
FROM employeedemographics;

-- OR

SELECT firstname FName
FROM employeedemographics;

-- concatenation
SELECT firstname || ' ' || lastname AS FullName
FROM employeedemographics;

SELECT AVG(age) AS AvgAge
from employeedemographics;

SELECT ed.employeeid, es.salary
FROM employeedemographics AS ed
JOIN employeesalary AS es
ON ed.employeeid = es.employeeid;

SELECT Demo.employeeid, Demo.firstname, Demo.lastname
FROM employeedemographics Demo
LEFT JOIN employeesalary Sal
ON Demo.employeeid = Sal.employeeid
LEFT JOIN warehouseemployeedemographics Ware
ON Demo.employeeid = Ware.employeeid;