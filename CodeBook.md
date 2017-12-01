## Data
 The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones DataSet from URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
 This dataset contains for 2 set  of subjects test and train  who performed one or more of following activities wearing a smartphone (Samsung Galaxy S II)

   1) WALKING
   2) WALKING_UPSTAIRS
   3) WALKING_DOWNSTAIRS
   4) SITTING
   5) STANDING
   6) LAYING
 
  Using Samsung Galaxy S II's  embedded accelerometer and gyroscope subject's vital are captured and stored for analysis.
 ### Prerequisite for the program
  Prior to executing the R program, make sure package dplyr is installed. If not get the package installed
        install.packages("dplyr")
        install.packages("magrittr")
 
 ### Data Transformation Walk Through
  This section provides a walkthrough  on how does tidyData.R transforms the data
 
 1) Set a current working directory, which would host the input data files and stores the  final results
 2) Download the dataset  and unzip the contents
 3) Read the following files into separate data frame for further processing
    - 'features.txt': List of all features.
    - 'activity_labels.txt': Links the class labels with their activity name.
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels.
    - 'train/subject_train.txt': Each row identifies the subject who was part of train category performed the activity for each window sample. Its range is from 1 to 30.
    - 'test/subject_train.txt': Each row identifies the subject who was part of test category performed the activity for each window sample. Its range is from 1 to 30.
 4) Clean the contents of features.txt by removing  special characters '-','(',')' and capitalize mean and std for easy reading
 5) Create a new character vector Name, which shall contain list of all columns names
 6) Combine data frames of train/X_train.txt;train/y_train.txt;train/subject_train.txt  to form a consolidated train data frame
 7) Combine data frames of test/X_test.txt;test/y_test.txt;test/subject_test.txt  to form a consolidated test data frame
 8) Now consolidate both train and test dataset into a single data frame and subset only required columns into tidy_df
 9) Export the tidy_df into an external text file