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


# Correlated measurements ----
# Create correlation plot with RdBu palette
correlation_plot <- ggcorr(num_data,
                           low = "#2166ac",
                           mid = "white",
                           high = "#b2182b",
                           midpoint = 0,
                           label = FALSE,
                           size = 3)

correlation_plot

# Save plot as PNG with larger size for clarity
filename_correlation_plot <- here("figures", "correlation_plot.tiff")
ggsave(filename_correlation_plot, plot = correlation_plot, width = 7, height = 7, dpi = 300)


# Scatterplot investigating white blood cell count by potassium level ----
wbc_pot_plot <- ggplot(patient_data, aes(x = wbc, y = potassium)) + # Assign data, x and y values
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

wbc_pot_plot

#Save the plot
filename_wbc_pot_plot <- here("figures", "wbc_potassium_plot.tiff")
ggsave(filename_wbc_pot_plot, plot = wbc_pot_plot, width = 7, height = 7, dpi = 300)


# From the plot, the white blood cell count does not seem to change
# with potassium level


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

#Save the plot
filename_remission_mono_plot <- here("figures", "remission_mono_plot.tiff")
ggsave(filename_remission_mono_plot, plot = remission_mono_plot, width = 7, height = 7, dpi = 300)

# A visual inspection of the plot suggests that there is no difference in
# percent of monocytes in WBC count for groups with or without remission of inflammation
# after Thiopurines for > 12 weeks.

