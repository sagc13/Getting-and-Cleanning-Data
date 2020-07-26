##Library
install.packages("dplyr")
library(dplyr)

## Download File
if (!file.exists("Coursera_DS3_Final.zip")){
  fileZIP <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileZIP, destfile = "Dataset.zip")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip("Dataset.zip") 
}

##Reading Train Data
TrainFeat <- read.table("UCI HAR Dataset/train/X_train.txt",header= FALSE)
TrainAct <- read.table("UCI HAR Dataset/train/y_train.txt",header= FALSE)
TrainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",header= FALSE)

##Reading Test Data
TestFeat <- read.table("UCI HAR Dataset/test/X_test.txt",header= FALSE)
TestAct <- read.table("UCI HAR Dataset/test/y_test.txt",header= FALSE)
TestSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",header= FALSE)

##Merging Features, Activities, Subjects in DataFrame
Feats <- rbind(TrainFeat,TestFeat)
Acts <- rbind(TrainAct,TestAct)
Subject <- rbind(TrainSubject,TestSubject)

##Naming Columns
names(Subject) <- c("Subject")
names(Acts) <- c("Activities")
FeatCol <- read.table("UCI HAR Dataset/features.txt")
names(Feats) <- FeatCol$V2

#Merging everything in one Data set
Dataset <- cbind(Subject,Acts)
Dataset <- cbind(Dataset,Feats)

#Extracting only the measurements on the mean and standard deviation for each measurement.
SubDS <- select(Dataset, Subject, Activities, contains("mean"), contains("std")) 

##Matching Activity Names 
ActNames <- read.table("UCI HAR Dataset/activity_labels.txt",header= FALSE)
SubDS$Activities <- ActNames[SubDS$Activities,2]

##Appropriately labels the data set with descriptive variable names
names(SubDS) <- gsub("^t","Time",names(SubDS))
names(SubDS) <- gsub("Acc", "Accelerometer",names(SubDS))
names(SubDS) <- gsub("Gyro", "Gyroscope",names(SubDS))
names(SubDS) <- gsub("BodyBody", "Body",names(SubDS))
names(SubDS) <- gsub("^f","Frecuency",names(SubDS))
names(SubDS) <- gsub("-mean","Mean",names(SubDS))
names(SubDS) <- gsub("-std","STD",names(SubDS))
names(SubDS) <- gsub("angle","Angle",names(SubDS))
names(SubDS) <- gsub("gravity","Gravity",names(SubDS))

##From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.
SecData <- SubDS %>%
  group_by(Subject, Activities) %>%
  summarise_all(funs(mean))

write.table(SecData,"TidyData.txt", row.names = FALSE)
