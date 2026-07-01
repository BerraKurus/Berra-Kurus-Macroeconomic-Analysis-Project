--This query with cte and window functions aims to display the countries, and the years in which inflation increases compared to previous year.
WITH inflation_change_cte AS
(SELECT 
country_name,
inflation,
year, 
LEAD(inflation) OVER(PARTITION BY country_name ORDER BY year) AS inflation_of_next_year
FROM macroeconomic_data WHERE inflation <> 'NA')SELECT country_name, year +1 AS year_inf_increases
FROM inflation_change_cte 
WHERE CAST(inflation AS FLOAT) < CAST(inflation_of_next_year AS FLOAT)


