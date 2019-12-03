## Question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "acs.csv")
data <- read.csv("acs.csv")
splitted.names <- strsplit(names(data), split = "wgtp")
print(splitted.names[[123]])
file.remove("acs.csv")


## Question 2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
data <- read.csv("gdp.csv")[5:194,5]
remove.commas <- function(number) {
    as.numeric(gsub(",", "", number))
}
print(mean(sapply(data, remove.commas)))
file.remove("gdp.csv")


## Question 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
countryNames <- read.csv("gdp.csv")[5:194,4]
print(length(grep("^United", countryNames)))
file.remove("gdp.csv")


## Question 4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "educational.csv")
countryNames <- read.csv("gdp.csv")[5:194,1]
fiscal.year <- read.csv("educational.csv")[,c(1,10)]
fiscal.year <- fiscal.year[countryNames]
print(length(grep("June", fiscal.year)))
file.remove("gdp.csv")
file.remove("educational.csv")


## Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleTimes
samples.in.2012.indexes <- grep("2012", sampleTimes)
print(length(samples.in.2012.indexes))
samples.in.2012 <- sampleTimes[samples.in.2012.indexes]
print(sum(wday(samples.in.2012) == 2))
