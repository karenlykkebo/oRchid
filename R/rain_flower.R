#' A map of Gotland with Orchid genus and rain fall
#'
#' A map of Gotland with Orchid genus and rain fall
#'
#' This function makes a map of orchid genus's in Gotland and makes a denisty plot of rain fall for that same year.
#' @section Warning:
#' Might work, might not. We hope so
#'
#' @param x1 insert year
#'
#' @example flowerp(2015)
#'
flowerp <- function(x1) {
require(ggplot2)
require(egg)
require(dplyr)

plot1 <- got_orchids %>%
    filter(year == x1) %>%
    ggplot() +
    geom_sf(data = gotland) +
    geom_point(aes(long, lat, col = genus), size = 3, alpha = 0.8) +
    theme_bw() +
    labs(x = "Longitude", y = "Latitude", col = "Genus")

rainp <- got_rain %>%
  filter(year == x1) %>%
    ggplot(aes(Rain, fill = as.factor(month))) +
    geom_density(alpha = 0.6) +
    labs(fill = "Month") +
    theme_bw() +
    scale_y_continuous(expand = c(0.01, 0.01))

ggarrange(plot1, rainp, nrow = 1)

}

flowerp(2015)


