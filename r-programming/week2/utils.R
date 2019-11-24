getDataFrame <- function(directory, id) {
    filename <- buildPath(directory, id)
    read.csv(filename)
}

buildPath <- function(directory, name, extension = ".csv") {
    filename <- addZerosToId(name)
    paste(directory, "/", filename, extension, sep = "")
}

addZerosToId <- function(id, ndigits = 3) {
    digitLength <- nchar(as.character(id))
    zerosToAdd <- ndigits - digitLength
    
    filename <- paste(strrep("0", zerosToAdd), id, sep = "")
    filename
}