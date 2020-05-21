library(tidyverse)
library(sf)
library(tigris)
library(jsonlite)
library(leaflet)
library(plotly)

tarrant <- tracts("GA", "Fulton")

tarrant_sf <- st_as_sf(tarrant)

l <- leaflet(tarrant) %>%  
  addTiles() %>% 
  addPolygons(popup=~AWATER)

l

g <- ggplot(tarrant_sf) +
      geom_sf(aes(fill=as.numeric(AWATER))) 

g

fig <- ggplotly(g)
fig
