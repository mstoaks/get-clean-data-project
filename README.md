# get-clean-data-project
Repo for the course project for Getting and Cleaning Data

This repository contains one script called "run_analysis.R"

###How run_analysis.R works:
The run_analysis.R script assumes the following data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
has been downloaded into a directory names "./data"

The following files are expected:
* ./data/activity_labels.txt
* ./data/features.txt
* ./data/test/X_test.txt
* ./data/test/y_test.txt
* ./data/test/subject_test.txt
* ./data/train/X_train.txt
* ./data/train/y_train.txt
* ./data/train/subject_train.txt

It does the following:
1. loads the dlpyr and sqldf libraries
2. reads the test and train data files (X_test.txt, X_train.txt)
3. merges them using rbind()
4. adds the feature names as column names (data/features.txt)
5. extracts only the mean and std features. I.e. those features that contain "mean()" or "std()" in their name
6. adds the activity labels for each row (data/activity_labels.txt, data/test/y_test.txt, data/test/y_train.txt)
7. adds the subject data for each row (data/test/subject_test.txt, data/train/subject_train.txt)
8. writes a text file "tidydataset.txt"
