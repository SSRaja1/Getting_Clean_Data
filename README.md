# Coursera Getting and Cleaning Data course project
Each analysis needs to have a tidy data. This course provides an example of how
to fetch and clean up the data set and make it ready to use for analysis

This repository contains the  following
1.  README.MD => this file provides overview of this repo and its contents
2.  CodeBook.md => this file, provides a detailed description of the R programme tidyData.R and how it transforms raw data into analysis-ready dataset
3.  run_analysis.R => this R file contains the code which  transforms the raw data
4.  tidy.txt =>this is the transformed sub-set of data using  R programme tidyData.R

## Study Guide
The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Training and test data were first merged together to create one data set, then the measurements on the mean and standard deviation were extracted for each measurement, and then the measurements were averaged for each subject and activity, resulting in the final data set.