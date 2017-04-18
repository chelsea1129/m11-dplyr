# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
install.packages("nycflights13")
library(nycflights13)
library(dplyr)
View(flights)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
month.average <- group_by(flights, month) %>%
                  summarise(mean = mean(dep_delay, na.rm = TRUE))
View(month.average)
max.month <- filter(month.average, mean == max(mean)) %>%
              select(month)
max.month

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(month.average)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
airport.average.delay <- group_by(flights, dest) %>%
                          summarise(mean = mean(arr_delay, na.rm = TRUE))
highest.delay.airport <- filter(airport.average.delay, mean == max(mean)) %>%
                            select(dest)

### Bonus ###
# Which city was flown to with the highest average speed?
