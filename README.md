# tablestylizer: R Package for Styling and Formatting Tables


## Overview

The `tablestylizer` R package provides a set of functions for styling and formatting tables, making them more suitable for publication. It is designed to enhance the visual appeal and clarity of tables generated in R.

## Key Features

- **`stylize_tableone` Function:**
  - Processes a `tableone` object to a lean, more publication-ready format.
  - Converts rownames to column names, transfers percentage symbols, and removes unnecessary symbols.
  - If a p-value column is present, it is processed using the `stylize_p` function.


- **`stylize_p` Function:**
  - Rounds and formats p-values for improved readability.
  - If the round result is equal to "0.050", the original value is given without any rounding.
  - If the original value (prior to rounding) is equal to 0.050, the original value is given without any rounding.
  - The function aims to round values to 2 decimal places whenever feasible.
  - Values less than 0.001 are expressed as "<0.001".


- **`stylize1` Function:**
  - Stylizes numeric values according to a set of custom rules.
  - Rounds values to 1 decimal place unless they round to a smaller digit.
  - Values less than 0.001 are expressed as "<0.001".

- **`stylize2` Function:**
  - Stylizes numeric values with a focus on rounding to 2 decimal places when feasible.
  - Follows specific rules for improved readability.

## Installation

```R
# Install the development version from GitHub
devtools::install_github("vljlangen/tablestylizer")
