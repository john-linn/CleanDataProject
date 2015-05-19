#Project Codebook
Codebook describing generated dataset

Last update: 19 May 2015

This dataset provides a condensed version of information from the Human Activity
Recognition Using Smartphones Data Set, as published at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
It provides data collected by observations of
30 experimental subjects, each of whom engaged in 6 
identified activities while wearing a smartphone:
WALKING,
WALKING UPSTAIRS,
WALKING DOWNSTAIRS, 
SITTING, 
STANDING, and 
LAYING.
All data was extracted from the "subject", "X", and "y" text files at the
top levels of the input dataset's "test" and "train"
subdirectories, without reference to the inertial data files in lower-level
subdirectories.  Please refer to the "README.txt" and "features\_info.txt" files
in the published dataset for further descriptive information, including 
specifics on normalization of the variables provided. 

For each of the resulting 180 combinations, the generated
dataset provides calculated means for each of 66 variables, with names 
corresponding to those in the "features.txt"
file from the original dataset.  As directed in the course assignment, variables
with names suffixed with "-mean()" or "-std()", optionally followed by
"-X", "-Y", or "-Z" to designate dimensions, were selected; in other words, from
the input dataset, only those variables representing means and standard deviations
were processed.

For each of the variables, the generated dataset provides a computed mean of the 
input dataset's values of that variable that correspond to a particular subject
performing a particular activity. 
Note that some of the variable names
as extracted from "features.txt" differ from those in the dataset's descriptive
"features\_info.txt" file, as, e.g., being prefixed by "fBodyBody" instead
of "fBody" as cited in "features\_info.txt".

###Body Acceleration variables

	tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z          
	tBodyAcc-std()-X            tBodyAcc-std()-Y            tBodyAcc-std()-Z      

###Gravity Acceleration variables  

	tGravityAcc-mean()-X        tGravityAcc-mean()-Y        tGravityAcc-mean()-Z       
	tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z

###Body Acceleration Jerk variables 
       
	tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z      
	tBodyAccJerk-std()-X        tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z 

###Body Gyro variables    
  
	tBodyGyro-mean()-X          tBodyGyro-mean()-Y          tBodyGyro-mean()-Z         
	tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z  

###Body Gyro Jerk variables  
      
	tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z     
	tBodyGyroJerk-std()-X       tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z 

###Body Acceleration Magnitude variables  
   
	tBodyAccMag-mean()          tBodyAccMag-std()

###Gravity Acceleration Magnitude variables 
          
	tGravityAccMag-mean()      	tGravityAccMag-std()        

###Body Acceleration Jerk Magnitude variables

	tBodyAccJerkMag-mean()      tBodyAccJerkMag-std() 

###Body Gyro Magnitude variables 
    
	tBodyGyroMag-mean()         tBodyGyroMag-std()          

###Body Gyro Jerk Magnitude variables

	tBodyGyroJerkMag-mean()    	tBodyGyroJerkMag-std() 

###FFT-transformed Body Acceleration variables  
   
	fBodyAcc-mean()-X           fBodyAcc-mean()-Y          fBodyAcc-mean()-Z
	fBodyAcc-std()-X            fBodyAcc-std()-Y           fBodyAcc-std()-Z            

###FFT-transformed Body Acceleration Jerk variables

	fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      fBodyAccJerk-mean()-Z 
	fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y       fBodyAccJerk-std()-Z        

###FFT-transformed Body Gyro variables

	fBodyGyro-mean()-X          fBodyGyro-mean()-Y         fBodyGyro-mean()-Z
	fBodyGyro-std()-X           fBodyGyro-std()-Y          fBodyGyro-std()-Z           

###FFT-transformed Body Acceleration Magnitude variables

	fBodyAccMag-mean()          fBodyAccMag-std() 

###FFT-transformed Body-Body Acceleration Jerk Magnitude variables 
        
	fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   

###FFT-transformed Body-Body Gyro Magnitude variables

	fBodyBodyGyroMag-mean()		fBodyBodyGyroMag-std()     

###FFT-transformed Body-Body Gyro Jerk Magnitude variables

	fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag-std() 
