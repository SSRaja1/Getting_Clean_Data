## Install and load required packages
install.packages("magrittr")
install.packages("dplyr")

library("dplyr")
library(magrittr)

setwd("E:/Data Science/Coursera/Work Space/R Program/Cleaning Data/Final1")
filename <- "getdata_dataset.zip"



# Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method = "libcurl", mode = "wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



#Read files and store them into appropiate data frames
feature_df <-read.csv2("UCI HAR Dataset/features.txt",header=FALSE,sep=" ")
activity_df <-read.csv2("UCI HAR Dataset/activity_labels.txt",header=FALSE,sep=" ")
names(activity_df)<-c("ID","DESC")

train_subject_df <-read.csv2("UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep=" ")
train_activity_df <-read.csv2("UCI HAR Dataset/train/y_train.txt",header=FALSE,sep=" ")
train_measure_df <-read.table("UCI HAR Dataset/train/X_train.txt")

test_subject_df <-read.csv2("UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep=" ")
test_activity_df <-read.csv2("UCI HAR Dataset/test/y_test.txt",header=FALSE,sep=" ")
test_measure_df <-read.table("UCI HAR Dataset/test/X_test.txt")

#Create a char vector which contains the name of  each columns
feature_df[,2]<-gsub("[()-]","",feature_df[,2])
feature_df[,2]<-gsub("mean","Mean",feature_df[,2])
feature_df[,2]<-gsub("std","Std",feature_df[,2])
feature_df[,2] <- gsub("^f", "frequencyDomain", feature_df[,2])
feature_df[,2] <- gsub("^t", "timeDomain", feature_df[,2])
feature_df[,2] <- gsub("Acc", "Accelerometer", feature_df[,2])
feature_df[,2] <- gsub("Gyro", "Gyroscope", feature_df[,2])
feature_df[,2] <- gsub("Mag", "Magnitude", feature_df[,2])
feature_df[,2] <- gsub("Freq", "Frequency", feature_df[,2])
feature_df[,2] <- gsub("mean", "Mean", feature_df[,2])
feature_df[,2] <- gsub("std", "StandardDeviation", feature_df[,2])

Name<-c("Subject","Activity")
Name1<- as.character(feature_df[,2])
Name<- c(Name,Name1)

#Create a logical vector which contains  only mean   and std
Name_pos<-(grepl("Subject|Activity|Mean|Std",Name))

#Lookup trainig activity to get corresponding Desc
names(train_activity_df)<-c("ID")
train_activity_df_1<-left_join(train_activity_df,activity_df,by="ID")

names(test_activity_df)<-c("ID")
test_activity_df_1<-left_join(test_activity_df,activity_df,by="ID")

#Combine Subject,Activity,Measure data for Train group and assign column names
train_df<-train_subject_df
train_df[,2]<-train_activity_df_1[,2]
train_df[,3:563]<-train_measure_df
names(train_df)<-Name

#Combine Subject,Activity,Measure data for test group and assign column names
test_df<-test_subject_df
test_df[,2]<-test_activity_df_1[,2]
test_df[,3:563]<-test_measure_df
names(test_df)<-Name

#Combine test and train groups and selected required columns into tidy_df
all_df<-rbind(test_df,train_df)
tidy_df<-all_df[,Name_pos]

Summarized_df <- tidy_df %>%   group_by(Subject, Activity) %>%  summarise_each(funs(mean))

#Export tidy data into a seperate file
write.table(Summarized_df, "tidy.txt", row.names = FALSE, quote = FALSE)