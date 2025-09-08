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

<<<<<<< HEAD
# Remove unnecessary columns from your dataframe: `hct, rdw`
=======
# Tidy, adjust and explore ----
>>>>>>> 656bc2394eabfb60a352914df6520d8580a13fd4
Tidy_patient_data <- patient_data %>%
 select(-hct, -rdw) %>% # Remove unnessary columns
  left_join(patient_data_join, join_by("patient_id")) %>% # Join with the other dataset
  glimpse() # Overview of variable type

