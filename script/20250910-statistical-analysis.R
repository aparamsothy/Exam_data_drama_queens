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

# RBC by Hemoglobin Quartiles
# ANOVA test
patient_data %>% 
  aov(rbc ~ hgb_quartiles, data = .) %>%  # Performs one-way ANOVA
  broom::tidy()                           # Converts results to clean data frame


# Creates table for active inflammation vs remission
table(patient_data$active, patient_data$remission)

# Plot 1 - Hemoglobin quartiles vs RBC counts
hgb_RBC_plot <- ggplot(patient_data, aes(x = hgb_quartiles, y = rbc, fill = hgb_quartiles)) +
  geom_boxplot() +                        # Creates box plots
  scale_fill_manual(values = c("#E31A1C", "#FF7F00", "#1F78B4", "#33A02C"), # Custom colors for each quartile
                    name = "Hemoglobin\nQuartiles") +     # Legend title 
  labs(title = "RBC Counts by Hemoglobin Quartiles",     # Main title
       x = "Hemoglobin Quartiles",                       # X-axis label
       y = "RBC Count") +                                # Y-axis label
  theme_minimal()                         

hgb_RBC_plot



# Plot 2 - Active inflammation vs remission
inflammation_remission_plot <- ggplot(patient_data, aes(x = active, fill = remission)) +
  geom_bar(position = "dodge",            # Side-by-side bars 
           alpha = 0.8,                   # Semi-transparent bars 
           color = "white",               # White borders around bars
           size = 0.5) +                  # Border thickness
  scale_fill_manual(values = c("#2E86AB", "#A23B72"),    
                    name = "Remission Status",           # Legend title
                    labels = c("Not in Remission", "In Remission")) + # Custom legend labels
  labs(title = "Active Inflammation vs Remission Status", # Main title
       x = "Active Inflammation",                         # X-axis label
       y = "Number of Patients",                          # Y-axis label
       caption = "Data: Patient cohort analysis") +      # Bottom caption
  theme_minimal()                         

inflammation_remission_plot
