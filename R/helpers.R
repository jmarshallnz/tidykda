#' Wrapper around ks::kda to map y -> x.group and also check that ncol(x) <= 3
#' For ncol(x) > 3, ks::kda() does not have a separate predict() method, and while
#' We could hack it in by modifying ks::kda(), it needs a lot of data for more
#' than 3 dimensions anyway.
#'
#' Internal wrapper functions
#' @export
#' @keywords internal
#' @rdname tidykda_helpers
ks_kda_wrapper <- function(x, y, ...) {
  if (ncol(x) > 3) {
    rlang::abort("`x` should have at most 3 numeric predictors.")
  }
  args <- list(x = rlang::enquo(x), x.group = rlang::enquo(y))
  dots <- rlang::enquos(...)
  if (length(dots) > 0) {
    args <- c(args, dots)
  }
  cl <- rlang::call2("kda", .ns = "ks", !!!args)
  rlang::eval_tidy(cl)
}
