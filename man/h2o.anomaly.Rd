% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.anomaly}
\alias{h2o.anomaly}
\title{Anomaly Detection via H2O Deep Learning Model}
\usage{
h2o.anomaly(object, data, per_feature = FALSE)
}
\arguments{
\item{object}{An \linkS4class{H2OAutoEncoderModel} object that represents the
model to be used for anomaly detection.}

\item{data}{An H2OFrame object.}

\item{per_feature}{Whether to return the per-feature squared reconstruction error}
}
\value{
Returns an H2OFrame object containing the
        reconstruction MSE or the per-feature squared error.
}
\description{
Detect anomalies in an H2O dataset using an H2O deep learning model with
auto-encoding.
}
\examples{
\donttest{
library(h2o)
h2o.init()
prosPath = system.file("extdata", "prostate.csv", package = "h2o")
prostate.hex = h2o.importFile(path = prosPath)
prostate.dl = h2o.deeplearning(x = 3:9, training_frame = prostate.hex, autoencoder = TRUE,
                               hidden = c(10, 10), epochs = 5)
prostate.anon = h2o.anomaly(prostate.dl, prostate.hex)
head(prostate.anon)
prostate.anon.per.feature = h2o.anomaly(prostate.dl, prostate.hex, per_feature=TRUE)
head(prostate.anon.per.feature)
}
}
\seealso{
\code{\link{h2o.deeplearning}} for making an H2OAutoEncoderModel.
}

