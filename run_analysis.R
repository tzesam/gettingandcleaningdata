####################
##Getting and Cleaning Data
##Course Project
####################

##Setting work directory for Samsung files
#Change accordingly in order to run code
getwd()
setwd("C:/Users/tzesam/Desktop/Coursera/Module3/UCI HAR Dataset")

##Step 1
#Reading and merging both test and train datasets
train.df <- read.table("./train/X_train.txt", header=F)
test.df <- read.table("./test/X_test.txt", header=F)
merged.df <- rbind(train.df,test.df)
#Check if dimensions match the description
dim(merged.df)

##Step 2
#Mean of each measurement in the dataset
mean.df <- sapply(merged.df,mean,na.rm=T)
#SD of each measurement in the dataset
sd.df <- sapply(merged.df,sd,na.rm=T)

##Step 3
#Uses descriptive activity names to name the activities in the data set
activities_labels <- read.table("./activity_labels.txt",header=F,colClasses="character")
train.act <- read.table("./train/y_train.txt",header=F)
test.act <- read.table("./test/y_test.txt",header=F)
#transforming labels as factors
train.act[,1] <- factor(train.act[,1],levels=activities_labels[,1],labels=activities_labels[,2])
test.act[,1] <- factor(test.act[,1],levels=activities_labels[,1],labels=activities_labels[,2])
merged.act <- rbind(train.act,test.act)
colnames(merged.act) <- "activity"

##Step 4
#Appropriately labels the data set with descriptive variable names
features <- read.table("./features.txt",header=F,colClasses="character")
colnames(merged.df) <- features$V2
#Subjects
train.sub <- read.table("./train/subject_train.txt",header=F)
test.sub <- read.table("./test/subject_test.txt",header=F)
merged.sub <- rbind(train.sub,test.sub)
colnames(merged.sub) <- "subject"

##Step 5
#Create a second, independent tidy data set with the average of 
#each variable for each activity and each subject
#First, merge all the data we have obtained from previous steps
library(data.table)
final.df <- cbind(merged.df,merged.act,merged.sub)
final.dt <- data.table(final.df)
#Easier to work with using data table, mean and SD for each of the 6 activities for all 30 individuals
tidy_data <- final.dt[,lapply(.SD,mean),by="activity,subject"]
dim(tidy_data)

#Writing the tidy_dataset
write.table(tidy_data,"tidy_data.txt",row.name=F)
