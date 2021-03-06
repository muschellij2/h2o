% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.cut}
\alias{cut.H2OFrame}
\alias{h2o.cut}
\title{Cut H2O Numeric Data to Factor}
\usage{
h2o.cut(x, breaks, labels = NULL, include.lowest = FALSE, right = TRUE,
  dig.lab = 3, ...)

\method{cut}{H2OFrame}(x, breaks, labels = NULL, include.lowest = FALSE,
  right = TRUE, dig.lab = 3, ...)
}
\arguments{
\item{x}{An H2OFrame object with a single numeric column.}

\item{breaks}{A numeric vector of two or more unique cut points.}

\item{labels}{Labels for the levels of the resulting category. By default, labels are constructed sing "(a,b]"
interval notation.}

\item{include.lowest}{\code{Logical}, indicationg if an 'x[i]' equal to the lowest (or highest, for \code{right =
FALSE} 'breaks' value should be included}

\item{right}{/code{Logical}, indicating if the intervals should be closed on the right (opened on the left) or vice
versa.}

\item{dig.lab}{Integer which is used when labels are not given, determines the number of digits used in formatting
the break numbers.}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
Returns an H2OFrame object containing the factored data with intervals as levels.
}
\description{
Divides the range of the H2O data into intervals and codes the values according to which interval they fall in. The
leftmost interval corresponds to the level one, the next is level two, etc.
}
\examples{
\donttest{
library(h2o)
h2o.init()
irisPath <- system.file("extdata", "iris_wheader.csv", package="h2o")
iris.hex <- h2o.uploadFile(path = irisPath, destination_frame = "iris.hex")
summary(iris.hex)

# Cut sepal length column into intervals determined by min/max/quantiles
sepal_len.cut = cut(iris.hex$sepal_len, c(4.2, 4.8, 5.8, 6, 8))
head(sepal_len.cut)
summary(sepal_len.cut)
}
}

