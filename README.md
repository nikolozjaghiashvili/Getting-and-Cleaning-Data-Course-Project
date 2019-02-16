# Getting and Cleaning Data Course Project
## Initial Dataset

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Zip file contains following datasets:

features.txt - List of all variables
X_train - train dataset
X_test - test dataset
Y_test - activity labels for test (in numeric form)
Y_train - actibity labels for train (in numeric form)
subject_test - subject IDs for test
subject_train - subject IDs for train


## run_analysis.R

R script called run_analysis.R makes the following changes to the original dataset: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step-by-step explanation of the Script

The script in run_analysis.R consists of 7 parts. Parts 1-6 are used to arrive to the dataset in step 4. Scrip requires reshape2 library

Part 1 of the run_analysis.R, is used to read the train and test datasets into R.
Part 2, assigns descriptive variable names to both datasets. The sources of variable names is file features.txt.
Part 3, reads activity and subject datasets into R. Both train and test datasets has the unique pair of activity and subject labels.
Part 4, combins test and train datasets with the appropriante activity and subject labels. The script than merges the two datasets.
Part 5, using the grep function finds the indexes of variables representing standad deviation and mean. The script than extracts the portion of the dataset containing those variables. 
Part 6, using merge function matchies activity lables with activity names, the latter can be found in activity_labels.txt.
Part 7, melts the datasets. Script uses activity and subject columns as IDs, and the rest as measure variables. The dataset is than cast into a separate table containing means based on chosen IDs.

## Tidy Datasets

Dataset in step 4 is not saved.
Dataset in step 5 is saved as tidydata.txt