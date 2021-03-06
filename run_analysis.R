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

  # Ingest variable names from features.txt file
  varnames <- read.table("UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE,check.names=FALSE)
  # Select names matching desired string elements and produce subset table
  # with columns corresponding to the named variables
  namidx_mean <- grep(pattern="-mean()",varnames[,2], fixed=TRUE)
  namidx_std <- grep(pattern="-std()", varnames[,2], fixed=TRUE)
  comb_subsx <- select(comb_x, sort(c(namidx_mean,namidx_std)))

  # Prepend subject IDs as first table column
  comb_subsx <- cbind(comb_subj,comb_subsx)
  names(comb_subsx)[1] <- "Subject"

  # Part 3
  # Ingest activity label names
  actnames <- read.table("UCI HAR Dataset/activity_labels.txt",
                         stringsAsFactors = FALSE)
  # Create vector of activity names and prepend as table column
  Activity <- actnames[comb_y[[1]],2]
  comb_subsx <- cbind(Activity,comb_subsx)

  # Part 4
  # Derive numeric-form character column names to match those generated
  # by read.table() default processing
  varncols <- mutate(varnames, sname=paste("V", 
                      as.character(varnames[,1]), sep=""))
  # Extract indices into varncols for each "Vnn" column name in comb_subsx,
  # except for first (Subject) and 2nd (Activity) column
  nindex <- match(names(comb_subsx[-c(1:2)]),varncols[,3])
  # Look up corresponding column names from features.txt and
  # apply those names to comb_subsx columns
  names(comb_subsx)[-c(1:2)] <- varnames[nindex,2]

  # Part 5
  grouped_both <- group_by(comb_subsx,Activity,Subject, add=TRUE)
  # dplyr function (provided with Anglicized spelling only) 
  # as of dplyr v1.2 allows concise computation of result
  sum_tbl <- summarise_each(grouped_both,"mean")
  #adapting & testing per SO post, could replace above summarise_each() call as follows:
  #cols <- names(grouped_both)[-(1:2)]
  #dots <- lapply(cols, function(x) substitute (mean(x), list(x=as.name(x))))
  #sum_tbl <- do.call(summarise,c(list(.data=grouped_both), dots))
  #end of more obscure substitute for summarise_each
  sum_tbl <- mutate(sum_tbl, Subject = factor(Subject))
  return(sum_tbl)
}

out_tbl <- analyze()
write.table(out_tbl,"ucidat.txt",row.names=FALSE)


