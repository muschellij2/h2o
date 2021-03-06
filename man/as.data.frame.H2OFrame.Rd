% Generated by roxygen2 (4.0.2): do not edit by hand
\name{as.data.frame.H2OFrame}
\alias{as.data.frame.H2OFrame}
\title{Converts parsed H2O data into an R data frame}
\usage{
\method{as.data.frame}{H2OFrame}(x, ...)
}
\arguments{
\item{x}{An H2OFrame object.}

\item{...}{Further arguments to be passed down from other methods.}
}
\description{
Downloads the H2O data and then scans it in to an R data frame.
}
\examples{
\donttest{
h2o.init()
prosPath <- system.file("extdata", "prostate.csv", package="h2o")
prostate.hex <- h2o.uploadFile(path = prosPath)
as.data.frame(prostate.hex)
}
}

