==================================================================
Johns Hopkins University, Getting and Cleaning Data course project
Version 1.0
==================================================================
Ricardo Leon
www.ricardoleoncorreia.com
==================================================================


Expected outputs
================

* Train and test sets merged as one tidy dataset (named tidy_dataset.txt)
* Summary tidy dataset with averages grouped by subject and activity (named summary_dataset.txt)


Feature Selection (taken from the original features info doc)
=============================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available in 'features.txt'


Data Source
===========

* Original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Project source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Data process
============

There are 5 main steps that were folloed during the processing:

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The detail for each step is described below

### Merge the training and the test sets to create one data set

1. Download all the files
2. Read X_train data
3. Read y_train data and set "y" as column name
4. Read subject_train data and set "subject" as column name
5. Merge previous three training datasets
6. Read X_test data
7. Read y_test data and set "y" as column name
8. Read subject_test data and set "subject" as column name
9. Merge previous three test datasets
10. Append test set below the training set to create only one dataset

### Extract only the measurements on the mean and standard deviation for each measurement

1. Load features from features.txt
2. Look for column names that has "mean" or "std" in it
3. Save resulting names in new_features.txt file (in root folder)
4. Select from the dataset all columns of interest

### Use descriptive activity names to name the activities in the data set

1. Load activities from activity_labels.txt
2. Merge activities with dataset by "y" column
3. Remove "y" column from resulting dataset

### Appropriately labels the data set with descriptive variable names

1. Get a vector with requested features and add "activity" and "subject" labels
2. Name columns
3. Reorder columns
4. Save data in tidy_dataset.txt

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

1. Group data by "activity" and "subject"
2. Get all mean values by groups
3. Save data in summary_dataset.txt
