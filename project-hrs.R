PAID_hours <- list(
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


hours <- list(
  oct8 = .5, #final trends plot tweaks
  oct9 = .75, # summary stats
  oct10 = 2.25, # box plots by variable 
  oct11 = 1.5,
  oct14 = .5, # leaflet map of SML locations
  oct15 = 1.75, # he wanted a physical map to print; began work on the publication (possible) time series for select stations
  oct16 = 2, # continuing work on publication time series
  oct16pm = 1.5, # Lake average trends
  oct17 = .75, # debugging error in lake average trends/plots
  oct24 = .5, # ensuring uniformity of dimensions for all plots in paneled lake average figures
  oct26 = .33, # DIN vs TN scatterplot)
  oct28 = 1.75, #scatterplot, reshaping summary data for long term station averages; James River water temp monthly means csv 
  oct30 = 1, # population level mblm trend estimates
  oct31 = 1 # finalizing population level mblm trend estimates, generating figure
)

total_hours <- sum(unlist(hours))
print(total_hours)

total_hours * 35

