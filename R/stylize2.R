#' Stylize Numeric Values with Custom Rules (Aiming for 2 Decimals)
#'
#' This function stylizes numeric values according to a set of custom rules.
#' It rounds values to 2 decimal places unless they round to a smaller digit,
#' and values less than 0.001 are expressed as "<0.001".
#'
#' @param x Numeric value to be stylized.
#'
#' @return A character string representing the stylized value.
#' @export
#'
#' @examples
#' stylize2(-0.05)
#' # Returns: "-0.05"
#'
#' stylize2(0.002)
#' # Returns: "0.00"
#'
#' stylize2(0.0005)
#' # Returns: "<0.001"
#'
#' @author Ville Langén
stylize2 <- function(x) {
  case_when(
    x < -0.01 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),

    x >= -0.01 & x <= -0.001 & round_half_up(x, 2) == "-0.01"
    ~ as.character(format(round_half_up(x, 2), nsmall = 2)),

    x >= -0.01 & x <= -0.001 & round_half_up(x, 2) != "-0.01"
    ~ as.character(format(round_half_up(x, 3), nsmall = 3)),

    x > -0.001 & x < 0 ~ "-<0.001",
    x == 0 ~ "0.00",
    x >= 0 & x < 0.001 ~ "<0.001",

    x >= 0.001 & x < 0.005 ~ as.character(format(round_half_up(x, 3), nsmall = 3)),

    x >= 0.005 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),

    TRUE ~ "other"
  )
}
