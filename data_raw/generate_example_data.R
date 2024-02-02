## Load packages
library(pacman)
p_load(wakefield, dplyr, tidyverse, tableone)

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



## Change the order of the factor Group for nicer output in tableone
#example_df$Group <- factor(example_df$Group, levels=c('B','A'))


## Get variables names
dput(names(example_df))
#c("ID", "Age", "Sex", "Height", "Dummy", "Group", "Favorite.color")

## Vector of variables to summarize
myVars <- c("Age", "Sex", "Height", "Dummy", "Favorite.color",  "Group")

## Vector of categorical variables that need transformation
catVars <- c("Sex", "Dummy", "Favorite.color", "Group")

## Create a TableOne object
tab2 <- CreateTableOne(vars = myVars, data = example_df, factorVars = catVars)



tab2

## Create a TableOne object for multiple groups

tab3 <- CreateTableOne(vars = myVars, strata = "Group" , data = example_df, factorVars = catVars)
tab33 <- CreateTableOne(vars = myVars, strata = "Group" , data = example_df, factorVars = catVars, test = F)



tab3
tab33


print(tab3, formatOptions = list(big.mark = ",")) -> test3
print(tab33, formatOptions = list(big.mark = ",")) -> test33



#
# # Convert rownames to column names
# test3 <- as.data.frame(test2) %>%
#   rownames_to_column(var = "Variable")

test3


slice


#lempiväri, lempiruoka tms. kokeile 3 ryhmää myös, miten taulukoituu


# Muokkaa funktio niin, että se muuttaa seuraavilta riveiltä prosentit kuntoon,
# kun leveleitä onkin useita.
#
# Favorite.color (%)                                               0.219
#    Red                 0 (  0.0)      1 ( 14.3)      4 ( 50.0)
#    Green               3 ( 60.0)      2 ( 28.6)      2 ( 25.0)
#    Blue                2 ( 40.0)      4 ( 57.1)      2 ( 25.0)
