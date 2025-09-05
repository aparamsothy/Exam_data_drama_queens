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


## Create new columns ----

# Remove duplicates before running this line!
  # Create three new columns for RBC characteristics with mean values for each characteristic
  # Duplicates are removed by only including distinct patient IDs
patient_data <- patient_data %>%
  distinct() %>%
  pivot_wider(names_from = "mean_RBC_characteristic", values_from = "mean_value" 
  )



