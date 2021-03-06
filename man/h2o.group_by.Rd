% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.group_by}
\alias{h2o.group_by}
\title{Group and Apply by Column}
\usage{
h2o.group_by(data, by, ..., gb.control = list(na.methods = NULL, col.names =
  NULL))
}
\arguments{
\item{data}{an H2OFrame object.}

\item{by}{a list of column names}

\item{gb.control}{a list of how to handle \code{NA} values in the dataset as well as how to name
output columns. See \code{Details:} for more help.}

\item{\dots}{any supported aggregate function.}
}
\value{
Returns a new H2OFrame object with columns equivalent to the number of
        groups created
}
\description{
Performs a group by and apply similar to ddply.
}
\details{
In the case of \code{na.methods} within \code{gb.control}, there are three possible settings.
\code{"all"} will include \code{NAs} in computation of functions. \code{"rm"} will completely
remove all \code{NA} fields. \code{"ignore"} will remove \code{NAs} from the numerator but keep
the rows for computational purposes. If a list smaller than the number of columns groups is
supplied, the list will be padded by \code{"ignore"}.

Similar to \code{na.methods}, \code{col.names} will pad the list with the default column names if
the length is less than the number of colums groups supplied.
}

