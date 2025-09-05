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

ncol(patient_data)   #24
nrow(patient_data)   #15524


skimr::skim(patient_data)  #"patient_id\tdays of life\twbc\twbc_copy\thgb\thct\tplt\trbc\trdw\tmpv\t%neut\tlymph%\tmo…

# For your specific column names:
patient_data <- patient_data %>% 
  rename(
    neut_percent = `%neut`,           # Remove % and spaces
    lymph_percent = `lymph%`,         # Remove % and add underscore
    days_of_life = `days of life`     # Replace spaces with underscores
  )




