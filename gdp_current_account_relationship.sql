--This query contains cte, subquery, and window functions. Its main purpose is to find the countries with decreasing gdp growth and increasing current account during pandemic years, because importation fell more than exportation.  
WITH pandemic_cte AS(
SELECT * FROM
-- SUBQUERY
(SELECT 
country_name,
year,
LAG(CAST(gdp_growth AS FLOAT)) OVER(PARTITION BY country_name ORDER BY year) AS previous_gdp, 
CAST(gdp_growth AS FLOAT) AS current_gdp,
LAG(CAST(current_account AS FLOAT)) OVER(PARTITION BY country_name ORDER BY year) AS previous_account,
CAST(current_account AS FLOAT) AS current_account
FROM macroeconomic_data) AS pandemic_period WHERE year BETWEEN 2019 AND 2021)SELECT year, country_name FROM pandemic_cte 
WHERE previous_gdp > current_gdp AND current_account > previous_account ORDER BY year
