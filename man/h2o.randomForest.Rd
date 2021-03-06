% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.randomForest}
\alias{h2o.randomForest}
\title{Build a Big Data Random Forest Model}
\usage{
h2o.randomForest(x, y, training_frame, model_id, validation_frame = NULL,
  ignore_const_cols = TRUE, checkpoint, mtries = -1,
  col_sample_rate_change_per_level = 1, sample_rate = 0.632,
  sample_rate_per_class, col_sample_rate_per_tree = 1,
  build_tree_one_node = FALSE, ntrees = 50, max_depth = 20,
  min_rows = 1, nbins = 20, nbins_top_level = 1024, nbins_cats = 1024,
  binomial_double_trees = FALSE, balance_classes = FALSE,
  class_sampling_factors, max_after_balance_size = 5, seed,
  offset_column = NULL, weights_column = NULL, nfolds = 0,
  fold_column = NULL, fold_assignment = c("AUTO", "Random", "Modulo",
  "Stratified"), keep_cross_validation_predictions = FALSE,
  keep_cross_validation_fold_assignment = FALSE,
  score_each_iteration = FALSE, score_tree_interval = 0,
  stopping_rounds = 0, stopping_metric = c("AUTO", "deviance", "logloss",
  "MSE", "AUC", "misclassification", "mean_per_class_error"),
  stopping_tolerance = 0.001, max_runtime_secs = 0,
  min_split_improvement = 1e-05, histogram_type = c("AUTO",
  "UniformAdaptive", "Random", "QuantilesGlobal", "RoundRobin"),
  categorical_encoding = c("AUTO", "Enum", "OneHotInternal", "OneHotExplicit",
  "Binary", "Eigen"))
}
\arguments{
\item{x}{A vector containing the names or indices of the predictor variables
to use in building the RF model. If x is missing,then all columns except y are used.}

\item{y}{The name or index of the response variable. If the data does not
contain a header, this is the column index number starting at 1, and
increasing from left to right. (The response must be either an integer
or a categorical variable).}

\item{training_frame}{An H2OFrame object containing the
variables in the model.}

\item{model_id}{(Optional) The unique id assigned to the resulting model. If
none is given, an id will automatically be generated.}

\item{validation_frame}{An H2OFrame object containing the variables in the model.  Default is NULL.}

\item{ignore_const_cols}{A logical value indicating whether or not to ignore all the constant columns in the training frame.}

\item{checkpoint}{"Model checkpoint (provide the model_id) to resume training with."}

\item{mtries}{Number of variables randomly sampled as candidates at each split.
If set to -1, defaults to sqrt{p} for classification, and p/3 for regression,
where p is the number of predictors.}

\item{col_sample_rate_change_per_level}{Relative change of the column sampling rate for every level (from 0.0 to 2.0).  Default is 1.}

\item{sample_rate}{Row sample rate per tree (from \code{0.0} to \code{1.0}).  Default is 0.632.}

\item{sample_rate_per_class}{Row sample rate per tree per class (one per class, from \code{0.0} to \code{1.0}).}

\item{col_sample_rate_per_tree}{Column sample rate per tree (from \code{0.0} to \code{1.0}).  Default is 1.}

\item{build_tree_one_node}{Run on one node only; no network overhead but
fewer cpus used.  Suitable for small datasets.  Default is \code{FALSE}.}

\item{ntrees}{A nonnegative integer that determines the number of trees to grow.  Default is 50.}

\item{max_depth}{Maximum depth to grow the tree.  Default is 5.}

\item{min_rows}{Minimum number of rows to assign to teminal nodes.  Default is 10.}

\item{nbins}{For numerical columns (real/int), build a histogram of (at least) this many bins, then split at the best point.  Default is 20.}

\item{nbins_top_level}{For numerical columns (real/int), build a histogram of (at most) this many bins at the root
level, then decrease by factor of two per level.  Default is 1024.}

\item{nbins_cats}{For categorical columns (factors), build a histogram of this many bins, then split at the best point.
Higher values can lead to more overfitting.  Default is 1024.}

\item{binomial_double_trees}{For binary classification: Build 2x as many trees (one per class) - can lead to higher accuracy.  Default is \code{FALSE}.}

\item{balance_classes}{logical, indicates whether or not to balance training data class
counts via over/under-sampling (for imbalanced data).  Default is \code{FALSE}.}

\item{class_sampling_factors}{Desired over/under-sampling ratios per class (in lexicographic
order). If not specified, sampling factors will be automatically computed to obtain class
balance during training. Requires balance_classes.}

\item{max_after_balance_size}{Maximum relative size of the training data after balancing class counts (can be less
than 1.0). Ignored if balance_classes is FALSE, which is the default behavior.  Default is 5.}

\item{seed}{Seed for random numbers (affects sampling) - Note: only
reproducible when running single threaded.}

\item{offset_column}{Specify the offset column.  Defaults to \code{NULL}.}

\item{weights_column}{Specify the weights column.  Defaults to \code{NULL}.}

\item{nfolds}{(Optional) Number of folds for cross-validation.  Default is 0 (no cross-validation).}

\item{fold_column}{(Optional) Column with cross-validation fold index assignment per observation.  Defaults to NULL.}

\item{fold_assignment}{Cross-validation fold assignment scheme, if fold_column is not
specified, must be "AUTO", "Random",  "Modulo", or "Stratified".  The Stratified option will
stratify the folds based on the response variable, for classification problems.}

\item{keep_cross_validation_predictions}{Whether to keep the predictions of the cross-validation models.  Default is \code{FALSE}.}

\item{keep_cross_validation_fold_assignment}{Whether to keep the cross-validation fold assignment.  Default is \code{FALSE}.}

\item{score_each_iteration}{Attempts to score each tree.  Default is \code{FALSE}.}

\item{score_tree_interval}{Score the model after every so many trees. Default is 0 (disabled).}

\item{stopping_rounds}{Early stopping based on convergence of stopping_metric.  Default is 0 (disabled).
Stop if simple moving average of length k of the stopping_metric does not improve
(by stopping_tolerance) for k=stopping_rounds scoring events.
Can only trigger after at least 2k scoring events.}

\item{stopping_metric}{Metric to use for convergence checking, only for _stopping_rounds > 0
Can be one of "AUTO", "deviance", "logloss", "MSE", "AUC", "misclassification", or "mean_per_class_error".}

\item{stopping_tolerance}{Relative tolerance for metric-based stopping criterion (if relative
improvement is not at least this much, stop).  Default is 0.001.}

\item{max_runtime_secs}{Maximum allowed runtime in seconds for model training. Default is 0 (disabled).}

\item{min_split_improvement}{Minimum relative improvement in squared error reduction for a split to happen.  Default is 1e-5 and the value must be >=0.}

\item{histogram_type}{What type of histogram to use for finding optimal split points
Can be one of "AUTO", "UniformAdaptive", "Random", "QuantilesGlobal" or "RoundRobin". Note that H2O supports
extremely randomized trees with the "Random" option.}

\item{categorical_encoding}{Encoding scheme for categorical features
Can be one of "AUTO", "Enum", "OneHotInternal", "OneHotExplicit", "Binary", "Eigen". Default is "AUTO", which is "Enum".}
}
\value{
Creates a \linkS4class{H2OModel} object of the right type.
}
\description{
Builds a Random Forest Model on an H2OFrame
}
\seealso{
\code{\link{predict.H2OModel}} for prediction.
}

