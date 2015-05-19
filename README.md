# CleanDataProject
Course project for JHU-Coursera Getting and Cleaning Data course

Last update: 19 May 2015

The run_analysis.R script extracts and processes information from the UCI HAR Dataset, and assumes that
the dataset has already been unzipped into a "UCI HAR Dataset" subdirectory immediately under the R
working directory. It uses the *dplyr* package.  The script defines and then executes
an *analyze()* function, which performs most of the actual data processing. 

The *analyze()* function's processing is divided into 5 sequential parts, corresponding
to the steps in the course assignment: 

1. Merges the training and the test sets to create one data set. "subject", "X", and "y" .txt
files are read from the training and test folders into R, and 
*rbind()* is used to combine each pair
into a corresponding "comb" object. 

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
*grep()* calls are used to select matching columns, based on names in the
input dataset's "features.txt" file.  The subject IDs are extracted and
prepended as the first column within "comb\_subsx". 

3. Uses descriptive activity names to name the activities in the data set. 
Names from the input dataset's "activity\_labels.txt" file are prepended
to become the new first column within "comb\_subsx", shifting the other columns right. 

4. Appropriately labels the data set with descriptive variable names. 
Names from the input dataset's "features.txt" file are used. 

5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.  The *summarise_each()*
function, added to *dplyr* as of version 1.2, provides a concise means to perform
needed computations.  The *analyze()* function returns the generated table as its
result, and the calling script then writes it to text file "ucidat.txt". 

For reference, the contents saved in "ucidat.txt" can be read back into an R 
data frame named "frm" to obtain the same data classes as processed within
*analyze()* by using the following pair of R function calls, assuming that
*dplyr* has been loaded:

	frm <- read.table("ucidat.txt",header=TRUE, check.names=FALSE)
	frm <- mutate(frm,Subject=factor(Subject),Activity=factor(Activity))

This script has been tested within RStudio v. 0.98.1102 using R version 3.1.2 (Pumpkin 
Helmet) on Mac OS X 10.10.3 Yosemite and
on Ubuntu 15.04 (32-bit).  Dplyr package version 0.4.1 was used on both platforms. 
