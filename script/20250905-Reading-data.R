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
    neut_percent = `%neut`,           
    lymph_percent = `lymph%`,         
    days_of_life = `days of life`     
  )


#changing to specific column names:----
patient_data <- patient_data %>% 
  rename(
    # Patient Demographics
    patient_id = patient_id,                    
    age_days = days_of_life,                    
    
    # Complete Blood Count (CBC)
    wbc_count = wbc,                       # White blood cells (K/μL)
    wbc_count_duplicate = wbc_copy,             
    hemoglobin = hgb,                      
    hematocrit_percent = hct,                   
    platelet_count = plt,                  
    rbc_count = rbc,                       
    red_cell_dist_width_percent = rdw,          
    mean_platelet_volume = mpv,            
    
    # CBC Differential
    neutrophils_percent = neut_percent,         
    lymphocytes_percent = lymph_percent,        
    monocytes_percent = mono_percent,           
    eosinophils_percent = eos_percent,          
    basophils_percent = baso_percent,            
    
    # Basic Metabolic Panel (BMP)
    sodium = sod,                        
    potassium = pot,                     
    chloride = chlor,                    
    bicarbonate= co2,                   
    blood_urea_nitrogen = un,             
    
    # Clinical Status
    disease_active_status = active,             
    disease_remission_status = remission,       
    mean_value = mean_value          
  )







