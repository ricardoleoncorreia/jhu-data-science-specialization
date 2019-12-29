url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

source_classification <- "Source_Classification_Code.rds"
summary_scc_pm25 <- "summarySCC_PM25.rds"

get_data <- function(file_path) {
    if (!file.exists(file_path)) download_data()
    
    readRDS(file_path)
}

download_data <- function() {
    temp <- tempfile()
    download.file(url, temp)
    unzip(temp, exdir = "./")
    unlink(temp)
}