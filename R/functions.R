# oRchid
#
# RaukR 2019 group project

# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# LIBRARIES
library(data.table)
library(sf)

# Function to make simple map with color dots
orchidsmap <- function(my_df, x1, y1, z1) {
require(ggplot2)
require(Hmisc)

  ggplot(my_df) +
    geom_sf(data = gotland) +
    geom_point(aes_string(x1, y1, col = z1), size = 3, alpha = 0.8) +
    theme_bw() +
    labs(x = "Longitude", y = "Latitude", col = capitalize(z1))

}


# Save data

orchids <- fread("./data/orchidsgotland.csv")
gotland <- st_read("./data/gotland.shp")

usethis::use_data(orchids, overwrite = T)
usethis::use_data(gotland, overwrite = T)





