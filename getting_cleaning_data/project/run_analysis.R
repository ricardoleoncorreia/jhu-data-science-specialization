## Load required files
source('methods/transform.R')
source('methods/load.R')

## Merge the training and the test sets to create one data set
training_set <- get_full_dataset("train")
test_set <- get_full_dataset("test")
dataset <- rbind(training_set, test_set)
str(dataset)


## Extract only the measurements on the mean and standard deviation for each measurement
features <- get_features()
dataset <- extract_std_and_mean(dataset, features)
str(dataset)


## Use descriptive activity names to name the activities in the data set
activity_labels <- get_activities()
dataset <- name_activities(dataset, activity_labels)
str(dataset)


## Appropriately labels the data set with descriptive variable names
dataset <- set_variable_names(dataset, features)
str(dataset)


## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
average_dataset <- dataset %>%
                        group_by(activity, subject) %>%
                        summarise_all(funs(mean))
str(average_dataset)
