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


  

