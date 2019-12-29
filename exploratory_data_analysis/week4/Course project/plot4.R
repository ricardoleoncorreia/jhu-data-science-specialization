source('utils.R')
library(dplyr)
library(ggplot2)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

related_codes <- SCC %>%
                    filter(grepl("^Fuel Comb.*Coal", EI.Sector)) %>%
                    distinct(SCC)

coal_emissions <- NEI %>%
                    filter(SCC %in% related_codes$SCC) %>%
                    select(Emissions, year) %>%
                    group_by(year) %>%
                    summarise(total = sum(Emissions)) %>%
                    mutate(total = total/1000)

png(filename="plot4.png")

ggplot(coal_emissions) + 
    geom_line(aes(x = year, y = total)) +
    ggtitle("US total emissions from coal combution-related sources") +
    ylab("Emissions (thousands)") + 
    xlab("Year")

dev.off()