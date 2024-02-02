stylize_tableone <- function(table1) {
  # Convert tableone object to a printable object
  table1_printed <- print(table1,
                          quote = FALSE,
                          noSpaces = TRUE,
                          test = FALSE,
                          contDigits = 1,
                          printToggle = FALSE,
                          dropEqual = TRUE,
                          explain = TRUE)

  # Convert rownames to column names
  table1_df <- as.data.frame(table1_printed) %>%
    rownames_to_column(var = "Variable")

  # Transfer the percentage symbols from 1st column to the second
  for (i in seq_len(nrow(table1_df))) {
    if (grepl("\\(SD\\)\\)$", table1_df[i, 1])) {
      # Extract the text before the first "("
      before_parentheses <- sub("\\(.*", "", table1_df[i, 2])

      # Extract the text inside the parentheses
      inside_parentheses <- sub(".*\\((.*)\\).*", "\\1", table1_df[i, 2])

      # Combine the extracted values with " ± "
      new_value <- paste0(before_parentheses, "± ", inside_parentheses)

      # Assign the new formatted string to the second column
      table1_df[i, 2] <- new_value
      next
    }
    table1_df[i, 2] <- sub("\\)$", "%)", table1_df[i, 2])
  }

  # Erase percentage, SD etc. symbols from the 1st column
  table1_df[, 1] <- sub(" \\(mean \\(SD\\)\\)$", "", table1_df[, 1])
  table1_df[, 1] <- sub(" \\(%)$", "", table1_df[, 1])

  return(table1_df)
}







stylize_tableone <- function(table1) {
  # Convert tableone object to a printable object
  table1_printed <- print(table1,
                          quote = FALSE,
                          noSpaces = TRUE,
                          test = FALSE,
                          contDigits = 1,
                          printToggle = FALSE,
                          dropEqual = TRUE,
                          explain = TRUE)

  # Convert rownames to column names
  table1_df <- as.data.frame(table1_printed) %>%
    rownames_to_column(var = "Variable")

  # Transfer the percentage symbols from 1st column to the second
  for (i in seq_len(nrow(table1_df))) {
    if (grepl("\\(SD\\)\\)$", table1_df[i, 1])) {

      for (j in seq_along(table1_df[i, 2:ncol(table1_df)])) {


        # Extract the text before the first "("
        before_parentheses <- sub("\\(.*", "", table1_df[i, j+1])

        # Extract the text inside the parentheses
        inside_parentheses <- sub(".*\\((.*)\\).*", "\\1", table1_df[i, j+1])

        # Combine the extracted values with " ± "
        new_value <- paste0(before_parentheses, "± ", inside_parentheses)

        # Assign the new formatted string to the second column
        table1_df[i, j+1] <- new_value }

      next
    }
    for (j in seq_along(table1_df[i, 2:ncol(table1_df)])) {

      table1_df[i, j+1] <- sub("\\)$", "%)", table1_df[i, j+1])
    }
  }

  # Erase percentage, SD etc. symbols from the 1st column
  table1_df[, 1] <- sub(" \\(mean \\(SD\\)\\)$", "", table1_df[, 1])
  table1_df[, 1] <- sub(" \\(%)$", "", table1_df[, 1])

  return(table1_df)
}



stylize_tableone <- function(table1) {
  # Convert tableone object to a printable object
  table1_printed <- print(table1,
                          quote = FALSE,
                          noSpaces = TRUE,
                          test = FALSE,
                          contDigits = 1,
                          printToggle = FALSE,
                          dropEqual = TRUE,
                          explain = TRUE)

  # Convert rownames to column names
  table1_df <- as.data.frame(table1_printed) %>%
    rownames_to_column(var = "Variable")

  # Process columns starting from the second column until "p" is encountered
  for (i in seq_len(nrow(table1_df))) {
    for (j in seq_along(table1_df[i, 2:ncol(table1_df)])) {
      column_name <- colnames(table1_df)[j + 1]  # Adjust index to match column names

      # Stop processing if column name is "p"
      if (column_name == "p") {
        break
      }

      # Process the column if it doesn't contain "(SD)"
      if (!grepl("\\(SD\\)$", table1_df[i, j + 1])) {
        table1_df[i, j + 1] <- sub("\\)$", "%)", table1_df[i, j + 1])
      } else {
        # Extract the text before the first "("
        before_parentheses <- sub("\\(.*", "", table1_df[i, j + 1])

        # Extract the text inside the parentheses
        inside_parentheses <- sub(".*\\((.*)\\).*", "\\1", table1_df[i, j + 1])

        # Combine the extracted values with " ± "
        new_value <- paste0(before_parentheses, " ± ", inside_parentheses)

        # Assign the new formatted string to the column
        table1_df[i, j + 1] <- new_value
      }
    }
  }

  # Erase percentage, SD etc. symbols from the 1st column
  table1_df[, 1] <- sub(" \\(mean \\(SD\\)\\)$", "", table1_df[, 1])
  table1_df[, 1] <- sub(" \\(%)$", "", table1_df[, 1])

  return(table1_df)
}








