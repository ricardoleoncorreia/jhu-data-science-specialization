library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

data.folder <- "UCI HAR Dataset"

subject_mock_path <- paste0(data.folder, "/type/subject_type.txt")
x_mock_path <- paste0(data.folder, "/type/X_type.txt")
y_mock_path <- paste0(data.folder, "/type/y_type.txt")


check_downloaded_data <- function() {
    if (!file.exists(data.folder)) download_data()
}


download_data <- function() {
    temp <- tempfile()
    download.file(url, temp)
    unzip(temp, exdir = "./")
    unlink(temp)
}
