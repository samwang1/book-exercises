# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
group_dest <- group_by(flights, dest)
arr_delay_by_dest <- group_dest %>%
  summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(-avg_arr_delay)

join_airports <- left_join(arr_delay_by_dest, airports, by = c("dest" = "faa"))

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
group_airline <- group_by(flights, carrier, dest)
arr_delay_by_carrier <- group_airline %>% 
  summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(-avg_arr_delay)

joined <- left_join(arr_delay_by_carrier, airports, by = c("dest" = "faa"))
