/*
WHERE statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

SELECT *
FROM employeedemographics
WHERE firstname = 'Jim';

-- does not equal
SELECT *
FROM employeedemographics
WHERE firstname <> 'Jim';

-- greater than and equal to / less
SELECT *
FROM employeedemographics
WHERE age >= 30;

SELECT *
FROM employeedemographics
WHERE age <= 30;

-- AND
SELECT *
FROM employeedemographics
WHERE age <= 32 AND gender = 'Male';

-- OR - only one criteria needs to be met
SELECT *
FROM employeedemographics
WHERE age <= 32 OR gender = 'Male';

-- LIKE with wildcard
SELECT *
FROM employeedemographics
WHERE lastname LIKE 'S%';

SELECT *
FROM employeedemographics
WHERE lastname LIKE 'S%c%ott%';

-- NULL
SELECT *
FROM employeedemographics
WHERE firstname is NOT NULL;

SELECT *
FROM employeedemographics
WHERE firstname is NULL;

-- IN - multiple equal statements
SELECT *
FROM employeedemographics
WHERE firstname IN ('Jim', 'Michael');
