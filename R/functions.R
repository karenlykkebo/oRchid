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
library(roxygen2)

#' A map of Gotland with Orchid observations
#'
#' A map of Gotland with Orchid observations
#'
#' This function makes a map of Gotland and adds latitude and longitude data points of some observation.
#' @section Warning:
#' Might work, might not. We hope so
#' @param my_df A data frame
#' @param x1 Longitude
#' @param y1 Latitude
#' @param z1 Observation to color by, example Species, Genus, Temperature etc.
#'
#' @example orchid %>% orchidmap("decimalLongitude", "decimalLatitude", "species")
#'
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
# Orchids
orchids1 <- fread(file ="./data/orchidsgotland.csv", header = T, sep = ";")
# clean up dataframe
got_orchids <- orchids1 %>%
  rename("lat" = "decimalLatitude",
         "long" = "decimalLongitude") %>%
  select(-c(1:3, 11:14, 16, 19:24, 29:45))

# Rain
got_rain <- fread(file = "./data/rain_gotland.csv",header = T, sep = ";")

# Shapefile
gotland <- st_read(file = "./data/gotland.shp")

# Save to package
usethis::use_data(got_orchids, overwrite = T)
usethis::use_data(gotland, overwrite = T)
usethis::use_data(got_rain, overwrite = T)






