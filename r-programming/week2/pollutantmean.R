source('utils.R')

pollutantmean <- function(directory, pollutant, id = 1:332) {
    totalSum <- 0
    totalValues <- 0
    for (name in id) {
        data <- getDataFrame(directory, name)
        totals <- getTotals(data, pollutant)
        
        totalSum <- totalSum + totals[["totalSum"]]
        totalValues <- totalValues + totals[["totalValues"]]
    }
    totalSum / totalValues
}

getTotals <- function(data, pollutant) {
    selectedColumn <- data[[pollutant]]
    
    rowsWithNA = is.na(selectedColumn)
    nonNAValues = selectedColumn[!rowsWithNA]
    
    c(totalSum = sum(nonNAValues), totalValues = length(nonNAValues))
}
