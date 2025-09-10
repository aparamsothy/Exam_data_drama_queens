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


# Does the remission depend on the hemoglobin level categorized into quartiles?
# Hemoglobin quartiles vs RBC counts - statistical analysis
# ANOVA test
patient_data %>% 
  aov(rbc ~ hgb_quartiles, data = .) %>%  # Performs one-way ANOVA
  broom::tidy()                           # Converts results to clean data frame


# Creates table for active inflammation vs remission
table(patient_data$hgb_quartiles, patient_data$remission)

# Plot 1 - hgb_quartiles vs remission
hgb_remission_plot <- ggplot(patient_data, aes(x = hgb_quartiles, fill = remission)) +
  geom_bar(position = "dodge",            # Side-by-side bars 
           alpha = 0.8,                   # Semi-transparent bars 
           color = "white",               # White borders around bars
           size = 0.5) +                  # Border thickness
  scale_fill_manual(values = c("#2E86AB", "#A23B72"),    
                    name = "Remission Status",           # Legend title
                    labels = c("Not in Remission", "In Remission")) + # Custom legend labels
  labs(title = "hgb quartiles vs Remission Status", # Main title
       x = "hgb",                         # X-axis label
       y = "Number of Patients",                          # Y-axis label
       caption = "Data: Patient cohort analysis") +      # Bottom caption
  theme_minimal()                         

hgb_remission_plot


# Association between calcium and total bilirubin----
#Plot the data first
patient_data  %>%
  ggplot(aes(x = tbil, y = cal)) +
  geom_point() +
  geom_smooth(method = "lm") +
  xlab("Total Bilirubin") + #change x axis label
  ylab("Calcium") + #y axis labels
  labs(title = "Association between calcium and total bilirubin") +
  theme_minimal() + #use the minimal theme
  theme(
    panel.grid.major = element_blank(), #remove major grid
    panel.grid.minor = element_blank(), #remove minor grid
    axis.line = element_line(colour="grey", linewidth = 0.5), #include x and y axis
    axis.ticks = element_line(colour = "grey", linewidth = 0.5), #include tick marks
    plot.title = element_text(size = 16, face = "bold"), #change title font
    axis.title = element_text(size = 14), #change axis title size
    axis.text.x = element_text( size = 12), #change x-axis text size
    axis.text.y = element_text(size=12) #change y-axis text size
  ) 

# From the plot we see that the data is not well captured by a linear relationships.
# Most points are located at low levels of total bilirubin, while a few points are located to the right.
# If the analyse was to be used in a "real" analysis, we should consider measures to improve the 
# association evaluation.

# However, a linear regression analysis for the association between calcium and total bilirubin is 
# considered to be sufficient in this project.
cal_tbil_lm <- patient_data %>% 
  lm(cal ~ tbil, data = .) %>%
  broom::tidy()

#View the regression results
cal_tbil_lm

# The linear regression indicates that there is an association between calcium and total bilirubin.
# The estimated coefficient is -0.09, with a p-value of 1.8e-104.

