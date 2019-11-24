rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    isHeartAttack <- outcome == "heart attack"
    isHeartFailure <- outcome == "heart failure"
    isPneumonia <- outcome == "pneumonia"
    isValidOutcome <- isHeartAttack | isHeartFailure | isPneumonia
    
    if (!isValidOutcome) { stop("invalid outcome") }
    
    ## Coerce corresponding column to numeric
    colNumber <- getColumnNumber(outcome)
    outcome.data[,colNumber] <- as.numeric(outcome.data[,colNumber])
    
    ## Remove data with NA
    outcome.data <- outcome.data[!is.na(outcome.data[,colNumber]),]
    
    ## Delete unused columns
    outcome.data <- outcome.data[,c(2, 7, colNumber)]
    colnames(outcome.data) <- c("Hospital.Name", "State", "Death.Rate")
    
    ## Split data by State
    outcome.by.state <- split(outcome.data, outcome.data$State)
    
    ## For each state, find the hospital of the given rank
    result <- data.frame(sapply(outcome.by.state,
                                orderByRank,
                                num = num))
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    result <- cbind(result, row.names(result))
    colnames(result) <- c("hospital", "state")
    result
}

getColumnNumber <- function(outcome) {
    switch(outcome,
           "heart attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23)
}

orderByRank <- function(data.in.state, num) {
    number.of.rows <- nrow(data.in.state)

    ranking <- order(data.in.state$Death.Rate, data.in.state$Hospital.Name)
    data.in.state <- data.in.state[ranking,]

    if (num == "best") { num <- 1 }
    if (num == "worst") { num <- number.of.rows }

    if (num > number.of.rows) { return("<NA>") }
    
    data.in.state$Hospital.Name[[num]]
}