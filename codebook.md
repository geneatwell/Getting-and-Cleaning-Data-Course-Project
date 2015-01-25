This file describes the data tranformation from the raw data asscociated with the project for the course Getting and Cleaning Data.

The data originated from the "Human Activity Recognition Using Smartphones Dataset" experiment, whose authors are :

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

Since the data column names were in a hard to understand, compressed format, I scrubbed the data to make the Column headings more readable.

Additionally, I changed the coded entries of the activities to the actual names of the activities to make it easier to understand what the subject was actually performing.

Lastly, I wrote a summary file that is uploaded to this directory under the name FinalAnswer.txt

The variables used in the program run_analysis.R are as follows:

xtest, ytest and test.subject are the files that were read from the original datasets UCI HAR Dataset/test/X_test.txt UCI HAR Dataset/test/Y_test.txt and UCI HAR Dataset/test/subject_test.txt respectively and bound together using cbind to create the TestSubjectXY file.

xtrain, ytrain and train.subject are the files read from the original datasets UCI HAR Dataset/train/X_test.txt UCI HAR Dataset/train/Y_test.txt and UCI HAR Dataset/train/subject_test.txt respectively and bound together using cbind to create the TrainSubjectXY file.

xtest and xtrain had column headings added that came from the UCI HAR Dataset/features.txt file.  test.subject and train.subject had one variable and they were named Subject.  ytest and ytrain had a single variable whose column was named Activities.

TrainSubjectXY and TestSubjectXY were then bound using rbind to create the file SingleFile.  Duplicate rows are eliminated from the file into SingleFileNoDups to create a file that will be parsed for certain variables.

stdmean is created using the SingleFileNoDups file and selecting only columns that contain a mean and standard deviation calculation.  In this case, I was looking for std() and mean() in each variable. stdmean is the file with those specific variables included.

ActivityLabels reads in the cryptic names of all the activities performed(numeric and text) from the file UCI HAR Dataset/activity_labels.txt and work is done on that file to create understandable, English language labels for the activities. Specifically, I first eliminated the underscore(_) from all the names in the second column of ActivityLabels, turned all the names into lower case and then capitalized the first letter of each separate word.  The two columns were named Activities and Subject for later merging activities.

MergedData is the data file that contains the merging of stdmean and ActivityLabels.  There is an extra column referring to the coded activities as a numeric value between 1 and 6 and that column is eliminated since it will not be needed.

Names is a file that was edited to contain column names that are not cryptic and more explanatory.  The t was changed to Time, f was changed to Frequency, std() was changed to STD and mean() was changed to Mean. x, y and z were respectively changed to X Axis, Y Axis and Z Axis.  These changes were then added to the measurements they accompanied.  

GroupedBy is the MergedData file grouped by Subject and Activity columns.

FinalAnswer is the summary of the GroupedBy information applying the mean to each column.

Final Answer.txt is the file containing the required output.



