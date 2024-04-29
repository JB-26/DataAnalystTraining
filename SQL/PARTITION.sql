/*
Partiton By - divides results into partions
*/

SELECT dem.firstname, dem.lastname, dem.gender, sal.salary, COUNT(dem.gender) OVER (PARTITION BY dem.gender) as TotalGender
FROM employeedemographics dem
JOIN employeesalary sal
ON dem.employeeid = sal.employeeid;


SELECT dem.gender, COUNT(dem.gender)
FROM employeedemographics dem
JOIN employeesalary sal ON dem.employeeid = sal.employeeid
GROUP BY dem.gender;
