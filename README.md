### Getting & Cleaning Data Course Project
-------------------------------------------

#### <ins>Brief Introduction</ins>

This project is dealing with cleaning up data related to wearable technology. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Groundwork

The data needed can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
run_analysis.R can only be run assuming working with a directory containing the needed datafiles, which can be done using the setwd() function.

###Part 1

Reading both training and test datasets, and merging them into one using rbind() command.

###Part 2

Using sapply(), we are able to extract both the mean and standard deviation from the merged file in Part 1.

### Part 3

Using the data file which contains the labels of all 6 activities, map the description of the activities on the activity IDs for both training and test dataset.

###Part 4

The "features" file contains the labels for 561 features
Label the features on the merged datafile as column names.

###Part 5

Since each of the 30 individuals have 6 activities tested, the final tidy dataset should have 180 rows
Using data.table package introduced in the R Programming course and the lapply() function, obtaining both the mean and SD for each activity and subject.
