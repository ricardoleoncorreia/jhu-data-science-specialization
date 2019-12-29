source('utils.R')
library(dplyr)
library(ggplot2)

NEI <- get_data(summary_scc_pm25)
SCC <- get_data(source_classification)

emission_types <- NEI %>%
    group_by(year, type) %>%
    summarise(total = sum(Emissions)) %>%
    mutate(total = log10(total))

png(filename="plot3.png")

ggplot(emission_types, aes(year, total, colour=type)) + 
    geom_line(aes()) +
    ggtitle("US total emissions per type (semi-log plot)") +
    labs(color = "Type") +
    ylab("Emissions (log)") + 
    xlab("Year")

dev.off()