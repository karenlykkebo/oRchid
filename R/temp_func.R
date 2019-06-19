library(sf)
library(ggplot2)
library(gganimate)
library(ggpubr)


temp_got<-st_read("data/gotland_shp_temp.shp")



gtempWrap<-function(my_df,x1,y1,y2){
  require(ggplot2)
  require(ggpubr)
  
  my_df %>% filter(!!as.name(y1) > y2) %>% 
    ggplot() +
    geom_sf(aes(fill=!!as.name(x1))) +
    scale_fill_continuous(low="yellow",high="red") +
    theme_pubclean() +
    labs(fill = "Temperature")+
    facet_wrap(y1)
  
}

gtempWrap(temp_got,"avgyear","year","2000")



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

gtemp_anim(temp_got,"avgyear","year","2000")
