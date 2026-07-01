--This query with subquery was prepared to list the countries having higher inflation rates than global inflation rate at that year.
SELECT country_name,
year, 
inflation_rate,
global_inflation_rate
FROM
(SELECT year,
CAST(inflation AS DECIMAL(10,2)) AS inflation_rate,
country_name,
  AVG(CAST(inflation AS DECIMAL(10,2))) OVER(PARTITION BY year) AS global_inflation_rate
FROM macroeconomic_data
WHERE inflation <> 'NA') AS subquery
WHERE inflation_rate > global_inflation_rate

