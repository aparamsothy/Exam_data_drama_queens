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

# Scatterplot investigating white blood cell count by potassium level ----
ggplot(patient_data, aes(x = wbc, y = potassium)) + # Assign data, x and y values
  geom_point(colour = "darkblue", alpha = 0.5, na.rm = TRUE) + # Scatterplot
  geom_smooth(method = "lm", se = FALSE, colour = "orange") + #Regression line
  theme_minimal() + #Background theme
  theme(legend.position = "none", #Remove legend
        plot.title = element_text(face = "bold", size = 12, margin = margin(10, 0, 10, 0)), #Bold title, resized title and increased margin between title and plot
        axis.title.x = element_text(face = "bold", size = 10), #Bold x-axis text
        axis.title.y = element_text(face = "bold", size = 10)) + #Bold y-axis text
  labs(title = "White Blood Cell Count by Potassium Level", #Title
       x = "White blood cell count (10,000 cells per microliter)", #x-axis title
       y = "Potassium level (mmol/L)") #y-axis title



# From the plot, the white blood cell count does not seem to change
  # with potassium level



