--top 2 foods with highest protein in every category
SELECT * FROM
(
SELECT 
	category, 
	food, 
	protein, 
	ROW_NUMBER() OVER (PARTITION BY category ORDER BY protein DESC) AS gro
	FROM nutrients
)GB
WHERE gro <=2 AND protein !=0
ORDER BY category

--Top 10 food with the highest saturated fat
SELECT food, sat_fat FROM nutrients
ORDER BY sat_fat DESC
LIMIT 20

--macro nutrients from 5 lowest calories for fish and seafood
SELECT * FROM
(
SELECT DISTINCT (food),
	category, 
	grams,
	calories,
	Protein,
	carbs,
	fat,
	ROW_NUMBER() OVER (PARTITION BY category ORDER BY calories ASC) AS gro
	FROM nutrients
)GB
WHERE category = 'Fish, Seafood' AND gro <=5
ORDER BY category

--Top 6 vegetables that have high fiber
Select food, category, fiber, 
CASE 
WHEN grams = 100 THEN round(fiber,2)
ELSe ROUND((100/grams)*fiber,2) 
END
FROM nutrients
WHERE category LIKE 'Vege%'
ORDER BY round DESC
LIMIT 6