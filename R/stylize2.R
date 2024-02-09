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
stylize2 <- function(x, threshold = NULL) {
  case_when(

    # Add a condition to handle values below the threshold
    !is.null(threshold) && x < threshold & x > 0 ~ paste0("<",as.character(threshold)),

    # Same for negative values
    !is.null(threshold) && x > -threshold & x < 0 ~ paste0(">-",as.character(threshold)),



    x < 0 & x > -0.0000005 ~ {
      formatted_value <- sprintf("%.1e", x)
      formatted_value <- gsub("e", "x10e", formatted_value)
      # Remove leading zero after 'x10^' and handle the minus sign
      formatted_value <- gsub("x10e-0", "x10-", formatted_value)
      formatted_value <- gsub("x10e", "x10", formatted_value)
      formatted_value
    },

    x > -0.000005 & x <= -0.0000005 ~ as.character(sprintf("%.6f", round_half_up(x, 6))),
    x > -0.00005 & x <= -0.000005 ~ as.character(sprintf("%.5f", round_half_up(x, 5))),
    x > -0.0005 & x <= -0.00005 ~ as.character(sprintf("%.4f", round_half_up(x, 4))),
    x > -0.005 & x <= -0.0005 ~ as.character(format(round_half_up(x, 3))),
    x > -0.05 & x <= -0.005 ~ as.character(format(round_half_up(x, 2))),
    x <= -0.05 & x > -99999.995 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),

    x <= -99999.995 ~ {
      formatted_value <- sprintf("%.2e", x)
      formatted_value <- gsub("e", "x10e", formatted_value)
      # Remove leading zero after 'x10^' and handle the minus sign
      formatted_value <- gsub("x10e\\+0", "x10+", formatted_value)
      formatted_value
    },

    x == 0 ~ "0.00",

    x > 0 & x < 0.0000005 ~ {
      formatted_value <- sprintf("%.1e", x)
      formatted_value <- gsub("e", "x10e", formatted_value)
      # Remove leading zero after 'x10^' and handle the minus sign
      formatted_value <- gsub("x10e-0", "x10-", formatted_value)
      formatted_value <- gsub("x10e", "x10", formatted_value)
      formatted_value
    },

    x >= 0.0000005 & x < 0.000005 ~ as.character(sprintf("%.6f", round_half_up(x, 6))),
    x >= 0.000005 & x < 0.00005 ~ as.character(sprintf("%.5f", round_half_up(x, 5))),
    x >= 0.00005 & x < 0.0005 ~ as.character(sprintf("%.4f", round_half_up(x, 4))),
    x >= 0.0005 & x < 0.005 ~ as.character(format(round_half_up(x, 3))),
    x >= 0.005 & x < 0.05 ~ as.character(format(round_half_up(x, 2))),
    x >= 0.05  & x < 99999.995 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),


    x >= 99999.995 ~ {
      formatted_value <- sprintf("%.2e", x)
      formatted_value <- gsub("e", "x10e", formatted_value)
      # Remove leading zero after 'x10^' and handle the minus sign
      formatted_value <- gsub("x10e\\+0", "x10+", formatted_value)
      formatted_value
    },

    TRUE ~ "other"
  #
  #   x < -0.01 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),
  #
  #   x >= -0.01 & x <= -0.001 & round_half_up(x, 2) == "-0.01"
  #   ~ as.character(format(round_half_up(x, 2), nsmall = 2)),
  #
  #   x >= -0.01 & x <= -0.001 & round_half_up(x, 2) != "-0.01"
  #   ~ as.character(format(round_half_up(x, 3), nsmall = 3)),
  #
  #   x > -0.001 & x < 0 ~ "-<0.001",
  #   x == 0 ~ "0.00",
  #   x >= 0 & x < 0.001 ~ "<0.001",
  #
  #   x >= 0.001 & x < 0.005 ~ as.character(format(round_half_up(x, 3), nsmall = 3)),
  #
  #   x >= 0.005 ~ as.character(format(round_half_up(x, 2), nsmall = 2)),
  #
  #   TRUE ~ "other"
  # )
  )
}
