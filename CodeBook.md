# Code Book for Data in philglaeser/cleaningdataproject repository

## Overview
The tidy datasets described herein originates from data which is split across 8 datasets.
The original data resulted from an experiment using motion sensors in a smartphone
to measure movements of 30 subjects over 6 activities.

The first goal is to extract only certain types of data measurements, mean and standard deviation, and combine
both the test and trial subjects into one table.  This table is named "CombinedMeanandStd.txt".

The second goal is to summarize this data by taking the mean of the selected measurements grouped by the subject and the activity.
This table is named "MeansOfSelectedVariablesBySubjectAndActivity.txt".

## The Process

Processing the data requires the execution of 1 script, run_analysis.R.
It performs the following steps on the origional data.

### Step 1 
* Read 8 tables into 8 dataframes
* Note, table are assumed to be in the current working directory
* Name the column with the participant id numbers "Subject"

### Step 2
* Create a True/False column in the features data to select the mean and standard deviation columns.
* Note the meanfreq columns are not selected for this data set.
* 66 columns with mean and std data are selected. 

###Step 3 
* Use the data in the activities table to create a column that associates the proper labels to the activity number in the yTest and yTrain tables
* The column with the descriptions are now labeled "Activities"

### Step 4 
* Subset the features table to only those we want to keep
* Create a vector "ColKeep" which is the list of column numbers to keep 
* Create a vector "ColDisc" with the labels of those columns by using make.name to insure legitimate column names
* Subset the xTest andxTrain data to only the columns we want
* Create a vector "existnames" with the existing names of the xT... tables
* Rename the columns by matching existing to the desired names

### Step 5
* Combine the subject, activity, and numeric observations in one frame for the train and test data sets
* Then, put both data sets together to complete instructions 1 through 4
* Additionally, write the data to a text file to store on the repository.

## Step 6 
* Find the mean for all variables grouped by Subject and Activity.
* 30 Subjects x 6 Activities give 180 observations, each with means for 66 variables.
* Write the result to a file to complete instruction 5 of the assignment

## Variable Names
The columns names for both the summary datasets contain herein are the same.
The 'Subject' column contains the subject id number which ranges from 1 to 30.
The 'Activity' column contains a character string representing one of the 6 activities performed by the subjects.

The remaining columns were renaimed slightly from the original dataset descriptions of the data in order to make valid column labels.
This means that '-', '(', and ')' characters were changed to '.'

For the "CombinedMeanandStd.txt" dataset, the observations are the same as the corresponding origional data.

For the "MeansOfSelectedVariablesBySubjectAndActivity.txt", the data is grouped by the subject and the activity with the mean of each group of observations shown. 

The following list provides the names of data contained in each column of both the datasets. 

 1. Subject
 2. Activity
 3. tBodyAcc.mean...X
 4. tBodyAcc.mean...Y
 5. tBodyAcc.mean...Z
 6. tBodyAcc.std...X
 7. tBodyAcc.std...Y
 8. tBodyAcc.std...Z
 9. tGravityAcc.mean...X
 10. tGravityAcc.mean...Y
 11. tGravityAcc.mean...Z
 12. tGravityAcc.std...X
 13. tGravityAcc.std...Y
 14. tGravityAcc.std...Z
 15. tBodyAccJerk.mean...X
 16. tBodyAccJerk.mean...Y
 17. tBodyAccJerk.mean...Z
 18. tBodyAccJerk.std...X
 19. tBodyAccJerk.std...Y
 20. tBodyAccJerk.std...Z
 21. tBodyGyro.mean...X
 22. tBodyGyro.mean...Y
 23. tBodyGyro.mean...Z
 24. tBodyGyro.std...X
 25. tBodyGyro.std...Y
 26. tBodyGyro.std...Z
 27. tBodyGyroJerk.mean...X
 28. tBodyGyroJerk.mean...Y
 29. tBodyGyroJerk.mean...Z
 30. tBodyGyroJerk.std...X
 31. tBodyGyroJerk.std...Y
 32. tBodyGyroJerk.std...Z
 33. tBodyAccMag.mean..
 34. tBodyAccMag.std..
 35. tGravityAccMag.mean..
 36. tGravityAccMag.std..
 37. tBodyAccJerkMag.mean..
 38. tBodyAccJerkMag.std..
 39. tBodyGyroMag.mean..
 40. tBodyGyroMag.std..
 41. tBodyGyroJerkMag.mean..
 42. tBodyGyroJerkMag.std..
 43. fBodyAcc.mean...X
 44. fBodyAcc.mean...Y
 45. fBodyAcc.mean...Z
 46. fBodyAcc.std...X
 47. fBodyAcc.std...Y
 48. fBodyAcc.std...Z
 49. fBodyAccJerk.mean...X
 50. fBodyAccJerk.mean...Y
 51. fBodyAccJerk.mean...Z
 52. fBodyAccJerk.std...X
 53. fBodyAccJerk.std...Y
 54. fBodyAccJerk.std...Z
 55. fBodyGyro.mean...X
 56. fBodyGyro.mean...Y
 57. fBodyGyro.mean...Z
 58. fBodyGyro.std...X
 59. fBodyGyro.std...Y
 60. fBodyGyro.std...Z
 61. fBodyAccMag.mean..
 62. fBodyAccMag.std..
 63. fBodyBodyAccJerkMag.mean..
 64. fBodyBodyAccJerkMag.std..
 65. fBodyBodyGyroMag.mean..
 66. fBodyBodyGyroMag.std..
 67. fBodyBodyGyroJerkMag.mean..
 68. fBodyBodyGyroJerkMag.std..

