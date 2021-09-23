#counties in a different state
library(tigris)
library(sf, quietly = T)
counties <- counties("Rhode Island", cb = TRUE)
counties$area <- as.numeric(st_area(counties))
glimpse(counties)
counties #to see more information

tm_shape(counties) +
  tm_polygons("area", 
              style="quantile", 
              title="Area of Rhode Island Counties")
