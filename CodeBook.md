# Code Book for Data in philglaeser/cleaningdataproject repository


3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.









This repository contains the code to process 


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## The following code (script) reads in 8 files containing data 
## associated with an experiment using the Acceleration and Gyroscope capabilities
## of smart phone to measure movements of 30 subjects over 6 activities. 


## The Process
Processing the data requires the execution of 1 script,  run_analysis.R
It performs the following steps on the origional data.

### Step 1 
* Read 8 tables into 8 dataframes
* Note, table are assumed to be in the current working directory
* Name the column with the participant id numbers "Subject"
### Step 2
* Create a True/False column in the features data to select the mean and standard deviation columns.
* Note the meanfreq columns are not selected for this data set.
* 66 columns with meand and std data are selected. 
###Step 3 
* Use the data in the activities table to create a column that associates the proper labels to the activity number in the yTest and yTrain tables
* The column with the descriptions are now labeled "Activities"
### Step 4 
## Subset the features table to only those we want to keep
## Create a vector "ColKeep" which is the list of column numbers to keep 
## Create a vector "ColDisc" with the labels of those columns 
##   by using make.name to insure legitimate column names
## Subset the xTest andxTrain data to only the columns we want
## Create a vector "existnames" with the existing names of the xT... tables
## Rename the columns by matching existing to the desired names

fs <- subset(features, MS == TRUE)
colKeep <- fs$V1
colDisc <- make.names(fs$V2)

xTest <- subset(xTest[,colKeep])
existnames <- names(xTest)
names(xTest)[match(existnames,names(xTest))] <- colDisc

xTrain <- subset(xTrain[,colKeep])
existnames <- names(xTrain)
names(xTrain)[match(existnames,names(xTrain))] <- colDisc

## Step 5
## Combine the subject, activity, and numeric observations in one frame
##  for the train and test data sets
##  Then, put both data sets together to complete instructions 1 through 4
##  Additionally, write the data to a text file to store on the repository.
xTest <- cbind(subTest,Activity=yTest$Activity,xTest)
xTrain <- cbind(subTrain,Activity=yTrain$Activity,xTrain)
allData <- rbind(xTest,xTrain)
write.table(allData, file = "CombinedMeanandStd.txt",row.name=FALSE)

## Step 6 
## Find the mean for all variables grouped by Subject and Activity.
## 30 Subjects x 6 Activities give 180 observations, each with means for 66 variables.
## Write the result to a file to complete instruction 5
SumData <- allData %>% group_by(Subject, Activity) %>% summarize_each(funs(mean)) 
write.table(SumData, file = "MeansOfSelectedVariablesBySubjectAndActivity.txt",row.name=FALSE)






###



Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ (6)
tGravityAcc-XYZ (6)
tBodyAccJerk-XYZ (6)
tBodyGyro-XYZ (6)
tBodyGyroJerk-XYZ (6)
tBodyAccMag (2)
tGravityAccMag (2)
tBodyAccJerkMag (2)
tBodyGyroMag (2)
tBodyGyroJerkMag (2)
fBodyAcc-XYZ (6)
fBodyAccJerk-XYZ (6)
fBodyGyro-XYZ (6)
fBodyAccMag (2)
fBodyAccJerkMag (2)
fBodyGyroMag (2)
fBodyGyroJerkMag (2)

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'







### MeansOfSelectedVariablesBySubjectAndActivity.txt

This dataset contains the averages of the means and standard deviations for the data in the ??? data set.
There are 30 subjects in the study, each with 6 activities, for a total of 180 rows. 

The following list provides the type of data contained in each column of the file 

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

