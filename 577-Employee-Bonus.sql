# Write your MySQL query statement below
SELECT name, bonus
FROM Employee AS emp
LEFT JOIN Bonus AS bo ON emp.empId = bo.empId
WHERE bonus < 1000 or bonus IS NULL;