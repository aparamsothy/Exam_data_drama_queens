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


# According to the data, was there a difference of alanine transaminase between quartiles of the hemoglobin level?
# Hemoglobin quartiles - statistical analysis
# ANOVA test
hgb_alt_aov <-patient_data %>% 
  aov(alt ~ hgb_quartiles, data = .) %>%  # Performs one-way ANOVA
  broom::tidy()                           # Converts results to clean data frame


# Plot 1 - Hemoglobin quartiles vs Alanine Transaminase
hgb_alt_plot <- ggplot(patient_data, aes(x = hgb_quartiles, y = alt, fill = hgb_quartiles)) +
  geom_boxplot() +                        # Creates box plots
  scale_fill_manual(values = c("#E31A1C", "#FF7F00", "#1F78B4", "#33A02C"), # Custom colors for each quartile
                    name = "Hemoglobin\nQuartiles") +     # Legend title 
  labs(title = "Alanine Transaminase by Hemoglobin Quartiles",     # Main title
       x = "Hemoglobin Quartiles",                       # X-axis label
       y = "Alanine Transaminase") +                                # Y-axis label
  theme_minimal()                         

hgb_alt_plot


hgb_alt_plot_without_outliers <- ggplot(patient_data, aes(x = hgb_quartiles, y = alt, fill = hgb_quartiles)) +
  geom_boxplot() +                        # Creates box plots
  scale_fill_manual(values = c("#E31A1C", "#FF7F00", "#1F78B4", "#33A02C"), # Custom colors for each quartile
                    name = "Hemoglobin\nQuartiles") +     # Legend title 
  labs(title = "Alanine Transaminase by Hemoglobin Quartiles",     # Main title
       x = "Hemoglobin Quartiles",                       # X-axis label
       y = "Alanine Transaminase") +                                # Y-axis label
  theme_minimal() +
  scale_y_continuous(limits = c(0, 100))

hgb_alt_plot_without_outliers

# Statistical test to investigate if the remission is depended on chloride

## Count the number of patients in each category of remission
patient_data %>%
  group_by(remission) %>%
  count()

## Boxplot to visualize chloride levels by remission status.
ggplot(patient_data, aes(remission, chloride, color = remission)) +
  geom_boxplot() +
  theme_minimal() +
  theme(
    legend.position = "none"
  ) +
  labs(title = "Chloride level by Remission Status",
       x = "Chloride level",
       y = "Remission status") +
  theme(
    axis.title.x = element_text(face = "bold", size = 9),
    axis.title.y = element_text(face = "bold", size = 9),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 12)
  ) +
  scale_color_manual(values = c("No" = "#fe6d01", "Yes" = "#40b0bf"))

# T-test to test difference in mean chloride levels by remission status
t_test_results <- patient_data %>% 
  t.test(chloride ~ remission, data = .) %>%
  broom::tidy()

t_test_results
# We have used an unpaired t-test for statistical analysis because we are
# interested in comparing the mean of chloride level between those with and 
# without remission. 

# The 2808 patients with remission compared to the 2359 patients
# without remission showed significantly lower chloride levels (t = -0.377, p = 0.000113)



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


