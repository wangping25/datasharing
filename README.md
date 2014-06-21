This repro contains the following two files:
 * readme -- this read me file
 * run_analysis.R -- The R script file that contains the code to process data originated from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and created a tidy data that contains averge measurements by subject and activity, the measurements covers only measurements that contains "mean" or "std" in original data set
 * tidy data set -- the data created from run_analysis.R which contains mean for all columns group by activity and subject
 * Code book -- 

### The raw data
The raw data comes from here:
  * The https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip The data originates from here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, see the describption here for details

### The data process
  The following steps are done to do the data process:
  * read in training data, filter out columns whose name don't contain "mean" or "std"
  * read in activity data, map the activity ID to activity name
  * read in subject data
  * combine by column the three data sets from previous steps
  * do the same above four steps for test data
  * combine training data and test data into a big data set
  * group the big data set by "subject" and "activity" and compute the average(mean) of all other columns
  * write output to a file

### The tidy data set
  * the output data contains the data created from run_analysis.R which contains mean for all columns group by activity and subject


### The code book
