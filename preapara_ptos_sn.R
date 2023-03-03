library(tidyverse)
library(sf)

ptos <- readxl::read_excel("data/puntos_sn/puntos_sn.xlsx", sheet = "puntos")
codes <- readxl::read_excel("data/puntos_sn/puntos_sn.xlsx", sheet = "codes")

names(codes)

ptos <- ptos |> inner_join(codes, by=c("comunidad"="code_comunidad"))

ptos_sn <- st_as_sf(ptos, coords = c("x", "y"), crs = 23030) 
st_write(ptos_sn, "data/puntos_sn/puntos_sn.shp")
