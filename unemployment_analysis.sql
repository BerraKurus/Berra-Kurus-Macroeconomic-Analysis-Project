--This query was constructed to analyse which countries tend to have a higher increase in youth unemployment rate than in unemployment rate in case of a gdp growth decrease. This analysis was conducted via the calculation of youth unemployment multiplier, cte, subquery, functions, and conditions.
WITH gdp_unemployment_analysis_cte AS(
SELECT country_name,
year,
LAG(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS previous_gdp,
TRY_CAST(gdp_growth AS DECIMAL(10, 2)) AS current_gdp,
TRY_CAST(youth_unemployment AS DECIMAL(10, 2)) AS youth_unemployment,
TRY_CAST(unemployment AS DECIMAL(10, 2)) AS unemployment,
(TRY_CAST(youth_unemployment AS DECIMAL(10, 2))/TRY_CAST(unemployment AS DECIMAL(10, 2))) AS youth_unemployment_multiplier,
LAG((TRY_CAST(youth_unemployment AS DECIMAL(10, 2))/TRY_CAST(unemployment AS DECIMAL(10, 2)))) OVER(PARTITION BY country_name ORDER BY year) AS previous_multiplier
FROM macroeconomic_data 
WHERE TRY_CAST(unemployment AS DECIMAL(10, 2)) IS NOT NULL AND TRY_CAST(youth_unemployment AS DECIMAL(10, 2)) IS NOT NULL)SELECT country_name, year, gdp_change, multiplier_change 
FROM 
(SELECT country_name, year,
(current_gdp - previous_gdp) AS gdp_change,
(youth_unemployment_multiplier - previous_multiplier) AS multiplier_change 
FROM gdp_unemployment_analysis_cte) AS subquery WHERE gdp_change < 0 AND multiplier_change > 0
ORDER BY country_name, year
