The tidy data set "means-by-subject-activity.txt' is a table that contains the mean value for each feature for each subject/activity
combination. The first line contains the field name.
 * subject -- the subject ID that indicates the person that is involved in data collection
 * activity -- the activity that the subject is doing
 * other -- mean value of the corresponding original features for that subject/activity combination

Here is the steps of processing to get the resulting data from original input data:
  * read in training data, filter out columns whose name don't contain "mean" or "std"
  * read in activity data, map the activity ID to activity name
  * read in subject data
  * combine by column the three data sets from previous steps
  * do the same above four steps for test data
  * combine training data and test data into a big data set
  * group the big data set by "subject" and "activity" and compute the average(mean) of all other columns
  * write output to a file
 

Here is the detailed explanation for each column:
  subject  categorical value
      The unique identifier for each subject
  
  activity -- string 
       The activity name that describes what the subject was doing when the data was recorded
  
  rest -- the mean value of corresponding measurements described by the field name. The explanation of the name is below.
    t*  -- the data is extracted from time series
    f*  -- the data is extracted by applying FFT transform and hence frequency data
    *XYZ -- the 3-axial signals in the X, Y and Z deriections
    mean/std -- indicates how the data is estimated from the signal, it is either mean or std

