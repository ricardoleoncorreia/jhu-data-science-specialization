source('methods/extract.R')

get_data_from_path <- function(data.file) {
    check_downloaded_data()    
    read.table(data.file, stringsAsFactors = FALSE)
}


get_sub_dataset <- function(dataset_type, mock_path) {
    path <- gsub("type", dataset_type, mock_path)
    get_data_from_path(path)
}


get_full_dataset <- function(dataset_type) {
    x_data <- get_sub_dataset(dataset_type, x_mock_path)
    y_data <- get_sub_dataset(dataset_type, y_mock_path)
    subject_data <- get_sub_dataset(dataset_type, subject_mock_path)
    
    cbind(x_data, y = y_data$V1, subject = subject_data$V1)
}


get_features <- function() {
    features_path <- paste0(data.folder, "/features.txt")
    features_file <- get_data_from_path(features_path)
    features_file[, 2]
}


get_activities <- function() {
    check_downloaded_data()    
    
    activity_path <- paste0(data.folder, "/activity_labels.txt")
    activity_labels <- read.table(activity_path)
    
    colnames(activity_labels) <- c("y", "activity")
    activity_labels
}
