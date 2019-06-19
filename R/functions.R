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
#' @example
#' orchid %>% orchidmap("decimalLongitude", "decimalLatitude", "species")
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

orchids <- fread("./data/orchidsgotland.csv")
gotland <- st_read("./data/gotland.shp")

usethis::use_data(orchids, overwrite = T)
usethis::use_data(gotland, overwrite = T)





