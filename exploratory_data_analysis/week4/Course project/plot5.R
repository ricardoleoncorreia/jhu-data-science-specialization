source('utils.R')
library(dplyr)
library(ggplot2)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

related_codes <- SCC %>%
                    filter(grepl("^Mobile.*Vehicle", EI.Sector)) %>%
                    distinct(SCC)

motor_vehicle_emissions <- NEI %>%
                            filter(SCC %in% related_codes$SCC & fips == "24510") %>%
                            select(Emissions, year) %>%
                            group_by(year) %>%
                            summarise(total = sum(Emissions))

png(filename="plot5.png")

ggplot(motor_vehicle_emissions) + 
    geom_line(aes(x = year, y = total)) +
    ggtitle("Baltimore City total emissions from motor vehicle sources") +
    ylab("Emissions") + 
    xlab("Year")

dev.off()