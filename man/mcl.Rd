\name{mcl}
\alias{mcl}
\encoding{UTF-8} 
\title{
Markov Cluster Algorithm
}
\description{
Perform the Markov Cluster Algorithm on an adjacency or (n x n) matrix.}
\usage{
mcl(x, addLoops = NULL, expansion = 2, inflation = 2, allow1 = FALSE, 
       max.iter = 100, ESM = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an adjacency or (n x n) matrix 
}
  \item{addLoops}{
logical; if \code{TRUE}, self-loops with weight 1 are added to each vertex of \code{x} (see Details).
}
  \item{expansion}{
numeric value > 1 for the expansion parameter
}
  \item{inflation}{
numeric value > 0 for the inflation power coefficient
}
  \item{allow1}{
logical; if \code{TRUE}, vertices are allowed to form their own cluster. If \code{FALSE}, clusters of size 1 are interpreted as background noise and grouped in one cluster.
}
  \item{max.iter}{
 an interger, the maximum number of iterations for the MCL
}
  \item{ESM}{
 logical whether the equilibrium state matrix should be returned (default is \code{FALSE})
}
}
\details{
The adjacency or correlation matrix \code{x} is clustered by the Markov Cluster algorithm. The algorihtm is controlled by the expansion parameter and the inflation power coefficient (for further details, see reference below). Adding self-loops is necessary, if either \code{x} contains at least one vertex of degree 0 or \code{x} represents a directed, non-bipartite graph adjacency matrix (i.e. the upper or lower matrix of \code{x} contains only zeros).
}
\value{
\item{K}{the number of clusters}
\item{n.iterations}{the number of iterations}
\item{Cluster}{a vector of integers indicating the cluster to which each vertex is allocated}
\item{Equilibrium.state.matrix}{a matrix; rows contain clusters}
}
\references{
van Dongen, S.M. (2000) Graph Clustering by Flow Simulation. Ph.D. thesis, Universtiy of Utrecht. 
Utrecht University Repository: http://dspace.library.uu.nl/handle/1874/848
}
\author{
Martin L. Jäger
}
\note{
If an error occurs, \code{mcl} returns the number of the last iteration. If an error occurs at iteration 1, there might be a problem with the matrix \code{x}. If an error occurs at iteration \code{max.iter}, \code{x} could not be transformed into an equilibrium state matrix.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
### Generate adjacency matrix of undirected graph
adjacency <- matrix(c(0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,1,1,
                      0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,
                      0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,
                      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), 
                      byrow=TRUE, nrow=9)

### Plot graph (requires package igraph) 
# library(igraph)
# gu <- graph.adjacency( adjacency, mode="undirected" )
# plot( gu )

### Run MCL
mcl(x = adjacency, addLoops=TRUE, ESM = TRUE)

### Allow clusters of size 1
mcl(x = adjacency, addLoops = TRUE, allow1 = TRUE)

### Error: Small inflation coefficient prevents that an 
###        equilibrium state matrix is reached within 100 iterations
mcl(x = adjacency, addLoops=TRUE, inflation = 1.01, max.iter = 100)


### Generate adjacency matrix of directed graph
dgr <- matrix(0,nrow = 10,ncol = 10)
dgr[2:3,1] <- 1; dgr[3:4,2] <- 1; dgr[5:6,4] <- 1
dgr[6:7,5] <- 1; dgr[8:9,7] <- 1; dgr[10,8:9] <- 1

### Plot graph (requires package igraph) 
# library( igraph )
# gd <- graph.adjacency( dgr )
# plot( gd )

### Directed graphs require self-loops!
mcl(x = dgr, addLoops = TRUE)

}

\keyword{graphs}
\keyword{cluster}