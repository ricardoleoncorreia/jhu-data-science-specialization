source("best.R")
best("SC", "heart attack") ## 1
best("NY", "pneumonia") ## 2
best("AK", "pneumonia") ## 3


source("rankhospital.R")
rankhospital("NC", "heart attack", "worst") ## 4
rankhospital("WA", "heart attack", 7) ## 5
rankhospital("TX", "pneumonia", 10) ## 6
rankhospital("NY", "heart attack", 7) ## 7


source("rankall.R")
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital) ## 8
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital) ## 9
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital) ## 10
