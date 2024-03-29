#' Round and Format Numeric Values for Improved Readability
#'
#' This function takes a numeric value and rounds/formats it according to specific rules
#' to improve readability, especially when used for p-values in statistical outputs.
#' The function aims to round values to 2 decimal places whenever feasible.
#' Specifically avoids outputting "0.05", as this value may not hold practical meaning for the reader when the significance level (alpha) is set at 0.05.
#' If the round result is equal to "0.050", the original value is given without any rounding.
#' If the original value (prior to rounding) is equal to 0.050, the original value is given without any rounding.
#' Values less than 0.001 are expressed as "<0.001".
#'
#' @param x Numeric value to be rounded and formatted.
#'
#' @return A character string representing the rounded and formatted value.
#' @export
#'
#' @examples
#' stylize_p(0.0499)
#' # Returns: "0.0499"
#'
#' stylize_p(0.002)
#' # Returns: "0.002"
#'
#' stylize_p(0.0005)
#' # Returns: "<0.001"
#'
#' @author Ville Langén
stylize_p <- function(x) {
  case_when(
    x < 0.001 ~ "<0.001",
    x == 0.050 ~ "0.050",
    x >= 0.001 & x < 0.005 ~ as.character(format(round_half_up(x, 3), nsmall = 3)),

    x >= 0.005 & x < 0.045 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),

    x >= 0.045 & x < 0.055 & ((as.character(format(round_half_up(x, 3), nsmall = 3)) == "0.050")) ~ as.character(x),

    x >= 0.045 & x < 0.055 ~ as.character(format(round_half_up(x, 3), nsmall = 3)),
    x >= 0.055 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),
    TRUE ~ "other"
  )
}
