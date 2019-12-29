source('utils.R')
library(dplyr)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

total_emissions <- NEI %>%
                    group_by(year) %>%
                    summarise(total = sum(Emissions)) %>%
                    mutate(total = total / 1000000)

png(filename="plot1.png")

plot(total_emissions,
     xlab = "Year",
     ylab = "Emissions (millions)",
     xlim = c(1998, 2008),
     main = "US total emissions per year",
     type = "b")

dev.off()