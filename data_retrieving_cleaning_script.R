install.packages("WDI")
install.packages("tidyverse")
library(WDI)
library(tidyverse)

indicators <- c(
  gdp_growth = "NY.GDP.MKTP.KD.ZG", # gdp annual growth rate
  inflation = "FP.CPI.TOTL.ZG", # inflation rate  
  unemployment = "SL.UEM.TOTL.ZS", # general unemployment rate
  youth_unemployment = "SL.UEM.1524.ZS", # youth unemployment rate(ages 15-24)   
  current_account = "BN.CAB.XOKA.GD.ZS", # current account / gdp
  real_interest_rate = "FR.INR.RINR" #  real interest rate   
)
country_list <- c(
  "US", "DE", "JP", "GB", "FR", "CA", "IT", "KR", "AU", "CH", "TR", "BR", "RU", "IN", "CN", "ZA", "MX", "ID", "SA", "AR", "ES", "GR" 
)
raw_macro_data <- WDI(
  country = country_list,
  indicator = indicators,
  start = 2010,
  end = 2024,
  extra = FALSE
)
sum(is.na(raw_macro_data))

cleaned_macro_data <- raw_macro_data %>%
  rename(
 country_name = country,
 country_code = iso2c
) %>%
  select(- iso3c) %>%
  mutate(real_interest_rate = case_when(
 country_name == "United States" & year == 2022 ~ -0.7800000,
 country_name == "United States" & year == 2023 ~ 4.1100000,
 country_name == "United States" & year == 2024 ~ 3.4100000,
 TRUE ~ real_interest_rate))

europe_nominal_interest_rates <- c(0.43634, 0.87067, 0.22938, 0.08917, 0.09533, -0.10693, -0.31928, -0.35468, -0.36285, -0.41310, -0.54610, -0.56766, -0.03915, 3.18281, 3.65654)
names(europe_nominal_interest_rates) <- 2010:2024

turkey_nominal_interest_rates <- c(6.75, 6.00, 5.50, 4.75, 9.13, 7.63, 8.00, NA, 19.42, 15.56, 11.38, 16.40, 11.13, 26.69, 47.50)
names(turkey_nominal_interest_rates) <- 2010:2024

cleaned_macro_data <- cleaned_macro_data %>%
mutate(real_interest_rate = case_when(
country_name %in% c("Germany", "France", "Spain", "Greece") ~ (europe_nominal_interest_rates[as.character(year)] - inflation),
country_name == "Turkiye" ~ turkey_nominal_interest_rates[as.character(year)] - inflation,
TRUE ~ real_interest_rate))

sum(is.na(cleaned_macro_data))

cleaned_macro_data <- cleaned_macro_data %>%
  mutate(across(where(is.numeric), ~ round(., 2)))

write.csv(cleaned_macro_data, "macroeconomic_data.csv", row.names = FALSE)
