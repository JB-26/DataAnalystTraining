/*
Stored Procedures
a group of statements that have been created and then stored in the database. It can accept input parameters.
A stored procedure can be used by users
*/

/*
Stored Procedures vs. Functions: In PostgreSQL, stored procedures (PROCEDURE) are designed for performing actions and don't inherently return data. Functions (FUNCTION), on the other hand, are meant to return a result.
*/

CREATE OR REPLACE PROCEDURE TEST()
LANGUAGE SQL
AS $$
SELECT * FROM employeedemographics;
$$;

-- doesn't return anything
CALL TEST();

-- this one works
CREATE OR REPLACE PROCEDURE AddEmployee(Id int, fname VARCHAR(50), lname VARCHAR(50), age int, gender VARCHAR(50))
LANGUAGE SQL
AS $$
INSERT INTO employeedemographics VALUES (Id, fname, lname, age, gender)
$$;

CALL AddEmployee(5000, 'Joshua', 'Blewitt', 31, 'Male');

SELECT *
FROM employeedemographics


/* Function example */
CREATE OR REPLACE FUNCTION get_all_employees()
RETURNS TABLE(id INT, firstname VARCHAR, lastname VARCHAR, age INT, gender VARCHAR)
LANGUAGE SQL
AS $$
SELECT * FROM employeedemographics;
$$;

-- Call the function
SELECT * FROM get_all_employees();


/* 
Views example
Views provide a way to present data from underlying tables in a structured format.
*/

CREATE VIEW employees_and_roles AS
SELECT dem.employeeid, dem.firstname, dem.lastname, sal.jobtitle, sal.salary
FROM employeedemographics dem
JOIN employeesalary sal ON dem.employeeid = sal.employeeid;

SELECT *
FROM employees_and_roles;