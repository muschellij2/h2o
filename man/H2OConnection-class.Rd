% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{class}
\name{H2OConnection-class}
\alias{H2OConnection}
\alias{H2OConnection-class}
\alias{show,H2OConnection-method}
\title{The H2OConnection class.}
\usage{
\S4method{show}{H2OConnection}(object)
}
\arguments{
\item{object}{an \code{H2OConnection} object.}
}
\description{
This class represents a connection to an H2O cloud.
}
\details{
Because H2O is not a master-slave architecture, there is no restriction on which H2O node
is used to establish the connection between R (the client) and H2O (the server).

A new H2O connection is established via the h2o.init() function, which takes as parameters
the `ip` and `port` of the machine running an instance to connect with. The default behavior
is to connect with a local instance of H2O at port 54321, or to boot a new local instance if one
is not found at port 54321.
}
\section{Slots}{

\describe{
\item{\code{ip}}{A \code{character} string specifying the IP address of the H2O cloud.}

\item{\code{port}}{A \code{numeric} value specifying the port number of the H2O cloud.}

\item{\code{proxy}}{A \code{character} specifying the proxy path of the H2O cloud.}

\item{\code{https}}{Set this to TRUE to use https instead of http.}

\item{\code{insecure}}{Set this to TRUE to disable SSL certificate checking.}

\item{\code{username}}{Username to login with.}

\item{\code{password}}{Password to login with.}

\item{\code{cluster_id}}{Cluster to login to. Used for Steam connections}

\item{\code{cookies}}{Cookies to add to request}

\item{\code{mutable}}{An \code{H2OConnectionMutableState} object to hold the mutable state for the H2O connection.}
}}

