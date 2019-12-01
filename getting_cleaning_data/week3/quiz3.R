## Question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "acs.csv")
file <- read_csv("acs.csv")
head(file)
agricultureLogical <- mutate(file, agricultureLogical = (ACR == 3) & (AGS == 6))$agricultureLogical
print(head(which(agricultureLogical),3))
file.remove("acs.csv")


## Question 2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "image.jpg")
library(jpeg)
img <- readJPEG("image.jpg", native = TRUE)
print(quantile(img, probs = c(0.3, 0.8)))
file.remove("image.jpg")

## Question 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "ed.csv")
gross.domestic.product <- read_csv("gdp.csv")[c(5:195),] %>%
                          rename(Rank = 'Gross domestic product 2012', Country = X4, CountryCode = X1, Income = X5) %>%
                          mutate(Rank = as.numeric(Rank))
head(gross.domestic.product)
educational.data <- read_csv("ed.csv")
head(educational.data)
print(sum(!is.na(match(gross.domestic.product$CountryCode, educational.data$CountryCode))))
ordered.by.rank <- gross.domestic.product %>% arrange(desc(Rank))
print(ordered.by.rank$Country[[13]])


## Question 4
high.income.data <- educational.data %>%
                    select(c(CountryCode, "Income Group")) %>%
                    rename(IncomeGroup = "Income Group")
ordered.by.country <- gross.domestic.product %>%
                      select(c(CountryCode, Rank)) %>%
                      arrange(desc(CountryCode)) %>%
                      inner_join(high.income.data) %>%
                      group_by(IncomeGroup)
summary.by.income.group <- ordered.by.country %>%
                           summarize(mean = mean(Rank))
print(head(summary.by.income.group))


## Question 5
highest38GDP <- ordered.by.country %>%
                arrange(Rank) %>%
                filter(Rank <= 38)
print(head(sum(highest38GDP$IncomeGroup == "Lower middle income")))

file.remove("ed.csv")
file.remove("gdp.csv")