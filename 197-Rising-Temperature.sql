# Write your MySQL query statement below
SELECT w_tod.id AS id
FROM Weather w_yes
INNER JOIN Weather w_tod
ON w_yes.recordDate + INTERVAL 1 DAY = w_tod.recordDate 
WHERE w_tod.temperature > w_yes.temperature;