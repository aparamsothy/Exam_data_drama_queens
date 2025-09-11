# 2025 RMED901A Exam
This project contains the answers to the exam in RMED901A from the group _Data Drama Queens_.<br>
The exam report can be found as an Rmarkdown file and a html file ([20250911-data-drama-queens-exam-report.Rmd](documentation/20250911-data-drama-queens-exam-report.Rmd) and [20250911-data-drama-queens-exam-report.html](documentation/20250911-data-drama-queens-exam-report.html) in the folder `documentation`.

## Folder structure
* [data](data)
    + [data-for-analysis](data/data-for-analysis)
      + [20250905-tidy-exam-data.txt](data/data-for-analysis/20250905-tidy-exam-data.txt): tidied version of exam dataset ("medicaldata"")
      + [20250908-tidy-joined-exam-data.txt](data/data-for-analysis/20250908-tidy-joined-exam-data.txt): tidied and joint version of exam dataset
    + [original-data](data/original-data)   
      + [exam_data.txt](data/original-data/exam_data.txt): received exam data
      + [exam_data_join.txt](data/original-data/exam_data_join.txt): received exam data no. 2
      

* [documentation](documentation)
    + [exam-descr.md](documentation/exam-descr.md): received exam description
    + [original-codebook.html](documentation/original-codebook.html): originally received codebook
    + [20250911-data-drama-queens-exam-report.Rmd](documentation/20250911-data-drama-queens-exam-report.Rmd): Rmarkdown for exam report. 
       Outputs   [20250911-data-drama-queens-exam-report.html](documentation/20250911-data-drama-queens-exam-report.html)
    + [20250911-data-drama-queens-exam-report.html](documentation/20250911-data-drama-queens-exam-report.html): Exam report. 
      
* [script](script)
    + [20250905-Reading-data.R](script/20250905-Reading-data.R): script for reading and tidying data. Exam task 1. Outputs [20250905-tidy-exam-data.txt](data/data-for-analysis/20250905-tidy-exam-data.txt).
    + [20250908-tidy-adjust-explore-data.R](script/20250908-tidy-adjust-explore-data.R): script for tidying, adjusting and exploring data. Exam task 2 and 3. Outputs [20250908-tidy-joined-exam-data.txt](data/data-for-analysis/20250908-tidy-joined-exam-data.txt)
    + [20250909-creating-plots.R](script/20250909-creating-plots.R): script for creating and saving plots. Exam task 4. Outputs:
      [20250909-correlation-plot.tiff](figures/20250909-correlation-plot.tiff),
      [20250909-remission-mono-plot.tiff](figures/20250909-remission-mono-plot.tiff), 
      [20250909-wbc-potassium-plot.tiff](figures/20250909-wbc-potassium-plot.tiff)
    + [20250910-statistical-analysis.R](script/20250910-statistical-analysis.R):  script for conducting statistical analysis. Exam task 5. Outputs:
    [20250910-hgb-alt-plot.tiff](figures/20250910-hgb-alt-plot.tiff),
    [20250910-hgb-alt-plot-without-outliers.tiff](figures/20250910-hgb-alt-plot-without-outliers.tiff),
    [20250910-cal-tbil.tiff](figures/20250910-cal-tbil.tiff),
    [20250910-remission-chloride.tiff](figures/20250910-remission-chloride.tiff)
    + [20250911-style-scripts.R](script/20250911-style-scripts.R): script for styling scripts and Rmarkdown documents.

* [figures](figures)
    + [20250909-correlation-plot.tiff](figures/20250909-correlation-plot.tiff) : correlation plot of numerical variables
    + [20250909-remission-mono-plot.tiff](figures/20250909-remission-mono-plot.tiff): remission of inflammation after Thiopurines for > 12 weeks and change with percent of monocytes in WBC count
    + [20250909-wbc-potassium-plot.tiff](figures/20250909-wbc-potassium-plot.tiff): white blood cell count by potassium level
    + [20250910-hgb-alt-plot.tiff](figures/20250910-hgb-alt-plot.tiff): Hemoglobin quartiles vs Alanine Transaminase
    + [20250910-hgb-alt-plot-without-outliers.tiff](figures/20250910-hgb-alt-plot-without-outliers.tiff): Hemoglobin quartiles vs Alanine Transaminase wihtout outliers
    + [20250910-cal-tbil.tiff](figures/20250910-cal-tbil.tiff): Association between calcium and total bilirubin
    + [20250910-remission-chloride.tiff](figures/20250910-remission-chloride.tiff): chloride levels by remission status

