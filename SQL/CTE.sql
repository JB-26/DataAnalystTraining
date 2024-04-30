/*
CTE (Common Table Expression)
acts like a subquery
The CTE isn't saved, so this needs to be run each time
SELECT statement needs to be written directly after the CTE
*/

WITH CTE_Employee as (
    SELECT dem.firstname, dem.lastname, dem.gender, sal.salary, COUNT(dem.gender) OVER (PARTITION BY dem.gender) AS TotalGender, AVG(sal.salary) OVER (PARTITION BY dem.gender) AS AvgSalary
    FROM employeedemographics dem
    JOIN employeesalary sal
    ON dem.employeeid = sal.employeeid
    WHERE salary > '45000'
)

SELECT firstname, avgsalary
FROM CTE_Employee;