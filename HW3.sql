-- 1. Do the same with speed. If speed is NULL or speed < 100 create a "LOW SPEED" category, otherwise, mark as "HIGH SPEED". Use IF instead of CASE! --
SELECT * FROM birdstrikes;

SELECT airline,speed, 
IF (speed is NULL or speed < 100 , "LOW SPEED", "HIGH SPEED") as "Speed_category"
FROM birdstrikes ORDER BY speed_category;


-- 2. How many distinct 'aircraft' we have in the database? -- 
SELECT COUNT(DISTINCT (aircraft)) 
FROM birdstrikes;
-- 3. What was the lowest speed of aircrafts starting with 'H' --

SELECT aircraft, MIN(speed) FROM birdstrikes WHERE aircraft LIKE'H%';
-- 9 -- 

-- 4. Which phase_of_flight has the least of incidents? -- 
SELECT phase_of_flight,COUNT(damage) AS count FROM birdstrikes GROUP BY phase_of_flight ORDER BY count;
-- Taxi --

-- 5.  What is the rounded highest average cost by phase_of_flight? --
SELECT phase_of_flight,ROUND(AVG(cost)) as AVGCOST FROM birdstrikes GROUP BY phase_of_flight ORDER BY AVGCOST DESC;
-- 54673 --

-- 6. What the highest AVG speed of the states with names less than 5 characters? -- 

SELECT state,AVG(speed) as AVGSPEED FROM birdstrikes GROUP BY state HAVING LENGTH(state) < 5 AND state != ''  
ORDER BY AVGSPEED DESC;
-- 2862 -- 
