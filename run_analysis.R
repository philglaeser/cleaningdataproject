## Getting and Cleaning Data Course Project
## Coded by PBG

## The following code (script) reads in 8 files containing data 
## associated with an experiment using the Acceleration and Gyroscope capabilities
## of smart phone to measure movements of 30 subjects over 6 activities. 

require(dplyr)

## Step 1 
## Read 8 tables into 8 dataframes
## Note, table are assumed to be in the current working directory
## Name the column with the participant id numbers "Subject"

activities <- read.table("activity_labels.txt")
features <- read.table("features.txt")

yTest <- read.table("y_test.txt")
xTest <- read.table("x_test.txt")
subTest <- read.table("subject_test.txt")

yTrain <- read.table("y_train.txt")
xTrain <- read.table("x_train.txt")
subTrain <- read.table("subject_train.txt")

names(subTest) <- "Subject"
names(subTrain) <- "Subject"

## Step 2
## Create a True/False column inthe features data to select the
##   mean and standard deviation columns.
## Note the meanfreq columns are not selected for this data set.
## 66 columns are selected. 
strMS <- "mean[(]|std"
features$MS <- features$V1  %in% grep(strMS, features$V2)

## Step 3 
## Use the data in the activities table to create a column 
## that associates the proper labels to the activity number
## in the yTest and yTrain tables
## The column with the descriptions are now labeled "Activities"
aNum <- as.character(activities$V1)
aName <- activities$V2
yTest$Activity <- factor(yTest$V1, aNum, aName)
yTrain$Activity <- factor(yTrain$V1, aNum, aName)

## Step 4 
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
