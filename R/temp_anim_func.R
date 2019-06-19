#' Description for temperature animation function for Gotland
#'
#' Part of the package oRchid on github karenlykkebo/oRchid
#'
#' Run the function with:
#'
#' @param my_df your dataframe - shp file included in the package with temperature data and gotland shape
#' @param x1 response variable (temperature)
#' @param y1 filtering and facet variable.
#'
#' @example
#' gtemp_anim(temp_got,"avgyear","year","2000")
#'
#'

gtemp_anim<-function(my_df,x1,y1,y2){
  require(ggplot2)
  require(ggpubr)
  require(gganimate)
  require(tidyverse)

  my_df %>% filter(!!as.name(y1) > y2) %>%
    ggplot() +
    geom_sf(aes(fill=!!as.name(x1))) +
    scale_fill_continuous(low="yellow",high="red") +
    theme_pubclean() +
    labs(fill = "Temperature") +
    transition_states(!!as.name(y1),
                      transition_length = 2,
                      state_length = 1) +
    labs(title = ': {closest_state}')


}

