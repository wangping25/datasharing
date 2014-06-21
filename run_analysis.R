########################################
##### some common data and functions
########################################

activity_labels <- read.table("./activity_labels.txt")
features <- read.table("features.txt")

activity_id_to_label <- function(id) {
  # extract the label (which is second column) from
  # corresponiding row(activity id)
  activity_labels[id, 2]
}

# extrac mean/std columns
is_mean_std <- function(x) {
  grepl("mean", x) | grepl("std", x)
}

# create mean and std filter for later use
mean_std_columns <- sapply(features$V2, is_mean_std)
mean_std_columns_indexes <- features[mean_std_columns,]$V1

########################################
##### main data process routing
########################################

data_process <- function(path_x, path_y, path_subject) {
  # read in X set
  data_x <- read.table(path_x)
  # set column names
  colnames(data_x) = features$V2
  # filter out non-mean and non-std columns
  data_x_filtered <- data_x[mean_std_columns_indexes]

  # read in activity
  activity <- read.table(path_y)
  # set column names
  colnames(activity) = c("activity")
  # convert from id to name
  activity_names <- sapply(activity, activity_id_to_label)

  # read in subject
  subject <- read.table(path_subject)
  #rename
  colnames(subject) = c("subject")

  # combine readings with subject and activity
  cbind(data_x_filtered, activity_names, subject)
}

########################################
##### get training/test data
########################################
train <- data_process("./train/X_train.txt", "./train/Y_train.txt", "./train/subject_train.txt")
test <- data_process("./test/X_test.txt", "./test/Y_test.txt", "./test/subject_test.txt")

########################################
##### combine test/train data
########################################
all_data <- rbind(train, test)

########################################
##### Creates a second, independent tidy data set with the average
##### of each variable for each activity and each subject.
########################################
result <- aggregate(. ~ activity + subject, data=all_data, mean)
write.table(result, file="mean-by-subject-activity.txt")




