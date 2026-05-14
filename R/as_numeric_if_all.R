#' Conditionally convert to numeric if all non-NA values appear numeric
#'
#' @param x A vector
#' @return Numeric vector or original vector unchanged
#' @export
as_numeric_if_all <- function(x) {
  vals <- na.omit(x)
  if (length(vals) == 0) return(x)
  if (all(grepl("^\\s*-?\\d+(\\.\\d+)?\\s*$", vals))) {
    as.numeric(x)
  } else {
    x
  }
}
