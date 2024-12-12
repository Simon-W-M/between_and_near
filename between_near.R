library(tidyverse)
library(NHSRdatasets)

data <- ae_attendances

# filters between and near

# using the between filter
data_filt_bet <- data |>
  filter(between(attendances, 2000, 3000))

#using the near filter
data_filt_near <- data |>
  filter(near(attendances, 2500, 500))

# see what the difference is
setdiff(data_filt_bet, data_filt_near)

# double check if 2000 would also not appear in 'near'
data$attendances[1] <- 2000

# re run between
data_filt_bet <- data |>
  filter(between(attendances, 2000, 3000))

# run near
data_filt_near <- data |>
  filter(near(attendances, 2500, 500))

# see that near does not pick up the 2000 and 3000
setdiff(data_filt_bet, data_filt_near)

#using the near filter
data_filt_near <- data |>
  filter(near(period, as.Date('2017-03-01'), 45))

range(data_filt_near$period)
