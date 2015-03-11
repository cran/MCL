\name{MCL-package}
\alias{MCL-package}
\docType{package}
\encoding{UTF-8} 
\title{
Markov Cluster Algorithm
}
\description{
Contains the Markov cluster algorithm (MCL) by van Dongen (2000) for identifying clusters in networks and graphs. The algorithm simulates random walks on a (n x n) matrix as the adjacency matrix of a graph. It alternates an expansion step and an inflation step until an equilibrium state is reached.
}
\details{
\tabular{ll}{
Package: \tab MCL\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-03-10\cr
License: \tab   GPL-2 | GPL-3 [expanded from: GPL (= 2)]\cr
}


The Markov Cluster Algorithm (MCL) is a method to identify clusters in undirected network graphs. It is suitable for high-dimensional data (e.g. gene expression data). 

The original MCL uses the adjacency matrix of a graph (propsed by van Dongen (2000)). The function \code{mcl} in this package allows in addition the input of a (n x n) matrix.


}
\author{
Martin L. Jäger \cr

\emph{Maintainer:} Ronja Foraita <foraita@bips.uni-bremen.de> \cr
Leibniz Institute for Prevention Research and Epidemiology (BIPS) 
}
\references{
van Dongen, S.M. (2000) Graph Clustering by Flow Simulation. Ph.D. thesis, Universtiy of Utrecht. 
Utrecht University Repository: http://dspace.library.uu.nl/handle/1874/848
}
\note{
  We thank Moritz Hanke for his help in realizing this package.
}

\keyword{ ts }
\keyword{ iteration }

\examples{
### Load adjacency matrix
adjacency <- matrix(c(0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,1,1,
             0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,
             0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0), byrow=TRUE, nrow=9)

### Run MCL 
mcl(x = adjacency, addLoops = TRUE )
}
