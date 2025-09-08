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
Tidy_patient_data <- patient_data %>%
 select(-hct, -rdw) %>% # Remove unnessary columns
 left_join(patient_data_join, join_by("patient_id")) # Join with the other dataset
 

# Investigate data types
glimpse(Tidy_patient_data)
# All data types are numeric. We do not see the need to change them.

# Create new columns ----
# Cut the hemoglobin level into quartiles 
Tidy_patient_data <- Tidy_patient_data %>% 
  mutate(hgb_quartiles = cut(hgb, breaks=4, labels = c("Q1", "Q2", "Q3", "Q4")))

# Verify that the new column is making sense
Tidy_patient_data %>%
  count(hgb_quartiles)

# Add a column checking if Blood Urea Nitrogen is above 30
Tidy_patient_data <- Tidy_patient_data %>%
  mutate(blood_urea_nitrogen_over_30 = if_else(blood_urea_nitrogen > 30, 1, 0))

# Verify that the new column is making sense
Tidy_patient_data %>%
  count(blood_urea_nitrogen_over_30)

# New column with lymphocyte cell count
Tidy_patient_data %>%
mutate(lymph_count = wbc * (lymph_percent/100)) 

# New column showing sodium as a fraction of summed sodium, potassium, and chloride
Tidy_patient_data %>%
mutate(sodium_fraction = round(sodium / (sodium + potassium + chloride), digits = 2))




