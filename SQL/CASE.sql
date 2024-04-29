/*
CASE statement - specify conditions and what to be returned when condition is met
*/

SELECT firstname, lastname, age,
CASE
    WHEN age > 30 THEN 'Old'
    WHEN age BETWEEN 27 AND 30 THEN 'Young'
    ELSE 'Baby'
END AS age_group
FROM employeedemographics
WHERE age IS NOT NULL
ORDER BY age;


SELECT ed.firstname, ed.lastname, es.jobtitle, es.salary,
CASE
    WHEN es.jobtitle = 'Salesman' THEN es.salary + (es.salary * .10)
    WHEN es.jobtitle = 'Accountant' THEN es.salary + (es.salary * .05)
    WHEN es.jobtitle = 'HR' THEN es.salary + (es.salary * .000001)
    ELSE es.salary + (es.salary * .03)
END AS new_salary
FROM employeedemographics ed
JOIN employeesalary es
ON ed.employeeid = es.employeeid;