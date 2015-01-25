This file describes the data tranformation from the raw data asscociated with the project for the course Getting and Cleaning Data.

The original data come from the "Human Activity Recognition Using Smartphones Dataset" experiment, whose authors are :

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.

For more infomation, visit this site: https://sites.google.com/site/smartlabunige/software-datasets/har-dataset 
or email activityrecognition@smartlab.ws 
or visit the parent site: www.smartlab.ws

It was first necessary to read in the different datasets to create a single dataset.  More information can be found in the Readme.md file.

Orignal Dataset from the original Readme provided with the data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The below listed variables were extracted from that data when they had a mean or standard deviation computed  I did not use any of the Intertial Data:

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

Since the data column names were in a hard to understand, compressed format, I scrubbed the data to make the Column heading more readable.

Additionally, I changed the coded entries of the activities to the actual names of the activities to make it easier to understand what the subject was actually performing.

Lastly, I wrote a summary file that is uploaded to this directory under the name FinalAnswer.txt
