source('utils.R')

complete <- function(directory, id = 1:332) {
    summary <- c()
    for (name in id) {
        data <- getDataFrame(directory, name)
        completedValues <- getCompleteValues(data)
        summary <- c(summary, completedValues)
    }
    data.frame("id" = id, "nobs" = summary)
}

getCompleteValues <- function(data){
    rowsWithSulfate = !is.na(data[['sulfate']])
    rowsWithNitrate = !is.na(data[['nitrate']])
    
    sum(rowsWithSulfate & rowsWithNitrate)
}