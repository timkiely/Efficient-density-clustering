#' @useDynLib densitycut sexp_log_sum_exp
LogSumExp = function(x) { 
  # The log-sum-exp trick, x is a vector. 
  # A matrix input will be converted to a vector
  
  x = as.numeric(x)
  x = na.omit(x)
  if (length(x) < 1) {
    stop("Error: x should be a vector of length greater than zero!")
  }
  
  tmp = .Call("sexp_log_sum_exp", x)
  
  return(tmp)
}


#======================================================================
#' Reset the default parameters for the plot function
#' 
#' @export
#' @param ... go to plot
#' @param xlab A title for the x axis 
#' @param ylab A title for the y axis
#' @param xaxt see par 
#' @param yaxt see par
#' @param xtck.label Logical, wheter to draw the x axis tick labels
#' @param ytck.label Logical, wheter to draw the y axis tick labels
#' @param cex.axis cex for axis 
#' 
#' @importFrom graphics plot axis mtext 
#' 
NeatPlot = function(..., xlab, ylab, xaxt="s", yaxt="s", 
                    xtck.label=TRUE, ytck.label=TRUE, cex.axis=0.8) {
  
  plot(xaxt="n", yaxt="n", xlab=NA, ylab=NA, ...) 
  
  if (xaxt == "s") {
    axis(side=1, tck=-0.015, labels=NA)
    axis(side=1, lwd=0, mgp=c(3,0.5,0), line=-0.4,
         labels=xtck.label, cex.axis=cex.axis)
  }
  if (yaxt == "s") {
    axis(side=2, tck=-0.015, labels=NA)
    axis(side=2, lwd=0, mgp=c(3,0.5,0), line=-0.4,
         labels=ytck.label, cex.axis=cex.axis)
  }
  
  if (!missing(xlab)) {
    mtext(side=1, text=xlab, cex=cex.axis, line=1.0)
  }
  if (!missing(ylab)) {
    mtext(side=2, text=ylab, cex=cex.axis, line=1.0)
  }
}


#======================================================================
#' Calcular the normalized mutual information
#' 
#' @export
#' 
#' @param ground.truth The cluster ground truth
#' @param cluster The cluster labels
#' 
ComputeNMI = function(ground.truth, cluster) {
  N = length(ground.truth)
  if (length(cluster) != N) {
    stop("The two vectors should be the same length!")
  }
  
  x = table(ground.truth, cluster)
  x = x / sum(x)
  
  p.x = rowSums(x)
  p.y = colSums(x)
  y = outer(p.x, p.y)
  
  i = which((x > 0) & (y > 0))
  mutual.info = sum(x[i] * log2(x[i] / y[i]))
  entropy.x = sum(p.x * log2(ifelse(p.x > 0, p.x, 1)))
  entropy.y = sum(p.y * log2(ifelse(p.y > 0, p.y, 1)))
  
  nmi = mutual.info / sqrt(entropy.x * entropy.y)
  
  return(nmi)
}


# Calculate the entropy
ComputeEntropy = function(x) {
  N  = length(x)
  prob = table(x) / N
  
  entropy = -sum(prob * log2(prob))
  
  return(entropy)
}


#======================================================================
#' Assign colors to labels
#' 
#' @author Jiarui Ding
#' 
#' @export
#' 
#' @param col A set of colors
#' @param label Cluster labels
#' @param uniq.label The initial labels
#' 
AssignLabelColor = function(col, label, uniq.label) {
  if (is.list(label)) {
    label = unlist(label)
  }
  
  if (missing(uniq.label)) {
    uniq.label = unique(label)
  }
  len = length(uniq.label)
  uniq.label.ind = seq(len)
  
  if (len > length(col)) {
    col = colorRampPalette(col)(len)
  }
    
  col.label = label
  for(z in uniq.label.ind) {
    id = label == uniq.label[z]
    col.label[id] = col[z]
  }
  
  return(col.label)
}


#======================================================================
#' Add transpancy to color
#' 
#' @author Jiarui Ding
#' 
#' @export
#' 
#' @param col A set of colors
#' @param trans A vector or vector of the same length as col, 
#' 0 being fully visable and 1 being fully transpant
#' 
AddTrans = function(col, trans) {
  # Add transcripancy to colours. 
  # Works with either color and trans a vector 
  # of equal length, or one of the two of length 1.
  
  # col  :
  #      colour vector
  # trans:
  #      0 being fully visable and 1 being fully transpant
  # 
  if (any(trans > 1) | any(trans < 0)) {
    stop("Error: trans should in the range of [0, 1]") 
  }
  if (length(col) != length(trans) & 
        !any(c(length(col), length(trans))==1)) 
    stop("Error: vector lengths doesn't match")
  if (length(col)==1 & length(trans)>1)
    color = rep(color,length(trans))
  if (length(trans)==1 & length(col)>1) 
    trans = rep(trans, length(col))
  
  num2hex = function(x) {
    hex = unlist(strsplit("0123456789ABCDEF", split=""))
    return (paste(hex[(x-x%%16)/16 + 1], hex[x%%16 + 1], sep=""))
  }
  rgb = rbind(col2rgb(col), round(255 - trans*255))
  col = apply(apply(rgb, 2, num2hex), 2, paste, collapse="")
  col = paste("#", col, sep="")
  
  return(col)
}


