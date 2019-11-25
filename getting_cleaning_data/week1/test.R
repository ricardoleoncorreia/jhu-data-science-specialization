## Question 1
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv')
data <- read.csv('survey.csv')
sum(!is.na(data[data$VAL==24,]$VAL))

## Question 3
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx',
              destfile = 'gas.xlsx')
dat <- read.xlsx('gas.xlsx', sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

## Question 4
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml',
              destfile = 'restaurant.xml')
restaurant.data <- xmlTreeParse('restaurant.xml', useInternalNodes = T)
rootNode <- xmlRoot(restaurant.data)
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")
