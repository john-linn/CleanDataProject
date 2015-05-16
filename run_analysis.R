library(dplyr)

analyze <- function () {
  # Part 1
  # Read partitioned dataset components into data frames
  test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
  test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
  test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
  train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
  train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
  train_y <- read.table("UCI HAR Dataset/train/y_train.txt")

  # Consolidate datasets
  comb_subj <- rbind(test_subj, train_subj)
  comb_x <- rbind(test_x, train_x)
  comb_y <- rbind(test_y, train_y)

  # Part 2
  # Select only the computed means and standard deviations for 17 variables
  # Features.txt identifies columns corresponding to variables

  # Ingest variable names
  varnames <- read.table("UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE,check.names=FALSE)
  names_mean <- grep(pattern="-mean()",varnames[,2], fixed=TRUE)
  names_std <- grep(pattern="-std()", varnames[,2], fixed=TRUE)

  comb_subsx <- select(comb_x, sort(c(names_mean,names_std)))

  # Prepend subject IDs as first table column
  comb_subsx <- cbind(comb_subj,comb_subsx)
  names(comb_subsx)[1] <- "Subject"

  # Part 3
  # Ingest activity label names
  actnames <- read.table("UCI HAR Dataset/activity_labels.txt",
                         stringsAsFactors = FALSE)
  # Create vector of names
  Activity <- actnames[comb_y[[1]],2]
  comb_subsx <- cbind(Activity,comb_subsx)

  # Part 4
  # Derive numeric-form column names
  varncols <- mutate(varnames, sname=paste("V", 
                      as.character(varnames[,1]), sep=""))
  # Extract indices into varncols for each "Vnn" column name in comb_subsx,
  # excepting comb_subsx's first (Subject) and 2nd (Activity) column
  nindex <- match(names(comb_subsx[-c(1:2)]),varncols[,3])
  # Look up corresponding column names
  namevec <- varnames[nindex,2]
  # Apply names ingested from features.txt to comb_subsx columns
  names(comb_subsx)[-c(1:2)] <- namevec

  # Part 5
  grouped_both <- group_by(comb_subsx,Activity,Subject)
  # Recent dplyr function (with British spelling only) allows concise result
  grpout <- summarise_each(grouped_both,"mean")
  write.table(grpout,"ucidat.txt",row.names=FALSE)
}

analyze()

