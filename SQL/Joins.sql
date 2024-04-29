/*
Inner Joins, full/left/right outer joins
*/

-- inner join shows everything that is common / overlapping between the tables
SELECT employeedemographics.employeeid, employeedemographics.firstname, employeedemographics.lastname, employeesalary.jobtitle, employeesalary.salary
FROM employeedemographics
INNER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- shows everything from both tables, regardless if there isn't a match
SELECT *
FROM employeedemographics
FULL OUTER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;

-- takes everything from the left table, and everything that's overlapping, but if it's in the right table we don't want it
SELECT employeedemographics.employeeid, employeedemographics.firstname, employeedemographics.lastname, employeesalary.jobtitle, employeesalary.salary
FROM employeedemographics
LEFT OUTER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;


-- the exact opposite
SELECT employeesalary.employeeid, employeedemographics.firstname, employeedemographics.lastname, employeesalary.jobtitle, employeesalary.salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid;


-- examples
SELECT employeedemographics.employeeid, employeedemographics.firstname, employeedemographics.lastname, employeesalary.salary
FROM employeedemographics
INNER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
WHERE employeedemographics.firstname <> 'Michael'
ORDER BY employeesalary.salary desc;

SELECT employeesalary.jobtitle, AVG(employeesalary.salary)
FROM employeedemographics
INNER JOIN employeesalary ON employeedemographics.employeeid = employeesalary.employeeid
WHERE employeesalary.jobtitle = 'Salesman'
GROUP BY employeesalary.jobtitle;