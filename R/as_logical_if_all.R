#' Conditionally convert to logical (supports TRUE/FALSE/T/F/Yes/No/Y/N)
#'
#' @param x A vector
#' @return Logical vector or original vector
#' @export
as_logical_if_all <- function(x) {
  vals <- na.omit(x)
  if (length(vals) == 0) return(x)
  upper <- toupper(vals)
  if (all(upper %in% c("TRUE", "FALSE", "T", "F", "YES", "NO", "Y", "N"))) {
    as.logical(upper %in% c("TRUE", "T", "YES", "Y"))
  } else {
    x
  }
}
