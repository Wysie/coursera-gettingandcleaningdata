if (!require(plyr)) {
  install.packages("plyr") 
}

library(plyr)

#Step 0: Download the dataset and unzip it
har_dataset <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", har_dataset, "curl", quiet=TRUE)
unzip(har_dataset)
unlink(har_dataset)

#Step 1: Merges the training and the test sets to create one data set.
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="Label")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testData <- cbind(testSubjects, testLabels, testSet) #Merge all test data

trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="Label")
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingData <- cbind(trainingSubjects, trainingLabels, trainingSet) #Merge all training data

mergedData <- rbind(testData, trainingData) #Merge test and training data

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("Index", "Feature"), colClasses="character")
featuresFiltered <- features[grepl("mean\\(\\)|std\\(\\)", features$Feature), ]
mergedDataWithoutLabelsSubjects <- mergedData[, c(-1, -2)][, as.numeric(featuresFiltered$Index)] #Get merged data without labels and subjects, and filter them based on the filtered features
mergedDataFiltered <- cbind(mergedData[, c(1, 2)], mergedDataWithoutLabelsSubjects) #Merge back filtered merged data with labels and subjects

#Step 3: Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("Index", "Label"))
mergedDataFiltered$Label <- activityLabels[mergedDataFiltered$Label, "Label"]

#Step 4: Appropriately labels the data set with descriptive variable names.
colnames(mergedDataFiltered) <- c("Subject", "Activity", featuresFiltered$Feature)

#Step 5:
newData = ddply(mergedDataFiltered, .(Subject, Activity), numcolwise(mean))
write.csv(newData, "newData.csv", row.names=FALSE)