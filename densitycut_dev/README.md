densityCut is an efficient density-based clustering algorithm to analyze large-scale biological data. densityCut is written in R, and it has been tested on both Windows 8 and Mac OS X 10.9.5.  

After downloading densityCut, it can be installed from the terminal (the dependent packages are listed in DESCRIPTION):  
  R CMD build densitycut_dev/  
  R CMD install densitycut_0.0.1.tar.gz  

The data (variant allele frequencies of somatic mutations, single-cell gene expression data, and single-cell CyTOF data) are in the folder densitycut_dev/data/. After installation densitycut, you can access these data and get help information for these data. For example,  

library(densitycut)  
?PMF # Get help information for data PMF  

cluster.out = DensityCut(PMF$x) # DensityCut clustering analysis  
col = AssignLabelColor(label=cluster.out$cluster, col=distinct.col) # Assign colour to clusters  
NeatPlot(x=PMF$x[, 1:2], col=col) # Scatter plots  

