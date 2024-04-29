/*
Group by, order by
*/

SELECT Gender, COUNT(Gender)
FROM employeedemographics
GROUP BY Gender;

SELECT Gender, COUNT(Gender) AS countGender
FROM employeedemographics
WHERE age > 31
GROUP BY Gender
ORDER BY countGender;

SELECT *
FROM employeedemographics
ORDER BY Age DESC, Gender DESC;

-- this counts the number of rows being returned
-- COUNT is a derived column, doesn't need to be included in the GROUP BY
-- derived off the gender column, so the column is fictional
SELECT Gender, Age, COUNT(Gender)
FROM employeedemographics
GROUP BY Gender, Age;