#' Lenient datetime parsing using lubridate::parse_date_time
#'
#' @param x A vector
#' @param orders Character vector of date orders
#' @return POSIXct vector or original vector
#' @export
as_datetime_lenient <- function(x, orders = c("mdy", "ymd", "dmy", "Ymd", "mdY")) {
  if (!is.character(x) && !is.factor(x)) return(x)   # ← Safety guard
  
  vals <- na.omit(x)
  if (length(vals) == 0) return(x)
  
  parsed <- suppressWarnings(lubridate::parse_date_time(x, orders = orders, tz = "UTC"))
  if (any(!is.na(parsed))) {
    parsed
  } else {
    x
  }
}
