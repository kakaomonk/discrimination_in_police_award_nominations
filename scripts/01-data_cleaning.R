#### Preamble ####
# Purpose: Cleans the data and group the data by each officer.
# Author: Hyungsoo Park, Jeongwoo Kim
# Date: 12 February 2024
# Contact: hyungsoo.park@mail.utoronto.ca, jwoo.kim@mail.utoronto.ca
# License: MIT
# Pre-requisites: R
# Any other information needed? NA

#### Workspace setup ####
library(tidyverse)
library(here)

#### Clean data ####
# Read data 
month_data <- read_dta(here("inputs/data/officer_month_data.dta"))
year_data <- read_dta(here("inputs/data/officer_year_data.dta"))

number_of_officer <- month_data |>
  group_by(nuid) |>
  summarise()

# All data of every officer from month data group by nuid
all_officer <- month_data |>
  group_by(nuid) |>
  filter(unit == 44) |>
  summarise(total_month = max(unit_duration), birth = max(birth_year), 
            arrest = sum(arrest_total), Complaints = sum(cmpl_civ), 
            Gender = max(female), White = max(white), Black = max(black), 
            awd_perf = sum(awd_perf), use_force = sum(trr_new))

# All data of every officer from year data group by nuid
all_officer_year <- year_data |>
  group_by(nuid) |>
  summarise(birth = max(birth_year), arrest = sum(arrest_total), 
            Complaints = sum(cmpl_civ), Female = max(female), 
            White = max(white), Black = max(black), Asian = max(asian), 
            Hisp = max(hisp), Natam = max(natam), awd_perf = sum(awd_perf))

#### Save data ####
write_csv(all_officer, here("outputs/data/all_officer.dta"))
write_csv(all_officer_year, here("outputs/data/all_officer_year.dta"))

