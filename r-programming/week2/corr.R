corr <- function(directory, threshold = 0) {
    summary <- c()
    fileNames <- list.files(directory)
    old.dir = getwd()
    setwd(directory)
    for (fileName in fileNames) {
        data <- read.csv(fileName)
        correlationValue <- getCorrelation(data, threshold)
        if (!is.na(correlationValue)) {
            summary <- c(summary, correlationValue)
        }
    }
    setwd(old.dir)
    summary
}

getCorrelation <- function(data, threshold){
    notEmptyColumns = !is.na(data[['sulfate']]) & !is.na(data[['nitrate']])
    notEmptySulfate = data[['sulfate']][notEmptyColumns]
    notEmptyNitrate = data[['nitrate']][notEmptyColumns]
    
    correlation <- if (sum(notEmptyColumns) >= threshold) {
        cor(notEmptySulfate, notEmptyNitrate)
    } else {
        NA
    }
    correlation
}