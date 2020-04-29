# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
month_group <- group_by(flights, month)
dep_delay_by_month <- month_group %>%
  summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
filter(dep_delay_by_month, avg_dep_delay == max(avg_dep_delay, na.rm = TRUE))
# july

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
group_dest <- group_by(flights, dest)
dep_delay_by_dest <- group_dest %>%
  summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  arrange(-avg_dep_delay)

head(dep_delay_by_dest, 5)
# You can look up these airports in the `airports` data frame!
# View(airports)

# Which city was flown to with the highest average speed?
avg_speed <- flights %>% 
  mutate(avg_speed = distance / air_time)

group_speed_dest <- group_by(avg_speed, dest)

city_speeds <- group_speed_dest %>% 
  summarize(avg_speed = mean(avg_speed, na.rm = TRUE)) %>% 
  arrange(-avg_speed)
