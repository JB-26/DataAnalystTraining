/*
Temp Tables
Uses a hash / pound sign
In postgres use TEMPORARY statement
*/

CREATE TEMPORARY TABLE temp_employee (
    employeeId INT,
    jobTitle VARCHAR(50),
    salary INT
);

SELECT *
from temp_employee

INSERT INTO temp_employee VALUES (
    1001, 'hr', 45000
)

-- good example!
INSERT INTO temp_employee
SELECT *
FROM employeesalary

-- another good example!
CREATE TEMPORARY TABLE temp_employee2 (
    jobTitle VARCHAR(50),
    EmployeesPerJob int,
    AvgAge int,
    AvgSalary int
);

INSERT INTO temp_employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM employeedemographics dem
JOIN employeesalary sal ON dem.employeeid = sal.employeeid
GROUP BY JobTitle

SELECT *
FROM temp_employee2;