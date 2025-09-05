#----Script Header-------------------------####
# Date: 05.09.2025         
# Author: Data_drama_queens     
# Filename: Reading-data   
# Description: Script for reading and tidying data
#               
#               
# Project: RMED901A_Exam_Assignment
#-------------------------------------------###


# Read the data ----
library(tidyverse)
library(here)

patient_data <- read_delim(
  here("data", "exam_data.txt"),
  delim = "\t"
)

# Explore the data ----

## Overview of the data ----
glimpse(patient_data)
head(patient_data)

skimr::skim(patient_data)

naniar::gg_miss_var(patient_data)


## Unique observations ----
#Number of rows
patient_data %>%
  count()

#Number of unique observations
patient_data %>%
  distinct(patient_id) %>%
  count()

#There are 5167 unique observations, which is about 1/3 of the total number of rows.

#Checking if entire rows are duplicated
sum(duplicated(patient_data)) #there are 23 duplicated rows. We need to remove these.






