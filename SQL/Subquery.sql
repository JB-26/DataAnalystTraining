/*
Subqueries
A query within a query
Can be used almost anywhere
*/

-- subquery in select
SELECT employeeid, salary, (SELECT AVG(salary) FROM employeesalary) AS AllAvgSalary
FROM employeesalary;

-- partition by - same result as above
SELECT employeeid, salary, AVG(Salary) over () as AllAvgSalary
FROM employeesalary;

-- group by doesn't work - can't get the all average salary
SELECT employeeid, salary, AVG(Salary) as AllAvgSalary
FROM employeesalary
GROUP BY employeeid, salary
ORDER BY 1,2;

-- subquery in From
-- it'll run the subquery to create the table, like a temp table or a CTE, then we can query off the table
SELECT a.employeeid, AllAvgSalary
FROM (SELECT employeeid, salary, AVG(Salary) over () AS AllAvgSalary FROM employeesalary) a;

-- subquery in where
SELECT employeeid, jobtitle, salary
FROM employeesalary
WHERE employeeid IN (
    SELECT employeeid
    FROM employeedemographics
    WHERE age > 30
);