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


library(ggplot2)
# Check our coordinate reference systems
st_crs(gages_sf)
st_crs(pnw)
# Are they equal?
st_crs(gages_sf)==st_crs(pnw)
# transform one to the other
gages_sf <- st_transform(gages_sf, st_crs(pnw)) #instead of passing ECSG code, transform to coordinate system of states data
ggplot() + 
  geom_sf(data=gages_sf,  color="blue") +
  geom_sf(data=pnw,  color="black", fill=NA) +
  labs(title="USGS Stream Gages in the Pacific Northwest") +
  theme_bw() 