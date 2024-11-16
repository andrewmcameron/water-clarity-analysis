# Script to pull in data using the USGS `dataRetrieval` package.
# The package allows access to water data from the USGS National Water Information System (NWIS) 
# and the Water Quality Portal (WQP)
# Documentation at https://cran.r-project.org/web/packages/dataRetrieval/vignettes/dataRetrieval.html

library(dataRetrieval)
library(tidyverse)

# 1. Setup sites and parameters to download ----
  ## The text below was copied directly from the cells in an Excel file and pasted here to create a single large string.
  sites_string <- 
"USGS 02054500 ROANOKE RIVER AT LAFAYETTE, VA
USGS 02054530 ROANOKE RIVER AT GLENVAR, VA
USGS 02054550 ROANOKE RIVER AT RTS 639/760 AT SALEM, VA
USGS 02054750 ROANOKE RIVER AT ROUTE 117 AT ROANOKE, VA
USGS 02055000 ROANOKE RIVER AT ROANOKE, VA
USGS 02055080 ROANOKE RIVER AT THIRTEENTH ST BR AT ROANOKE, VA
USGS 02056000 ROANOKE RIVER AT NIAGARA, VA
USGS 02060500 ROANOKE RIVER AT ALTAVISTA, VA
USGS 02062500 ROANOKE (STAUNTON) RIVER AT BROOKNEAL, VA
USGS 02066000 ROANOKE (STAUNTON) RIVER AT RANDOLPH, VA
USGS 02079500 ROANOKE RIVER AT BUGGS ISLAND, VA
USGS 02080500 ROANOKE RIVER AT ROANOKE RAPIDS, NC
USGS 0208062765 ROANOKE RIVER AT HALIFAX, NC
USGS 02081000 ROANOKE RIVER NEAR SCOTLAND NECK, NC
USGS 02081022 ROANOKE RIVER NEAR OAK CITY, NC
USGS 0208102855 ROANOKE RIVER AB SR1100 NR GRABTOWN, NC
USGS 02081094 ROANOKE RIVER AT JAMESVILLE, NC
USGS 0208114150 ROANOKE RIVER AT NC 45 NR WESTOVER, NC"

  ## Then the string is broken up into individual site names...
site_ids <- strsplit(sites_string, "\n") %>%  # ...first by splitting on the line breaks...
  unlist() %>%
  strsplit(" ") %>% # ...then by splitting on the spaces...
  lapply(function(x) paste(x[1], x[2], sep = "-")) %>%  # ...then by selecting the first and second element of each split and separating with "-"
  unlist()


# Parameters to download
pCode <- c("00530", "00600", "00665", "70951")


# 2. Download data ----
# As of Oct. 24, 2024, the way to access this data has changed. 
## You need to convert the numeric USGS site ID’s into something that 
## the Water Quality Portal will accept, which requires the agency prefix
## e.g., "USGS-xxxxxxx" --- this was taken care of above in the string splitting code.
dat <- readWQPqw(siteNumbers = site_ids,
                    parameterCd = pCode) %>%
  renameNWISColumns()

dat %>% 
  group_by(MonitoringLocationIdentifier, ActivityStartDate) %>%
  summarize(n = n())

# Filter to include only data from 1999 and later
dat <- dat %>%
  mutate(ActivityStartDate = as.Date(ActivityStartDate)) %>%
  filter(year(ActivityStartDate) >= 1999) %>%
  select(OrganizationFormalName, MonitoringLocationIdentifier, ActivityStartDate, CharacteristicName, ResultMeasureValue, ResultMeasure.MeasureUnitCode, USGSPCode)

# 3. Export data to csv ----
write_csv(dat, "data/river_data/roanoke_river_data.csv")

