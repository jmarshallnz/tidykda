#' Kernel discriminant analysis
#'
#' @description
#'
#' `discrim_kernel()` defines a model that estimates a multivariate
#'  distribution for the predictors separately for the data in each class
#'  non-parameterically with a kernel density estimator. Bayes' theorem is used
#'  to compute the probability of each class, given the predictor values. This
#'  function can fit classification models.
#'
#' \Sexpr[stage=render,results=rd]{parsnip:::make_engine_list("discrim_kernel")}
#'
#' More information on how \pkg{parsnip} is used for modeling is at
#' \url{https://www.tidymodels.org/}.
#'
#' @param mode A single character string for the type of model. The only
#'  possible value for this model is "classification".
#' @param engine A single character string for the engine.
#'
#' @export
discrim_kernel <- function(mode = "classification", engine = "ks") {
  # Check for correct mode
  if (mode  != "classification") {
    rlang::abort("`mode` should be 'classification'")
  }

  args <- list()

  parsnip::new_model_spec(
    "discrim_kernel",
    args = args,
    eng_args = NULL,
    mode = mode,
    method = NULL,
    engine = engine
  )
}
