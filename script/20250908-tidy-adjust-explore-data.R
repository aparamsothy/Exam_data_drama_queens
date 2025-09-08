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


# Tidy, adjust and explore ----
Tidy_patient_data <- patient_data %>%
 select(-hct, -rdw) %>% # Remove unnessary columns
 left_join(patient_data_join, join_by("patient_id")) %>% # Join with the other dataset
 mutate(lymph = wbc * (lymph_percent/100)) # New column with lymphocyte cell count

# Investigate data types
glimpse(Tidy_patient_data)
# All data types are numeric. We do not see the need to change them.


