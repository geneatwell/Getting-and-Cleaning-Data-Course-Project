# Getting-and-Cleaning-Data-Course-Project
Datascience Project

This README is related to the run_analysis.R function. The origin of the data, and the explanation of the final tidy data set can be found in the codebook (codebook.md file).


The dataset is in the directory UCI HAR Dataset contained in the working directory.

Running the code will read the data from the test and train directories, combine the individual data using cbind into TestSubjectXY (2947 X 563) and TrainSubjectXY (7352 X 563) files and then rbind those two files to create the working dataset named SingleFile (10299 X 563).

Since some of the data are duplicated in the rows, I eliminate those rows since they do not contain any data that will be utilized for the final tidy data set and those data are stored in the file SingleFileNoDups.

I then select columns from SingleFileNoDups that contain either std() or mean(). This creates the file stdmean which contains 68 variables (columns) with 10299 observations (rows).

I create a file named ActivityLabels that uses information from the original dataset showing the names of the activities.  I then parse the file to create Upper/Lower case names that eliminates the capitalization and hyphens in the original dataset.

I merge the ActivityLabels and stdmean files to create a single file named MergedData (69 X 10299) from which I eliminate the column associated with the code for the activities since it will no longer be utilized resulting in MergedData (68 X 10299).  I've not had enough time to complete week 4 lectures about regex, so I was forced to edit a file created during the initial run that I edited using RStudio by the name of Names.csv.  That file existed in my directory and was utilized to then change the column headings to something more readable.

I then grouped MergedData using the Subject and Activity Columns into the file GroupedBy (68 X 10299).

Finally, I summarized the data in GroupedBy using the mean function and stored that in FinalAnswer.

FinalAnswer was then written to the FinalAnswer.txt file which has been uploaded here.


