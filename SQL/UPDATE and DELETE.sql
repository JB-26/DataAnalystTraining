/*
Updating / Deleting data
*/

SELECT *
FROM employeedemographics;

UPDATE employeedemographics
SET age = 31, gender = 'Female'
WHERE firstname = 'Holly'
AND lastname = 'Flex';

-- OR

UPDATE employeedemographics
SET age = 31, gender = 'Female'
WHERE employeeid = 1012

-- you can use select as a safeguard to check what you're deleting
/*
DELETE FROM employeedemographics
WHERE employeeid = 1013;
*/