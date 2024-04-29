/*
Unions - combines two tables for one output, removes duplicates (unless you use UNION ALL)
*/

SELECT *
from employeedemographics
UNION
SELECT *
FROM warehouseemployeedemographics;

SELECT *
from employeedemographics
UNION ALL
SELECT *
FROM warehouseemployeedemographics
ORDER BY employeeid;

-- same amount of columns, but the results will be weird! Make sure the data is the same!
SELECT employeeid, firstname, age
FROM employeedemographics
UNION
SELECT employeeid, jobtitle, salary
FROM employeesalary
ORDER BY employeeid;