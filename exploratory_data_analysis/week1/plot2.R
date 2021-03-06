source('utils.R')
library(dplyr)

important_columns <- c("Date", "Time", "Global_active_power")
data <- get_data(columns = important_columns)

current.data <- data %>%
                mutate(Datetime = as.POSIXct(strptime(paste(Date, Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")),
                       Global_active_power = as.numeric(Global_active_power))

png(filename = "plot2.png", width = 480, height = 480)

with(current.data, plot(Datetime,
                        Global_active_power,
                        xlab = "",
                        ylab = "Global Active Power (kilowatts)",
                        type = "l"))

dev.off()
