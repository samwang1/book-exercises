# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(data("USPersonalExpenditure")) 

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
USPE <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
# X1940, X1945, X1950, X1955, X1960

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!

# What are the row names of your dataframe?
# Food and Tobacco, Household Operation, Medical and Health, Personal Care, Private Education

# Add a column "category" to your data frame that contains the rownames
USPE$category <- c("Food and Tobacco", "Household Operation", "Medical and Health",
                    "Personal Care", "Private Education")

# How much money was spent on personal care in 1940?
USPE["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960?
USPE["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
USPE[USPE$X1960 == max(USPE$X1960), "category"]

# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year
lowest_category <- function(year) {
  y <- paste0("X", year)
  return(USPE[USPE[[y]] == min(USPE[[y]]), "category"])
}


# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
sapply(seq(1940, 1960, 5), lowest_category)
