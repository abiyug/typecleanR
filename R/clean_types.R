#' Intelligently clean types across all columns in one step
#'
#' Safe order: numeric → logical → date → datetime (only on remaining characters)
#'
#' @param .data A data frame or tibble
#' @param ... Arguments passed to individual cleaning functions
#' @return A tibble with cleaned column types
#' @export
clean_types <- function(.data, ...) {
  .data %>%
    # Numeric first (safest)
    mutate(across(everything(), as_numeric_if_all)) %>%
    # Logical
    mutate(across(everything(), as_logical_if_all)) %>%
    # Strict Date
    mutate(across(everything(), ~ as_date_if_all(., ...))) %>%
    # Lenient datetime only on remaining character columns
    mutate(across(where(is.character), ~ as_datetime_lenient(., ...)))
}
