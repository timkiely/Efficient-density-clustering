
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
load("densitycut_dev/data/distinct.col.rda")

taxi_rides_q1_2016_sf <- st_read("237 E 34th/carto_data/taxi_rides_q1_2016.geojson")

# hdbscan fails around 100,000 rows with this implementation. better to select a smaller sample
clust_original <- taxi_rides_q1_2016_sf %>% head(100000) #filter(droppoff_month_lab == "MAR", droppoff_day_of_week %in% c("TUE"))

# matrix of lat/lon points
clust_matrix <-
  clust_original %>% 
  st_coordinates()


N = nrow(clust_matrix)
number.cluster = 30
N = N / number.cluster

K <- ceiling(log2(N * number.cluster))
x <- clust_matrix
a <- DensityCut(X=x, K=K
                , alpha=0.85
                , nu=seq(0.0, 1.0, by=0.05)
                ,debug=FALSE
                , show.plot=F
                , col = distinct.col)

col = AssignLabelColor(distinct.col, a$cluster)
NeatPlot(x, col=col, pch=4, cex=0.5)





