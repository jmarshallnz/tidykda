# These functions define the kernel discriminant analysis model. They are executed when
# this package is loaded via `.onLoad()` and modify the parsnip package's
# model environment.

make_discrim_kernel_ks <- function() {

  parsnip::set_new_model("discrim_kernel")
  parsnip::set_model_mode(model = "discrim_kernel", mode = "classification")
  parsnip::set_model_engine("discrim_kernel", mode = "classification", eng = "ks")
  parsnip::set_dependency("discrim_kernel", "ks", "ks")
  parsnip::set_dependency("discrim_kernel", "ks", "tidykda")

  parsnip::set_fit(
    model = "discrim_kernel",
    eng = "ks",
    mode = "classification",
    value = list(
      interface = "data.frame",
      protect = c("x", "y"),
      func = c(pkg = "tidykda", fun = "ks_kda_wrapper"),
      defaults = list()
    )
  )

  parsnip::set_encoding(
    model = "discrim_kernel",
    eng = "ks",
    mode = "classification",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )

  parsnip::set_pred(
    model = "discrim_kernel",
    eng = "ks",
    mode = "classification",
    type = "class",
    value = list(
      pre = NULL,
      post = NULL,
      func = c(fun = "predict"),
      args =
        list(
          object = quote(object$fit),
          x = quote(new_data)
        )
    )
  )
}
