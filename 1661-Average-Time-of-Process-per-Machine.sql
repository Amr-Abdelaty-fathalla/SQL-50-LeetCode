# Write your MySQL query statement below
/*
SELECT a.machine_id,
ROUND(AVG(b.timestamp - a.timestamp),3) AS processing_time
FROM Activity a
JOIN Activity b
ON a.machine_id = b.machine_id AND a.process_id = b.process_id AND a.activity_type = 'start' AND b.activity_type = 'end'
GROUP BY a.machine_id;
*/

-- Another Solution I See it use different formule to cal avg time for each machine
-- Fromula ==> ((E1-S1)+(E2-S2))/2 = (E1+E2)/2 - (S1+S2)/2
SELECT a.machine_id,
ROUND(
    (SELECT AVG(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'end' AND a1.machine_id = a.machine_id) - 
    (SELECT AVG(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'start' AND a1.machine_id = a.machine_id) 
,3) AS processing_time
FROM Activity a
GROUP BY a.machine_id;