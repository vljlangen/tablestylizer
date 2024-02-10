#################################################################
##                        Load packages                        ##
#################################################################

library(pacman)
p_load(wakefield, dplyr, tidyverse, tableone)




##################################################################
##                     Generate random data                     ##
##################################################################


## Generate random data with wakefield
example_df <- r_data_frame(n=20, id, age, sex, height, dummy, group)
#example_df <- example_df %>% rename()

## Change the labels of Group
example_df$Group <- factor(example_df$Group, levels=c('Control','Treatment'),
                           labels=c('A','B'))

example_df$Group <-sample(1:3, nrow(example_df), replace = TRUE)
example_df$Group <- factor(example_df$Group,
                                  levels = c(1, 2, 3),
                                  labels = c("A", "B", "C"))

# Create a new random variable
example_df$Favorite.color <-sample(1:3, nrow(example_df), replace = TRUE)
example_df$Favorite.color <- factor(example_df$Favorite.color,
                                  levels = c(1, 2, 3),
                                  labels = c("Red", "Green", "Blue"))

# Code the "Dummy" variable to depict if the participant likes Coffee
example_df <- example_df %>% rename(Likes.coffee = Dummy)

# Convert to factor
example_df$Likes.coffee <- factor(example_df$Likes.coffee,
                                    levels = c(0, 1),
                                    labels = c("No", "Yes"))

# Reorder
dput(names(example_df))
#c("ID", "Age", "Sex", "Height", "Likes.coffee", "Favorite.color", "Group")
example_df <- example_df %>% select(ID, Age, Sex, Height, Likes.coffee, Favorite.color, Group)

# Rename
example_df <- example_df %>% rename(Women = Sex,
                                     `Age (years)` = Age,
                                     `Height (inches)` = Height,
                                     `Likes coffee` = Likes.coffee,
                                     `Favorite color` = Favorite.color)

# Relabel
example_df$Women <- factor(example_df$Women, levels = c("Male", "Female"),
                      labels = c("No", "Yes"))


##################################################################
##    Generate a tableone object (only 1 column, no stratas)    ##
##################################################################


## Get variables names
dput(names(example_df))
#c("ID", "Age", "Sex", "Height", "Likes.coffee", "Favorite.color", "Group")

## Vector of variables to summarize
myVars <- c("Age (years)", "Women", "Height (inches)", "Likes coffee",
            "Favorite color", "Group")

## Vector of categorical variables that need transformation
catVars <- c("Women", "Likes coffee", "Favorite color", "Group")

## Create a TableOne object
tableone_1g <- CreateTableOne(vars = myVars, data = example_df, factorVars = catVars)

## Display the TableOne object
tableone_1g




########################################################################
##  Generate a tableone object (3 stratas + comparison between them)  ##
########################################################################


## Vector of variables to summarize
myVars <- c("Age (years)", "Women", "Height (inches)", "Likes coffee",
            "Favorite color")

## Vector of categorical variables that need transformation
catVars <- c("Women", "Likes coffee", "Favorite color")



## Create a TableOne object for multiple groups and a comparison
tableone_3g_p <- CreateTableOne(vars = myVars, strata = "Group" , data = example_df, factorVars = catVars)

## Display the TableOne object
tableone_3g_p




###########################################################################
##  Generate a tableone object (3 stratas + no comparison between them)  ##
###########################################################################


## Create a TableOne object for multiple groups, without a comparison test
tableone_3g <- CreateTableOne(vars = myVars, strata = "Group" , data = example_df, factorVars = catVars, test = F)


## Display the TableOne object
tableone_3g




#################################################################
##            Possibly useful scripts for debugging            ##
#################################################################


## For debugging, a TableOne object can be converted to a common matrix
print(tableone_1g, formatOptions = list(big.mark = ",")) -> tableone_1g_df
print(tableone_3g_p, formatOptions = list(big.mark = ",")) -> tableone_3g_p_df
print(tableone_3g, formatOptions = list(big.mark = ",")) -> tableone_3g_df

## Rownames can be transferred to column 1 followingly:

# Convert rownames to column names

tableone_1g_df_no.rownames <- as.data.frame(tableone_1g_df) %>%
                                  rownames_to_column(var = "Variable")

## Display the data frame object
tableone_1g_df_no.rownames

## Give data sets more descriptive names
tablestylizer_df <- example_df
