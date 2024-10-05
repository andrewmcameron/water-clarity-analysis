hours <- list(
  sep10 = 1,
  sep11 = 4.5,  # 9-11:30, 2:30-4:30
  sep12 = 5, # 12-6:30pm (about 90 min break)
  sep18 = 1.25, # sep 18 - realized I had not filtered by station-years with >= 3 Nobs on a variable-by-variable basis. 
  sep19 = 1.5,
  sep23 = 1,  # noticed Secchi data had been integrated into processed data in such a way that some observations were missing (466 total). Fixed this, re ran models
  sep24 = 4.5, # plotting somewhat complicated. 
  sep27 = 1.5, # regression statistics for all stations-variables that have 10 years of observations
  oct2 = 1.75, # incorporating lake anna supplemental
  oct3 = 1, #finalizing lake anna data integration and generating updated files
  oct4 = 3) # initital publication plot draft. setting up data, trying differnt approaches to achieve desired output

total_hours <- sum(unlist(hours))
print(total_hours)

total_hours * 35

