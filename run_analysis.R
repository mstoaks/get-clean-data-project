#run_analysis.R

#this script assumes that the data has been downloaded from
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#and placed into a subdirectory of the working dir named ./data

#specifically, it assumes and uses the following data files
#./data/activity_labels.txt
#./data/features.txt
#./data/test/X_test.txt
#./data/test/y_test.txt
#./data/test/subject_test.txt
#./data/train/X_train.txt
#./data/train/y_train.txt
#./data/train/subject_train.txt

library("sqldf", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")

#merge the training and test data sets to create one data set
testPhaseRawData <- read.table("./data/test/X_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
trainPhaseRawData <- read.table("./data/train/X_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
allRawData <- rbind(testPhaseRawData, trainPhaseRawData)

#add the feature names as column names
features <- read.table("./data/features.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
names(features) = c("featureID", "featureName")
names(allRawData) = features$featureName


#we're only interested in mean and std features. I.e. those that end in "mean()" or in "std()
#there are dupes in the features but we can get rid of those because they are NOT the mean() or std() readings we need
allRawData <- allRawData[!duplicated(names(allRawData))]
allRawData <- select(allRawData, contains("mean()"), contains("std()"))


#add the activities to the data

#first read the activity IDs
testPhaseActivityIDs <- read.table("./data/test/y_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
trainPhaseActivityIDs <- read.table("./data/train/y_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
#concat activity IDs
allActivityIDs <- rbind(testPhaseActivityIDs, trainPhaseActivityIDs)
names(allActivityIDs) = "activityID"

#read the activity labels
activityLabels <- read.table("./data/activity_labels.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
names(activityLabels) = c("activityID", "activityName")

#create a new DF of just the labels
allActivityLabels <- sqldf("select activityName from activityLabels inner join allActivityIDs using(activityID)")

#add the activity labels to the raw data
allRawData <- cbind(allActivityLabels, allRawData)

#add the subjects to the data

testPhaseSubjects <- read.table("./data/test/subject_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
trainPhaseSubjects <- read.table("./data/train/subject_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)

allSubjects <- rbind(testPhaseSubjects, trainPhaseSubjects)
names(allSubjects) = "subjectID"

allRawData <- cbind(allSubjects, allRawData)

write.table(allRawData, "tidydataset.txt", row.names=FALSE)
