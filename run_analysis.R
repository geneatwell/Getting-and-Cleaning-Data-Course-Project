rm(list=ls())
library(tidyr)
library(dplyr)
library(stringr)

##################################################################################################
#Read Data Files and name each column of data
test.subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(test.subject)<-"Subject"

xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
Title = read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
TitleCharacter<-as.character(Title[,"V2"])
names(xtest)<-TitleCharacter


ytest<-read.table("UCI HAR Dataset/test/Y_test.txt")
names(ytest)<-"Activities"

train.subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(train.subject)<-"Subject"

xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
names(xtrain)<-TitleCharacter

ytrain<-read.table("UCI HAR Dataset/train/Y_train.txt")
names(ytrain)<-"Activities"
##################################################################################################

##################################################################################################
#Combine Test and Training Data into their respective files to be combined again in the next step.
TestSubjectXY<-cbind(test.subject,ytest,xtest)
TrainSubjectXY<-cbind(train.subject,ytrain,xtrain)
##################################################################################################        


##################################################################################################
#Combine the Test and Training Data into a single file.
SingleFile<-rbind(TrainSubjectXY, TestSubjectXY)

#Due to duplicate row names, I'm removing those lines that are duplicated because none of them 
#have mean() or std() in their title and their absence will not affect the final output.
dups<-which(duplicated(TitleCharacter))
SingleFileNoDups<-SingleFile[,-dups]


#Select only those columns that contain mean() and std()
stdmean<-select(SingleFileNoDups,1:2,contains("std()"),contains("mean()"))

#This reads in the datafile containing the names of the six activities represented by 1:6 in the data files.
ActivityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
ActivityLabels[,2] <- sub("_"," ",ActivityLabels[,2])
ActivityLabels[,2]<-tolower(ActivityLabels[,2])
simpleCap <- function(x) {
        s <- strsplit(x, " ")[[1]]
        paste(toupper(substring(s, 1,1)), substring(s, 2),
              sep="", collapse=" ")
}
ActivityLabels[,2]<-sapply(ActivityLabels[,2],simpleCap)


names(ActivityLabels)<-c("Activities","Activity")


#This will eliminate the underscore character (_) from each activity description for a neater presentation.
#ActivityLabels[,"Activity"]<-str_replace_all(ActivityLabels[,"Activity"],"[[:punct:]\\_]+"," ")

#This will change all numeric representations of a particular activity into the actual activity.
MergedData<-merge(stdmean,ActivityLabels)

#The following two lines were used in the intial creation of a file that I edited using RStudio to change
#the names from the cryptic orginal names of the columns.  Since that file now exists, I've commented
#these two lines out.  I did not have enough time to learn week 4 about regex and was unable to
#find out how to use regex to replace the names I needed in enough time to submit this.
#TitleMerged<-names(MergedData)
#write.csv(TitleMerged, file = "Names.csv")
Names<-read.csv("Names.csv")
names(MergedData)<-Names[,2]
MergedData<-MergedData[,-1]

#Final work to summarize the data within the required groups for this project.
GroupedBy <- group_by(MergedData, Subject, Activity)
FinalAnswer<-summarise_each(GroupedBy, funs(mean))

#Writes the data to the required file to be uploaded for completion of the project
write.table(FinalAnswer, file = "FinalAnswer.txt", row.name=FALSE)

