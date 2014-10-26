# Code Book

### Subject and Activity

These variables identify the unique subject/activity pair the variables relate to:

 - Subject: The subject ID
 - Activity: The activity name
  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIRS
  - WALKING_UPSTAIRS  

### Measurement Means

All variables are the average of a measurement for each subject and activity. As such, all of the variable names started with a "mean-" prefix. All variable names are of the form:

mean-[x]NameOfMeasurement-[y]-[Z]

where x will be t if it is a time domain measurement, or f if it is a frequency domain measurement, y will be either mean() or std(), and Z is used to denote the signals in the X, Y or Z directions. Some examples of variable names are given as follows:

 - mean-tBodyAcc-mean()-X
 - mean-tBodyAcc-mean()-Y
 - mean-tBodyAcc-mean()-Z