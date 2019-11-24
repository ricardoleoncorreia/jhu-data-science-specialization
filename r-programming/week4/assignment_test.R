## Part 1. Plot the 30-day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
names(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[, 11])


## Part 2. Finding the best hospital in a state

source("best.R")

best("TX", "heart attack") ## [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure") ## [1] "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack") ## [1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia") ## [1] "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack") ## Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack") ## Error in best("NY", "hert attack") : invalid outcome


## Part 3. Ranking hospitals by outcome in a state

source("rankhospital.R")

rankhospital("TX", "heart failure", 4) ## [1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst") ## [1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000) ## [1] NA


## Part 4. Ranking hospitals in all states

source("rankall.R")

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
