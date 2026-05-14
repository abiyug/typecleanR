#' Conditionally convert to Date if all non-NA values match the given format
#'
#' @param x A vector
#' @param format Date format string (default "%m/%d/%Y")
#' @return Date vector or original vector
#' @export
as_date_if_all <- function(x, format = "%m/%d/%Y") {
  if (!is.character(x) && !is.factor(x)) return(x)   # ← Safety guard
  
  vals <- na.omit(x)
  if (length(vals) == 0) return(x)
  
  try_dates <- suppressWarnings(as.Date(vals, format = format))
  if (all(!is.na(try_dates))) {
    as.Date(x, format = format)
  } else {
    x
  }
}
