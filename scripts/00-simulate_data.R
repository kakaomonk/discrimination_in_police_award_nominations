#### Preamble ####
# Purpose: Simulate each race/gender's award score
# Author: Hyungsoo Park, Jeongwoo Kim
# Date: 12 February 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: R
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# set seed for the simulation
set.seed(1002415488)
number_simulations <- 10000
# set a distribution of award score with normal distribution (mean: 7.054227, sd: 4.553837 based on the raw-data).
races <- c("White", "Asian", "Black", "Natam", "Hisp")
# Simulate 10000 times
sim_race <- replicate(number_simulations, c(sample(races, 1, replace = TRUE), rtruncnorm(1, a = 0, mean = mean(all_officer$awd_perf), sd = sd(all_officer$awd_perf))))

gender <- c("Male", "Female")
sim_gender <- replicate(number_simulations, c(sample(gender, 1, replace = TRUE), rtruncnorm(1, a = 0, mean = mean(all_officer$awd_perf), sd = sd(all_officer$awd_perf))))


