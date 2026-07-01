--Investigation of the years when specific countries experienced stagflation via utilizing cte, window functions, and conditions.
WITH cte AS(
SELECT country_name,
year,
TRY_CAST(real_interest_rate AS DECIMAL(10, 2)) AS real_interest_rate,
TRY_CAST(gdp_growth AS DECIMAL(10, 2)) AS current_gdp,
LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_gdp,
(LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(gdp_growth AS DECIMAL(10, 2))) AS gdp_change,
TRY_CAST(inflation AS DECIMAL(10, 2)) AS current_inflation,
LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_inflation,
(LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(inflation AS DECIMAL(10, 2))) AS inflation_change
FROM macroeconomic_data)SELECT country_name,
year,
real_interest_rate,
gdp_change,
inflation_change,
SUM(CASE WHEN gdp_change < 0 AND inflation_change > 0 THEN 1 ELSE 0 END) OVER(PARTITION BY country_name) AS number_of_cases
FROM cte WHERE real_interest_rate IS NOT NULL AND
current_gdp IS NOT NULL AND
following_gdp IS NOT NULL AND 
current_inflation IS NOT NULL AND
following_inflation IS NOT NULL AND 
real_interest_rate < 0
ORDER BY country_name, year

--Investigation of successful economies where specific conditions were met.
WITH cte AS(
SELECT country_name,
year,
TRY_CAST(real_interest_rate AS DECIMAL(10, 2)) AS real_interest_rate,
TRY_CAST(gdp_growth AS DECIMAL(10, 2)) AS current_gdp,
LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_gdp,
(LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(gdp_growth AS DECIMAL(10, 2))) AS gdp_change,
TRY_CAST(inflation AS DECIMAL(10, 2)) AS current_inflation,
LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_inflation,
(LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(inflation AS DECIMAL(10, 2))) AS inflation_change
FROM macroeconomic_data)SELECT country_name,
year,
real_interest_rate,
gdp_change,
inflation_change,
SUM(CASE WHEN gdp_change > 0 AND inflation_change < 0 THEN 1 ELSE 0 END) OVER(PARTITION BY country_name) AS number_of_cases
FROM cte WHERE real_interest_rate IS NOT NULL AND
current_gdp IS NOT NULL AND
following_gdp IS NOT NULL AND 
current_inflation IS NOT NULL AND
following_inflation IS NOT NULL AND 
real_interest_rate > 0
ORDER BY country_name, year


--Investigation of the standard deviation of inflation and gdp change based on the deepness of the real interest rate negativity by constructing multiple cte's, conditions, calculations, and (window) functions.
WITH cte AS(
SELECT country_name,
year,
TRY_CAST(real_interest_rate AS DECIMAL(10, 2)) AS real_interest_rate,
TRY_CAST(gdp_growth AS DECIMAL(10, 2)) AS current_gdp,
LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_gdp,
(LEAD(TRY_CAST(gdp_growth AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(gdp_growth AS DECIMAL(10, 2))) AS gdp_change,
TRY_CAST(inflation AS DECIMAL(10, 2)) AS current_inflation,
LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) AS following_inflation,
(LEAD(TRY_CAST(inflation AS DECIMAL(10, 2))) OVER(PARTITION BY country_name ORDER BY year) - TRY_CAST(inflation AS DECIMAL(10, 2))) AS inflation_change
FROM macroeconomic_data),
cte_2 AS(
SELECT country_name,
year,
real_interest_rate,
gdp_change,
inflation_change,
CASE WHEN real_interest_rate BETWEEN -2 AND 0 THEN 'Slightly Negative' 
WHEN real_interest_rate BETWEEN -5 AND -2 THEN 'Acceptably Negative' 
WHEN real_interest_rate BETWEEN -10 AND -5 THEN 'Risky Negative' 
ELSE 'Extremely Negative'
END AS interest_rate_situation
FROM cte WHERE real_interest_rate IS NOT NULL AND
current_gdp IS NOT NULL AND
following_gdp IS NOT NULL AND 
current_inflation IS NOT NULL AND
following_inflation IS NOT NULL AND 
real_interest_rate < 0)SELECT country_name, year, real_interest_rate, gdp_change, inflation_change, interest_rate_situation,
STDEV(gdp_change) OVER(PARTITION BY interest_rate_situation) AS gdp_change_std_dev_for_different_negatives,
STDEV(inflation_change) OVER(PARTITION BY interest_rate_situation) AS inf_change_std_dev_for_different_negatives
FROM cte_2
ORDER BY interest_rate_situation, country_name, year



