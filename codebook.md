This file describes the data tranformation from the raw data asscociated with the project for the course Getting and Cleaning Data.

The original data come from the "Human Activity Recognition Using Smartphones Dataset" experiment, whose authors are :

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. 
For more infomation, visit this site: https://sites.google.com/site/smartlabunige/software-datasets/har-dataset 
or email activityrecognition@smartlab.ws 
or visit the parent site: www.smartlab.ws

It was first necessary to read in the different datasets to create a single dataset.  More information can be found in the Readme file.

The below listed variables were extracted from that data when they had a mean or standard deviation computed:

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

Lastly
