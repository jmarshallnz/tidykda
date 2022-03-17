#' @importFrom rlang enquos
#' @importFrom parsnip set_new_model

# ------------------------------------------------------------------------------

utils::globalVariables(c("x", "y"))

# ------------------------------------------------------------------------------

# The functions below define the model information. These access the model
# environment inside of parsnip so they have to be executed once parsnip has
# been loaded.

.onLoad <- function(libname, pkgname) {
  # This defines discrim_kernel in the model database
  make_discrim_kernel_ks()
}
