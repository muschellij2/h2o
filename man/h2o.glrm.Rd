% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.glrm}
\alias{h2o.glrm}
\title{Generalized Low Rank Model}
\usage{
h2o.glrm(training_frame, cols, k, model_id, validation_frame, loading_name,
  ignore_const_cols, transform = c("NONE", "DEMEAN", "DESCALE", "STANDARDIZE",
  "NORMALIZE"), loss = c("Quadratic", "L1", "Huber", "Poisson", "Hinge",
  "Logistic"), multi_loss = c("Categorical", "Ordinal"), loss_by_col = NULL,
  loss_by_col_idx = NULL, regularization_x = c("None", "Quadratic", "L2",
  "L1", "NonNegative", "OneSparse", "UnitOneSparse", "Simplex"),
  regularization_y = c("None", "Quadratic", "L2", "L1", "NonNegative",
  "OneSparse", "UnitOneSparse", "Simplex"), gamma_x = 0, gamma_y = 0,
  max_iterations = 1000, max_updates = 2 * max_iterations,
  init_step_size = 1, min_step_size = 0.001, init = c("Random",
  "PlusPlus", "SVD"), svd_method = c("GramSVD", "Power", "Randomized"),
  user_y = NULL, user_x = NULL, expand_user_y = TRUE,
  impute_original = FALSE, recover_svd = FALSE, seed,
  max_runtime_secs = 0)
}
\arguments{
\item{training_frame}{An H2OFrame object containing the
variables in the model.}

\item{cols}{(Optional) A vector containing the data columns on
which k-means operates.}

\item{k}{The rank of the resulting decomposition. This must be
between 1 and the number of columns in the training frame, inclusive.}

\item{model_id}{(Optional) The unique id assigned to the resulting model.
If none is given, an id will automatically be generated.}

\item{validation_frame}{An H2OFrame object containing the
variables in the model.}

\item{loading_name}{(Optional) The unique name assigned to the loading matrix X
in the XY decomposition. Automatically generated if none is provided.}

\item{ignore_const_cols}{(Optional) A logical value indicating whether to ignore
constant columns in the training frame. A column is constant if all of its
non-missing values are the same value.}

\item{transform}{A character string that indicates how the training data
should be transformed before running PCA. Possible values are "NONE":
for no transformation, "DEMEAN": for subtracting the mean of each
column, "DESCALE": for dividing by the standard deviation of each
column, "STANDARDIZE": for demeaning and descaling, and "NORMALIZE":
for demeaning and dividing each column by its range (max - min).}

\item{loss}{A character string indicating the default loss function for numeric columns.
Possible values are "Quadratic" (default), "L1", "Huber", "Poisson", "Hinge"
and "Logistic".}

\item{multi_loss}{A character string indicating the default loss function for enum columns.
Possible values are "Categorical" and "Ordinal".}

\item{loss_by_col}{A vector of strings indicating the loss function for specific
columns by corresponding index in loss_by_col_idx. Will override loss for
numeric columns and multi_loss for enum columns.}

\item{loss_by_col_idx}{A vector of column indices to which the corresponding loss
functions in loss_by_col are assigned. Must be zero indexed.}

\item{regularization_x}{A character string indicating the regularization function for
the X matrix. Possible values are "None" (default), "Quadratic", "L2", "L1",
"NonNegative", "OneSparse", "UnitOneSparse", and "Simplex".}

\item{regularization_y}{A character string indicating the regularization function for
the Y matrix. Possible values are "None" (default), "Quadratic", "L2", "L1",
"NonNegative", "OneSparse", "UnitOneSparse", and "Simplex".}

\item{gamma_x}{The weight on the X matrix regularization term.}

\item{gamma_y}{The weight on the Y matrix regularization term.}

\item{max_iterations}{The maximum number of iterations to run the optimization loop.
Each iteration consists of an update of the X matrix, followed by an update
of the Y matrix.}

\item{max_updates}{The maximum number of updates of X or Y to run. Each update consists
of an update of either the X matrix or the Y matrix. For example, if max_updates = 1
and max_iterations = 1, the algorithm will initialize X and Y, update X once, and
terminate without updating Y.}

\item{init_step_size}{Initial step size. Divided by number of columns in the training
frame when calculating the proximal gradient update. The algorithm begins at
init_step_size and decreases the step size at each iteration until a
termination condition is reached.}

\item{min_step_size}{Minimum step size upon which the algorithm is terminated.}

\item{init}{A character string indicating how to select the initial Y matrix.
Possible values are "Random": for initialization to a random array from the
standard normal distribution, "PlusPlus": for initialization using the clusters
from k-means++ initialization, or "SVD": for initialization using the
first k right singular vectors. Additionally, the user may specify the
initial Y as a matrix, data.frame, H2OFrame, or list of vectors.}

\item{svd_method}{(Optional) A character string that indicates how SVD should be
calculated during initialization. Possible values are "GramSVD": distributed
computation of the Gram matrix followed by a local SVD using the JAMA package,
"Power": computation of the SVD using the power iteration method, "Randomized":
(default) approximate SVD by projecting onto a random subspace (see references).}

\item{user_y}{(Optional) A matrix, data.frame, H2OFrame, or list of vectors specifying the
initial Y. Only used when init = "User". The number of rows must equal k.}

\item{user_x}{(Optional) A matrix, data.frame, H2OFrame, or list of vectors specifying the
initial X. Only used when init = "User". The number of columns must equal k.}

\item{expand_user_y}{A logical value indicating whether the categorical columns of user_y
should be one-hot expanded. Only used when init = "User" and user_y is specified.}

\item{impute_original}{A logical value indicating whether to reconstruct the original training
data by reversing the transformation during prediction. Model metrics are calculated
with respect to the original data.}

\item{recover_svd}{A logical value indicating whether the singular values and eigenvectors
should be recovered during post-processing of the generalized low rank decomposition.}

\item{seed}{(Optional) Random seed used to initialize the X and Y matrices.}

\item{max_runtime_secs}{Maximum allowed runtime in seconds for model training. Use 0 to disable.}
}
\value{
Returns an object of class \linkS4class{H2ODimReductionModel}.
}
\description{
Generalized low rank decomposition of an H2O data frame.
}
\examples{
\donttest{
library(h2o)
h2o.init()
ausPath <- system.file("extdata", "australia.csv", package="h2o")
australia.hex <- h2o.uploadFile(path = ausPath)
h2o.glrm(training_frame = australia.hex, k = 5, loss = "Quadratic", regularization_x = "L1",
         gamma_x = 0.5, gamma_y = 0, max_iterations = 1000)
}
}
\references{
M. Udell, C. Horn, R. Zadeh, S. Boyd (2014). {Generalized Low Rank Models}[http://arxiv.org/abs/1410.0342]. Unpublished manuscript, Stanford Electrical Engineering Department.
            N. Halko, P.G. Martinsson, J.A. Tropp. {Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions}[http://arxiv.org/abs/0909.4061]. SIAM Rev., Survey and Review section, Vol. 53, num. 2, pp. 217-288, June 2011.
}
\seealso{
\code{\link{h2o.kmeans}, \link{h2o.svd}}, \code{\link{h2o.prcomp}}
}

