#----Script Header-------------------------------------------------------------####
# Date: 10.09.2025         
# Author: Data_drama_queens     
# Filename: creating-plots
# Description: Script for creating plots.
#              We were given 5 questions, and asked to select one question each.
#              We have answered the following questions:
#                 - Does the remission depend on the hemoglobin level categorized into quartiles?
#                 - Does the remission depend on chloride?
#                 - Is there an association between calcium and total bilirubin?
# Project: RMED901A_Exam_Assignment
#-------------------------------------------------------------------------------###

# Read the data ----
library(here)
library(ggplot2)
library(tidyverse)

patient_data <- read_delim(
  here("data", "data_for_analysis", "20250908-tidy-joined-exam-data.txt"),
  delim = "\t"
)
