#--------------Script Header-----------------------------------####
# Date: 11.09.2025
# Author: Data_drama_queens
# Filename: style_scripts
# Description: Script for styling scripts and Rmarkdown documents
#
#
# Project: RMED901A_Exam_Assignment
#---------------------------------------------------------------###

library(styler)
library(here)

#Style all scripts in the script folder
style_dir(path = here("script"))