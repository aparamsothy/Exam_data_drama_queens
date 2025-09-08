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

#Read the additional dataset
patient_data_join <- read_delim(
  here("data", "original_data", "exam_data_join.txt"),
  delim = "\t"
)

Tidy_patient_data <- patient_data %>%
 select(-hct, -rdw)


