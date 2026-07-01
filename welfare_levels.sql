--This query was written in order to classify each country's welfare level for each year based on their misery index, which was calculated as the sum of unemployment and inflation rate.
WITH misery_cte AS(
SELECT country_name,
year,
TRY_CAST(inflation AS DECIMAL(10, 2)) AS inflation,
TRY_CAST(unemployment AS DECIMAL(10, 2)) AS unemployment,
(TRY_CAST(inflation AS DECIMAL(10, 2)) + TRY_CAST(unemployment AS DECIMAL(10, 2))) AS misery_index
FROM macroeconomic_data),
avg_misery_cte AS(
SELECT country_name, year, AVG(misery_index) OVER(PARTITION BY country_name ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
AS misery_3_year_moving_avg
FROM misery_cte),
avg_misery_ranking_cte AS(
SELECT country_name, year, misery_3_year_moving_avg, 
DENSE_RANK() OVER(PARTITION BY year ORDER BY misery_3_year_moving_avg DESC) AS avg_misery_index_rank FROM avg_misery_cte)SELECT 
country_name, year, misery_3_year_moving_avg, avg_misery_index_rank, CASE 
	WHEN avg_misery_index_rank BETWEEN 1 AND 5 THEN 'High Risk'
	WHEN avg_misery_index_rank BETWEEN 6 AND 11 THEN 'Vulnerable'
	WHEN avg_misery_index_rank BETWEEN 12 AND 17 THEN 'Stable'
	ELSE 'High Welfare'
END AS welfare_level
FROM avg_misery_ranking_cte 
WHERE misery_3_year_moving_avg IS NOT NULL
ORDER BY year, avg_misery_index_rank 

