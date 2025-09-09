#----Script Header-------------------------------------------------------------####
# Date: 09.09.2025         
# Author: Data_drama_queens     
# Filename: creating-plots
# Description: Script for creating plots.
#              We were given 5 questions, and asked to select one question each.
#              We have answered the following questions:
#                 - Are there any correlated measurements?
#                 - Does the white blood cell count distribution depend on pot?
#                 - Does remission of inflammation after Thiopurines for > 12 
#                   weeks change with percent of monocytes in WBC count?
#               
# Project: RMED901A_Exam_Assignment
#-------------------------------------------------------------------------------###


# Read the data ----
library(ggplot2)
library(tidyverse)
library(here)

patient_data <- read_delim(
  here("data", "data_for_analysis", "20250908-tidy-joined-exam-data.txt"),
  delim = "\t"
)




# Remission and percent of monocytes ----
# Here, we investigates if remission of inflammation after Thiopurines for > 12 weeks 
# change with percent of monocytes in WBC count.
#Create a boxplot
remission_mono_plot <- ggplot(data=patient_data, 
                              mapping=aes(x=remission, y=mono_percent)) + #select variables
  geom_boxplot(fill=c("#7876B199", "#20854E99")) + #create a box plot and set specific colours
  xlab("Remission") + #change x axis label
  ylab("Monocytes in WBC count (%)") + #y axis labels
  labs(title = "Percent of monocytes in WBC count",
       subtitle = "Grouped by remission status") +
  theme_minimal() + #use the minimal theme
  theme(
    panel.grid.major = element_blank(), #remove major grid
    panel.grid.minor = element_blank(), #remove minor grid
    axis.line = element_line(colour="grey", linewidth = 0.5), #include x and y axis
    axis.ticks = element_line(colour = "grey", linewidth = 0.5), #include tick marks
    legend.position = "None", #remove legend
    plot.title = element_text(size = 16, face = "bold"), #change title font
    axis.title = element_text(size = 14), #change axis title size
    axis.text.x = element_text( size = 12), #change x-axis text size
    axis.text.y = element_text(size=12) #change y-axis text size
  ) 
  
  
remission_mono_plot

# A visual inspection of the plot suggests that there is no difference in
# percent of monocytes in WBC count for groups with or without remission of inflammation
# after Thiopurines for > 12 weeks.
