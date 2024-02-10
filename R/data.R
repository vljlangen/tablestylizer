#' Example Dataset with Imaginary Demographic Data for Practicing with the tablestylizer Package
#'
#' This dataset provides an example of fictional data related to a group of individuals.
#' It includes information such as age, sex, height, coffee preferences, favorite color, and group affiliation.
#'
#' @format A tibble with 20 rows and 7 variables:
#' \describe{
#'   \item{ID}{Unique identifier for each individual.}
#'   \item{Age (years)}{Age of the individuals in years.}
#'   \item{Women}{Indicates whether the individual is female (Yes) or not (No).}
#'   \item{Height (inches)}{Height of the individuals in inches.}
#'   \item{Likes coffee}{Individuals' preference for coffee (Yes or No).}
#'   \item{Favorite color}{Favorite color of the individuals (Red, Green, or Blue).}
#'   \item{Group}{Group affiliation of the individuals (A, B, or C).}
#' }
#'
#' @examples
#' head(tablestylizer_df)
#'
#' @source This data is generated for the purpose of illustrating data manipulation and analysis in R.
#' It does not represent real-world individuals or situations.
"tablestylizer_df"


#' Example tableone Object with Imaginary Demographic Data for Practicing with the tablestylizer Package
#'
#' This dataset is an example tableone object created using the tableone package, representing a summary table of characteristics.
#' It is generated based on the dataset "tablestylizer_df" and is in the format of a list with components for continuous (ContTable) and categorical (CatTable) variables.
#' Users can practice and explore the functionality of the tablestylizer package by tidying up this table with the tablestylizer::stylize_tableone() function.
#' Note that in this table, all data is presented under the "Overall" column, without dividing into Groups A, B, and C.
#'
#' @format An example tableone object with the following components:
#' \describe{
#'   \item{ContTable}{Summary statistics for continuous variables (Age (years), Height (inches)).}
#'   \item{CatTable}{Summary statistics for categorical variables (Women, Likes coffee, Favorite color, Group).}
#'   \item{MetaData}{Metadata information, including variable types and labels.}
#' }
#'
#' @examples
#' tableone_1g
#'
#' @source This data is generated for the purpose of providing a practice example tableone object for learning and experimenting with the tablestylizer package.
#' It does not represent real-world individuals or situations.
"tableone_1g"


#' Example tableone Object with Imaginary Demographic Data for Practicing with the tablestylizer Package
#'
#' This dataset is an example tableone object created using the tableone package, representing a summary table of characteristics.
#' It is generated based on the dataset "tablestylizer_df" and is in the format of a list with components for continuous (ContTable) and categorical (CatTable) variables.
#' The table is stratified by three groups: A, B, and C. For each group, the table provides summary statistics for continuous variables (Age (years), Height (inches)) and categorical variables (Women, Likes coffee, Favorite color).
#' Users can practice and explore the functionality of the tablestylizer package by tidying up this table with the tablestylizer::stylize_tableone() function.
#'
#' @format An example tableone object with the following components:
#' \describe{
#'   \item{ContTable}{Summary statistics for continuous variables (Age (years), Height (inches)) stratified by Groups A, B, and C.}
#'   \item{CatTable}{Summary statistics for categorical variables (Women, Likes coffee, Favorite color) stratified by Groups A, B, and C.}
#'   \item{MetaData}{Metadata information, including variable types and labels.}
#' }
#'
#' @examples
#' tableone_3g
#'
#' @source This data is generated for the purpose of providing a practice tableone object with multiple strata for learning and experimenting with the tablestylizer package.
#' It does not represent real-world individuals or situations.
"tableone_3g"


#' Example tableone Object with Imaginary Data and Between-Group Comparison Test Results for Practicing with the tablestylizer Package
#'
#' This dataset is an example tableone object created using the tableone package, representing a summary table of characteristics.
#' It is generated based on the dataset "tablestylizer_df" and is in the format of a list with components for continuous (ContTable) and categorical (CatTable) variables.
#' The table is stratified by three groups: A, B, and C. For each group, the table provides summary statistics for continuous variables (Age (years), Height (inches)) and categorical variables (Women, Likes coffee, Favorite color).
#' Additionally, this table includes between-group comparison test results, including p-values.
#' Users can practice and explore the functionality of the tablestylizer package by tidying up this table with the tablestylizer::stylize_tableone() function.
#'
#' @format An example tableone object with the following components:
#' \describe{
#'   \item{ContTable}{Summary statistics for continuous variables (Age (years), Height (inches)) stratified by Groups A, B, and C.}
#'   \item{CatTable}{Summary statistics for categorical variables (Women, Likes coffee, Favorite color) stratified by Groups A, B, and C.}
#'   \item{MetaData}{Metadata information, including variable types and labels.}
#'   \item{pValues}{Between-group comparison test results, including p-values for approximate and exact tests.}
#' }
#'
#' @examples
#' tableone_3g_p
#'
#' @source This data is generated for the purpose of providing a practice tableone object with multiple strata and between-group comparison test results for learning and experimenting with the tablestylizer package.
#' It does not represent real-world individuals or situations.
"tableone_3g_p"

