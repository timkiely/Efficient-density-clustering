##====================================================================
#' Efficient Knn-search in high-dimensional search (upto 1000 dimensions)
#' 
#' export
#' 
#' @param X A data matrix (columns are features and rows are data points)
#' @param num.tree The number of trees for random projection
#' @param K A integer to specify the number of neighbours in building the Knn graph.
#' Default to \eqn{K=\log_2(N)}, where N is the number of data points
#' 
#' @return A list containg knn.index, knn.dist, the dimensionality D, 
#' and the projected trees: tree.index
#' 

GetKnnRandomProjection = function(X, num.tree=50, K) {
  X = as.matrix(X)
  D = ncol(X)
  tree.index = new(RcppAnnoy::AnnoyEuclidean, D)
  N = nrow(X)
  
  for (i in seq(N)) {
    tree.index$addItem(i-1, X[i, ])
  }
  tree.index$build(num.tree)
  
  #====================
  if (missing(K)) {
    K  = ceiling(log2(N))
  }
  knn.index = matrix(0, nrow=N, ncol=K)
  knn.dist  = knn.index
  for (i in seq(N)) {
    idx = tree.index$getNNsByItem(i-1, K+1)
    idx = idx[-1]
    
    knn.dist[i, ]  =  sapply(idx, function(z) 
      tree.index$getDistance(i-1, z))
    
    knn.index[i, ] = idx + 1
  }
  
  return(list(knn.index=knn.index, 
              knn.dist =knn.dist, 
              D=D, 
              tree.index=tree.index)
         )
}

