#----Script Header-------------------------####
# Date: 09.09.2025         
# Author: Data_drama_queens     
# Filename: creating-plots
# Description: Script for creating plots
#               
#               
# Project: RMED901A_Exam_Assignment
#-------------------------------------------###


# Read the data ----
library(ggplot2)
library(tidyverse)
library(here)

patient_data <- read_delim(
  here("data", "data_for_analysis", "20250908-tidy-joined-exam-data.txt"),
  delim = "\t"
)
