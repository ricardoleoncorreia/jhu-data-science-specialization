rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    isValidState <- any(outcome.data$State == state)
    if (!isValidState) { stop("invalid state") }
    
    isHeartAttack <- outcome == "heart attack"
    isHeartFailure <- outcome == "heart failure"
    isPneumonia <- outcome == "pneumonia"
    isValidOutcome <- isHeartAttack | isHeartFailure | isPneumonia
    if (!isValidOutcome) { stop("invalid outcome") }
    
    ## Filter table by selected state
    data.in.state <- subset(outcome.data, State == state)
    
    ## Coerce corresponding column to numeric
    colNumber <- getColumnNumber(outcome)
    data.in.state[,colNumber] <- as.numeric(data.in.state[,colNumber])
    
    ## Delete rows with no values
    data.in.state <- data.in.state[!is.na(data.in.state[,colNumber]),]
    
    ## Order hospitals by ranking
    ranking <- order(data.in.state[,colNumber], data.in.state$Hospital.Name)
    data.in.state <- data.in.state[ranking,]
    
    ## Make num validations
    number.of.rows <- nrow(data.in.state)
    if (num == "best") { return(data.in.state$Hospital.Name[[1]]) }
    if (num == "worst") { return(data.in.state$Hospital.Name[[number.of.rows]]) }
    if (num > number.of.rows) { return(NA) }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    data.in.state$Hospital.Name[[num]]
}

getColumnNumber <- function(outcome) {
    switch(outcome,
           "heart attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23)
}
