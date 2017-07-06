
library(densitycut)
library(mvtnorm)

# load color pallette:
load("densitycut_dev/data/distinct.col.rda")

set.seed(0)

N = 2^12
number.cluster = 64
N = N / number.cluster

i  = j = seq(-3.5, 3.5, by=1)
mu = expand.grid(i, j)
mu = as.matrix(mu)

sigma = matrix(c(1, 0, 0, 1)*0.05, byrow=TRUE, nrow=2)

x = lapply(seq(number.cluster), function(z) rmvnorm(N, mu[z,], sigma))
x = do.call(rbind, x)

label = lapply(1:number.cluster, function(z) rep(z, N))
col = AssignLabelColor(distinct.col, unlist(label))
NeatPlot(x, col=col, pch=4, cex=0.5)

K = ceiling(log2(N * number.cluster))
a = DensityCut(X=x, K=K, alpha=0.85, nu=seq(0.0, 1.0, by=0.05),
               debug=FALSE, show.plot=TRUE,
               col=distinct.col)

col = AssignLabelColor(distinct.col, a$cluster)
NeatPlot(x, col=col, pch=4, cex=0.5)



# testing on taxi data ----------------------------------------------------

library(sf)
library(tidyverse)

clust_original <- st_read("data/taxi_rides_q1_2016.geojson")

# filter with a bouding box to simplify the final output 
clust_original <- 
  bind_cols(clust_original,
            as_data_frame(clust_original %>% st_coordinates()) %>% rename("lon"=X,"lat"=Y)
  ) %>% 
  filter(lat > 40.6, lat < 40.9, lon > -74.25, lon < (-1*73.55))

# matrix of lat/lon points
clust_matrix <-
  clust_original %>% 
  st_coordinates()


K <- 25
x <- clust_matrix
start_time <- Sys.time()
a <- DensityCut(X=x, K=K
                , alpha=0.85
                , nu=seq(0.0, 1.0, by=0.05)
                , debug=FALSE
                , show.plot=F
                , col = distinct.col)
end_time <- Sys.time()

# assign colors:
col = AssignLabelColor(distinct.col, a$cluster)
NeatPlot(x, col=col, pch=4, cex=0.5)

message("Clustering Time: ",round((end_time-start_time)/60,2)," minutes")

clust_original$cluster <- a$cluster

library(ggmap)
sbbox <- make_bbox(lon = clust_original$lon, lat = clust_original$lat, f = .1)
suppressMessages({
  sq_map <- get_map(location = sbbox, maptype="terrain-lines", source = "stamen",color = "bw")
})

ggmap(ggmap = sq_map)+
  geom_point(data = clust_original %>% head(n=100000), aes(color = as.character(cluster)), size = 0.1, alpha = 0.5)+
  scale_color_manual(values = col)+
  coord_map()+
  theme_minimal()+
  theme(legend.position = "none")
  
