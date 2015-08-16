##Class Project Codebook - Getting and Cleaning Data

This analysis uses the data files available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Tbe script run_analysis.R assumes that the data has been unpacked into a subdirectory called ./data. Specifically, it assumes and uses the following data files
./data/activity_labels.txt
./data/features.txt
./data/test/X_test.txt
./data/test/y_test.txt
./data/test/subject_test.txt
./data/train/X_train.txt
./data/train/y_train.txt
./data/train/subject_train.txt

The download also contains a README.txt file which explains the files in detail.


##Data Used for the Analysis
Of the data provided by the above set and described in features.txt, I used the following variables:

tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z          
tGravityAcc-mean()-X        tGravityAcc-mean()-Y        tGravityAcc-mean()-Z        tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y      
tBodyAccJerk-mean()-Z       tBodyGyro-mean()-X          tBodyGyro-mean()-Y          tBodyGyro-mean()-Z          tBodyGyroJerk-mean()-X     
tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z      tBodyAccMag-mean()          tGravityAccMag-mean()       tBodyAccJerkMag-mean()     
tBodyGyroMag-mean()         tBodyGyroJerkMag-mean()     fBodyAcc-mean()-X           fBodyAcc-mean()-Y           fBodyAcc-mean()-Z          
fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y       fBodyAccJerk-mean()-Z       fBodyGyro-mean()-X          fBodyGyro-mean()-Y         
fBodyGyro-mean()-Z          fBodyAccMag-mean()          fBodyBodyAccJerkMag-mean()  fBodyBodyGyroMag-mean()     fBodyBodyGyroJerkMag-mean()
tBodyAcc-std()-X            tBodyAcc-std()-Y            tBodyAcc-std()-Z            tGravityAcc-std()-X         tGravityAcc-std()-Y        
tGravityAcc-std()-Z         tBodyAccJerk-std()-X        tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z        tBodyGyro-std()-X          
tBodyGyro-std()-Y           tBodyGyro-std()-Z           tBodyGyroJerk-std()-X       tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z      
tBodyAccMag-std()           tGravityAccMag-std()        tBodyAccJerkMag-std()       tBodyGyroMag-std()          tBodyGyroJerkMag-std()     
fBodyAcc-std()-X            fBodyAcc-std()-Y            fBodyAcc-std()-Z            fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y       
fBodyAccJerk-std()-Z        fBodyGyro-std()-X           fBodyGyro-std()-Y           fBodyGyro-std()-Z           fBodyAccMag-std()          
fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-std()      fBodyBodyGyroJerkMag-std() 

**These were chosen because the other features (many of the frequency domain variables) were duplicated and thus were likely faulty data. For details, see this thread:
https://class.coursera.org/getdata-031/forum/thread?thread_id=214**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


For more details on these data, see the features_info.txt file in the data zip. This file is also available here:
https://github.com/mstoaks/get-clean-data-project/blob/master/data/features_info.txt


##Tidy Data Set Info
run_analysis.R creates tidy data sets and writes a narrow version to disk called tidydata-narrow.txt.

This data set contains the following columns:
subjectId - the identity of the subject
activityName - the name of the activity the subject participated in (i.e. WALKING, etc.)
feature - the feature being measured
featureMean - the mean value of the feature for over multiple runs






 