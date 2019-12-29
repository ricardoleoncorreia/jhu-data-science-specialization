source('utils.R')
library(dplyr)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

total_emissions_baltimore <- NEI %>%
                                filter(fips == "24510") %>%
                                group_by(year) %>%
                                summarise(total = sum(Emissions)) %>%
                                mutate(total = total / 1000)

png(filename="plot2.png")

plot(total_emissions_baltimore,
     xlab = "Year",
     ylab = "Emissions (thousands)",
     xlim = c(1998, 2008),
     main = "Baltimore City total emissions per year",
     type = "b")

dev.off()