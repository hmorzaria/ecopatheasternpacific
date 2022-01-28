#' @title Resumir datos DENUE
#' @description  Resumir datos de Unidades economicas por localidad para cada estado costero
#' @details INPUT: 1) Datos DENUE 2020/11 en cvs https://www.inegi.org.mx/app/descarga/?ti=6
#' @details OUTPUT: 1) Unidades economicas por localidad
#' @author Hem Nalini Morzaria-Luna, hmorzarialuna@gmail.com


make_polygons <- function(thislocation, coords.ecopath){
  
  print(thislocation)
  
  this.coord <- coords.ecopath %>% 
    filter(Location==thislocation)
  
  print(this.coord)
  
  x_coord <- this.coord %>% 
    dplyr::select(lon_rev) 
  
  y_coord <- this.coord %>% 
    dplyr::select(lat_rev) 
  
  xym <- bind_cols(x_coord, y_coord)
  xym
  
  p = Polygon(xym)
  ps = Polygons(list(p),1)
  sps = SpatialPolygons(list(ps))
  plot(sps)

  proj4string(sps) = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
  ####SpatialPolygonsDataFrame####
  data = data.frame(f=1)
  spdf = SpatialPolygonsDataFrame(sps,data)
  spdf
  
  summary(spdf)
  spplot(spdf)
  ####exportar poligono###
  
  writeOGR(obj=spdf, dsn="shapedir", layer=paste0(thislocation), driver="ESRI Shapefile", overwrite_layer = TRUE)
  
}


