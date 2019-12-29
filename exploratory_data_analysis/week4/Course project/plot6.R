source('utils.R')
library(dplyr)
library(ggplot2)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

cities <- data.frame(
            fips = c("06037", "24510"),
            city = c("Los Angeles County", "Baltimore City"),
            stringsAsFactors = FALSE)

related_codes <- SCC %>%
                    filter(grepl("^Mobile.*Vehicle", EI.Sector)) %>%
                    distinct(SCC)

motor_vehicle_emissions <- NEI %>%
                    filter(SCC %in% related_codes$SCC & (fips == "24510" | fips=="06037")) %>%
                    select(Emissions, year, fips) %>%
                    group_by(year, fips) %>%
                    summarise(total = sum(Emissions)) %>%
                    mutate(total = log10(total)) %>%
                    left_join(cities, by = "fips")

png(filename="plot6.png")

ggplot(motor_vehicle_emissions, aes(year, total, colour=city)) + 
    geom_line() +
    ggtitle("Motor vehicle emissions comparison (semi-log plot)") +
    labs(color = "City") +
    ylab("Emissions (log)") + 
    xlab("Year")

dev.off()