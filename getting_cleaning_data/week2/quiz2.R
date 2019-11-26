## Question 1
library(httr)
github.app <- oauth_app("JHUDataScience",
                        key = "my_key",
                        secret = "my_secret")
github.token <- oauth2.0_token(oauth_endpoints("github"), github.app)
auth.token <- config(token = github.token)
req <- GET("https://api.github.com/users/jtleek/repos", auth.token)
req.content <- content(req)
json.content <- jsonlite::toJSON(req.content)
content.data.frame <- jsonlite::fromJSON(json.content)
content.data.frame[content.data.frame$full_name == "jtleek/datasharing", "created_at"]


## Question 2
library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "acs.csv")
acs <- read.csv("acs.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")


## Question 3
library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "acs.csv")
acs <- read.csv("acs.csv")
sqldf("select distinct AGEP from acs")


## Question 4
library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- readLines(url)
c(nchar(html[10]), nchar(html[20]), nchar(html[30]), nchar(html[100]))


## Question 5
dataset <- read.fwf(file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
                    skip=4,
                    widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(dataset[,4])
