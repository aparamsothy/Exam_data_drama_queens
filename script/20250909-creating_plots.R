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

# Correlated measurements?
library(GGally)
library(ggplot2)

# Select only numeric columns for correlation
num_data <- patient_data[sapply(patient_data, is.numeric)]
# Correlation matrix plot
correlation_plot <- ggcorr(num_data, angle = 90, size = 3, clip = "off", label = FALSE) +
  theme(
    plot.margin = margin(t = 20, r = 40, b = 40, l = 40)  # top, right, bottom, left margins
  )

print(correlation_plot)

# To display the plot
print(correlation_plot)
ggsave("correlation_plot.png", plot = correlation_plot, width = 12, height = 12, dpi = 300)


# Alternative 
library(GGally)
library(ggplot2)
library(RColorBrewer)

# Select only numeric columns
num_data <- patient_data[sapply(patient_data, is.numeric)]


# Create correlation plot with RdBu palette
correlation_plot <- ggcorr(num_data,
                           palette = "RdBu",
                           low = "#2166ac",
                           mid = "white",
                           high = "#b2182b",
                           midpoint = 0,
                           label = FALSE,
                           size = 3,
                           angle = -50
) + 
  theme(
    plot.margin = margin(t = 20, r = 40, b = 40, l = 40),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
    clip = "off"  # Add clip here
  )

print(correlation_plot)

# Save plot as PNG with larger size for clarity
ggsave("correlation_plot.png", plot = correlation_plot, width = 12, height = 12, dpi = 300)


