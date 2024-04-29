/*
HAVING statement
*/

SELECT es.jobtitle, COUNT(es.jobtitle)
FROM employeedemographics ed
JOIN employeesalary es ON ed.employeeid = es.employeeid
GROUP BY es.jobtitle
HAVING COUNT(es.jobtitle) > 1;
-- HAVING must be after GROUP BY
-- you can't look at the aggregated information before it's aggregated in the GROUP BY


SELECT es.jobtitle, AVG(es.salary)
FROM employeedemographics ed
JOIN employeesalary es ON ed.employeeid = es.employeeid
GROUP BY es.jobtitle
HAVING AVG(es.salary) > 45000
ORDER BY AVG(es.salary)