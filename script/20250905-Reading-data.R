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
glimpse(patient_data) #all columns are numeric, except mean_RBC_characteristic 
head(patient_data)

skimr::skim(patient_data)

naniar::gg_miss_var(patient_data)

# Evaluate number of rows and columns
ncol(patient_data)   #24 columns
nrow(patient_data)   #15524 rows


# Changing to specific column names:----
patient_data <- patient_data %>% 
  rename(                                              
    
    # Datafriendly names
    neut_percent = `%neut`,           
    lymph_percent = `lymph%`,         
    age_days = `days of life`
    
    # Basic Metabolic Panel (BMP)
    sodium = sod,                        
    potassium = pot,                     
    chloride = chlor,                    
    bicarbonate = co2,                   
    blood_urea_nitrogen = un,                       
  )


## Unique observations ----
# Number of rows
patient_data %>%
  count()

# Number of unique observations
patient_data %>%
  distinct(patient_id) %>%
  count()

# There are 5167 unique observations, which is about 1/3 of the total number of rows.

# Checking if entire rows are duplicated
sum(duplicated(patient_data)) #there are 23 duplicated rows. We need to remove these.


## Create new columns ----

# Create three new columns for RBC characteristics with mean values for each characteristic
 # Duplicates are removed by only including distinct patient IDs
patient_data <- patient_data %>%
  distinct() %>%
  pivot_wider(names_from = "mean_RBC_characteristic", values_from = "mean_value" 
  )




