#----Script Header-------------------------####
# Date: 08.09.2025         
# Author: Data_drama_queens     
# Filename: tidy-adjust-explore-data   
# Description: Script for tidying data
#               
#               
# Project: RMED901A_Exam_Assignment
#-------------------------------------------###


# Read the data ----
library(tidyverse)
library(here)

patient_data <- read_delim(
  here("data", "data_for_analysis", "20250905-tidy-exam-data.txt"),
  delim = "\t"
)

# Read the additional dataset
patient_data_join <- read_delim(
  here("data", "original_data", "exam_data_join.txt"),
  delim = "\t"
)

# Explore the joining dataset ----
glimpse(patient_data_join) #all columns are numeric
head(patient_data_join)

skimr::skim(patient_data_join)

naniar::gg_miss_var(patient_data_join)

# Number of rows
patient_data_join %>%
  count()

# Number of unique patient IDs
patient_data_join %>%
  distinct(patient_id) %>%
  count() #No duplicates of patient IDs

# The new dataset which will be joined to our original dataset looks ok.


# Tidy, adjust and explore ----
patient_data <- patient_data %>%
 select(-hct, -rdw) %>% # Remove unnessary columns
 left_join(patient_data_join, join_by("patient_id")) # Join with the other dataset
 
# Investigate data types
glimpse(patient_data)
# All data types are numeric. We do not see the need to change them.

# Create new columns ----
patient_data <- patient_data %>% 
  mutate(hgb_quartiles = cut(hgb, breaks=4, labels = c("Q1", "Q2", "Q3", "Q4"))) %>% #Cut the hemoglobin level into quartiles 
  mutate(blood_urea_nitrogen_over_30 = if_else(blood_urea_nitrogen > 30, factor("Yes"), factor("No"))) %>% #create a column indicating if the blood urea nitrogen is above 30
  mutate(lymph_count = wbc * (lymph_percent/100)) %>% #add a column for Lymphocytes cell count
  mutate(sodium_fraction = (sodium / (sodium + potassium + chloride))) %>% #sodium as a fraction of summed sodium, potassium, and chloride
  select(patient_id, age_days, blood_urea_nitrogen, everything()) %>% # Set the order of columns
  arrange(patient_id) #arrange by patient ID

# Change numerical to factor variables
tidy_patient_data <- patient_data %>%
  mutate(active = if_else(active == 0, factor("No"), factor("Yes"))) %>%
  mutate(remission = if_else(remission == 0, factor("No"), factor("Yes")))

# Verify that the new column for hemoglobin quartiles makes sense
patient_data %>%
  count(hgb_quartiles)

# Verify that the categorical column for blood urea nitrogen makes sense
patient_data %>%
  count(blood_urea_nitrogen_over_30)

# Explore the new dataset with new columns ----

# Glimpse the new dataset
glimpse(patient_data)

# Explore the data
skimr::skim(patient_data)
naniar::gg_miss_var(patient_data)

# There is most missing data for blood_urea_nitrogen 
# and the column based on this (blood_urea_nitrogen_over_30).
# There is also missing values for 15 other columns.





