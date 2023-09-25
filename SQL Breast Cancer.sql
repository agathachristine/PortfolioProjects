--Average number alive and death by Age Range (30-70)
SELECT
CASE
	WHEN age BETWEEN 30 AND 35 then '30-35'
	WHEN age BETWEEN 35 AND 40 then '35-40'
	WHEN age BETWEEN 40 AND 45 then '40-45'
	WHEN age BETWEEN 45 AND 50 then '45-50'
	WHEN age BETWEEN 50 AND 55 then '50-55'
	WHEN age BETWEEN 55 AND 60 then '55-60'
	WHEN age BETWEEN 60 AND 65 then '60-65'
	WHEN age BETWEEN 65 AND 70 then '65-70'
	ELSE '70<' 
END AS age_range, 
COUNT(1) FILTER(WHERE status='Alive') AS Alive,
COUNT (1) FILTER (WHERE status = 'Dead') AS Dead
FROM bcancer
GROUP BY age_range
ORDER BY age_range