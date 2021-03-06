% Generated by roxygen2 (4.0.2): do not edit by hand
\name{h2o.deeplearning}
\alias{h2o.deeplearning}
\title{Build a Deep Neural Network}
\usage{
h2o.deeplearning(x, y, training_frame, model_id = "",
  overwrite_with_best_model, validation_frame = NULL, checkpoint = NULL,
  autoencoder = FALSE, pretrained_autoencoder = NULL,
  use_all_factor_levels = TRUE, standardize = TRUE,
  activation = c("Rectifier", "Tanh", "TanhWithDropout",
  "RectifierWithDropout", "Maxout", "MaxoutWithDropout"), hidden = c(200,
  200), epochs = 10, train_samples_per_iteration = -2,
  target_ratio_comm_to_comp = 0.05, seed, adaptive_rate = TRUE,
  rho = 0.99, epsilon = 1e-08, rate = 0.005, rate_annealing = 1e-06,
  rate_decay = 1, momentum_start = 0, momentum_ramp = 1e+06,
  momentum_stable = 0, nesterov_accelerated_gradient = TRUE,
  input_dropout_ratio = 0, hidden_dropout_ratios, l1 = 0, l2 = 0,
  max_w2 = Inf, initial_weight_distribution = c("UniformAdaptive",
  "Uniform", "Normal"), initial_weight_scale = 1, initial_weights = NULL,
  initial_biases = NULL, loss = c("Automatic", "CrossEntropy", "Quadratic",
  "Absolute", "Huber"), distribution = c("AUTO", "gaussian", "bernoulli",
  "multinomial", "poisson", "gamma", "tweedie", "laplace", "huber", "quantile"),
  quantile_alpha = 0.5, tweedie_power = 1.5, huber_alpha,
  score_interval = 5, score_training_samples, score_validation_samples,
  score_duty_cycle, classification_stop, regression_stop, stopping_rounds = 5,
  stopping_metric = c("AUTO", "deviance", "logloss", "MSE", "AUC", "r2",
  "misclassification", "mean_per_class_error"), stopping_tolerance = 0,
  max_runtime_secs = 0, quiet_mode, max_confusion_matrix_size,
  max_hit_ratio_k, balance_classes = FALSE, class_sampling_factors,
  max_after_balance_size, score_validation_sampling,
  missing_values_handling = c("MeanImputation", "Skip"), diagnostics,
  variable_importances, fast_mode, ignore_const_cols, force_load_balance,
  replicate_training_data, single_node_mode, shuffle_training_data, sparse,
  col_major, average_activation, sparsity_beta, max_categorical_features,
  categorical_encoding = c("AUTO", "Enum", "OneHotInternal", "OneHotExplicit",
  "Binary", "Eigen"), reproducible = FALSE,
  export_weights_and_biases = FALSE, offset_column = NULL,
  weights_column = NULL, nfolds = 0, fold_column = NULL,
  fold_assignment = c("AUTO", "Random", "Modulo", "Stratified"),
  keep_cross_validation_predictions = FALSE,
  keep_cross_validation_fold_assignment = FALSE)
}
\arguments{
\item{x}{A vector containing the \code{character} names of the predictors in the model.
If x is missing,then all columns except y are used.}

\item{y}{The name of the response variable in the model.}

\item{training_frame}{An H2OFrame object containing the variables in the model.}

\item{model_id}{(Optional) The unique id assigned to the resulting model. If
none is given, an id will automatically be generated.}

\item{overwrite_with_best_model}{Logical. If \code{TRUE}, overwrite the final model with the best model found during training. Defaults to \code{TRUE}.}

\item{validation_frame}{An H2OFrame object indicating the validation dataset used to construct the confusion matrix. Defaults to NULL.  If left as NULL, this defaults to the training data when \code{nfolds = 0}.}

\item{checkpoint}{"Model checkpoint (provide the model_id) to resume training with."}

\item{autoencoder}{Enable auto-encoder for model building.}

\item{pretrained_autoencoder}{Pretrained autoencoder (either key or H2ODeepLearningModel) to initialize the model state of a supervised DL model with.}

\item{use_all_factor_levels}{\code{Logical}. Use all factor levels of categorical variance.
Otherwise the first factor level is omitted (without loss of accuracy). Useful for
variable importances and auto-enabled for autoencoder.}

\item{standardize}{\code{Logical}. If enabled, automatically standardize the data. If disabled, the user must provide properly scaled input data.}

\item{activation}{A string indicating the activation function to use. Must be either "Tanh",
"TanhWithDropout", "Rectifier", "RectifierWithDropout", "Maxout", or "MaxoutWithDropout"}

\item{hidden}{Hidden layer sizes (e.g. c(100,100)).}

\item{epochs}{How many times the dataset should be iterated (streamed), can be fractional.}

\item{train_samples_per_iteration}{Number of training samples (globally) per MapReduce iteration.
Special values are: \bold{0} one epoch; \bold{-1} all available data (e.g., replicated
training data); or \bold{-2} auto-tuning (default)}

\item{target_ratio_comm_to_comp}{Target ratio of communication overhead to computation.
Only for multi-node operation and train_samples_per_iteration=-2 (auto-tuning).
Higher values can lead to faster convergence.}

\item{seed}{Seed for random numbers (affects sampling) - Note: only reproducible when running
single threaded}

\item{adaptive_rate}{\code{Logical}. Adaptive learning rate (ADAELTA).}

\item{rho}{Adaptive learning rate time decay factor (similarity to prior updates).}

\item{epsilon}{Adaptive learning rate parameter, similar to learn rate annealing during initial
training phase. Typical values are between \code{1.0e-10} and \code{1.0e-4}}

\item{rate}{Learning rate (higher => less stable, lower => slower convergence).}

\item{rate_annealing}{Learning rate annealing: \eqn{(rate)/(1 + rate_annealing*samples)}}

\item{rate_decay}{Learning rate decay factor between layers (N-th layer: \eqn{rate*\alpha^(N-1)})}

\item{momentum_start}{Initial momentum at the beginning of training (try 0.5).}

\item{momentum_ramp}{Number of training samples for which momentum increases.}

\item{momentum_stable}{Final momentum after the amp is over (try 0.99).}

\item{nesterov_accelerated_gradient}{\code{Logical}. Use Nesterov accelerated gradient
(recommended).}

\item{input_dropout_ratio}{A fraction of the features for each training row to be omitted from
training in order to improve generalization (dimension sampling).}

\item{hidden_dropout_ratios}{Hidden layer dropout ratio (can improve generalization) specify one
value per hidden layer, defaults to 0.5.}

\item{l1}{L1 regularization (can add stability and improve generalization, causes many weights to
become 0).}

\item{l2}{L2 regularization (can add stability and improve generalization, causes many weights to
be small).}

\item{max_w2}{Constraint for squared sum of incoming weights per unit (e.g. Rectifier).}

\item{initial_weight_distribution}{Can be "Uniform", "UniformAdaptive", or "Normal".}

\item{initial_weight_scale}{Uniform: -value ... value, Normal: stddev}

\item{initial_weights}{Vector of frame ids for initial weight matrices}

\item{initial_biases}{Vector of frame ids for initial bias vectors}

\item{loss}{Loss function: "Automatic", "CrossEntropy" (for classification only), "Quadratic", "Absolute"
(experimental) or "Huber" (experimental)}

\item{distribution}{A \code{character} string. The distribution function of the response.
Must be "AUTO", "bernoulli", "multinomial", "poisson", "gamma", "tweedie",
"laplace", "huber", "quantile" or "gaussian"}

\item{quantile_alpha}{Desired quantile for Quantile regression, must be between 0 and 1.}

\item{tweedie_power}{Tweedie power for Tweedie regression, must be between 1 and 2.}

\item{huber_alpha}{Desired quantile for Huber/M-regression (threshold between quadratic and linear loss, must be between 0 and 1).}

\item{score_interval}{Shortest time interval (in secs) between model scoring.}

\item{score_training_samples}{Number of training set samples for scoring (0 for all).}

\item{score_validation_samples}{Number of validation set samples for scoring (0 for all).}

\item{score_duty_cycle}{Maximum duty cycle fraction for scoring (lower: more training, higher:
more scoring).}

\item{classification_stop}{Stopping criterion for classification error fraction on training data
(-1 to disable).}

\item{regression_stop}{Stopping criterion for regression error (MSE) on training data (-1 to
disable).}

\item{stopping_rounds}{Early stopping based on convergence of stopping_metric.
Stop if simple moving average of length k of the stopping_metric does not improve
(by stopping_tolerance) for k=stopping_rounds scoring events.
Can only trigger after at least 2k scoring events. Use 0 to disable.}

\item{stopping_metric}{Metric to use for convergence checking, only for _stopping_rounds > 0
Can be one of "AUTO", "deviance", "logloss", "MSE", "AUC", "misclassification", or "mean_per_class_error".}

\item{stopping_tolerance}{Relative tolerance for metric-based stopping criterion (if relative
improvement is not at least this much, stop).}

\item{max_runtime_secs}{Maximum allowed runtime in seconds for model training. Use 0 to disable.}

\item{quiet_mode}{Enable quiet mode for less output to standard output.}

\item{max_confusion_matrix_size}{Max. size (number of classes) for confusion matrices to be shown}

\item{max_hit_ratio_k}{Max number (top K) of predictions to use for hit ratio computation (for
multi-class only, 0 to disable).}

\item{balance_classes}{Balance training data class counts via over/under-sampling (for imbalanced
data).}

\item{class_sampling_factors}{Desired over/under-sampling ratios per class (in lexicographic
order). If not specified, sampling factors will be automatically computed to obtain class
balance during training. Requires balance_classes.}

\item{max_after_balance_size}{Maximum relative size of the training data after balancing class
counts (can be less than 1.0).}

\item{score_validation_sampling}{Method used to sample validation dataset for scoring.}

\item{missing_values_handling}{Handling of missing values. Either MeanImputation (default) or Skip.}

\item{diagnostics}{Enable diagnostics for hidden layers.}

\item{variable_importances}{Compute variable importances for input features (Gedeon method) - can
be slow for large networks.}

\item{fast_mode}{Enable fast mode (minor approximations in back-propagation).}

\item{ignore_const_cols}{Ignore constant columns (no information can be gained anyway).}

\item{force_load_balance}{Force extra load balancing to increase training speed for small
datasets (to keep all cores busy).}

\item{replicate_training_data}{Replicate the entire training dataset onto every node for faster
training.}

\item{single_node_mode}{Run on a single node for fine-tuning of model parameters.}

\item{shuffle_training_data}{Enable shuffling of training data (recommended if training data is
replicated and train_samples_per_iteration is close to \eqn{numRows*numNodes}.}

\item{sparse}{Sparse data handling (more efficient for data with lots of 0 values).}

\item{col_major}{Use a column major weight matrix for input layer. Can speed up forward
propagation, but might slow down backpropagation (Experimental).}

\item{average_activation}{Average activation for sparse auto-encoder (Experimental).}

\item{sparsity_beta}{Sparsity regularization (Experimental).}

\item{max_categorical_features}{Max. number of categorical features, enforced via hashing
Experimental).}

\item{categorical_encoding}{Encoding scheme for categorical features, must be "AUTO", "Enum",}

\item{reproducible}{Force reproducibility on small data (requires setting the \code{seed} argument and this will be slow - only uses 1 thread).}

\item{export_weights_and_biases}{Whether to export Neural Network weights and biases to H2O.
Frames"}

\item{offset_column}{Specify the offset column.}

\item{weights_column}{Specify the weights column.}

\item{nfolds}{(Optional) Number of folds for cross-validation.}

\item{fold_column}{(Optional) Column with cross-validation fold index assignment per observation.}

\item{fold_assignment}{Cross-validation fold assignment scheme, if fold_column is not
specified, must be "AUTO", "Random",  "Modulo", or "Stratified".  The Stratified option will
stratify the folds based on the response variable, for classification problems.}

\item{keep_cross_validation_predictions}{Whether to keep the predictions of the cross-validation models.}

\item{keep_cross_validation_fold_assignment}{Whether to keep the cross-validation fold assignment.}

\item{...}{extra parameters to pass onto functions (not implemented)}
}
\description{
Builds a feed-forward multilayer artificial neural network on an H2OFrame
}
\examples{
\donttest{
library(h2o)
h2o.init()
iris.hex <- as.h2o(iris)
iris.dl <- h2o.deeplearning(x = 1:4, y = 5, training_frame = iris.hex)

# now make a prediction
predictions <- h2o.predict(iris.dl, iris.hex)
}
}
\seealso{
\code{\link{predict.H2OModel}} for prediction.
}

