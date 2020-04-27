# Exercise 2: working with `dplyr`
# Note that this exercise repeats the analysis from Exercise 1, but should be 
# performed using `dplyr` (do not directly access or manipulate the data frames)

# Install and load the "fueleconomy" package
#install.packages("devtools")
#devtools::install_github("hadley/fueleconomy")
# library(fueleconomy)

# Install and load the "dplyr" library
# install.packages("dplyr")
# library(dplyr)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes <- select(vehicles, make)

# Use the `distinct()` function to determine how many different car manufacturers
# are represented by the data set
num_mfc <- nrow(distinct(makes))

# Filter the data set for vehicles manufactured in 1997
mfc_1997 <- filter(vehicles, year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
hwy_mileage_1997 <- arrange(mfc_1997, -hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
mutate(mfc_1997,
       average = (hwy + cty)/2)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
TWD_city_20mpg <- vehicles %>%
  filter(cty > 20) %>% 
  filter(drive == "2-Wheel Drive")

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worst_hwy_mpg <- TWD_city_20mpg %>%
  arrange(hwy) %>% 
  select(id) %>% 
  top_n(1)

# Write a function that takes a `year_choice` and a `make_choice` as parameters,
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
most_efficient <- function(year_choice, make_choice) {
  year_make <- vehicles %>% 
    filter(year == year_choice) %>% 
    filter(make == make_choice) %>% 
    filter(hwy == max(hwy)) %>% 
    select(model)
  
  return(year_make)
}

# What was the most efficient Honda model of 1995?
most_efficient(1995, "Honda")
