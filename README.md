# tablestylizer: R Package for Styling and Formatting Tables


## Overview

The `tablestylizer` R package provides a set of functions for styling and formatting tables, making them more suitable for publication. It is designed to enhance the visual appeal and clarity of tables generated in R.


## Key Features

#### `stylize_tableone()` function:
- Processes a `tableone` object to a lean, more publication-ready format.
- Converts rownames to column names, transfers percentage symbols, and removes unnecessary symbols.
- If a p-value column is present, it is processed using the `stylize_p()` function.


#### `stylize_p()` function:
- Rounds and formats p-values for improved readability.
- The function aims to round values to 2 decimal places whenever feasible.
- Values less than 0.001 are expressed as "<0.001".
- Specifically avoids outputting "0.05", as this value may not hold practical meaning for the reader when the significance level (alpha) is set at 0.05.
- If the round result is equal to "0.050", the original value is given without any rounding.
- If the original value (prior to rounding) is equal to 0.050, the original value is given without any rounding.

##### Usage:
```R
stylize_p(0.05795)  # Returns: "0.06"
stylize_p(0.0499)   # Returns: "0.0499"
stylize_p(0.002)    # Returns: "0.002"
stylize_p(0.0005)   # Returns: "<0.001"
```


#### `stylize1()` function:
- Stylizes numeric values according to a set of custom rules.
- Rounds values to 1 decimal place unless they round to a smaller digit.
- Optional parameter to specify a threshold for displaying values as "<threshold".
- Very large or small values are expressed as powers of 10.

##### Usage:
```R
stylize1(-0.05)   # Returns: "-0.1"
stylize1(0.002)   # Returns: "0.002"
stylize1(0.0005, 0.001)  # Returns: "<0.001"
```


#### `stylize2()` function:
- Similar to `stylize1()`, this function stylizes numeric values according to custom rules, but aiming for 2 decimal places.
- Very large or small values are expressed as powers of 10.
- Optional parameter to specify a threshold for displaying values as "<threshold".

##### Usage:
```R
stylize2(-0.05)   # Returns: "-0.10"
stylize2(0.002)   # Returns: "0.002"
stylize2(0.0005, 0.001)  # Returns: "<0.001"
```


## Installation

```R
# Install the development version from GitHub
devtools::install_github("vljlangen/tablestylizer")
```
