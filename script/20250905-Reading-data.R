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

ncol(patient_data)   #24
nrow(patient_data)   #15524


skimr::skim(patient_data)  #"patient_id\tdays of life\twbc\twbc_copy\thgb\thct\tplt\trbc\trdw\tmpv\t%neut\tlymph%\tmo…

# For your specific column names:
patient_data <- patient_data %>% 
  rename(
    # Patient Demographics
    patient_id = patient_id,                    
    age_days = days_of_life,                    
    
    # Complete Blood Count (CBC)
    wbc_count_k_ul = wbc,                       # White blood cells (K/μL)
    wbc_count_duplicate = wbc_copy,             
    hemoglobin_g_dl = hgb,                      
    hematocrit_percent = hct,                   
    platelet_count_k_ul = plt,                  
    rbc_count_m_ul = rbc,                       
    red_cell_dist_width_percent = rdw,          
    mean_platelet_volume_fl = mpv,            
    
    # CBC Differential
    neutrophils_percent = neut_percent,         
    lymphocytes_percent = lymph_percent,        
    monocytes_percent = mono_percent,           
    eosinophils_percent = eos_percent,          
    basophils_percent = baso_percent,            
    
    # Basic Metabolic Panel (BMP)
    sodium_mmol_l = sod,                        
    potassium_mmol_l = pot,                     
    chloride_mmol_l = chlor,                    
    bicarbonate_mmol_l = co2,                   
    blood_urea_nitrogen_mg_dl = un,             
    
    # Clinical Status
    disease_active_status = active,             
    disease_remission_status = remission,       
    calculated_mean_value = mean_value          
  )




