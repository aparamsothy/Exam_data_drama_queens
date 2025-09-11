# 2025 RMED901A Exam
This project contains the answers to the exam in RMED901A from the group _Data Drama Queens_.
The exam report can be found as an Rmarkdown file and a html file ([20250911-data-drama-queens-exam-report.Rmd](https://github.com/aparamsothy/Exam_data_drama_queens/blob/main/documentation/20250911-data-drama-queens-exam-report.Rmd) and [20250911-data-drama-queens-exam-report.html](documentation/20250911-data-drama-queens-exam-report.html) in the folder `documentation`.

## Folder structure
* `data`
    + `data_for_analysis`
      + `20250905-tidy-exam-data.txt`: tidied version of exam dataset ("medicaldata"")
      + `20250908-tidy-joined-exam-data.txt`: tidied and joint version of exam dataset
    + `original_data`   
      + `exam_data.txt`: received exam data
      + `exam_data_join.txt`: received exam data no. 2
      

* `documentation`
    + `exam_descri.md`: received exam description
    + `original_codebook.html`: originally received codebook
    + `data_drama_queens_exam_report.Rmd`: Rmarkdown for exam report. 
       Outputs   `data_drama_queens_exam_report.html`
    + `data_drama_queens_exam_report.html`: Exam report. 
      
* `script`
    + `20250905-Reading-data.R`: script for reading and tidying data. Exam task 1. Outputs `20250905-tidy-exam-data.txt`.
    + `20250908-tidy-adjust-explore-data.R`: script for tidying, adjusting and exploring data. Exam task 2 and 3. Outputs `20250908-tidy-joined-exam-data.txt`
    + `20250909-creating-plots.R`: script for creating and saving plots. Exam task 4. Outputs:
      `correlation_plot.tiff`,
      `remission_mono_plot.tiff`, 
      `wbc_potassium_plot.tiff`
    + `20250910-statistical-analysis.R`:  script for conducting statistical analysis. Exam task 5. Outputs:
    `hgb_alt_plot.tiff`,
    `hgb_alt_plot_without_outliers.tiff`,
    `cal_tbil.tiff`,
    `remission_chloride.tiff`
    + `20250911-style-scripts.R`: script for styling scripts and Rmarkdown documents.

* `figures`
    + `correlation_plot.tiff` : correlation plot of numerical variables
    + `remission_mono_plot.tiff`: remission of inflammation after Thiopurines for > 12 weeks and change with percent of monocytes in WBC count
    + `wbc_potassium_plot.tiff`: white blood cell count by potassium level
    + `hgb_alt_plot.tiff`: Hemoglobin quartiles vs Alanine Transaminase
    + `hgb_alt_plot_without_outliers.tiff`: Hemoglobin quartiles vs Alanine Transaminase wihtout outliers
    + `cal_tbil.tiff`: Association between calcium and total bilirubin
    + `remission_chloride.tiff`: chloride levels by remission status

