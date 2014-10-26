### Introduction

This repository is hosting the R code for the Getting and Cleaning Data Course Project.

### Data Set

The data set "Human Activity Recognition Using Smartphones" has been taken from UCI.

### Files

#### README.md
This file that you are currently reading.

#### CodeBook.md
This file describes the variables used in the data set.

#### run_analysis.R
This is the main script that should be executed for this project. It uses the "plyr" library for the ddply function. At the start of the script, there is a check to see if the "plyr" library exists, if not, it attempts to download and install that. Following that are the following steps:

##### Step 0: Download the dataset and unzip it.
The data set is downloaded from UCI and extracted to a "UCI HAR Dataset" folder within the current working directory. All data cleaning work is then done based off the downloaded data.

##### Step 1: Merges the training and the test sets to create one data set.
This step reads in all the test data sets and merges them into a data frame, and repeats the same steps for all the training data sets. Once done, both data sets are merged into a single data frame.

##### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
This step reads in the features.txt file and filters away all features that do not use mean() or std(). Once done, the remaining features are then merged with the data set created in step 1 and used to filter that data set so that only measurements on the mean and standard deviation remain.

##### Step 3: Uses descriptive activity names to name the activities in the data set.
This step uses the data available in activity_labels.txt to give each activity a descriptive name (instead of having numbers).

##### Step 4: Appropriately labels the data set with descriptive variable names.
This step renames "Label" to "Activity", and also gives each of the other data columns a name based on the feature/measurement, instead of having just numbers.

##### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This step makes use of ddply to summmarize the cleaned up data, and then writes it to a file "newData.csv".