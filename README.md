# CleanDataProject
Course project for JHU-Coursera Getting and Cleaning Data course

Last update: 16 May 2015

The run_analysis.R script extracts and processes information from the UCI HAR Dataset, and assumes that
the dataset has already been unzipped into a "UCI HAR Dataset" subdirectory immediately under the R
working directory. It uses the *dplyr* package. Its processing is divided into 5 sequential parts, corresponding
to the steps in the course assignment: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.
