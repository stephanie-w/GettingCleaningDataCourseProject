# Getting and Cleaning Data Course Project

The goal of this project is to prepare tidy data from the `Human Activity Recognition Using Smartphones` dataset.

This dataset represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for this project [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## How it works
* Download [the zipped dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* unzip the file in your working directory
* run `run_analysis.R` with

        > source("run_analysis.R")
on the command line of R or

        R CMD BATCH run_analysis.R


The `run_analysis.R` script performs the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data computed at ths last step will be available in your working directory in an `analysis.txt` file.

## Code Book

A code book that describes the variables, the data, and transformations performed to clean up the data is available in the [CodeBook.md](https://github.com/stephanie-w/GettingCleaningDataCourseProject/blob/master/CodeBook.md) file.
